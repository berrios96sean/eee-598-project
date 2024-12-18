// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module mlp_Block_if_end_i_i126_9218229_proc (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        p_read,
        p_read1,
        p_read2,
        p_read3,
        p_read4,
        shl_ln887_4_cast11_loc_dout,
        shl_ln887_4_cast11_loc_num_data_valid,
        shl_ln887_4_cast11_loc_fifo_cap,
        shl_ln887_4_cast11_loc_empty_n,
        shl_ln887_4_cast11_loc_read,
        p_read5,
        p_read6,
        p_read7,
        p_read8,
        p_read9,
        shl_ln887_6_cast18_loc_c_din,
        shl_ln887_6_cast18_loc_c_num_data_valid,
        shl_ln887_6_cast18_loc_c_fifo_cap,
        shl_ln887_6_cast18_loc_c_full_n,
        shl_ln887_6_cast18_loc_c_write,
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
input  [45:0] p_read1;
input  [44:0] p_read2;
input  [41:0] p_read3;
input  [44:0] p_read4;
input  [42:0] shl_ln887_4_cast11_loc_dout;
input  [2:0] shl_ln887_4_cast11_loc_num_data_valid;
input  [2:0] shl_ln887_4_cast11_loc_fifo_cap;
input   shl_ln887_4_cast11_loc_empty_n;
output   shl_ln887_4_cast11_loc_read;
input  [43:0] p_read5;
input  [45:0] p_read6;
input  [40:0] p_read7;
input  [42:0] p_read8;
input  [44:0] p_read9;
output  [45:0] shl_ln887_6_cast18_loc_c_din;
input  [3:0] shl_ln887_6_cast18_loc_c_num_data_valid;
input  [3:0] shl_ln887_6_cast18_loc_c_fifo_cap;
input   shl_ln887_6_cast18_loc_c_full_n;
output   shl_ln887_6_cast18_loc_c_write;
output  [55:0] ap_return_0;
output  [31:0] ap_return_1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg shl_ln887_4_cast11_loc_read;
reg shl_ln887_6_cast18_loc_c_write;
reg[55:0] ap_return_0;
reg[31:0] ap_return_1;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    shl_ln887_4_cast11_loc_blk_n;
reg    shl_ln887_6_cast18_loc_c_blk_n;
reg  signed [42:0] shl_ln887_4_cast11_loc_read_reg_528;
wire   [45:0] r_V_fu_178_p2;
reg   [45:0] r_V_reg_533;
wire   [44:0] r_V_33_fu_184_p2;
reg   [44:0] r_V_33_reg_538;
wire   [41:0] r_V_34_fu_190_p2;
reg   [41:0] r_V_34_reg_543;
wire    ap_CS_fsm_state2;
reg   [31:0] tmp_21_reg_558;
wire   [43:0] r_V_37_fu_339_p2;
reg   [43:0] r_V_37_reg_563;
wire   [45:0] r_V_38_fu_345_p2;
reg   [45:0] r_V_38_reg_568;
wire   [40:0] r_V_39_fu_350_p2;
reg   [40:0] r_V_39_reg_573;
reg    ap_block_state1;
wire    ap_CS_fsm_state3;
wire  signed [29:0] r_V_fu_178_p1;
wire  signed [28:0] r_V_33_fu_184_p1;
wire   [25:0] r_V_34_fu_190_p1;
wire   [45:0] ret_V_fu_196_p2;
wire   [27:0] lhs_V_fu_201_p4;
wire   [45:0] lhs_V_31_fu_214_p3;
wire  signed [46:0] sext_ln1393_fu_222_p1;
wire  signed [46:0] sext_ln1316_fu_211_p1;
wire   [46:0] ret_V_36_fu_226_p2;
wire   [28:0] tmp_fu_232_p4;
wire   [46:0] tmp_17_fu_242_p3;
wire  signed [49:0] lhs_V_32_fu_250_p1;
wire  signed [49:0] sext_ln1393_26_fu_254_p1;
wire   [49:0] ret_V_37_fu_257_p2;
wire   [31:0] tmp_s_fu_263_p4;
wire  signed [28:0] r_V_35_fu_281_p1;
wire   [44:0] r_V_35_fu_281_p2;
wire   [49:0] lhs_V_33_fu_273_p3;
wire  signed [49:0] sext_ln1393_27_fu_286_p1;
wire   [49:0] ret_V_38_fu_290_p2;
wire   [31:0] tmp_20_fu_296_p4;
wire  signed [26:0] r_V_36_fu_314_p1;
wire   [42:0] r_V_36_fu_314_p2;
wire   [49:0] lhs_V_34_fu_306_p3;
wire  signed [49:0] sext_ln1393_28_fu_319_p1;
wire   [49:0] ret_V_39_fu_323_p2;
wire   [27:0] r_V_37_fu_339_p1;
wire  signed [29:0] r_V_38_fu_345_p1;
wire  signed [24:0] r_V_39_fu_350_p1;
wire   [49:0] lhs_V_35_fu_360_p3;
wire  signed [49:0] sext_ln1393_29_fu_367_p1;
wire   [49:0] ret_V_40_fu_370_p2;
wire   [31:0] tmp_22_fu_376_p4;
wire   [49:0] lhs_V_36_fu_386_p3;
wire  signed [49:0] sext_ln1393_30_fu_394_p1;
wire   [49:0] ret_V_41_fu_397_p2;
wire   [31:0] tmp_23_fu_403_p4;
wire   [49:0] lhs_V_37_fu_413_p3;
wire  signed [49:0] sext_ln1393_31_fu_421_p1;
wire   [49:0] ret_V_42_fu_424_p2;
wire   [31:0] tmp_24_fu_430_p4;
wire   [26:0] r_V_40_fu_448_p1;
wire   [42:0] r_V_40_fu_448_p2;
wire   [49:0] lhs_V_38_fu_440_p3;
wire  signed [49:0] sext_ln1393_32_fu_453_p1;
wire   [49:0] ret_V_43_fu_457_p2;
wire   [31:0] tmp_25_fu_463_p4;
wire   [28:0] r_V_41_fu_481_p1;
wire   [44:0] r_V_41_fu_481_p2;
wire   [49:0] lhs_V_39_fu_473_p3;
wire  signed [49:0] sext_ln1393_33_fu_486_p1;
wire   [49:0] ret_V_44_fu_490_p2;
wire   [55:0] zext_ln1319_fu_356_p1;
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

