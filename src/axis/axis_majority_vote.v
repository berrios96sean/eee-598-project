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
    reg [DATA_WIDTH-1:0] result_0, result_1, result_2;
    reg valid_0, valid_1, valid_2;
    reg [DATA_WIDTH-1:0] majority_result;
    reg result_valid;
    reg result_last;

    // AXI-Stream ready signals
    assign s_axis_tready_0 = m_axis_tready;
    assign s_axis_tready_1 = m_axis_tready;
    assign s_axis_tready_2 = m_axis_tready;

    // Majority voting logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            valid_0 <= 1'b0;
            valid_1 <= 1'b0;
            valid_2 <= 1'b0;
            result_valid <= 1'b0;
            result_last <= 1'b0;
        end else begin
            if (s_axis_tvalid_0 && s_axis_tvalid_1 && s_axis_tvalid_2) begin
                // Capture results from the three classifiers
                result_0 <= s_axis_tdata_0;
                result_1 <= s_axis_tdata_1;
                result_2 <= s_axis_tdata_2;

                valid_0 <= s_axis_tvalid_0;
                valid_1 <= s_axis_tvalid_1;
                valid_2 <= s_axis_tvalid_2;

                result_last <= s_axis_tlast_0 & s_axis_tlast_1 & s_axis_tlast_2;

                // Perform majority voting
                if ((result_0 == result_1) || (result_0 == result_2)) begin
                    majority_result <= result_0;
                end else if (result_1 == result_2) begin
                    majority_result <= result_1;
                end else begin
                    majority_result <= result_0; // Default to result_0 in case of no majority
                end

                result_valid <= 1'b1;
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

