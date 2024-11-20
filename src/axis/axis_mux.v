module axis_multiplexer #(
    parameter DATA_WIDTH = 32,
    parameter KEEP_WIDTH = 4
)(
    input wire clk,
    input wire rst_n,

    // AXI-Stream input interface
    input wire [DATA_WIDTH-1:0] s_axis_tdata,
    input wire [KEEP_WIDTH-1:0] s_axis_tkeep,
    input wire                  s_axis_tvalid,
    output wire                 s_axis_tready,
    input wire                  s_axis_tlast,

    // AXI-Stream output interfaces (explicitly separate outputs)
    output wire [DATA_WIDTH-1:0] m_axis_tdata_0,
    output wire [KEEP_WIDTH-1:0] m_axis_tkeep_0,
    output wire                  m_axis_tvalid_0,
    input wire                   m_axis_tready_0,
    output wire                  m_axis_tlast_0,

    output wire [DATA_WIDTH-1:0] m_axis_tdata_1,
    output wire [KEEP_WIDTH-1:0] m_axis_tkeep_1,
    output wire                  m_axis_tvalid_1,
    input wire                   m_axis_tready_1,
    output wire                  m_axis_tlast_1,

    output wire [DATA_WIDTH-1:0] m_axis_tdata_2,
    output wire [KEEP_WIDTH-1:0] m_axis_tkeep_2,
    output wire                  m_axis_tvalid_2,
    input wire                   m_axis_tready_2,
    output wire                  m_axis_tlast_2
);

    // Internal ready signal
    wire all_ready = m_axis_tready_0 & m_axis_tready_1 & m_axis_tready_2;

    // Pass-through from input to outputs
    assign s_axis_tready = all_ready;

    // Assign outputs
    assign m_axis_tdata_0 = s_axis_tdata;
    assign m_axis_tdata_1 = s_axis_tdata;
    assign m_axis_tdata_2 = s_axis_tdata;

    assign m_axis_tkeep_0 = s_axis_tkeep;
    assign m_axis_tkeep_1 = s_axis_tkeep;
    assign m_axis_tkeep_2 = s_axis_tkeep;

    assign m_axis_tvalid_0 = s_axis_tvalid & all_ready;
    assign m_axis_tvalid_1 = s_axis_tvalid & all_ready;
    assign m_axis_tvalid_2 = s_axis_tvalid & all_ready;

    assign m_axis_tlast_0 = s_axis_tlast;
    assign m_axis_tlast_1 = s_axis_tlast;
    assign m_axis_tlast_2 = s_axis_tlast;

endmodule

