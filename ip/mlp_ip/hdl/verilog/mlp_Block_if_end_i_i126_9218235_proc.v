// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module mlp_Block_if_end_i_i126_9218235_proc (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        p_read,
        p_read1,
        shl_ln887_1_cast8_loc_dout,
        shl_ln887_1_cast8_loc_num_data_valid,
        shl_ln887_1_cast8_loc_fifo_cap,
        shl_ln887_1_cast8_loc_empty_n,
        shl_ln887_1_cast8_loc_read,
        p_read2,
        p_read3,
        p_read4,
        p_read5,
        p_read6,
        shl_ln887_7_cast_loc_dout,
        shl_ln887_7_cast_loc_num_data_valid,
        shl_ln887_7_cast_loc_fifo_cap,
        shl_ln887_7_cast_loc_empty_n,
        shl_ln887_7_cast_loc_read,
        p_read7,
        p_read8,
        shl_ln887_7_cast_loc_c_din,
        shl_ln887_7_cast_loc_c_num_data_valid,
        shl_ln887_7_cast_loc_c_fifo_cap,
        shl_ln887_7_cast_loc_c_full_n,
        shl_ln887_7_cast_loc_c_write,
        shl_ln887_5_cast22_loc_c_din,
        shl_ln887_5_cast22_loc_c_num_data_valid,
        shl_ln887_5_cast22_loc_c_fifo_cap,
        shl_ln887_5_cast22_loc_c_full_n,
        shl_ln887_5_cast22_loc_c_write,
        shl_ln887_3_cast21_loc_c_din,
        shl_ln887_3_cast21_loc_c_num_data_valid,
        shl_ln887_3_cast21_loc_c_fifo_cap,
        shl_ln887_3_cast21_loc_c_full_n,
        shl_ln887_3_cast21_loc_c_write,
        ap_return_0,
        ap_return_1
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_state2 = 3'd2;
parameter    ap_ST_fsm_state3 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [30:0] p_read;
input  [44:0] p_read1;
input  [42:0] shl_ln887_1_cast8_loc_dout;
input  [3:0] shl_ln887_1_cast8_loc_num_data_valid;
input  [3:0] shl_ln887_1_cast8_loc_fifo_cap;
input   shl_ln887_1_cast8_loc_empty_n;
output   shl_ln887_1_cast8_loc_read;
input  [47:0] p_read2;
input  [43:0] p_read3;
input  [46:0] p_read4;
input  [45:0] p_read5;
input  [47:0] p_read6;
input  [41:0] shl_ln887_7_cast_loc_dout;
input  [3:0] shl_ln887_7_cast_loc_num_data_valid;
input  [3:0] shl_ln887_7_cast_loc_fifo_cap;
input   shl_ln887_7_cast_loc_empty_n;
output   shl_ln887_7_cast_loc_read;
input  [44:0] p_read7;
input  [41:0] p_read8;
output  [41:0] shl_ln887_7_cast_loc_c_din;
input  [2:0] shl_ln887_7_cast_loc_c_num_data_valid;
input  [2:0] shl_ln887_7_cast_loc_c_fifo_cap;
input   shl_ln887_7_cast_loc_c_full_n;
output   shl_ln887_7_cast_loc_c_write;
output  [45:0] shl_ln887_5_cast22_loc_c_din;
input  [2:0] shl_ln887_5_cast22_loc_c_num_data_valid;
input  [2:0] shl_ln887_5_cast22_loc_c_fifo_cap;
input   shl_ln887_5_cast22_loc_c_full_n;
output   shl_ln887_5_cast22_loc_c_write;
output  [43:0] shl_ln887_3_cast21_loc_c_din;
input  [2:0] shl_ln887_3_cast21_loc_c_num_data_valid;
input  [2:0] shl_ln887_3_cast21_loc_c_fifo_cap;
input   shl_ln887_3_cast21_loc_c_full_n;
output   shl_ln887_3_cast21_loc_c_write;
output  [55:0] ap_return_0;
output  [31:0] ap_return_1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg shl_ln887_1_cast8_loc_read;
reg shl_ln887_7_cast_loc_read;
reg shl_ln887_7_cast_loc_c_write;
reg shl_ln887_5_cast22_loc_c_write;
reg shl_ln887_3_cast21_loc_c_write;
reg[55:0] ap_return_0;
reg[31:0] ap_return_1;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    shl_ln887_1_cast8_loc_blk_n;
reg    shl_ln887_7_cast_loc_blk_n;
reg    shl_ln887_7_cast_loc_c_blk_n;
reg    shl_ln887_5_cast22_loc_c_blk_n;
reg    shl_ln887_3_cast21_loc_c_blk_n;
reg  signed [41:0] shl_ln887_7_cast_loc_read_reg_536;
wire   [44:0] mul_ln1393_fu_204_p2;
reg   [44:0] mul_ln1393_reg_541;
wire   [42:0] r_V_fu_210_p2;
reg   [42:0] r_V_reg_546;
wire   [47:0] r_V_25_fu_216_p2;
reg   [47:0] r_V_25_reg_551;
wire   [43:0] r_V_26_fu_222_p2;
reg   [43:0] r_V_26_reg_556;
wire    ap_CS_fsm_state2;
reg   [31:0] tmp_15_reg_571;
wire   [47:0] r_V_29_fu_380_p2;
reg   [47:0] r_V_29_reg_576;
wire   [41:0] r_V_30_fu_386_p2;
reg   [41:0] r_V_30_reg_581;
reg    ap_block_state1;
wire    ap_CS_fsm_state3;
wire  signed [29:0] mul_ln1393_fu_204_p1;
wire  signed [26:0] r_V_fu_210_p1;
wire  signed [31:0] r_V_25_fu_216_p1;
wire   [27:0] r_V_26_fu_222_p1;
wire   [44:0] ret_V_fu_228_p2;
wire   [26:0] lhs_V_fu_233_p4;
wire   [44:0] lhs_V_22_fu_246_p3;
wire  signed [45:0] sext_ln1393_fu_254_p1;
wire  signed [45:0] sext_ln1316_fu_243_p1;
wire   [45:0] ret_V_26_fu_258_p2;
wire   [27:0] tmp_fu_264_p4;
wire   [45:0] tmp_16_fu_274_p3;
wire  signed [49:0] lhs_V_23_fu_282_p1;
wire  signed [49:0] sext_ln1393_18_fu_286_p1;
wire   [49:0] ret_V_35_fu_289_p2;
wire  signed [49:0] sext_ln1393_19_fu_295_p1;
wire   [49:0] ret_V_28_fu_298_p2;
wire   [31:0] tmp_s_fu_304_p4;
wire   [30:0] r_V_27_fu_322_p1;
wire   [46:0] r_V_27_fu_322_p2;
wire   [49:0] lhs_V_25_fu_314_p3;
wire  signed [49:0] sext_ln1393_20_fu_327_p1;
wire   [49:0] ret_V_29_fu_331_p2;
wire   [31:0] tmp_14_fu_337_p4;
wire  signed [29:0] r_V_28_fu_355_p1;
wire   [45:0] r_V_28_fu_355_p2;
wire   [49:0] lhs_V_26_fu_347_p3;
wire  signed [49:0] sext_ln1393_21_fu_360_p1;
wire   [49:0] ret_V_30_fu_364_p2;
wire   [31:0] r_V_29_fu_380_p1;
wire  signed [25:0] r_V_30_fu_386_p1;
wire   [49:0] lhs_V_27_fu_395_p3;
wire  signed [49:0] sext_ln1393_22_fu_402_p1;
wire   [49:0] ret_V_31_fu_405_p2;
wire   [31:0] tmp_17_fu_411_p4;
wire   [49:0] lhs_V_28_fu_421_p3;
wire  signed [49:0] sext_ln1393_23_fu_429_p1;
wire   [49:0] ret_V_32_fu_432_p2;
wire   [31:0] tmp_18_fu_438_p4;
wire   [28:0] r_V_31_fu_456_p1;
wire   [44:0] r_V_31_fu_456_p2;
wire   [49:0] lhs_V_29_fu_448_p3;
wire  signed [49:0] sext_ln1393_24_fu_461_p1;
wire   [49:0] ret_V_33_fu_465_p2;
wire   [31:0] tmp_19_fu_471_p4;
wire  signed [25:0] r_V_32_fu_489_p1;
wire   [41:0] r_V_32_fu_489_p2;
wire   [49:0] lhs_V_30_fu_481_p3;
wire  signed [49:0] sext_ln1393_25_fu_494_p1;
wire   [49:0] ret_V_34_fu_498_p2;
wire   [55:0] zext_ln1319_fu_391_p1;
reg   [55:0] ap_return_0_preg;
reg   [31:0] ap_return_1_preg;
reg   [2:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 3'd1;
#0 ap_return_0_preg = 56'd0;
#0 ap_return_1_preg = 32'd0;
end

mlp_mul_45s_30s_45_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 45 ),
    .din1_WIDTH( 30 ),
    .dout_WIDTH( 45 ))
