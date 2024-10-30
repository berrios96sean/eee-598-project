
    wire dl_reset;
    wire dl_clock;
    assign dl_reset = ap_rst_n;
    assign dl_clock = ap_clk;
    wire [0:0] proc_0_data_FIFO_blk;
    wire [0:0] proc_0_data_PIPO_blk;
    wire [0:0] proc_0_start_FIFO_blk;
    wire [0:0] proc_0_TLF_FIFO_blk;
    wire [0:0] proc_0_input_sync_blk;
    wire [0:0] proc_0_output_sync_blk;
    wire [0:0] proc_dep_vld_vec_0;
    reg [0:0] proc_dep_vld_vec_0_reg;
    wire [0:0] in_chan_dep_vld_vec_0;
    wire [1:0] in_chan_dep_data_vec_0;
    wire [0:0] token_in_vec_0;
    wire [0:0] out_chan_dep_vld_vec_0;
    wire [1:0] out_chan_dep_data_0;
    wire [0:0] token_out_vec_0;
    wire dl_detect_out_0;
    wire dep_chan_vld_1_0;
    wire [1:0] dep_chan_data_1_0;
    wire token_1_0;
    wire [0:0] proc_1_data_FIFO_blk;
    wire [0:0] proc_1_data_PIPO_blk;
    wire [0:0] proc_1_start_FIFO_blk;
    wire [0:0] proc_1_TLF_FIFO_blk;
    wire [0:0] proc_1_input_sync_blk;
    wire [0:0] proc_1_output_sync_blk;
    wire [0:0] proc_dep_vld_vec_1;
    reg [0:0] proc_dep_vld_vec_1_reg;
    wire [0:0] in_chan_dep_vld_vec_1;
    wire [1:0] in_chan_dep_data_vec_1;
    wire [0:0] token_in_vec_1;
    wire [0:0] out_chan_dep_vld_vec_1;
    wire [1:0] out_chan_dep_data_1;
    wire [0:0] token_out_vec_1;
    wire dl_detect_out_1;
    wire dep_chan_vld_0_1;
    wire [1:0] dep_chan_data_0_1;
    wire token_0_1;
    wire [1:0] dl_in_vec;
    wire dl_detect_out;
    wire token_clear;
    reg [1:0] origin;

    reg ap_done_reg_0;// for module Block_logistic_regression_for_cond_i_exit_proc_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_0 <= 'b0;
        end
        else begin
            ap_done_reg_0 <= Block_logistic_regression_for_cond_i_exit_proc_U0.ap_done & ~Block_logistic_regression_for_cond_i_exit_proc_U0.ap_continue;
        end
    end

    // Process: Loop_read_input_features_proc2_U0
    logistic_regression_hls_deadlock_detect_unit #(2, 0, 1, 1) logistic_regression_hls_deadlock_detect_unit_0 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_0),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_0),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_0),
        .token_in_vec(token_in_vec_0),
        .dl_detect_in(dl_detect_out),
        .origin(origin[0]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_0),
        .out_chan_dep_data(out_chan_dep_data_0),
        .token_out_vec(token_out_vec_0),
        .dl_detect_out(dl_in_vec[0]));

    assign proc_0_data_FIFO_blk[0] = 1'b0;
    assign proc_0_data_PIPO_blk[0] = 1'b0;
    assign proc_0_start_FIFO_blk[0] = 1'b0;
    assign proc_0_TLF_FIFO_blk[0] = 1'b0;
    assign proc_0_input_sync_blk[0] = 1'b0 | (ap_sync_Loop_read_input_features_proc2_U0_ap_ready & Loop_read_input_features_proc2_U0.ap_idle & ~ap_sync_Block_logistic_regression_for_cond_i_exit_proc_U0_ap_ready);
    assign proc_0_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_0[0] = dl_detect_out ? proc_dep_vld_vec_0_reg[0] : (proc_0_data_FIFO_blk[0] | proc_0_data_PIPO_blk[0] | proc_0_start_FIFO_blk[0] | proc_0_TLF_FIFO_blk[0] | proc_0_input_sync_blk[0] | proc_0_output_sync_blk[0]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_0_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_0_reg <= proc_dep_vld_vec_0;
        end
    end
    assign in_chan_dep_vld_vec_0[0] = dep_chan_vld_1_0;
    assign in_chan_dep_data_vec_0[1 : 0] = dep_chan_data_1_0;
    assign token_in_vec_0[0] = token_1_0;
    assign dep_chan_vld_0_1 = out_chan_dep_vld_vec_0[0];
    assign dep_chan_data_0_1 = out_chan_dep_data_0;
    assign token_0_1 = token_out_vec_0[0];

    // Process: Block_logistic_regression_for_cond_i_exit_proc_U0
    logistic_regression_hls_deadlock_detect_unit #(2, 1, 1, 1) logistic_regression_hls_deadlock_detect_unit_1 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_1),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_1),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_1),
        .token_in_vec(token_in_vec_1),
        .dl_detect_in(dl_detect_out),
        .origin(origin[1]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_1),
        .out_chan_dep_data(out_chan_dep_data_1),
        .token_out_vec(token_out_vec_1),
        .dl_detect_out(dl_in_vec[1]));

    assign proc_1_data_FIFO_blk[0] = 1'b0;
    assign proc_1_data_PIPO_blk[0] = 1'b0;
    assign proc_1_start_FIFO_blk[0] = 1'b0;
    assign proc_1_TLF_FIFO_blk[0] = 1'b0 | (~features_V_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_loc_channel_U.if_write) | (~features_V_1_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_1_loc_channel_U.if_write) | (~features_V_2_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_2_loc_channel_U.if_write) | (~features_V_3_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_3_loc_channel_U.if_write) | (~features_V_4_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_4_loc_channel_U.if_write) | (~features_V_5_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_5_loc_channel_U.if_write) | (~features_V_6_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_6_loc_channel_U.if_write) | (~features_V_7_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_7_loc_channel_U.if_write) | (~features_V_8_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_8_loc_channel_U.if_write) | (~features_V_9_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_9_loc_channel_U.if_write) | (~features_V_10_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_10_loc_channel_U.if_write) | (~features_V_11_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_11_loc_channel_U.if_write) | (~features_V_12_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_12_loc_channel_U.if_write) | (~features_V_13_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_13_loc_channel_U.if_write) | (~features_V_14_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_14_loc_channel_U.if_write) | (~features_V_15_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_15_loc_channel_U.if_write) | (~features_V_16_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_16_loc_channel_U.if_write) | (~features_V_17_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_17_loc_channel_U.if_write) | (~features_V_18_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_18_loc_channel_U.if_write) | (~features_V_19_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_19_loc_channel_U.if_write) | (~features_V_20_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_20_loc_channel_U.if_write) | (~features_V_21_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_21_loc_channel_U.if_write) | (~features_V_22_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_22_loc_channel_U.if_write) | (~features_V_23_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_23_loc_channel_U.if_write) | (~features_V_24_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_24_loc_channel_U.if_write) | (~features_V_25_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_25_loc_channel_U.if_write) | (~features_V_26_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_26_loc_channel_U.if_write) | (~features_V_27_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_27_loc_channel_U.if_write) | (~features_V_28_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_28_loc_channel_U.if_write) | (~features_V_29_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_29_loc_channel_U.if_write) | (~features_V_30_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_30_loc_channel_U.if_write) | (~features_V_31_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_31_loc_channel_U.if_write) | (~features_V_32_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_32_loc_channel_U.if_write) | (~features_V_33_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_33_loc_channel_U.if_write) | (~features_V_34_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_34_loc_channel_U.if_write) | (~features_V_35_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_35_loc_channel_U.if_write) | (~features_V_36_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_36_loc_channel_U.if_write) | (~features_V_37_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_37_loc_channel_U.if_write) | (~features_V_38_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_38_loc_channel_U.if_write) | (~features_V_39_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_39_loc_channel_U.if_write) | (~features_V_40_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_40_loc_channel_U.if_write) | (~features_V_41_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_41_loc_channel_U.if_write) | (~features_V_42_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_42_loc_channel_U.if_write) | (~features_V_43_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_43_loc_channel_U.if_write) | (~features_V_44_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_44_loc_channel_U.if_write) | (~features_V_45_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_45_loc_channel_U.if_write) | (~features_V_46_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_46_loc_channel_U.if_write) | (~features_V_47_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_47_loc_channel_U.if_write) | (~features_V_48_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_48_loc_channel_U.if_write) | (~features_V_49_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_49_loc_channel_U.if_write) | (~features_V_50_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_50_loc_channel_U.if_write) | (~features_V_51_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_51_loc_channel_U.if_write) | (~features_V_52_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_52_loc_channel_U.if_write) | (~features_V_53_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_53_loc_channel_U.if_write) | (~features_V_54_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_54_loc_channel_U.if_write) | (~features_V_55_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_55_loc_channel_U.if_write) | (~features_V_56_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_56_loc_channel_U.if_write) | (~features_V_57_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_57_loc_channel_U.if_write) | (~features_V_58_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_58_loc_channel_U.if_write) | (~features_V_59_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_59_loc_channel_U.if_write) | (~features_V_60_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_60_loc_channel_U.if_write) | (~features_V_61_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_61_loc_channel_U.if_write) | (~features_V_62_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_62_loc_channel_U.if_write) | (~features_V_63_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_63_loc_channel_U.if_write) | (~features_V_64_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_64_loc_channel_U.if_write) | (~features_V_65_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_65_loc_channel_U.if_write) | (~features_V_66_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_66_loc_channel_U.if_write) | (~features_V_67_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_67_loc_channel_U.if_write) | (~features_V_68_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_68_loc_channel_U.if_write) | (~features_V_69_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_69_loc_channel_U.if_write) | (~features_V_70_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_70_loc_channel_U.if_write) | (~features_V_71_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_71_loc_channel_U.if_write) | (~features_V_72_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_72_loc_channel_U.if_write) | (~features_V_73_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_73_loc_channel_U.if_write) | (~features_V_74_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_74_loc_channel_U.if_write) | (~features_V_75_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_75_loc_channel_U.if_write) | (~features_V_76_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_76_loc_channel_U.if_write) | (~features_V_77_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_77_loc_channel_U.if_write) | (~features_V_78_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_78_loc_channel_U.if_write) | (~features_V_79_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_79_loc_channel_U.if_write) | (~features_V_80_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_80_loc_channel_U.if_write) | (~features_V_81_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_81_loc_channel_U.if_write) | (~features_V_82_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_82_loc_channel_U.if_write) | (~features_V_83_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_83_loc_channel_U.if_write) | (~features_V_84_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_84_loc_channel_U.if_write) | (~features_V_85_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_85_loc_channel_U.if_write) | (~features_V_86_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_86_loc_channel_U.if_write) | (~features_V_87_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_87_loc_channel_U.if_write) | (~features_V_88_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_88_loc_channel_U.if_write) | (~features_V_89_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_89_loc_channel_U.if_write) | (~features_V_90_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_90_loc_channel_U.if_write) | (~features_V_91_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_91_loc_channel_U.if_write) | (~features_V_92_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_92_loc_channel_U.if_write) | (~features_V_93_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_93_loc_channel_U.if_write) | (~features_V_94_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_94_loc_channel_U.if_write) | (~features_V_95_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_95_loc_channel_U.if_write) | (~features_V_96_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_96_loc_channel_U.if_write) | (~features_V_97_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_97_loc_channel_U.if_write) | (~features_V_98_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_98_loc_channel_U.if_write) | (~features_V_99_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_99_loc_channel_U.if_write) | (~features_V_100_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_100_loc_channel_U.if_write) | (~features_V_101_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_101_loc_channel_U.if_write) | (~features_V_102_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_102_loc_channel_U.if_write) | (~features_V_103_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_103_loc_channel_U.if_write) | (~features_V_104_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_104_loc_channel_U.if_write) | (~features_V_105_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_105_loc_channel_U.if_write) | (~features_V_106_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_106_loc_channel_U.if_write) | (~features_V_107_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_107_loc_channel_U.if_write) | (~features_V_108_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_108_loc_channel_U.if_write) | (~features_V_109_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_109_loc_channel_U.if_write) | (~features_V_110_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_110_loc_channel_U.if_write) | (~features_V_111_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_111_loc_channel_U.if_write) | (~features_V_112_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_112_loc_channel_U.if_write) | (~features_V_113_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_113_loc_channel_U.if_write) | (~features_V_114_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_114_loc_channel_U.if_write) | (~features_V_115_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_115_loc_channel_U.if_write) | (~features_V_116_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_116_loc_channel_U.if_write) | (~features_V_117_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_117_loc_channel_U.if_write) | (~features_V_118_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_118_loc_channel_U.if_write) | (~features_V_119_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_119_loc_channel_U.if_write) | (~features_V_120_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_120_loc_channel_U.if_write) | (~features_V_121_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_121_loc_channel_U.if_write) | (~features_V_122_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_122_loc_channel_U.if_write) | (~features_V_123_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_123_loc_channel_U.if_write) | (~features_V_124_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_124_loc_channel_U.if_write) | (~features_V_125_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_125_loc_channel_U.if_write) | (~features_V_126_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_126_loc_channel_U.if_write) | (~features_V_127_loc_channel_U.if_empty_n & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~features_V_127_loc_channel_U.if_write);
    assign proc_1_input_sync_blk[0] = 1'b0 | (ap_sync_Block_logistic_regression_for_cond_i_exit_proc_U0_ap_ready & Block_logistic_regression_for_cond_i_exit_proc_U0.ap_idle & ~ap_sync_Loop_read_input_features_proc2_U0_ap_ready);
    assign proc_1_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_1[0] = dl_detect_out ? proc_dep_vld_vec_1_reg[0] : (proc_1_data_FIFO_blk[0] | proc_1_data_PIPO_blk[0] | proc_1_start_FIFO_blk[0] | proc_1_TLF_FIFO_blk[0] | proc_1_input_sync_blk[0] | proc_1_output_sync_blk[0]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_1_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_1_reg <= proc_dep_vld_vec_1;
        end
    end
    assign in_chan_dep_vld_vec_1[0] = dep_chan_vld_0_1;
    assign in_chan_dep_data_vec_1[1 : 0] = dep_chan_data_0_1;
    assign token_in_vec_1[0] = token_0_1;
    assign dep_chan_vld_1_0 = out_chan_dep_vld_vec_1[0];
    assign dep_chan_data_1_0 = out_chan_dep_data_1;
    assign token_1_0 = token_out_vec_1[0];


`include "logistic_regression_hls_deadlock_report_unit.vh"
