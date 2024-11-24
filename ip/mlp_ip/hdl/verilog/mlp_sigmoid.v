// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module mlp_sigmoid (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        p_read1,
        ap_return
);

parameter    ap_ST_fsm_state1 = 10'd1;
parameter    ap_ST_fsm_state2 = 10'd2;
parameter    ap_ST_fsm_state3 = 10'd4;
parameter    ap_ST_fsm_state4 = 10'd8;
parameter    ap_ST_fsm_state5 = 10'd16;
parameter    ap_ST_fsm_state6 = 10'd32;
parameter    ap_ST_fsm_state7 = 10'd64;
parameter    ap_ST_fsm_state8 = 10'd128;
parameter    ap_ST_fsm_state9 = 10'd256;
parameter    ap_ST_fsm_state10 = 10'd512;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [31:0] p_read1;
output  [30:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[30:0] ap_return;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [9:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [0:0] icmp_ln1086_fu_132_p2;
reg   [0:0] icmp_ln1086_reg_560;
wire   [31:0] tmp_V_fu_138_p2;
reg   [31:0] tmp_V_reg_564;
wire   [0:0] p_Result_16_fu_144_p3;
reg   [0:0] p_Result_16_reg_569;
wire    ap_CS_fsm_state2;
reg   [62:0] m_reg_574;
reg   [0:0] p_Result_2_reg_579;
wire   [10:0] trunc_ln1094_fu_361_p1;
reg   [10:0] trunc_ln1094_reg_584;
wire   [0:0] notrhs_fu_375_p2;
reg   [0:0] notrhs_reg_589;
wire   [63:0] bitcast_ln800_fu_421_p1;
reg   [63:0] bitcast_ln800_reg_594;
wire    ap_CS_fsm_state3;
wire   [0:0] empty_fu_432_p2;
reg   [0:0] empty_reg_599;
wire   [0:0] grp_fu_127_p2;
reg   [0:0] empty_36_reg_604;
wire    ap_CS_fsm_state4;
reg   [0:0] empty_37_reg_608;
wire    ap_CS_fsm_state5;
reg   [0:0] empty_38_reg_612;
wire    ap_CS_fsm_state6;
reg   [0:0] empty_39_reg_616;
wire    ap_CS_fsm_state7;
wire    ap_CS_fsm_state9;
wire  signed [30:0] sext_ln39_fu_546_p1;
wire    ap_CS_fsm_state10;
reg   [30:0] ap_phi_mux_this_V_write_assign_phi_fu_102_p12;
reg   [30:0] this_V_write_assign_reg_98;
wire  signed [30:0] sext_ln42_fu_489_p1;
wire    ap_CS_fsm_state8;
reg    ap_block_state1;
reg   [63:0] grp_fu_118_p0;
reg   [63:0] grp_fu_118_p1;
wire   [0:0] grp_fu_118_p2;
wire  signed [31:0] icmp_ln1086_fu_132_p0;
wire  signed [31:0] tmp_V_fu_138_p1;
wire  signed [31:0] p_Result_16_fu_144_p1;
wire  signed [31:0] tmp_V_6_fu_151_p2;
wire   [31:0] tmp_V_6_fu_151_p3;
reg   [31:0] p_Result_17_fu_157_p4;
reg   [31:0] l_fu_167_p3;
wire   [31:0] sub_ln1095_fu_175_p2;
wire   [31:0] lsb_index_fu_181_p2;
wire   [30:0] tmp_7_fu_187_p4;
wire   [5:0] trunc_ln1098_fu_203_p1;
wire   [5:0] sub_ln1098_fu_207_p2;
wire   [31:0] zext_ln1098_fu_213_p1;
wire   [31:0] lshr_ln1098_fu_217_p2;
wire   [31:0] p_Result_s_fu_223_p2;
wire   [0:0] icmp_ln1097_fu_197_p2;
wire   [0:0] icmp_ln1098_fu_229_p2;
wire   [0:0] tmp_8_fu_241_p3;
wire   [0:0] p_Result_1_fu_255_p3;
wire   [0:0] xor_ln1100_fu_249_p2;
wire   [0:0] and_ln1100_fu_263_p2;
wire   [0:0] a_fu_235_p2;
wire   [0:0] or_ln1100_fu_269_p2;
wire   [31:0] add_ln1109_fu_293_p2;
wire   [63:0] zext_ln1108_fu_283_p1;
wire   [63:0] zext_ln1109_fu_299_p1;
wire   [31:0] sub_ln1110_fu_309_p2;
wire   [63:0] zext_ln1110_fu_315_p1;
wire   [0:0] icmp_ln1109_fu_287_p2;
wire   [63:0] lshr_ln1109_fu_303_p2;
wire   [63:0] shl_ln1110_fu_319_p2;
wire   [1:0] or_ln_i_fu_275_p3;
wire   [63:0] m_2_fu_325_p3;
wire   [63:0] zext_ln1112_fu_333_p1;
wire   [63:0] m_3_fu_337_p2;
wire   [51:0] tmp_5_fu_365_p4;
wire   [10:0] select_ln1094_fu_384_p3;
wire   [10:0] sub_ln1116_fu_391_p2;
wire   [10:0] add_ln1122_fu_396_p2;
wire   [63:0] zext_ln1113_fu_381_p1;
wire   [11:0] tmp_1_i_fu_402_p3;
wire   [63:0] p_Result_18_fu_409_p5;
wire   [0:0] notlhs_fu_426_p2;
wire  signed [31:0] r_V_2_fu_437_p1;
wire   [53:0] r_V_2_fu_437_p3;
wire  signed [54:0] sext_ln1316_1_fu_444_p1;
wire   [54:0] add_ln1393_1_fu_448_p2;
wire   [21:0] r_V_3_fu_467_p1;
wire   [52:0] r_V_3_fu_467_p2;
wire   [52:0] ret_V_1_fu_473_p2;
wire   [28:0] trunc_ln864_3_fu_479_p4;
wire  signed [31:0] r_V_1_fu_494_p1;
wire   [53:0] r_V_1_fu_494_p3;
wire  signed [54:0] sext_ln1316_fu_501_p1;
wire   [54:0] add_ln1393_fu_505_p2;
wire   [21:0] r_V_fu_524_p1;
wire   [52:0] r_V_fu_524_p2;
wire   [52:0] ret_V_fu_530_p2;
wire   [28:0] trunc_ln2_fu_536_p4;
reg   [30:0] ap_return_preg;
reg   [9:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
wire    ap_ST_fsm_state9_blk;
wire    ap_ST_fsm_state10_blk;
reg    ap_condition_480;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 10'd1;
#0 ap_return_preg = 31'd0;
end

mlp_dcmp_64ns_64ns_1_2_no_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 1 ))
dcmp_64ns_64ns_1_2_no_dsp_1_U160(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_118_p0),
    .din1(grp_fu_118_p1),
    .ce(1'b1),
    .opcode(5'd4),
    .dout(grp_fu_118_p2)
);

mlp_mul_32s_22ns_53_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 22 ),
    .dout_WIDTH( 53 ))