mul_45s_30s_45_1_1_U92(
    .din0(p_read1),
    .din1(mul_ln1393_fu_204_p1),
    .dout(mul_ln1393_fu_204_p2)
);

mlp_mul_43s_27s_43_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 43 ),
    .din1_WIDTH( 27 ),
    .dout_WIDTH( 43 ))
mul_43s_27s_43_1_1_U93(
    .din0(shl_ln887_1_cast8_loc_dout),
    .din1(r_V_fu_210_p1),
    .dout(r_V_fu_210_p2)
);

mlp_mul_48s_32s_48_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 48 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 48 ))
mul_48s_32s_48_1_1_U94(
    .din0(p_read2),
    .din1(r_V_25_fu_216_p1),
    .dout(r_V_25_fu_216_p2)
);

mlp_mul_44s_28ns_44_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 44 ),
    .din1_WIDTH( 28 ),
    .dout_WIDTH( 44 ))
mul_44s_28ns_44_1_1_U95(
    .din0(p_read3),
    .din1(r_V_26_fu_222_p1),
    .dout(r_V_26_fu_222_p2)
);

mlp_mul_47s_31ns_47_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 47 ),
    .din1_WIDTH( 31 ),
    .dout_WIDTH( 47 ))
mul_47s_31ns_47_1_1_U96(
    .din0(p_read4),
    .din1(r_V_27_fu_322_p1),
    .dout(r_V_27_fu_322_p2)
);