mlp_mul_46s_30s_46_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 46 ),
    .din1_WIDTH( 30 ),
    .dout_WIDTH( 46 ))
mul_46s_30s_46_1_1_U63(
    .din0(p_read1),
    .din1(r_V_fu_178_p1),
    .dout(r_V_fu_178_p2)
);

mlp_mul_45s_29s_45_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 45 ),
    .din1_WIDTH( 29 ),
    .dout_WIDTH( 45 ))
mul_45s_29s_45_1_1_U64(
    .din0(p_read2),
    .din1(r_V_33_fu_184_p1),
    .dout(r_V_33_fu_184_p2)
);

mlp_mul_42s_26ns_42_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 42 ),
    .din1_WIDTH( 26 ),
    .dout_WIDTH( 42 ))
mul_42s_26ns_42_1_1_U65(
    .din0(p_read3),
    .din1(r_V_34_fu_190_p1),
    .dout(r_V_34_fu_190_p2)
);

mlp_mul_45s_29s_45_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 45 ),
    .din1_WIDTH( 29 ),
    .dout_WIDTH( 45 ))
mul_45s_29s_45_1_1_U66(
    .din0(p_read4),
    .din1(r_V_35_fu_281_p1),
    .dout(r_V_35_fu_281_p2)
);

mlp_mul_43s_27s_43_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 43 ),
    .din1_WIDTH( 27 ),
    .dout_WIDTH( 43 ))
mul_43s_27s_43_1_1_U67(
    .din0(shl_ln887_4_cast11_loc_read_reg_528),
    .din1(r_V_36_fu_314_p1),
    .dout(r_V_36_fu_314_p2)
);

mlp_mul_44s_28ns_44_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 44 ),
    .din1_WIDTH( 28 ),
    .dout_WIDTH( 44 ))
mul_44s_28ns_44_1_1_U68(
    .din0(p_read5),
    .din1(r_V_37_fu_339_p1),
    .dout(r_V_37_fu_339_p2)
);

mlp_mul_46s_30s_46_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 46 ),
    .din1_WIDTH( 30 ),
    .dout_WIDTH( 46 ))
mul_46s_30s_46_1_1_U69(
    .din0(p_read6),
    .din1(r_V_38_fu_345_p1),
    .dout(r_V_38_fu_345_p2)
);