mul_32s_22ns_53_1_1_U161(
    .din0(p_read1),
    .din1(r_V_3_fu_467_p1),
    .dout(r_V_3_fu_467_p2)
);

mlp_mul_32s_22ns_53_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 22 ),
    .dout_WIDTH( 53 ))
mul_32s_22ns_53_1_1_U162(
    .din0(p_read1),
    .din1(r_V_fu_524_p1),
    .dout(r_V_fu_524_p2)
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
        end else if ((1'b1 == ap_CS_fsm_state8)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_preg <= 31'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state8)) begin
            ap_return_preg <= ap_phi_mux_this_V_write_assign_phi_fu_102_p12;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((empty_39_reg_616 == 1'd0) & (empty_38_reg_612 == 1'd0) & (empty_37_reg_608 == 1'd0) & (empty_36_reg_604 == 1'd0) & (grp_fu_127_p2 == 1'd0) & (icmp_ln1086_reg_560 == 1'd0) & (1'b1 == ap_CS_fsm_state8))) begin
        this_V_write_assign_reg_98 <= 31'd16777216;
    end else if (((grp_fu_127_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        this_V_write_assign_reg_98 <= 31'd0;
    end else if (((empty_39_reg_616 == 1'd0) & (empty_38_reg_612 == 1'd0) & (empty_37_reg_608 == 1'd0) & (empty_36_reg_604 == 1'd0) & (grp_fu_127_p2 == 1'd1) & (icmp_ln1086_reg_560 == 1'd0) & (1'b1 == ap_CS_fsm_state8))) begin
        this_V_write_assign_reg_98 <= sext_ln42_fu_489_p1;
    end else if ((1'b1 == ap_CS_fsm_state9)) begin
        this_V_write_assign_reg_98 <= {{add_ln1393_fu_505_p2[54:24]}};
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        this_V_write_assign_reg_98 <= sext_ln39_fu_546_p1;
    end else if (((1'b1 == ap_CS_fsm_state7) & ((grp_fu_127_p2 == 1'd1) | (icmp_ln1086_reg_560 == 1'd1)))) begin
        this_V_write_assign_reg_98 <= {{add_ln1393_1_fu_448_p2[54:24]}};
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        bitcast_ln800_reg_594 <= bitcast_ln800_fu_421_p1;
        empty_reg_599 <= empty_fu_432_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        empty_36_reg_604 <= grp_fu_127_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        empty_37_reg_608 <= grp_fu_127_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        empty_38_reg_612 <= grp_fu_127_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1086_reg_560 == 1'd0) & (1'b1 == ap_CS_fsm_state7))) begin
        empty_39_reg_616 <= grp_fu_127_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        icmp_ln1086_reg_560 <= icmp_ln1086_fu_132_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        m_reg_574 <= {{m_3_fu_337_p2[63:1]}};
        notrhs_reg_589 <= notrhs_fu_375_p2;
        p_Result_16_reg_569 <= p_Result_16_fu_144_p1[32'd31];
        p_Result_2_reg_579 <= m_3_fu_337_p2[32'd54];
        trunc_ln1094_reg_584 <= trunc_ln1094_fu_361_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1086_fu_132_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        tmp_V_reg_564 <= tmp_V_fu_138_p2;
    end
end

assign ap_ST_fsm_state10_blk = 1'b0;

always @ (*) begin
    if (((ap_done_reg == 1'b1) | (ap_start == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_480)) begin
        if ((grp_fu_127_p2 == 1'd0)) begin
            ap_phi_mux_this_V_write_assign_phi_fu_102_p12 = 31'd16777216;
        end else if ((grp_fu_127_p2 == 1'd1)) begin
            ap_phi_mux_this_V_write_assign_phi_fu_102_p12 = sext_ln42_fu_489_p1;
        end else begin
            ap_phi_mux_this_V_write_assign_phi_fu_102_p12 = this_V_write_assign_reg_98;
        end
    end else begin
        ap_phi_mux_this_V_write_assign_phi_fu_102_p12 = this_V_write_assign_reg_98;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        ap_return = ap_phi_mux_this_V_write_assign_phi_fu_102_p12;
    end else begin
        ap_return = ap_return_preg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        grp_fu_118_p0 = bitcast_ln800_reg_594;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        grp_fu_118_p0 = bitcast_ln800_fu_421_p1;
    end else begin
        grp_fu_118_p0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        grp_fu_118_p1 = 64'd4616189618054758400;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        grp_fu_118_p1 = 64'd4611686018427387904;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        grp_fu_118_p1 = 64'd0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        grp_fu_118_p1 = 64'd13835058055282163712;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        grp_fu_118_p1 = 64'd13839561654909534208;
    end else begin
        grp_fu_118_p1 = 'bx;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (icmp_ln1086_fu_132_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (icmp_ln1086_fu_132_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((grp_fu_127_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((grp_fu_127_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state6 : begin
            if (((grp_fu_127_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state6))) begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign a_fu_235_p2 = (icmp_ln1098_fu_229_p2 & icmp_ln1097_fu_197_p2);

assign add_ln1109_fu_293_p2 = ($signed(sub_ln1095_fu_175_p2) + $signed(32'd4294967242));

assign add_ln1122_fu_396_p2 = (select_ln1094_fu_384_p3 + sub_ln1116_fu_391_p2);

assign add_ln1393_1_fu_448_p2 = ($signed(sext_ln1316_1_fu_444_p1) + $signed(55'd140737488355328));

assign add_ln1393_fu_505_p2 = ($signed(sext_ln1316_fu_501_p1) + $signed(55'd140737488355328));

assign and_ln1100_fu_263_p2 = (xor_ln1100_fu_249_p2 & p_Result_1_fu_255_p3);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

always @ (*) begin
    ap_condition_480 = ((empty_39_reg_616 == 1'd0) & (empty_38_reg_612 == 1'd0) & (empty_37_reg_608 == 1'd0) & (empty_36_reg_604 == 1'd0) & (icmp_ln1086_reg_560 == 1'd0) & (1'b1 == ap_CS_fsm_state8));
end

assign bitcast_ln800_fu_421_p1 = p_Result_18_fu_409_p5;

assign empty_fu_432_p2 = (notrhs_reg_589 | notlhs_fu_426_p2);

assign grp_fu_127_p2 = (grp_fu_118_p2 & empty_reg_599);

assign icmp_ln1086_fu_132_p0 = p_read1;

assign icmp_ln1086_fu_132_p2 = ((icmp_ln1086_fu_132_p0 == 32'd0) ? 1'b1 : 1'b0);

assign icmp_ln1097_fu_197_p2 = (($signed(tmp_7_fu_187_p4) > $signed(31'd0)) ? 1'b1 : 1'b0);

assign icmp_ln1098_fu_229_p2 = ((p_Result_s_fu_223_p2 != 32'd0) ? 1'b1 : 1'b0);

assign icmp_ln1109_fu_287_p2 = (($signed(lsb_index_fu_181_p2) > $signed(32'd0)) ? 1'b1 : 1'b0);


always @ (p_Result_17_fu_157_p4) begin
    if (p_Result_17_fu_157_p4[0] == 1'b1) begin
        l_fu_167_p3 = 32'd0;
    end else if (p_Result_17_fu_157_p4[1] == 1'b1) begin
        l_fu_167_p3 = 32'd1;
    end else if (p_Result_17_fu_157_p4[2] == 1'b1) begin
        l_fu_167_p3 = 32'd2;
    end else if (p_Result_17_fu_157_p4[3] == 1'b1) begin
        l_fu_167_p3 = 32'd3;
    end else if (p_Result_17_fu_157_p4[4] == 1'b1) begin
        l_fu_167_p3 = 32'd4;
    end else if (p_Result_17_fu_157_p4[5] == 1'b1) begin
        l_fu_167_p3 = 32'd5;
    end else if (p_Result_17_fu_157_p4[6] == 1'b1) begin
        l_fu_167_p3 = 32'd6;
    end else if (p_Result_17_fu_157_p4[7] == 1'b1) begin
        l_fu_167_p3 = 32'd7;
    end else if (p_Result_17_fu_157_p4[8] == 1'b1) begin
        l_fu_167_p3 = 32'd8;
    end else if (p_Result_17_fu_157_p4[9] == 1'b1) begin
        l_fu_167_p3 = 32'd9;
    end else if (p_Result_17_fu_157_p4[10] == 1'b1) begin
        l_fu_167_p3 = 32'd10;
    end else if (p_Result_17_fu_157_p4[11] == 1'b1) begin
        l_fu_167_p3 = 32'd11;
    end else if (p_Result_17_fu_157_p4[12] == 1'b1) begin
        l_fu_167_p3 = 32'd12;
    end else if (p_Result_17_fu_157_p4[13] == 1'b1) begin
        l_fu_167_p3 = 32'd13;
    end else if (p_Result_17_fu_157_p4[14] == 1'b1) begin
        l_fu_167_p3 = 32'd14;
    end else if (p_Result_17_fu_157_p4[15] == 1'b1) begin
        l_fu_167_p3 = 32'd15;
    end else if (p_Result_17_fu_157_p4[16] == 1'b1) begin
        l_fu_167_p3 = 32'd16;
    end else if (p_Result_17_fu_157_p4[17] == 1'b1) begin
        l_fu_167_p3 = 32'd17;
    end else if (p_Result_17_fu_157_p4[18] == 1'b1) begin
        l_fu_167_p3 = 32'd18;
    end else if (p_Result_17_fu_157_p4[19] == 1'b1) begin
        l_fu_167_p3 = 32'd19;
    end else if (p_Result_17_fu_157_p4[20] == 1'b1) begin
        l_fu_167_p3 = 32'd20;
    end else if (p_Result_17_fu_157_p4[21] == 1'b1) begin
        l_fu_167_p3 = 32'd21;
    end else if (p_Result_17_fu_157_p4[22] == 1'b1) begin
        l_fu_167_p3 = 32'd22;
    end else if (p_Result_17_fu_157_p4[23] == 1'b1) begin
        l_fu_167_p3 = 32'd23;
    end else if (p_Result_17_fu_157_p4[24] == 1'b1) begin
        l_fu_167_p3 = 32'd24;
    end else if (p_Result_17_fu_157_p4[25] == 1'b1) begin
        l_fu_167_p3 = 32'd25;
    end else if (p_Result_17_fu_157_p4[26] == 1'b1) begin
        l_fu_167_p3 = 32'd26;
    end else if (p_Result_17_fu_157_p4[27] == 1'b1) begin
        l_fu_167_p3 = 32'd27;
    end else if (p_Result_17_fu_157_p4[28] == 1'b1) begin
        l_fu_167_p3 = 32'd28;
    end else if (p_Result_17_fu_157_p4[29] == 1'b1) begin
        l_fu_167_p3 = 32'd29;
    end else if (p_Result_17_fu_157_p4[30] == 1'b1) begin
        l_fu_167_p3 = 32'd30;
    end else if (p_Result_17_fu_157_p4[31] == 1'b1) begin
        l_fu_167_p3 = 32'd31;
    end else begin
        l_fu_167_p3 = 32'd32;
    end
end

assign lsb_index_fu_181_p2 = ($signed(sub_ln1095_fu_175_p2) + $signed(32'd4294967243));

assign lshr_ln1098_fu_217_p2 = 32'd4294967295 >> zext_ln1098_fu_213_p1;

assign lshr_ln1109_fu_303_p2 = zext_ln1108_fu_283_p1 >> zext_ln1109_fu_299_p1;

assign m_2_fu_325_p3 = ((icmp_ln1109_fu_287_p2[0:0] == 1'b1) ? lshr_ln1109_fu_303_p2 : shl_ln1110_fu_319_p2);

assign m_3_fu_337_p2 = (m_2_fu_325_p3 + zext_ln1112_fu_333_p1);

assign notlhs_fu_426_p2 = ((add_ln1122_fu_396_p2 != 11'd2047) ? 1'b1 : 1'b0);

assign notrhs_fu_375_p2 = ((tmp_5_fu_365_p4 == 52'd0) ? 1'b1 : 1'b0);

assign or_ln1100_fu_269_p2 = (and_ln1100_fu_263_p2 | a_fu_235_p2);

assign or_ln_i_fu_275_p3 = {{1'd0}, {or_ln1100_fu_269_p2}};

assign p_Result_16_fu_144_p1 = p_read1;

assign p_Result_16_fu_144_p3 = p_Result_16_fu_144_p1[32'd31];

integer ap_tvar_int_0;

always @ (tmp_V_6_fu_151_p3) begin
    for (ap_tvar_int_0 = 32 - 1; ap_tvar_int_0 >= 0; ap_tvar_int_0 = ap_tvar_int_0 - 1) begin
        if (ap_tvar_int_0 > 31 - 0) begin
            p_Result_17_fu_157_p4[ap_tvar_int_0] = 1'b0;
        end else begin
            p_Result_17_fu_157_p4[ap_tvar_int_0] = tmp_V_6_fu_151_p3[31 - ap_tvar_int_0];
        end
    end
end

assign p_Result_18_fu_409_p5 = {{tmp_1_i_fu_402_p3}, {zext_ln1113_fu_381_p1[51:0]}};

assign p_Result_1_fu_255_p3 = tmp_V_6_fu_151_p3[lsb_index_fu_181_p2];

assign p_Result_s_fu_223_p2 = (tmp_V_6_fu_151_p3 & lshr_ln1098_fu_217_p2);

assign r_V_1_fu_494_p1 = p_read1;

assign r_V_1_fu_494_p3 = {{r_V_1_fu_494_p1}, {22'd0}};

assign r_V_2_fu_437_p1 = p_read1;

assign r_V_2_fu_437_p3 = {{r_V_2_fu_437_p1}, {22'd0}};

assign r_V_3_fu_467_p1 = 53'd1677721;

assign r_V_fu_524_p1 = 53'd1677721;

assign ret_V_1_fu_473_p2 = (r_V_3_fu_467_p2 + 53'd225179967946752);

assign ret_V_fu_530_p2 = (r_V_fu_524_p2 + 53'd56294991986688);

assign select_ln1094_fu_384_p3 = ((p_Result_2_reg_579[0:0] == 1'b1) ? 11'd1023 : 11'd1022);

assign sext_ln1316_1_fu_444_p1 = $signed(r_V_2_fu_437_p3);

assign sext_ln1316_fu_501_p1 = $signed(r_V_1_fu_494_p3);

assign sext_ln39_fu_546_p1 = $signed(trunc_ln2_fu_536_p4);

assign sext_ln42_fu_489_p1 = $signed(trunc_ln864_3_fu_479_p4);

assign shl_ln1110_fu_319_p2 = zext_ln1108_fu_283_p1 << zext_ln1110_fu_315_p1;

assign sub_ln1095_fu_175_p2 = (32'd32 - l_fu_167_p3);

assign sub_ln1098_fu_207_p2 = (6'd22 - trunc_ln1098_fu_203_p1);

assign sub_ln1110_fu_309_p2 = (32'd54 - sub_ln1095_fu_175_p2);

assign sub_ln1116_fu_391_p2 = (11'd8 - trunc_ln1094_reg_584);

assign tmp_1_i_fu_402_p3 = {{p_Result_16_reg_569}, {add_ln1122_fu_396_p2}};

assign tmp_5_fu_365_p4 = {{m_3_fu_337_p2[52:1]}};

assign tmp_7_fu_187_p4 = {{lsb_index_fu_181_p2[31:1]}};

assign tmp_8_fu_241_p3 = lsb_index_fu_181_p2[32'd31];

assign tmp_V_6_fu_151_p2 = p_read1;

assign tmp_V_6_fu_151_p3 = ((p_Result_16_fu_144_p3[0:0] == 1'b1) ? tmp_V_reg_564 : tmp_V_6_fu_151_p2);

assign tmp_V_fu_138_p1 = p_read1;

assign tmp_V_fu_138_p2 = ($signed(32'd0) - $signed(tmp_V_fu_138_p1));

assign trunc_ln1094_fu_361_p1 = l_fu_167_p3[10:0];

assign trunc_ln1098_fu_203_p1 = sub_ln1095_fu_175_p2[5:0];

assign trunc_ln2_fu_536_p4 = {{ret_V_fu_530_p2[52:24]}};

assign trunc_ln864_3_fu_479_p4 = {{ret_V_1_fu_473_p2[52:24]}};

assign xor_ln1100_fu_249_p2 = (tmp_8_fu_241_p3 ^ 1'd1);

assign zext_ln1098_fu_213_p1 = sub_ln1098_fu_207_p2;

assign zext_ln1108_fu_283_p1 = tmp_V_6_fu_151_p3;

assign zext_ln1109_fu_299_p1 = add_ln1109_fu_293_p2;

assign zext_ln1110_fu_315_p1 = sub_ln1110_fu_309_p2;

assign zext_ln1112_fu_333_p1 = or_ln_i_fu_275_p3;

assign zext_ln1113_fu_381_p1 = m_reg_574;

endmodule //mlp_sigmoid
