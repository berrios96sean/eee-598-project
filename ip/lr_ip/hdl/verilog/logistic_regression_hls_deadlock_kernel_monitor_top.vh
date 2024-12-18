
wire kernel_monitor_reset;
wire kernel_monitor_clock;
assign kernel_monitor_reset = ~ap_rst_n;
assign kernel_monitor_clock = ap_clk;
wire [1:0] axis_block_sigs;
wire [5:0] inst_idle_sigs;
wire [2:0] inst_block_sigs;
wire kernel_block;

assign axis_block_sigs[0] = ~Block_entry35_proc2_U0.in_stream_TDATA_blk_n;
assign axis_block_sigs[1] = ~Block_entry3537_proc3_U0.out_stream_TDATA_blk_n;

assign inst_idle_sigs[0] = Block_entry35_proc2_U0.ap_idle;
assign inst_block_sigs[0] = (Block_entry35_proc2_U0.ap_done & ~Block_entry35_proc2_U0.ap_continue);
assign inst_idle_sigs[1] = sigmoid_U0.ap_idle;
assign inst_block_sigs[1] = (sigmoid_U0.ap_done & ~sigmoid_U0.ap_continue);
assign inst_idle_sigs[2] = Block_entry3537_proc3_U0.ap_idle;
assign inst_block_sigs[2] = (Block_entry3537_proc3_U0.ap_done & ~Block_entry3537_proc3_U0.ap_continue);

assign inst_idle_sigs[3] = 1'b0;
assign inst_idle_sigs[4] = Block_entry35_proc2_U0.ap_idle;
assign inst_idle_sigs[5] = Block_entry3537_proc3_U0.ap_idle;

logistic_regression_hls_deadlock_idx0_monitor logistic_regression_hls_deadlock_idx0_monitor_U (
    .clock(kernel_monitor_clock),
    .reset(kernel_monitor_reset),
    .axis_block_sigs(axis_block_sigs),
    .inst_idle_sigs(inst_idle_sigs),
    .inst_block_sigs(inst_block_sigs),
    .block(kernel_block)
);

always @ (kernel_block or kernel_monitor_reset) begin
    if (kernel_block == 1'b1 && kernel_monitor_reset == 1'b0) begin
        find_kernel_block = 1'b1;
    end
    else begin
        find_kernel_block = 1'b0;
    end
end