mlp_mul_46s_30s_46_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 46 ),
    .din1_WIDTH( 30 ),
    .dout_WIDTH( 46 ))
mul_46s_30s_46_1_1_U97(
    .din0(p_read5),
    .din1(r_V_28_fu_355_p1),
    .dout(r_V_28_fu_355_p2)
);

mlp_mul_48s_32ns_48_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 48 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 48 ))
mul_48s_32ns_48_1_1_U98(
    .din0(p_read6),
    .din1(r_V_29_fu_380_p1),
    .dout(r_V_29_fu_380_p2)
);

mlp_mul_42s_26s_42_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 42 ),
    .din1_WIDTH( 26 ),
    .dout_WIDTH( 42 ))
mul_42s_26s_42_1_1_U99(
    .din0(shl_ln887_7_cast_loc_read_reg_536),
    .din1(r_V_30_fu_386_p1),
    .dout(r_V_30_fu_386_p2)
);

mlp_mul_45s_29ns_45_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 45 ),
    .din1_WIDTH( 29 ),
    .dout_WIDTH( 45 ))
mul_45s_29ns_45_1_1_U100(
    .din0(p_read7),
    .din1(r_V_31_fu_456_p1),
    .dout(r_V_31_fu_456_p2)
);

mlp_mul_42s_26s_42_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 42 ),
    .din1_WIDTH( 26 ),
    .dout_WIDTH( 42 ))
