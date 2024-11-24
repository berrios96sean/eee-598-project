// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module mlp_Block_if_end_i_i126_9218249_proc13 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        p_read,
        out_stream_TDATA,
        out_stream_TVALID,
        out_stream_TREADY,
        out_stream_TKEEP,
        out_stream_TSTRB,
        out_stream_TLAST
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_state4 = 5'd8;
parameter    ap_ST_fsm_state5 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [30:0] p_read;
output  [15:0] out_stream_TDATA;
output   out_stream_TVALID;
input   out_stream_TREADY;
output  [1:0] out_stream_TKEEP;
output  [1:0] out_stream_TSTRB;
output  [0:0] out_stream_TLAST;

reg ap_done;
reg ap_idle;
reg ap_ready;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    out_stream_TDATA_blk_n;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state5;
wire   [0:0] p_Result_22_fu_118_p3;
reg   [0:0] p_Result_22_reg_443;
wire   [30:0] tmp_V_fu_132_p3;
reg   [30:0] tmp_V_reg_448;
wire   [0:0] icmp_ln1086_fu_140_p2;
reg   [0:0] icmp_ln1086_reg_454;
reg   [62:0] m_15_reg_459;
wire    ap_CS_fsm_state2;
wire   [10:0] add_ln1122_fu_370_p2;
reg   [10:0] add_ln1122_reg_464;
wire   [0:0] notrhs_fu_386_p2;
reg   [0:0] notrhs_reg_470;
wire    ap_CS_fsm_state3;
wire   [0:0] notlhs_fu_418_p2;
reg   [0:0] notlhs_reg_480;
reg    ap_block_state1;
wire   [63:0] grp_fu_113_p0;
wire   [30:0] tmp_V_16_fu_126_p2;
wire   [31:0] zext_ln1088_fu_146_p1;
reg   [31:0] p_Result_23_fu_149_p4;
reg   [31:0] l_fu_159_p3;
wire   [31:0] sub_ln1095_fu_167_p2;
wire   [31:0] lsb_index_fu_173_p2;
wire   [30:0] tmp_12_fu_179_p4;
wire   [5:0] trunc_ln1098_fu_195_p1;
wire   [5:0] sub_ln1098_fu_199_p2;
wire   [31:0] zext_ln1098_fu_205_p1;
wire   [31:0] lshr_ln1098_fu_209_p2;
wire   [31:0] p_Result_s_fu_215_p2;
wire   [0:0] icmp_ln1097_fu_189_p2;
wire   [0:0] icmp_ln1098_fu_221_p2;
wire   [0:0] tmp_13_fu_233_p3;
wire   [0:0] p_Result_19_fu_247_p3;
wire   [0:0] xor_ln1100_fu_241_p2;
wire   [0:0] and_ln1100_fu_255_p2;
wire   [0:0] a_fu_227_p2;
wire   [0:0] or_ln1100_fu_261_p2;
wire   [31:0] add_ln1109_fu_284_p2;
wire   [63:0] zext_ln1108_fu_275_p1;
wire   [63:0] zext_ln1109_fu_290_p1;
wire   [31:0] sub_ln1110_fu_300_p2;
wire   [63:0] zext_ln1110_fu_306_p1;
wire   [0:0] icmp_ln1109_fu_278_p2;
wire   [63:0] lshr_ln1109_fu_294_p2;
wire   [63:0] shl_ln1110_fu_310_p2;
wire   [1:0] or_ln_fu_267_p3;
wire   [63:0] m_13_fu_316_p3;
wire   [63:0] zext_ln1112_fu_324_p1;
wire   [63:0] m_14_fu_328_p2;
wire   [0:0] p_Result_20_fu_344_p3;
wire   [10:0] trunc_ln1094_fu_360_p1;
wire   [10:0] sub_ln1116_fu_364_p2;
wire   [10:0] select_ln1094_fu_352_p3;
wire   [51:0] tmp_7_fu_376_p4;
wire   [63:0] zext_ln1113_fu_392_p1;
wire   [11:0] tmp_s_fu_395_p3;
wire   [63:0] p_Result_24_fu_401_p5;
wire   [0:0] empty_fu_423_p2;
wire   [0:0] grp_fu_113_p2;
wire   [0:0] empty_115_fu_427_p2;
wire   [0:0] predicted_class_V_fu_433_p2;
reg    grp_fu_113_ce;
wire    regslice_both_out_stream_V_data_V_U_apdone_blk;
reg    ap_block_state5;
reg   [4:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
wire   [15:0] out_stream_TDATA_int_regslice;
reg    out_stream_TVALID_int_regslice;
wire    out_stream_TREADY_int_regslice;
wire    regslice_both_out_stream_V_data_V_U_vld_out;
wire    regslice_both_out_stream_V_keep_V_U_apdone_blk;
wire    regslice_both_out_stream_V_keep_V_U_ack_in_dummy;
wire    regslice_both_out_stream_V_keep_V_U_vld_out;
wire    regslice_both_out_stream_V_strb_V_U_apdone_blk;
wire    regslice_both_out_stream_V_strb_V_U_ack_in_dummy;
wire    regslice_both_out_stream_V_strb_V_U_vld_out;
wire    regslice_both_out_stream_V_last_V_U_apdone_blk;
wire    regslice_both_out_stream_V_last_V_U_ack_in_dummy;
wire    regslice_both_out_stream_V_last_V_U_vld_out;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 5'd1;
end

mlp_dcmp_64ns_64ns_1_2_no_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 1 ))
dcmp_64ns_64ns_1_2_no_dsp_1_U166(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_113_p0),
    .din1(64'd4602678819172646912),
    .ce(grp_fu_113_ce),
    .opcode(5'd2),
    .dout(grp_fu_113_p2)
);

mlp_regslice_both #(
    .DataWidth( 16 ))
