 `timescale 1ns / 1ps

module ensemble_wrapper_black_box #(
    parameter DATA_WIDTH = 32,
    parameter KEEP_WIDTH = 4
)(
    input wire clk,
    input wire rst_n,

    // Classifier 0
    // AXI-Stream input interface 
    input wire [DATA_WIDTH-1:0] s_axis_tdata_0,
    input wire [KEEP_WIDTH-1:0] s_axis_tkeep_0,
    input wire                  s_axis_tvalid_0,
    output wire                 s_axis_tready_0,
    input wire                  s_axis_tlast_0,

    // AXI-Stream output interface
    output wire [DATA_WIDTH-1:0] m_axis_tdata_0,
    output wire [KEEP_WIDTH-1:0] m_axis_tkeep_0,
    output wire                  m_axis_tvalid_0,
    input wire                   m_axis_tready_0,
    output wire                  m_axis_tlast_0,

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
    output wire                  m_axis_tlast_2
);

// Classifier 0
assign m_axis_tdata_0 = s_axis_tdata_0;
assign m_axis_tkeep_0 = s_axis_tkeep_0;
assign m_axis_tvalid_0 = s_axis_tvalid_0;
assign s_axis_tready_0 = m_axis_tready_0;
assign m_axis_tlast_0 = s_axis_tlast_0;

// Classifier 1
assign m_axis_tdata_1 = s_axis_tdata_1;
assign m_axis_tkeep_1 = s_axis_tkeep_1;
assign m_axis_tvalid_1 = s_axis_tvalid_1;
assign s_axis_tready_1 = m_axis_tready_1;
assign m_axis_tlast_1 = s_axis_tlast_1;

// Classifier 2
assign m_axis_tdata_2 = s_axis_tdata_2;
assign m_axis_tkeep_2 = s_axis_tkeep_2;
assign m_axis_tvalid_2 = s_axis_tvalid_2;
assign s_axis_tready_2 = m_axis_tready_2;
assign m_axis_tlast_2 = s_axis_tlast_2;

endmodule