mul_42s_26s_42_1_1_U101(
    .din0(p_read8),
    .din1(r_V_32_fu_489_p1),
    .dout(r_V_32_fu_489_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state3)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
                ap_return_0_preg[0] <= 1'b0;
        ap_return_0_preg[1] <= 1'b0;
        ap_return_0_preg[2] <= 1'b0;
        ap_return_0_preg[3] <= 1'b0;
        ap_return_0_preg[4] <= 1'b0;
        ap_return_0_preg[5] <= 1'b0;
        ap_return_0_preg[6] <= 1'b0;
        ap_return_0_preg[7] <= 1'b0;
        ap_return_0_preg[8] <= 1'b0;
        ap_return_0_preg[9] <= 1'b0;
        ap_return_0_preg[10] <= 1'b0;
        ap_return_0_preg[11] <= 1'b0;
        ap_return_0_preg[12] <= 1'b0;
        ap_return_0_preg[13] <= 1'b0;
        ap_return_0_preg[14] <= 1'b0;
        ap_return_0_preg[15] <= 1'b0;
        ap_return_0_preg[16] <= 1'b0;
        ap_return_0_preg[17] <= 1'b0;
        ap_return_0_preg[18] <= 1'b0;
        ap_return_0_preg[19] <= 1'b0;
        ap_return_0_preg[20] <= 1'b0;
        ap_return_0_preg[21] <= 1'b0;
        ap_return_0_preg[22] <= 1'b0;
        ap_return_0_preg[23] <= 1'b0;
        ap_return_0_preg[24] <= 1'b0;
        ap_return_0_preg[25] <= 1'b0;
        ap_return_0_preg[26] <= 1'b0;
        ap_return_0_preg[27] <= 1'b0;
        ap_return_0_preg[28] <= 1'b0;
        ap_return_0_preg[29] <= 1'b0;
        ap_return_0_preg[30] <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
                        ap_return_0_preg[30 : 0] <= zext_ln1319_fu_391_p1[30 : 0];
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_1_preg <= 32'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            ap_return_1_preg <= {{ret_V_34_fu_498_p2[49:18]}};
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        mul_ln1393_reg_541 <= mul_ln1393_fu_204_p2;
        r_V_25_reg_551 <= r_V_25_fu_216_p2;
        r_V_26_reg_556 <= r_V_26_fu_222_p2;
        r_V_reg_546 <= r_V_fu_210_p2;
        shl_ln887_7_cast_loc_read_reg_536 <= shl_ln887_7_cast_loc_dout;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        r_V_29_reg_576 <= r_V_29_fu_380_p2;
        r_V_30_reg_581 <= r_V_30_fu_386_p2;
        tmp_15_reg_571 <= {{ret_V_30_fu_364_p2[49:18]}};
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) | (shl_ln887_3_cast21_loc_c_full_n == 1'b0) | (shl_ln887_5_cast22_loc_c_full_n == 1'b0) | (shl_ln887_7_cast_loc_c_full_n == 1'b0) | (shl_ln887_7_cast_loc_empty_n == 1'b0) | (shl_ln887_1_cast8_loc_empty_n == 1'b0) | (ap_done_reg == 1'b1))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        ap_return_0 = zext_ln1319_fu_391_p1;
    end else begin
        ap_return_0 = ap_return_0_preg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        ap_return_1 = {{ret_V_34_fu_498_p2[49:18]}};
    end else begin
        ap_return_1 = ap_return_1_preg;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        shl_ln887_1_cast8_loc_blk_n = shl_ln887_1_cast8_loc_empty_n;
    end else begin
        shl_ln887_1_cast8_loc_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (shl_ln887_3_cast21_loc_c_full_n == 1'b0) | (shl_ln887_5_cast22_loc_c_full_n == 1'b0) | (shl_ln887_7_cast_loc_c_full_n == 1'b0) | (shl_ln887_7_cast_loc_empty_n == 1'b0) | (shl_ln887_1_cast8_loc_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        shl_ln887_1_cast8_loc_read = 1'b1;
    end else begin
        shl_ln887_1_cast8_loc_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        shl_ln887_3_cast21_loc_c_blk_n = shl_ln887_3_cast21_loc_c_full_n;
    end else begin
        shl_ln887_3_cast21_loc_c_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (shl_ln887_3_cast21_loc_c_full_n == 1'b0) | (shl_ln887_5_cast22_loc_c_full_n == 1'b0) | (shl_ln887_7_cast_loc_c_full_n == 1'b0) | (shl_ln887_7_cast_loc_empty_n == 1'b0) | (shl_ln887_1_cast8_loc_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        shl_ln887_3_cast21_loc_c_write = 1'b1;
    end else begin
        shl_ln887_3_cast21_loc_c_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        shl_ln887_5_cast22_loc_c_blk_n = shl_ln887_5_cast22_loc_c_full_n;
    end else begin
        shl_ln887_5_cast22_loc_c_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (shl_ln887_3_cast21_loc_c_full_n == 1'b0) | (shl_ln887_5_cast22_loc_c_full_n == 1'b0) | (shl_ln887_7_cast_loc_c_full_n == 1'b0) | (shl_ln887_7_cast_loc_empty_n == 1'b0) | (shl_ln887_1_cast8_loc_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        shl_ln887_5_cast22_loc_c_write = 1'b1;
    end else begin
        shl_ln887_5_cast22_loc_c_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        shl_ln887_7_cast_loc_blk_n = shl_ln887_7_cast_loc_empty_n;
    end else begin
        shl_ln887_7_cast_loc_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        shl_ln887_7_cast_loc_c_blk_n = shl_ln887_7_cast_loc_c_full_n;
    end else begin
        shl_ln887_7_cast_loc_c_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (shl_ln887_3_cast21_loc_c_full_n == 1'b0) | (shl_ln887_5_cast22_loc_c_full_n == 1'b0) | (shl_ln887_7_cast_loc_c_full_n == 1'b0) | (shl_ln887_7_cast_loc_empty_n == 1'b0) | (shl_ln887_1_cast8_loc_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        shl_ln887_7_cast_loc_c_write = 1'b1;
    end else begin
        shl_ln887_7_cast_loc_c_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (shl_ln887_3_cast21_loc_c_full_n == 1'b0) | (shl_ln887_5_cast22_loc_c_full_n == 1'b0) | (shl_ln887_7_cast_loc_c_full_n == 1'b0) | (shl_ln887_7_cast_loc_empty_n == 1'b0) | (shl_ln887_1_cast8_loc_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        shl_ln887_7_cast_loc_read = 1'b1;
    end else begin
        shl_ln887_7_cast_loc_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (shl_ln887_3_cast21_loc_c_full_n == 1'b0) | (shl_ln887_5_cast22_loc_c_full_n == 1'b0) | (shl_ln887_7_cast_loc_c_full_n == 1'b0) | (shl_ln887_7_cast_loc_empty_n == 1'b0) | (shl_ln887_1_cast8_loc_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (shl_ln887_3_cast21_loc_c_full_n == 1'b0) | (shl_ln887_5_cast22_loc_c_full_n == 1'b0) | (shl_ln887_7_cast_loc_c_full_n == 1'b0) | (shl_ln887_7_cast_loc_empty_n == 1'b0) | (shl_ln887_1_cast8_loc_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign lhs_V_22_fu_246_p3 = {{lhs_V_fu_233_p4}, {18'd0}};

assign lhs_V_23_fu_282_p1 = $signed(tmp_16_fu_274_p3);

assign lhs_V_25_fu_314_p3 = {{tmp_s_fu_304_p4}, {18'd0}};

assign lhs_V_26_fu_347_p3 = {{tmp_14_fu_337_p4}, {18'd0}};

assign lhs_V_27_fu_395_p3 = {{tmp_15_reg_571}, {18'd0}};

assign lhs_V_28_fu_421_p3 = {{tmp_17_fu_411_p4}, {18'd0}};

assign lhs_V_29_fu_448_p3 = {{tmp_18_fu_438_p4}, {18'd0}};

assign lhs_V_30_fu_481_p3 = {{tmp_19_fu_471_p4}, {18'd0}};

assign lhs_V_fu_233_p4 = {{ret_V_fu_228_p2[44:18]}};

assign mul_ln1393_fu_204_p1 = 45'd35184057810366;

assign r_V_25_fu_216_p1 = 48'd281473586861696;

assign r_V_26_fu_222_p1 = 44'd81591014;

assign r_V_27_fu_322_p1 = 47'd615339442;

assign r_V_28_fu_355_p1 = 46'd70368225939367;

assign r_V_29_fu_380_p1 = 48'd1146573327;

assign r_V_30_fu_386_p1 = 42'd4398016403524;

assign r_V_31_fu_456_p1 = 45'd186154207;

assign r_V_32_fu_489_p1 = 42'd4398020026248;

assign r_V_fu_210_p1 = 43'd8796057219373;

assign ret_V_26_fu_258_p2 = ($signed(sext_ln1393_fu_254_p1) + $signed(sext_ln1316_fu_243_p1));

assign ret_V_28_fu_298_p2 = ($signed(ret_V_35_fu_289_p2) + $signed(sext_ln1393_19_fu_295_p1));

assign ret_V_29_fu_331_p2 = ($signed(lhs_V_25_fu_314_p3) + $signed(sext_ln1393_20_fu_327_p1));

assign ret_V_30_fu_364_p2 = ($signed(lhs_V_26_fu_347_p3) + $signed(sext_ln1393_21_fu_360_p1));

assign ret_V_31_fu_405_p2 = ($signed(lhs_V_27_fu_395_p3) + $signed(sext_ln1393_22_fu_402_p1));

assign ret_V_32_fu_432_p2 = ($signed(lhs_V_28_fu_421_p3) + $signed(sext_ln1393_23_fu_429_p1));

assign ret_V_33_fu_465_p2 = ($signed(lhs_V_29_fu_448_p3) + $signed(sext_ln1393_24_fu_461_p1));

assign ret_V_34_fu_498_p2 = ($signed(lhs_V_30_fu_481_p3) + $signed(sext_ln1393_25_fu_494_p1));

assign ret_V_35_fu_289_p2 = ($signed(lhs_V_23_fu_282_p1) + $signed(sext_ln1393_18_fu_286_p1));

assign ret_V_fu_228_p2 = (mul_ln1393_reg_541 + 45'd3955357384704);

assign sext_ln1316_fu_243_p1 = $signed(r_V_reg_546);

assign sext_ln1393_18_fu_286_p1 = $signed(r_V_25_reg_551);

assign sext_ln1393_19_fu_295_p1 = $signed(r_V_26_reg_556);

assign sext_ln1393_20_fu_327_p1 = $signed(r_V_27_fu_322_p2);

assign sext_ln1393_21_fu_360_p1 = $signed(r_V_28_fu_355_p2);

assign sext_ln1393_22_fu_402_p1 = $signed(r_V_29_reg_576);

assign sext_ln1393_23_fu_429_p1 = $signed(r_V_30_reg_581);

assign sext_ln1393_24_fu_461_p1 = $signed(r_V_31_fu_456_p2);

assign sext_ln1393_25_fu_494_p1 = $signed(r_V_32_fu_489_p2);

assign sext_ln1393_fu_254_p1 = $signed(lhs_V_22_fu_246_p3);

assign shl_ln887_3_cast21_loc_c_din = p_read3;

assign shl_ln887_5_cast22_loc_c_din = p_read5;

assign shl_ln887_7_cast_loc_c_din = shl_ln887_7_cast_loc_dout;

assign tmp_14_fu_337_p4 = {{ret_V_29_fu_331_p2[49:18]}};

assign tmp_16_fu_274_p3 = {{tmp_fu_264_p4}, {18'd0}};

assign tmp_17_fu_411_p4 = {{ret_V_31_fu_405_p2[49:18]}};

assign tmp_18_fu_438_p4 = {{ret_V_32_fu_432_p2[49:18]}};

assign tmp_19_fu_471_p4 = {{ret_V_33_fu_465_p2[49:18]}};

assign tmp_fu_264_p4 = {{ret_V_26_fu_258_p2[45:18]}};

assign tmp_s_fu_304_p4 = {{ret_V_28_fu_298_p2[49:18]}};

assign zext_ln1319_fu_391_p1 = p_read;

always @ (posedge ap_clk) begin
    ap_return_0_preg[55:31] <= 25'b0000000000000000000000000;
end

endmodule //mlp_Block_if_end_i_i126_9218235_proc