regslice_both_out_stream_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(out_stream_TDATA_int_regslice),
    .vld_in(out_stream_TVALID_int_regslice),
    .ack_in(out_stream_TREADY_int_regslice),
    .data_out(out_stream_TDATA),
    .vld_out(regslice_both_out_stream_V_data_V_U_vld_out),
    .ack_out(out_stream_TREADY),
    .apdone_blk(regslice_both_out_stream_V_data_V_U_apdone_blk)
);

mlp_regslice_both #(
    .DataWidth( 2 ))
regslice_both_out_stream_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(2'd0),
    .vld_in(out_stream_TVALID_int_regslice),
    .ack_in(regslice_both_out_stream_V_keep_V_U_ack_in_dummy),
    .data_out(out_stream_TKEEP),
    .vld_out(regslice_both_out_stream_V_keep_V_U_vld_out),
    .ack_out(out_stream_TREADY),
    .apdone_blk(regslice_both_out_stream_V_keep_V_U_apdone_blk)
);

mlp_regslice_both #(
    .DataWidth( 2 ))
regslice_both_out_stream_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(2'd0),
    .vld_in(out_stream_TVALID_int_regslice),
    .ack_in(regslice_both_out_stream_V_strb_V_U_ack_in_dummy),
    .data_out(out_stream_TSTRB),
    .vld_out(regslice_both_out_stream_V_strb_V_U_vld_out),
    .ack_out(out_stream_TREADY),
    .apdone_blk(regslice_both_out_stream_V_strb_V_U_apdone_blk)
);

mlp_regslice_both #(
    .DataWidth( 1 ))
