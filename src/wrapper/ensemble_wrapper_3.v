// gaussian_nb  gradient_boost  mlp

module ensemble_wrapper1 #(
    parameter DATA_WIDTH = 32,
    parameter KEEP_WIDTH = 4
)(
    input wire clk,
    input wire rst_n,

    // Classifier 1
    // AXI-Stream input interface 
    input wire [DATA_WIDTH-1:0] s_axis_tdata_1,
    input wire [KEEP_WIDTH-1:0] s_axis_tkeep_1,
    input wire                  s_axis_tvalid_1,
    output wire                 s_axis_tready_1,
    input wire                  s_axis_tlast_1,

    // AXI-Stream output interface
    output wire [DATA_WIDTH-1:0] m_axis_tdata_1,
    output wire [KEEP_WIDTH-1:0] m_axis_tkeep_1,
    output wire                  m_axis_tvalid_1,
    input wire                   m_axis_tready_1,
    output wire                  m_axis_tlast_1,

    // Classifier 2
    // AXI-Stream input interface
    input wire [DATA_WIDTH-1:0] s_axis_tdata_2,
    input wire [KEEP_WIDTH-1:0] s_axis_tkeep_2,
    input wire                  s_axis_tvalid_2,
    output wire                 s_axis_tready_2,
    input wire                  s_axis_tlast_2,

    // AXI-Stream output interface
    output wire [DATA_WIDTH-1:0] m_axis_tdata_2,
    output wire [KEEP_WIDTH-1:0] m_axis_tkeep_2,
    output wire                  m_axis_tvalid_2,
    input wire                   m_axis_tready_2,
    output wire                  m_axis_tlast_2,

    // Classifier 3
    // AXI-Stream input interface
    input wire [DATA_WIDTH-1:0] s_axis_tdata_3,
    input wire [KEEP_WIDTH-1:0] s_axis_tkeep_3,
    input wire                  s_axis_tvalid_3,
    output wire                 s_axis_tready_3,
    input wire                  s_axis_tlast_3,

    // AXI-Stream output interface
    output wire [DATA_WIDTH-1:0] m_axis_tdata_3,
    output wire [KEEP_WIDTH-1:0] m_axis_tkeep_3,
    output wire                  m_axis_tvalid_3,
    input wire                   m_axis_tready_3,
    output wire                  m_axis_tlast_3
);

    gaussian_nb_0 gnb_0 (
        .ap_clk(clk),
        .ap_rst_n(rst_n),
        .in_stream_TDATA(s_axis_tdata_1),
        .in_stream_TVALID(s_axis_tvalid_1),
        .in_stream_TREADY(s_axis_tready_1),
        .in_stream_TKEEP(s_axis_tkeep_1),
        .in_stream_TSTRB(2'b11),
        .in_stream_TLAST(s_axis_tlast_1),
        .out_stream_TDATA(m_axis_tdata_1),
        .out_stream_TVALID(m_axis_tvalid_1),
        .out_stream_TREADY(m_axis_tready_1),
        .out_stream_TKEEP(m_axis_tkeep_1),
        // .out_stream_TSTRB(2'b11),
        .out_stream_TLAST(m_axis_tlast_1)
    );

    gradient_boost_0 gb_0 (
        .ap_clk(clk),
        .ap_rst_n(rst_n),
        .in_stream_TDATA(s_axis_tdata_3),
        .in_stream_TVALID(s_axis_tvalid_3),
        .in_stream_TREADY(s_axis_tready_3),
        .in_stream_TKEEP(s_axis_tkeep_3),
        .in_stream_TSTRB(2'b11),
        .in_stream_TLAST(s_axis_tlast_3),
        .out_stream_TDATA(m_axis_tdata_3),
        .out_stream_TVALID(m_axis_tvalid_3),
        .out_stream_TREADY(m_axis_tready_3),
        .out_stream_TKEEP(m_axis_tkeep_3),
        // .out_stream_TSTRB(2'b11),
        .out_stream_TLAST(m_axis_tlast_3)
    );

    mlp_0 mlp_u_0 (
        .ap_clk(clk),
        .ap_rst_n(rst_n),
        .in_stream_TDATA(s_axis_tdata_3),
        .in_stream_TVALID(s_axis_tvalid_3),
        .in_stream_TREADY(s_axis_tready_3),
        .in_stream_TKEEP(s_axis_tkeep_3),
        .in_stream_TSTRB(2'b11),
        .in_stream_TLAST(s_axis_tlast_3),
        .out_stream_TDATA(m_axis_tdata_3),
        .out_stream_TVALID(m_axis_tvalid_3),
        .out_stream_TREADY(m_axis_tready_3),
        .out_stream_TKEEP(m_axis_tkeep_3),
        // .out_stream_TSTRB(2'b11),
        .out_stream_TLAST(m_axis_tlast_3)
    );

endmodule