mlp_mul_41s_25s_41_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 41 ),
    .din1_WIDTH( 25 ),
    .dout_WIDTH( 41 ))
mul_41s_25s_41_1_1_U70(
    .din0(p_read7),
    .din1(r_V_39_fu_350_p1),
    .dout(r_V_39_fu_350_p2)
);

mlp_mul_43s_27ns_43_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 43 ),
    .din1_WIDTH( 27 ),
    .dout_WIDTH( 43 ))
mul_43s_27ns_43_1_1_U71(
    .din0(p_read8),
    .din1(r_V_40_fu_448_p1),
    .dout(r_V_40_fu_448_p2)
);

mlp_mul_45s_29ns_45_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 45 ),
    .din1_WIDTH( 29 ),
    .dout_WIDTH( 45 ))
mul_45s_29ns_45_1_1_U72(
    .din0(p_read9),
    .din1(r_V_41_fu_481_p1),
    .dout(r_V_41_fu_481_p2)
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
                        ap_return_0_preg[30 : 0] <= zext_ln1319_fu_356_p1[30 : 0];
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_1_preg <= 32'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            ap_return_1_preg <= {{ret_V_44_fu_490_p2[49:18]}};
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        r_V_33_reg_538 <= r_V_33_fu_184_p2;
        r_V_34_reg_543 <= r_V_34_fu_190_p2;
        r_V_reg_533 <= r_V_fu_178_p2;
        shl_ln887_4_cast11_loc_read_reg_528 <= shl_ln887_4_cast11_loc_dout;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        r_V_37_reg_563 <= r_V_37_fu_339_p2;
        r_V_38_reg_568 <= r_V_38_fu_345_p2;
        r_V_39_reg_573 <= r_V_39_fu_350_p2;
        tmp_21_reg_558 <= {{ret_V_39_fu_323_p2[49:18]}};
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) | (shl_ln887_6_cast18_loc_c_full_n == 1'b0) | (shl_ln887_4_cast11_loc_empty_n == 1'b0) | (ap_done_reg == 1'b1))) begin
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
        ap_return_0 = zext_ln1319_fu_356_p1;
    end else begin
        ap_return_0 = ap_return_0_preg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        ap_return_1 = {{ret_V_44_fu_490_p2[49:18]}};
    end else begin
        ap_return_1 = ap_return_1_preg;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        shl_ln887_4_cast11_loc_blk_n = shl_ln887_4_cast11_loc_empty_n;
    end else begin
        shl_ln887_4_cast11_loc_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (shl_ln887_6_cast18_loc_c_full_n == 1'b0) | (shl_ln887_4_cast11_loc_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        shl_ln887_4_cast11_loc_read = 1'b1;
    end else begin
        shl_ln887_4_cast11_loc_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        shl_ln887_6_cast18_loc_c_blk_n = shl_ln887_6_cast18_loc_c_full_n;
    end else begin
        shl_ln887_6_cast18_loc_c_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (shl_ln887_6_cast18_loc_c_full_n == 1'b0) | (shl_ln887_4_cast11_loc_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        shl_ln887_6_cast18_loc_c_write = 1'b1;
    end else begin
        shl_ln887_6_cast18_loc_c_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (shl_ln887_6_cast18_loc_c_full_n == 1'b0) | (shl_ln887_4_cast11_loc_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
    ap_block_state1 = ((ap_start == 1'b0) | (shl_ln887_6_cast18_loc_c_full_n == 1'b0) | (shl_ln887_4_cast11_loc_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign lhs_V_31_fu_214_p3 = {{lhs_V_fu_201_p4}, {18'd0}};

assign lhs_V_32_fu_250_p1 = $signed(tmp_17_fu_242_p3);

assign lhs_V_33_fu_273_p3 = {{tmp_s_fu_263_p4}, {18'd0}};

assign lhs_V_34_fu_306_p3 = {{tmp_20_fu_296_p4}, {18'd0}};

assign lhs_V_35_fu_360_p3 = {{tmp_21_reg_558}, {18'd0}};

assign lhs_V_36_fu_386_p3 = {{tmp_22_fu_376_p4}, {18'd0}};

assign lhs_V_37_fu_413_p3 = {{tmp_23_fu_403_p4}, {18'd0}};

assign lhs_V_38_fu_440_p3 = {{tmp_24_fu_430_p4}, {18'd0}};

assign lhs_V_39_fu_473_p3 = {{tmp_25_fu_463_p4}, {18'd0}};

assign lhs_V_fu_201_p4 = {{ret_V_fu_196_p2[45:18]}};

assign r_V_33_fu_184_p1 = 45'd35184135424052;

assign r_V_34_fu_190_p1 = 42'd20653483;

assign r_V_35_fu_281_p1 = 45'd35184190675112;

assign r_V_36_fu_314_p1 = 43'd8796040419186;

assign r_V_37_fu_339_p1 = 44'd77122954;

assign r_V_38_fu_345_p1 = 46'd70368341232681;

assign r_V_39_fu_350_p1 = 41'd2199006633146;

assign r_V_40_fu_448_p1 = 43'd57383912;

assign r_V_41_fu_481_p1 = 45'd191804249;

assign r_V_fu_178_p1 = 46'd70368385600299;

assign ret_V_36_fu_226_p2 = ($signed(sext_ln1393_fu_222_p1) + $signed(sext_ln1316_fu_211_p1));

assign ret_V_37_fu_257_p2 = ($signed(lhs_V_32_fu_250_p1) + $signed(sext_ln1393_26_fu_254_p1));

assign ret_V_38_fu_290_p2 = ($signed(lhs_V_33_fu_273_p3) + $signed(sext_ln1393_27_fu_286_p1));

assign ret_V_39_fu_323_p2 = ($signed(lhs_V_34_fu_306_p3) + $signed(sext_ln1393_28_fu_319_p1));

assign ret_V_40_fu_370_p2 = ($signed(lhs_V_35_fu_360_p3) + $signed(sext_ln1393_29_fu_367_p1));

assign ret_V_41_fu_397_p2 = ($signed(lhs_V_36_fu_386_p3) + $signed(sext_ln1393_30_fu_394_p1));

assign ret_V_42_fu_424_p2 = ($signed(lhs_V_37_fu_413_p3) + $signed(sext_ln1393_31_fu_421_p1));

assign ret_V_43_fu_457_p2 = ($signed(lhs_V_38_fu_440_p3) + $signed(sext_ln1393_32_fu_453_p1));

assign ret_V_44_fu_490_p2 = ($signed(lhs_V_39_fu_473_p3) + $signed(sext_ln1393_33_fu_486_p1));

assign ret_V_fu_196_p2 = (r_V_reg_533 + 46'd7034627948544);

assign sext_ln1316_fu_211_p1 = $signed(r_V_33_reg_538);

assign sext_ln1393_26_fu_254_p1 = $signed(r_V_34_reg_543);

assign sext_ln1393_27_fu_286_p1 = $signed(r_V_35_fu_281_p2);

assign sext_ln1393_28_fu_319_p1 = $signed(r_V_36_fu_314_p2);

assign sext_ln1393_29_fu_367_p1 = $signed(r_V_37_reg_563);

assign sext_ln1393_30_fu_394_p1 = $signed(r_V_38_reg_568);

assign sext_ln1393_31_fu_421_p1 = $signed(r_V_39_reg_573);

assign sext_ln1393_32_fu_453_p1 = $signed(r_V_40_fu_448_p2);

assign sext_ln1393_33_fu_486_p1 = $signed(r_V_41_fu_481_p2);

assign sext_ln1393_fu_222_p1 = $signed(lhs_V_31_fu_214_p3);

assign shl_ln887_6_cast18_loc_c_din = p_read6;

assign tmp_17_fu_242_p3 = {{tmp_fu_232_p4}, {18'd0}};

assign tmp_20_fu_296_p4 = {{ret_V_38_fu_290_p2[49:18]}};

assign tmp_22_fu_376_p4 = {{ret_V_40_fu_370_p2[49:18]}};

assign tmp_23_fu_403_p4 = {{ret_V_41_fu_397_p2[49:18]}};

assign tmp_24_fu_430_p4 = {{ret_V_42_fu_424_p2[49:18]}};

assign tmp_25_fu_463_p4 = {{ret_V_43_fu_457_p2[49:18]}};

assign tmp_fu_232_p4 = {{ret_V_36_fu_226_p2[46:18]}};

assign tmp_s_fu_263_p4 = {{ret_V_37_fu_257_p2[49:18]}};

assign zext_ln1319_fu_356_p1 = p_read;

always @ (posedge ap_clk) begin
    ap_return_0_preg[55:31] <= 25'b0000000000000000000000000;
end

endmodule //mlp_Block_if_end_i_i126_9218229_proc