regslice_both_out_stream_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(1'd1),
    .vld_in(out_stream_TVALID_int_regslice),
    .ack_in(regslice_both_out_stream_V_last_V_U_ack_in_dummy),
    .data_out(out_stream_TLAST),
    .vld_out(regslice_both_out_stream_V_last_V_U_vld_out),
    .ack_out(out_stream_TREADY),
    .apdone_blk(regslice_both_out_stream_V_last_V_U_apdone_blk)
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
        end else if ((~((out_stream_TREADY_int_regslice == 1'b0) | (regslice_both_out_stream_V_data_V_U_apdone_blk == 1'b1)) & (1'b1 == ap_CS_fsm_state5))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add_ln1122_reg_464 <= add_ln1122_fu_370_p2;
        m_15_reg_459 <= {{m_14_fu_328_p2[63:1]}};
        notrhs_reg_470 <= notrhs_fu_386_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        icmp_ln1086_reg_454 <= icmp_ln1086_fu_140_p2;
        p_Result_22_reg_443 <= p_read[32'd30];
        tmp_V_reg_448 <= tmp_V_fu_132_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        notlhs_reg_480 <= notlhs_fu_418_p2;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b1) | (ap_start == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((out_stream_TREADY_int_regslice == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if (((out_stream_TREADY_int_regslice == 1'b0) | (regslice_both_out_stream_V_data_V_U_apdone_blk == 1'b1))) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~((out_stream_TREADY_int_regslice == 1'b0) | (regslice_both_out_stream_V_data_V_U_apdone_blk == 1'b1)) & (1'b1 == ap_CS_fsm_state5))) begin
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
    if ((~((out_stream_TREADY_int_regslice == 1'b0) | (regslice_both_out_stream_V_data_V_U_apdone_blk == 1'b1)) & (1'b1 == ap_CS_fsm_state5))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | ((out_stream_TREADY_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state4)))) begin
        grp_fu_113_ce = 1'b1;
    end else begin
        grp_fu_113_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        out_stream_TDATA_blk_n = out_stream_TREADY_int_regslice;
    end else begin
        out_stream_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((out_stream_TREADY_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
        out_stream_TVALID_int_regslice = 1'b1;
    end else begin
        out_stream_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
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
            if (((out_stream_TREADY_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if ((~((out_stream_TREADY_int_regslice == 1'b0) | (regslice_both_out_stream_V_data_V_U_apdone_blk == 1'b1)) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign a_fu_227_p2 = (icmp_ln1098_fu_221_p2 & icmp_ln1097_fu_189_p2);

assign add_ln1109_fu_284_p2 = ($signed(sub_ln1095_fu_167_p2) + $signed(32'd4294967242));

assign add_ln1122_fu_370_p2 = (sub_ln1116_fu_364_p2 + select_ln1094_fu_352_p3);

assign and_ln1100_fu_255_p2 = (xor_ln1100_fu_241_p2 & p_Result_19_fu_247_p3);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

always @ (*) begin
    ap_block_state5 = ((out_stream_TREADY_int_regslice == 1'b0) | (regslice_both_out_stream_V_data_V_U_apdone_blk == 1'b1));
end

assign empty_115_fu_427_p2 = (grp_fu_113_p2 & empty_fu_423_p2);

assign empty_fu_423_p2 = (notrhs_reg_470 | notlhs_reg_480);

assign grp_fu_113_p0 = p_Result_24_fu_401_p5;

assign icmp_ln1086_fu_140_p2 = ((p_read != 31'd0) ? 1'b1 : 1'b0);

assign icmp_ln1097_fu_189_p2 = (($signed(tmp_12_fu_179_p4) > $signed(31'd0)) ? 1'b1 : 1'b0);

assign icmp_ln1098_fu_221_p2 = ((p_Result_s_fu_215_p2 != 32'd0) ? 1'b1 : 1'b0);

assign icmp_ln1109_fu_278_p2 = (($signed(lsb_index_fu_173_p2) > $signed(32'd0)) ? 1'b1 : 1'b0);


always @ (p_Result_23_fu_149_p4) begin
    if (p_Result_23_fu_149_p4[0] == 1'b1) begin
        l_fu_159_p3 = 32'd0;
    end else if (p_Result_23_fu_149_p4[1] == 1'b1) begin
        l_fu_159_p3 = 32'd1;
    end else if (p_Result_23_fu_149_p4[2] == 1'b1) begin
        l_fu_159_p3 = 32'd2;
    end else if (p_Result_23_fu_149_p4[3] == 1'b1) begin
        l_fu_159_p3 = 32'd3;
    end else if (p_Result_23_fu_149_p4[4] == 1'b1) begin
        l_fu_159_p3 = 32'd4;
    end else if (p_Result_23_fu_149_p4[5] == 1'b1) begin
        l_fu_159_p3 = 32'd5;
    end else if (p_Result_23_fu_149_p4[6] == 1'b1) begin
        l_fu_159_p3 = 32'd6;
    end else if (p_Result_23_fu_149_p4[7] == 1'b1) begin
        l_fu_159_p3 = 32'd7;
    end else if (p_Result_23_fu_149_p4[8] == 1'b1) begin
        l_fu_159_p3 = 32'd8;
    end else if (p_Result_23_fu_149_p4[9] == 1'b1) begin
        l_fu_159_p3 = 32'd9;
    end else if (p_Result_23_fu_149_p4[10] == 1'b1) begin
        l_fu_159_p3 = 32'd10;
    end else if (p_Result_23_fu_149_p4[11] == 1'b1) begin
        l_fu_159_p3 = 32'd11;
    end else if (p_Result_23_fu_149_p4[12] == 1'b1) begin
        l_fu_159_p3 = 32'd12;
    end else if (p_Result_23_fu_149_p4[13] == 1'b1) begin
        l_fu_159_p3 = 32'd13;
    end else if (p_Result_23_fu_149_p4[14] == 1'b1) begin
        l_fu_159_p3 = 32'd14;
    end else if (p_Result_23_fu_149_p4[15] == 1'b1) begin
        l_fu_159_p3 = 32'd15;
    end else if (p_Result_23_fu_149_p4[16] == 1'b1) begin
        l_fu_159_p3 = 32'd16;
    end else if (p_Result_23_fu_149_p4[17] == 1'b1) begin
        l_fu_159_p3 = 32'd17;
    end else if (p_Result_23_fu_149_p4[18] == 1'b1) begin
        l_fu_159_p3 = 32'd18;
    end else if (p_Result_23_fu_149_p4[19] == 1'b1) begin
        l_fu_159_p3 = 32'd19;
    end else if (p_Result_23_fu_149_p4[20] == 1'b1) begin
        l_fu_159_p3 = 32'd20;
    end else if (p_Result_23_fu_149_p4[21] == 1'b1) begin
        l_fu_159_p3 = 32'd21;
    end else if (p_Result_23_fu_149_p4[22] == 1'b1) begin
        l_fu_159_p3 = 32'd22;
    end else if (p_Result_23_fu_149_p4[23] == 1'b1) begin
        l_fu_159_p3 = 32'd23;
    end else if (p_Result_23_fu_149_p4[24] == 1'b1) begin
        l_fu_159_p3 = 32'd24;
    end else if (p_Result_23_fu_149_p4[25] == 1'b1) begin
        l_fu_159_p3 = 32'd25;
    end else if (p_Result_23_fu_149_p4[26] == 1'b1) begin
        l_fu_159_p3 = 32'd26;
    end else if (p_Result_23_fu_149_p4[27] == 1'b1) begin
        l_fu_159_p3 = 32'd27;
    end else if (p_Result_23_fu_149_p4[28] == 1'b1) begin
        l_fu_159_p3 = 32'd28;
    end else if (p_Result_23_fu_149_p4[29] == 1'b1) begin
        l_fu_159_p3 = 32'd29;
    end else if (p_Result_23_fu_149_p4[30] == 1'b1) begin
        l_fu_159_p3 = 32'd30;
    end else if (p_Result_23_fu_149_p4[31] == 1'b1) begin
        l_fu_159_p3 = 32'd31;
    end else begin
        l_fu_159_p3 = 32'd32;
    end
end

assign lsb_index_fu_173_p2 = ($signed(sub_ln1095_fu_167_p2) + $signed(32'd4294967243));

assign lshr_ln1098_fu_209_p2 = 32'd4294967295 >> zext_ln1098_fu_205_p1;

assign lshr_ln1109_fu_294_p2 = zext_ln1108_fu_275_p1 >> zext_ln1109_fu_290_p1;

assign m_13_fu_316_p3 = ((icmp_ln1109_fu_278_p2[0:0] == 1'b1) ? lshr_ln1109_fu_294_p2 : shl_ln1110_fu_310_p2);

assign m_14_fu_328_p2 = (m_13_fu_316_p3 + zext_ln1112_fu_324_p1);

assign notlhs_fu_418_p2 = ((add_ln1122_reg_464 != 11'd2047) ? 1'b1 : 1'b0);

assign notrhs_fu_386_p2 = ((tmp_7_fu_376_p4 == 52'd0) ? 1'b1 : 1'b0);

assign or_ln1100_fu_261_p2 = (and_ln1100_fu_255_p2 | a_fu_227_p2);

assign or_ln_fu_267_p3 = {{1'd0}, {or_ln1100_fu_261_p2}};

assign out_stream_TDATA_int_regslice = predicted_class_V_fu_433_p2;

assign out_stream_TVALID = regslice_both_out_stream_V_data_V_U_vld_out;

assign p_Result_19_fu_247_p3 = zext_ln1088_fu_146_p1[lsb_index_fu_173_p2];

assign p_Result_20_fu_344_p3 = m_14_fu_328_p2[32'd54];

assign p_Result_22_fu_118_p3 = p_read[32'd30];

integer ap_tvar_int_0;

always @ (zext_ln1088_fu_146_p1) begin
    for (ap_tvar_int_0 = 32 - 1; ap_tvar_int_0 >= 0; ap_tvar_int_0 = ap_tvar_int_0 - 1) begin
        if (ap_tvar_int_0 > 31 - 0) begin
            p_Result_23_fu_149_p4[ap_tvar_int_0] = 1'b0;
        end else begin
            p_Result_23_fu_149_p4[ap_tvar_int_0] = zext_ln1088_fu_146_p1[31 - ap_tvar_int_0];
        end
    end
end

assign p_Result_24_fu_401_p5 = {{tmp_s_fu_395_p3}, {zext_ln1113_fu_392_p1[51:0]}};

assign p_Result_s_fu_215_p2 = (zext_ln1088_fu_146_p1 & lshr_ln1098_fu_209_p2);

assign predicted_class_V_fu_433_p2 = (icmp_ln1086_reg_454 & empty_115_fu_427_p2);

assign select_ln1094_fu_352_p3 = ((p_Result_20_fu_344_p3[0:0] == 1'b1) ? 11'd1023 : 11'd1022);

assign shl_ln1110_fu_310_p2 = zext_ln1108_fu_275_p1 << zext_ln1110_fu_306_p1;

assign sub_ln1095_fu_167_p2 = (32'd32 - l_fu_159_p3);

assign sub_ln1098_fu_199_p2 = (6'd22 - trunc_ln1098_fu_195_p1);

assign sub_ln1110_fu_300_p2 = (32'd54 - sub_ln1095_fu_167_p2);

assign sub_ln1116_fu_364_p2 = (11'd8 - trunc_ln1094_fu_360_p1);

assign tmp_12_fu_179_p4 = {{lsb_index_fu_173_p2[31:1]}};

assign tmp_13_fu_233_p3 = lsb_index_fu_173_p2[32'd31];

assign tmp_7_fu_376_p4 = {{m_14_fu_328_p2[52:1]}};

assign tmp_V_16_fu_126_p2 = (31'd0 - p_read);

assign tmp_V_fu_132_p3 = ((p_Result_22_fu_118_p3[0:0] == 1'b1) ? tmp_V_16_fu_126_p2 : p_read);

assign tmp_s_fu_395_p3 = {{p_Result_22_reg_443}, {add_ln1122_reg_464}};

assign trunc_ln1094_fu_360_p1 = l_fu_159_p3[10:0];

assign trunc_ln1098_fu_195_p1 = sub_ln1095_fu_167_p2[5:0];

assign xor_ln1100_fu_241_p2 = (tmp_13_fu_233_p3 ^ 1'd1);

assign zext_ln1088_fu_146_p1 = tmp_V_reg_448;

assign zext_ln1098_fu_205_p1 = sub_ln1098_fu_199_p2;

assign zext_ln1108_fu_275_p1 = tmp_V_reg_448;

assign zext_ln1109_fu_290_p1 = add_ln1109_fu_284_p2;

assign zext_ln1110_fu_306_p1 = sub_ln1110_fu_300_p2;

assign zext_ln1112_fu_324_p1 = or_ln_fu_267_p3;

assign zext_ln1113_fu_392_p1 = m_15_reg_459;

endmodule //mlp_Block_if_end_i_i126_9218249_proc13