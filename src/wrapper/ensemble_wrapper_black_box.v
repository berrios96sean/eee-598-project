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

// Assign outputs for Classifier 1
assign m_axis_tdata_1 = s_axis_tdata_1;
assign m_axis_tkeep_1 = s_axis_tkeep_1;
assign m_axis_tvalid_1 = s_axis_tvalid_1;
assign s_axis_tready_1 = m_axis_tready_1;
assign m_axis_tlast_1 = s_axis_tlast_1;

// Assign outputs for Classifier 2
assign m_axis_tdata_2 = s_axis_tdata_2;
assign m_axis_tkeep_2 = s_axis_tkeep_2;
assign m_axis_tvalid_2 = s_axis_tvalid_2;
assign s_axis_tready_2 = m_axis_tready_2;
assign m_axis_tlast_2 = s_axis_tlast_2;

// Assign outputs for Classifier 3
assign m_axis_tdata_3 = s_axis_tdata_3;
assign m_axis_tkeep_3 = s_axis_tkeep_3;
assign m_axis_tvalid_3 = s_axis_tvalid_3;
assign s_axis_tready_3 = m_axis_tready_3;
assign m_axis_tlast_3 = s_axis_tlast_3;
    
endmodule

