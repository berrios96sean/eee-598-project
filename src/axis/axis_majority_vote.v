module axis_majority_vote #(
    parameter DATA_WIDTH = 32
)(
    input wire clk,
    input wire rst_n,

    // AXI-Stream input interfaces (three classifiers)
    input wire [DATA_WIDTH-1:0] s_axis_tdata_0,
    input wire                  s_axis_tvalid_0,
    output wire                 s_axis_tready_0,
    input wire                  s_axis_tlast_0,

    input wire [DATA_WIDTH-1:0] s_axis_tdata_1,
    input wire                  s_axis_tvalid_1,
    output wire                 s_axis_tready_1,
    input wire                  s_axis_tlast_1,

    input wire [DATA_WIDTH-1:0] s_axis_tdata_2,
    input wire                  s_axis_tvalid_2,
    output wire                 s_axis_tready_2,
    input wire                  s_axis_tlast_2,

    // AXI-Stream output interface (majority result)
    output wire [DATA_WIDTH-1:0] m_axis_tdata,
    output wire                  m_axis_tvalid,
    input wire                   m_axis_tready,
    output wire                  m_axis_tlast
);

    // Internal signals
    reg [DATA_WIDTH-1:0] data_0, data_1, data_2;
    reg valid_0, valid_1, valid_2;
    reg last_0, last_1, last_2;

    reg [2:0] received_flags;
    reg [DATA_WIDTH-1:0] majority_result;
    reg result_valid;
    reg result_last;

    // AXI-Stream ready signals
    assign s_axis_tready_0 = ~valid_0;
    assign s_axis_tready_1 = ~valid_1;
    assign s_axis_tready_2 = ~valid_2;

    // Capture incoming data when valid
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            data_0 <= 0;
            valid_0 <= 1'b0;
            last_0 <= 1'b0;

            data_1 <= 0;
            valid_1 <= 1'b0;
            last_1 <= 1'b0;

            data_2 <= 0;
            valid_2 <= 1'b0;
            last_2 <= 1'b0;

            received_flags <= 3'b000;
        end else begin
            if (s_axis_tvalid_0 && ~valid_0) begin
                data_0 <= s_axis_tdata_0;
                valid_0 <= 1'b1;
                last_0 <= s_axis_tlast_0;
                received_flags[0] <= 1'b1;
            end
            if (s_axis_tvalid_1 && ~valid_1) begin
                data_1 <= s_axis_tdata_1;
                valid_1 <= 1'b1;
                last_1 <= s_axis_tlast_1;
                received_flags[1] <= 1'b1;
            end
            if (s_axis_tvalid_2 && ~valid_2) begin
                data_2 <= s_axis_tdata_2;
                valid_2 <= 1'b1;
                last_2 <= s_axis_tlast_2;
                received_flags[2] <= 1'b1;
            end

            if (received_flags == 3'b111) begin
                // Perform majority voting
                if ((data_0 == data_1) || (data_0 == data_2)) begin
                    majority_result <= data_0;
                end else if (data_1 == data_2) begin
                    majority_result <= data_1;
                end else begin
                    majority_result <= data_0; // Default to data_0 in case of no majority
                end
                result_valid <= 1'b1;
                result_last <= last_0 & last_1 & last_2;

                // Reset valid flags and received_flags
                valid_0 <= 1'b0;
                valid_1 <= 1'b0;
                valid_2 <= 1'b0;
                received_flags <= 3'b000;
            end else begin
                result_valid <= 1'b0;
            end
        end
    end

    // Output assignment
    assign m_axis_tdata  = majority_result;
    assign m_axis_tvalid = result_valid;
    assign m_axis_tlast  = result_last;

endmodule
