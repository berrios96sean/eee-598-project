`timescale 1ns / 1ps

module axis_testbench;
    parameter DATA_WIDTH = 32;
    parameter PACKET_SIZE = 1;  // Can be modified to adjust the number of data words in a packet

    reg clk;
    reg rst_n;

    // AXI-Stream input signals for the testbench
    reg [DATA_WIDTH-1:0] s_axis_tdata;
    reg                  s_axis_tvalid;
    wire                 s_axis_tready;
    reg                  s_axis_tlast;

    // AXI-Stream output signals from the voting logic
    wire [DATA_WIDTH-1:0] m_axis_tdata;
    wire                  m_axis_tvalid;
    reg                   m_axis_tready;
    wire                  m_axis_tlast;

    // Internal signals between modules
    wire [DATA_WIDTH-1:0] mux_to_ensemble_tdata_0;
    wire                  mux_to_ensemble_tvalid_0;
    wire                  mux_to_ensemble_tready_0;
    wire                  mux_to_ensemble_tlast_0;

    wire [DATA_WIDTH-1:0] mux_to_ensemble_tdata_1;
    wire                  mux_to_ensemble_tvalid_1;
    wire                  mux_to_ensemble_tready_1;
    wire                  mux_to_ensemble_tlast_1;

    wire [DATA_WIDTH-1:0] mux_to_ensemble_tdata_2;
    wire                  mux_to_ensemble_tvalid_2;
    wire                  mux_to_ensemble_tready_2;
    wire                  mux_to_ensemble_tlast_2;

    wire [DATA_WIDTH-1:0] ensemble_to_vote_tdata_0;
    wire                  ensemble_to_vote_tvalid_0;
    wire                  ensemble_to_vote_tready_0;
    wire                  ensemble_to_vote_tlast_0;

    wire [DATA_WIDTH-1:0] ensemble_to_vote_tdata_1;
    wire                  ensemble_to_vote_tvalid_1;
    wire                  ensemble_to_vote_tready_1;
    wire                  ensemble_to_vote_tlast_1;

    wire [DATA_WIDTH-1:0] ensemble_to_vote_tdata_2;
    wire                  ensemble_to_vote_tvalid_2;
    wire                  ensemble_to_vote_tready_2;
    wire                  ensemble_to_vote_tlast_2;

    // Instantiate the DUTs (MUX, Ensemble, Majority Vote)
    axis_multiplexer #(
        .DATA_WIDTH(DATA_WIDTH)
    ) u_axis_mux (
        .clk(clk),
        .rst_n(rst_n),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tvalid(s_axis_tvalid),
        .s_axis_tready(s_axis_tready),
        .s_axis_tlast(s_axis_tlast),
        // Output interfaces to ensemble
        .m_axis_tdata_0(mux_to_ensemble_tdata_0),
        .m_axis_tvalid_0(mux_to_ensemble_tvalid_0),
        .m_axis_tready_0(mux_to_ensemble_tready_0),
        .m_axis_tlast_0(mux_to_ensemble_tlast_0),
        .m_axis_tdata_1(mux_to_ensemble_tdata_1),
        .m_axis_tvalid_1(mux_to_ensemble_tvalid_1),
        .m_axis_tready_1(mux_to_ensemble_tready_1),
        .m_axis_tlast_1(mux_to_ensemble_tlast_1),
        .m_axis_tdata_2(mux_to_ensemble_tdata_2),
        .m_axis_tvalid_2(mux_to_ensemble_tvalid_2),
        .m_axis_tready_2(mux_to_ensemble_tready_2),
        .m_axis_tlast_2(mux_to_ensemble_tlast_2)
    );

    ensemble_wrapper_black_box #(
        .DATA_WIDTH(DATA_WIDTH)
    ) u_ensemble (
        .clk(clk),
        .rst_n(rst_n),
        .s_axis_tdata_0(mux_to_ensemble_tdata_0),
        .s_axis_tvalid_0(mux_to_ensemble_tvalid_0),
        .s_axis_tready_0(mux_to_ensemble_tready_0),
        .s_axis_tlast_0(mux_to_ensemble_tlast_0),
        .s_axis_tdata_1(mux_to_ensemble_tdata_1),
        .s_axis_tvalid_1(mux_to_ensemble_tvalid_1),
        .s_axis_tready_1(mux_to_ensemble_tready_1),
        .s_axis_tlast_1(mux_to_ensemble_tlast_1),
        .s_axis_tdata_2(mux_to_ensemble_tdata_2),
        .s_axis_tvalid_2(mux_to_ensemble_tvalid_2),
        .s_axis_tready_2(mux_to_ensemble_tready_2),
        .s_axis_tlast_2(mux_to_ensemble_tlast_2),
        // Output interfaces to voting logic
        .m_axis_tdata_0(ensemble_to_vote_tdata_0),
        .m_axis_tvalid_0(ensemble_to_vote_tvalid_0),
        .m_axis_tready_0(ensemble_to_vote_tready_0),
        .m_axis_tlast_0(ensemble_to_vote_tlast_0),
        .m_axis_tdata_1(ensemble_to_vote_tdata_1),
        .m_axis_tvalid_1(ensemble_to_vote_tvalid_1),
        .m_axis_tready_1(ensemble_to_vote_tready_1),
        .m_axis_tlast_1(ensemble_to_vote_tlast_1),
        .m_axis_tdata_2(ensemble_to_vote_tdata_2),
        .m_axis_tvalid_2(ensemble_to_vote_tvalid_2),
        .m_axis_tready_2(ensemble_to_vote_tready_2),
        .m_axis_tlast_2(ensemble_to_vote_tlast_2)
    );

    axis_majority_vote #(
        .DATA_WIDTH(DATA_WIDTH)
    ) u_majority_vote (
        .clk(clk),
        .rst_n(rst_n),
        .s_axis_tdata_0(ensemble_to_vote_tdata_0),
        .s_axis_tvalid_0(ensemble_to_vote_tvalid_0),
        .s_axis_tready_0(ensemble_to_vote_tready_0),
        .s_axis_tlast_0(ensemble_to_vote_tlast_0),
        .s_axis_tdata_1(ensemble_to_vote_tdata_1),
        .s_axis_tvalid_1(ensemble_to_vote_tvalid_1),
        .s_axis_tready_1(ensemble_to_vote_tready_1),
        .s_axis_tlast_1(ensemble_to_vote_tlast_1),
        .s_axis_tdata_2(ensemble_to_vote_tdata_2),
        .s_axis_tvalid_2(ensemble_to_vote_tvalid_2),
        .s_axis_tready_2(ensemble_to_vote_tready_2),
        .s_axis_tlast_2(ensemble_to_vote_tlast_2),
        // Output interface to the testbench
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tvalid(m_axis_tvalid),
        .m_axis_tready(m_axis_tready),
        .m_axis_tlast(m_axis_tlast)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 100 MHz clock
    end

    // Reset generation
    initial begin
        rst_n = 0;
        #20 rst_n = 1;
    end

    // Testbench logic
    initial begin
        // Initialize signals
        s_axis_tdata = 0;
        s_axis_tvalid = 0;
        s_axis_tlast = 0;
        m_axis_tready = 1;

        // Wait for reset deassertion
        @(posedge rst_n);
        @(posedge clk);

        // Send a single packet of data
//        send_packet(PACKET_SIZE);
        #100;
        s_axis_tdata <= 32'hFFFFFFFF;  // Example data pattern
        #10;
        s_axis_tvalid <= 1;
        s_axis_tlast <= 1;
        #10;
        s_axis_tdata <= 32'h00000000;  // Example data pattern
        s_axis_tvalid <= 0;
        s_axis_tlast <= 0;
        

        // Wait for the result to come back
        wait(m_axis_tvalid);
        if (m_axis_tvalid && m_axis_tready) begin
            $display("Received data: %h", m_axis_tdata);
        end

        // Finish simulation
        #100;
        $stop;
    end

    // Task to send a packet of data
    task send_packet(input integer size);
        integer i;
        begin
            for (i = 0; i < size; i = i + 1) begin
                @(posedge clk);
                s_axis_tdata <= 32'hFFFFFFFF;  // Example data pattern
                s_axis_tvalid <= 1;
                s_axis_tlast <= (i == size - 1);
                @(posedge clk);
                while (!s_axis_tready) begin
                    @(posedge clk);
                end
            end
            s_axis_tvalid <= 0;
            s_axis_tlast <= 0;
        end
    endtask

endmodule

