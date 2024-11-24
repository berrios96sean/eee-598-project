
wire kernel_monitor_reset;
wire kernel_monitor_clock;
assign kernel_monitor_reset = ~ap_rst_n;
assign kernel_monitor_clock = ap_clk;
wire [1:0] axis_block_sigs;
wire [15:0] inst_idle_sigs;
wire [12:0] inst_block_sigs;
wire kernel_block;

assign axis_block_sigs[0] = ~Block_if_end_i_i126_9218_proc12_U0.in_stream_TDATA_blk_n;
assign axis_block_sigs[1] = ~Block_if_end_i_i126_9218249_proc13_U0.out_stream_TDATA_blk_n;

assign inst_idle_sigs[0] = Block_if_end_i_i126_9218_proc12_U0.ap_idle;
assign inst_block_sigs[0] = (Block_if_end_i_i126_9218_proc12_U0.ap_done & ~Block_if_end_i_i126_9218_proc12_U0.ap_continue);
assign inst_idle_sigs[1] = relu_1_U0.ap_idle;
assign inst_block_sigs[1] = (relu_1_U0.ap_done & ~relu_1_U0.ap_continue);
assign inst_idle_sigs[2] = Block_if_end_i_i126_9218223_proc_U0.ap_idle;
assign inst_block_sigs[2] = (Block_if_end_i_i126_9218223_proc_U0.ap_done & ~Block_if_end_i_i126_9218223_proc_U0.ap_continue) | ~Block_if_end_i_i126_9218223_proc_U0.shl_ln887_8_cast_loc_c_blk_n | ~Block_if_end_i_i126_9218223_proc_U0.shl_ln887_7_cast_loc_c266_blk_n | ~Block_if_end_i_i126_9218223_proc_U0.shl_ln887_4_cast11_loc_c_blk_n | ~Block_if_end_i_i126_9218223_proc_U0.shl_ln887_2_cast9_loc_c_blk_n | ~Block_if_end_i_i126_9218223_proc_U0.shl_ln887_1_cast8_loc_c_blk_n;
assign inst_idle_sigs[3] = relu_2_U0.ap_idle;
assign inst_block_sigs[3] = (relu_2_U0.ap_done & ~relu_2_U0.ap_continue);
assign inst_idle_sigs[4] = Block_if_end_i_i126_9218229_proc_U0.ap_idle;
assign inst_block_sigs[4] = (Block_if_end_i_i126_9218229_proc_U0.ap_done & ~Block_if_end_i_i126_9218229_proc_U0.ap_continue) | ~Block_if_end_i_i126_9218229_proc_U0.shl_ln887_4_cast11_loc_blk_n | ~Block_if_end_i_i126_9218229_proc_U0.shl_ln887_6_cast18_loc_c_blk_n;
assign inst_idle_sigs[5] = relu_3_U0.ap_idle;
assign inst_block_sigs[5] = (relu_3_U0.ap_done & ~relu_3_U0.ap_continue);
assign inst_idle_sigs[6] = Block_if_end_i_i126_9218235_proc_U0.ap_idle;
assign inst_block_sigs[6] = (Block_if_end_i_i126_9218235_proc_U0.ap_done & ~Block_if_end_i_i126_9218235_proc_U0.ap_continue) | ~Block_if_end_i_i126_9218235_proc_U0.shl_ln887_1_cast8_loc_blk_n | ~Block_if_end_i_i126_9218235_proc_U0.shl_ln887_7_cast_loc_blk_n | ~Block_if_end_i_i126_9218235_proc_U0.shl_ln887_7_cast_loc_c_blk_n | ~Block_if_end_i_i126_9218235_proc_U0.shl_ln887_5_cast22_loc_c_blk_n | ~Block_if_end_i_i126_9218235_proc_U0.shl_ln887_3_cast21_loc_c_blk_n;
assign inst_idle_sigs[7] = relu_4_U0.ap_idle;
assign inst_block_sigs[7] = (relu_4_U0.ap_done & ~relu_4_U0.ap_continue);
assign inst_idle_sigs[8] = Block_if_end_i_i126_9218241_proc_U0.ap_idle;
assign inst_block_sigs[8] = (Block_if_end_i_i126_9218241_proc_U0.ap_done & ~Block_if_end_i_i126_9218241_proc_U0.ap_continue) | ~Block_if_end_i_i126_9218241_proc_U0.shl_ln887_2_cast9_loc_blk_n | ~Block_if_end_i_i126_9218241_proc_U0.shl_ln887_3_cast21_loc_blk_n | ~Block_if_end_i_i126_9218241_proc_U0.shl_ln887_5_cast22_loc_blk_n | ~Block_if_end_i_i126_9218241_proc_U0.shl_ln887_6_cast18_loc_blk_n | ~Block_if_end_i_i126_9218241_proc_U0.shl_ln887_7_cast_loc_blk_n | ~Block_if_end_i_i126_9218241_proc_U0.shl_ln887_8_cast_loc_blk_n;
assign inst_idle_sigs[9] = relu_U0.ap_idle;
assign inst_block_sigs[9] = (relu_U0.ap_done & ~relu_U0.ap_continue);
assign inst_idle_sigs[10] = Block_if_end_i_i126_9218247_proc_U0.ap_idle;
assign inst_block_sigs[10] = (Block_if_end_i_i126_9218247_proc_U0.ap_done & ~Block_if_end_i_i126_9218247_proc_U0.ap_continue);
assign inst_idle_sigs[11] = sigmoid_U0.ap_idle;
assign inst_block_sigs[11] = (sigmoid_U0.ap_done & ~sigmoid_U0.ap_continue);
assign inst_idle_sigs[12] = Block_if_end_i_i126_9218249_proc13_U0.ap_idle;
assign inst_block_sigs[12] = (Block_if_end_i_i126_9218249_proc13_U0.ap_done & ~Block_if_end_i_i126_9218249_proc13_U0.ap_continue);

assign inst_idle_sigs[13] = 1'b0;
assign inst_idle_sigs[14] = Block_if_end_i_i126_9218_proc12_U0.ap_idle;
assign inst_idle_sigs[15] = Block_if_end_i_i126_9218249_proc13_U0.ap_idle;

mlp_hls_deadlock_idx0_monitor mlp_hls_deadlock_idx0_monitor_U (
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
