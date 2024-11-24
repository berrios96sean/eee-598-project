-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity logistic_regression_sigmoid is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    p_read1 : IN STD_LOGIC_VECTOR (31 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (25 downto 0) );
end;


architecture behav of logistic_regression_sigmoid is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (9 downto 0) := "0000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (9 downto 0) := "0000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (9 downto 0) := "0000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (9 downto 0) := "0000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (9 downto 0) := "0000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (9 downto 0) := "0000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (9 downto 0) := "0001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (9 downto 0) := "0010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (9 downto 0) := "0100000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (9 downto 0) := "1000000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_9 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001001";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv26_0 : STD_LOGIC_VECTOR (25 downto 0) := "00000000000000000000000000";
    constant ap_const_lv26_1000000 : STD_LOGIC_VECTOR (25 downto 0) := "01000000000000000000000000";
    constant ap_const_lv64_C010000000000000 : STD_LOGIC_VECTOR (63 downto 0) := "1100000000010000000000000000000000000000000000000000000000000000";
    constant ap_const_lv64_C000000000000000 : STD_LOGIC_VECTOR (63 downto 0) := "1100000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv64_4000000000000000 : STD_LOGIC_VECTOR (63 downto 0) := "0100000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv64_4010000000000000 : STD_LOGIC_VECTOR (63 downto 0) := "0100000000010000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";
    constant ap_const_lv32_FFFFFFCB : STD_LOGIC_VECTOR (31 downto 0) := "11111111111111111111111111001011";
    constant ap_const_lv31_0 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000000";
    constant ap_const_lv6_16 : STD_LOGIC_VECTOR (5 downto 0) := "010110";
    constant ap_const_lv32_FFFFFFFF : STD_LOGIC_VECTOR (31 downto 0) := "11111111111111111111111111111111";
    constant ap_const_lv32_FFFFFFCA : STD_LOGIC_VECTOR (31 downto 0) := "11111111111111111111111111001010";
    constant ap_const_lv32_36 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110110";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv32_34 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110100";
    constant ap_const_lv52_0 : STD_LOGIC_VECTOR (51 downto 0) := "0000000000000000000000000000000000000000000000000000";
    constant ap_const_lv11_3FF : STD_LOGIC_VECTOR (10 downto 0) := "01111111111";
    constant ap_const_lv11_3FE : STD_LOGIC_VECTOR (10 downto 0) := "01111111110";
    constant ap_const_lv11_8 : STD_LOGIC_VECTOR (10 downto 0) := "00000001000";
    constant ap_const_lv11_7FF : STD_LOGIC_VECTOR (10 downto 0) := "11111111111";
    constant ap_const_lv22_0 : STD_LOGIC_VECTOR (21 downto 0) := "0000000000000000000000";
    constant ap_const_lv50_800000000000 : STD_LOGIC_VECTOR (49 downto 0) := "00100000000000000000000000000000000000000000000000";
    constant ap_const_lv32_18 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011000";
    constant ap_const_lv32_31 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110001";
    constant ap_const_lv50_199999 : STD_LOGIC_VECTOR (49 downto 0) := "00000000000000000000000000000110011001100110011001";
    constant ap_const_lv50_CCCCCC000000 : STD_LOGIC_VECTOR (49 downto 0) := "00110011001100110011001100000000000000000000000000";
    constant ap_const_lv50_333333000000 : STD_LOGIC_VECTOR (49 downto 0) := "00001100110011001100110011000000000000000000000000";
    constant ap_const_lv5_4 : STD_LOGIC_VECTOR (4 downto 0) := "00100";

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (9 downto 0) := "0000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal icmp_ln1086_fu_134_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1086_reg_554 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_V_fu_140_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_V_reg_558 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_Result_16_fu_146_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_Result_16_reg_563 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal m_reg_568 : STD_LOGIC_VECTOR (62 downto 0);
    signal p_Result_2_reg_573 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln1094_fu_363_p1 : STD_LOGIC_VECTOR (10 downto 0);
    signal trunc_ln1094_reg_578 : STD_LOGIC_VECTOR (10 downto 0);
    signal notrhs_fu_377_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal notrhs_reg_583 : STD_LOGIC_VECTOR (0 downto 0);
    signal bitcast_ln800_fu_423_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bitcast_ln800_reg_588 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal empty_fu_434_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal empty_reg_593 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_fu_129_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal empty_18_reg_598 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal empty_19_reg_602 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal empty_20_reg_606 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal empty_21_reg_610 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal ap_CS_fsm_state9 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state9 : signal is "none";
    signal ap_CS_fsm_state10 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state10 : signal is "none";
    signal ap_phi_mux_this_V_write_assign_phi_fu_104_p12 : STD_LOGIC_VECTOR (25 downto 0);
    signal this_V_write_assign_reg_100 : STD_LOGIC_VECTOR (25 downto 0);
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal ap_block_state1 : BOOLEAN;
    signal grp_fu_120_p0 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_fu_120_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_fu_120_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1086_fu_134_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_V_fu_140_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_Result_16_fu_146_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_V_6_fu_153_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_V_6_fu_153_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_Result_17_fu_159_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal l_fu_169_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal sub_ln1095_fu_177_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal lsb_index_fu_183_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_7_fu_189_p4 : STD_LOGIC_VECTOR (30 downto 0);
    signal trunc_ln1098_fu_205_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal sub_ln1098_fu_209_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal zext_ln1098_fu_215_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal lshr_ln1098_fu_219_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_Result_s_fu_225_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln1097_fu_199_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1098_fu_231_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_8_fu_243_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_Result_1_fu_257_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln1100_fu_251_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln1100_fu_265_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal a_fu_237_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln1100_fu_271_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln1109_fu_295_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln1108_fu_285_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln1109_fu_301_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal sub_ln1110_fu_311_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln1110_fu_317_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal icmp_ln1109_fu_289_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal lshr_ln1109_fu_305_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal shl_ln1110_fu_321_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal or_ln_i_fu_277_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal m_2_fu_327_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln1112_fu_335_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal m_3_fu_339_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_5_fu_367_p4 : STD_LOGIC_VECTOR (51 downto 0);
    signal select_ln1094_fu_386_p3 : STD_LOGIC_VECTOR (10 downto 0);
    signal sub_ln1116_fu_393_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal add_ln1122_fu_398_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal zext_ln1113_fu_383_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_1_i_fu_404_p3 : STD_LOGIC_VECTOR (11 downto 0);
    signal p_Result_18_fu_411_p5 : STD_LOGIC_VECTOR (63 downto 0);
    signal notlhs_fu_428_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln1319_1_fu_439_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln1319_1_fu_439_p1 : STD_LOGIC_VECTOR (27 downto 0);
    signal r_V_2_fu_442_p3 : STD_LOGIC_VECTOR (49 downto 0);
    signal add_ln1393_1_fu_450_p2 : STD_LOGIC_VECTOR (49 downto 0);
    signal r_V_3_fu_469_p1 : STD_LOGIC_VECTOR (21 downto 0);
    signal r_V_3_fu_469_p2 : STD_LOGIC_VECTOR (49 downto 0);
    signal ret_V_1_fu_475_p2 : STD_LOGIC_VECTOR (49 downto 0);
    signal trunc_ln1319_fu_492_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln1319_fu_492_p1 : STD_LOGIC_VECTOR (27 downto 0);
    signal r_V_1_fu_495_p3 : STD_LOGIC_VECTOR (49 downto 0);
    signal add_ln1393_fu_503_p2 : STD_LOGIC_VECTOR (49 downto 0);
    signal r_V_fu_522_p1 : STD_LOGIC_VECTOR (21 downto 0);
    signal r_V_fu_522_p2 : STD_LOGIC_VECTOR (49 downto 0);
    signal ret_V_fu_528_p2 : STD_LOGIC_VECTOR (49 downto 0);
    signal ap_return_preg : STD_LOGIC_VECTOR (25 downto 0) := "00000000000000000000000000";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (9 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_ST_fsm_state7_blk : STD_LOGIC;
    signal ap_ST_fsm_state8_blk : STD_LOGIC;
    signal ap_ST_fsm_state9_blk : STD_LOGIC;
    signal ap_ST_fsm_state10_blk : STD_LOGIC;
    signal ap_condition_476 : BOOLEAN;
    signal ap_ce_reg : STD_LOGIC;

    component logistic_regression_dcmp_64ns_64ns_1_2_no_dsp_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (63 downto 0);
        din1 : IN STD_LOGIC_VECTOR (63 downto 0);
        ce : IN STD_LOGIC;
        opcode : IN STD_LOGIC_VECTOR (4 downto 0);
        dout : OUT STD_LOGIC_VECTOR (0 downto 0) );
    end component;


    component logistic_regression_mul_32s_22ns_50_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (21 downto 0);
        dout : OUT STD_LOGIC_VECTOR (49 downto 0) );
    end component;



begin
    dcmp_64ns_64ns_1_2_no_dsp_1_U26 : component logistic_regression_dcmp_64ns_64ns_1_2_no_dsp_1
    generic map (
        ID => 1,
        NUM_STAGE => 2,
        din0_WIDTH => 64,
        din1_WIDTH => 64,
        dout_WIDTH => 1)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_120_p0,
        din1 => grp_fu_120_p1,
        ce => ap_const_logic_1,
        opcode => ap_const_lv5_4,
        dout => grp_fu_120_p2);

    mul_32s_22ns_50_1_1_U27 : component logistic_regression_mul_32s_22ns_50_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 22,
        dout_WIDTH => 50)
    port map (
        din0 => p_read1,
        din1 => r_V_3_fu_469_p1,
        dout => r_V_3_fu_469_p2);

    mul_32s_22ns_50_1_1_U28 : component logistic_regression_mul_32s_22ns_50_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 22,
        dout_WIDTH => 50)
    port map (
        din0 => p_read1,
        din1 => r_V_fu_522_p1,
        dout => r_V_fu_522_p2);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_return_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_preg <= ap_const_lv26_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
                    ap_return_preg <= ap_phi_mux_this_V_write_assign_phi_fu_104_p12;
                end if; 
            end if;
        end if;
    end process;


    this_V_write_assign_reg_100_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((empty_21_reg_610 = ap_const_lv1_0) and (empty_20_reg_606 = ap_const_lv1_0) and (empty_19_reg_602 = ap_const_lv1_0) and (empty_18_reg_598 = ap_const_lv1_0) and (grp_fu_129_p2 = ap_const_lv1_0) and (icmp_ln1086_reg_554 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state8))) then 
                this_V_write_assign_reg_100 <= ap_const_lv26_1000000;
            elsif (((grp_fu_129_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
                this_V_write_assign_reg_100 <= ap_const_lv26_0;
            elsif (((empty_21_reg_610 = ap_const_lv1_0) and (empty_20_reg_606 = ap_const_lv1_0) and (empty_19_reg_602 = ap_const_lv1_0) and (empty_18_reg_598 = ap_const_lv1_0) and (grp_fu_129_p2 = ap_const_lv1_1) and (icmp_ln1086_reg_554 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state8))) then 
                this_V_write_assign_reg_100 <= ret_V_1_fu_475_p2(49 downto 24);
            elsif ((ap_const_logic_1 = ap_CS_fsm_state9)) then 
                this_V_write_assign_reg_100 <= add_ln1393_fu_503_p2(49 downto 24);
            elsif ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
                this_V_write_assign_reg_100 <= ret_V_fu_528_p2(49 downto 24);
            elsif (((ap_const_logic_1 = ap_CS_fsm_state7) and ((grp_fu_129_p2 = ap_const_lv1_1) or (icmp_ln1086_reg_554 = ap_const_lv1_1)))) then 
                this_V_write_assign_reg_100 <= add_ln1393_1_fu_450_p2(49 downto 24);
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                bitcast_ln800_reg_588 <= bitcast_ln800_fu_423_p1;
                empty_reg_593 <= empty_fu_434_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                empty_18_reg_598 <= grp_fu_129_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state5)) then
                empty_19_reg_602 <= grp_fu_129_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state6)) then
                empty_20_reg_606 <= grp_fu_129_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln1086_reg_554 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state7))) then
                empty_21_reg_610 <= grp_fu_129_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                icmp_ln1086_reg_554 <= icmp_ln1086_fu_134_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                m_reg_568 <= m_3_fu_339_p2(63 downto 1);
                notrhs_reg_583 <= notrhs_fu_377_p2;
                p_Result_16_reg_563 <= p_Result_16_fu_146_p1(31 downto 31);
                p_Result_2_reg_573 <= m_3_fu_339_p2(54 downto 54);
                trunc_ln1094_reg_578 <= trunc_ln1094_fu_363_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln1086_fu_134_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                tmp_V_reg_558 <= tmp_V_fu_140_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, icmp_ln1086_fu_134_p2, grp_fu_129_p2, ap_CS_fsm_state4, ap_CS_fsm_state5, ap_CS_fsm_state6)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (icmp_ln1086_fu_134_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state7;
                elsif ((not(((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (icmp_ln1086_fu_134_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                ap_NS_fsm <= ap_ST_fsm_state3;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                if (((grp_fu_129_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                    ap_NS_fsm <= ap_ST_fsm_state8;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when ap_ST_fsm_state5 => 
                if (((grp_fu_129_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then
                    ap_NS_fsm <= ap_ST_fsm_state10;
                else
                    ap_NS_fsm <= ap_ST_fsm_state6;
                end if;
            when ap_ST_fsm_state6 => 
                if (((grp_fu_129_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state6))) then
                    ap_NS_fsm <= ap_ST_fsm_state9;
                else
                    ap_NS_fsm <= ap_ST_fsm_state7;
                end if;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when ap_ST_fsm_state9 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state10 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXX";
        end case;
    end process;
    a_fu_237_p2 <= (icmp_ln1098_fu_231_p2 and icmp_ln1097_fu_199_p2);
    add_ln1109_fu_295_p2 <= std_logic_vector(unsigned(sub_ln1095_fu_177_p2) + unsigned(ap_const_lv32_FFFFFFCA));
    add_ln1122_fu_398_p2 <= std_logic_vector(unsigned(select_ln1094_fu_386_p3) + unsigned(sub_ln1116_fu_393_p2));
    add_ln1393_1_fu_450_p2 <= std_logic_vector(unsigned(r_V_2_fu_442_p3) + unsigned(ap_const_lv50_800000000000));
    add_ln1393_fu_503_p2 <= std_logic_vector(unsigned(r_V_1_fu_495_p3) + unsigned(ap_const_lv50_800000000000));
    and_ln1100_fu_265_p2 <= (xor_ln1100_fu_251_p2 and p_Result_1_fu_257_p3);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state10 <= ap_CS_fsm(9);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);
    ap_CS_fsm_state7 <= ap_CS_fsm(6);
    ap_CS_fsm_state8 <= ap_CS_fsm(7);
    ap_CS_fsm_state9 <= ap_CS_fsm(8);
    ap_ST_fsm_state10_blk <= ap_const_logic_0;

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, ap_done_reg)
    begin
        if (((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;
    ap_ST_fsm_state3_blk <= ap_const_logic_0;
    ap_ST_fsm_state4_blk <= ap_const_logic_0;
    ap_ST_fsm_state5_blk <= ap_const_logic_0;
    ap_ST_fsm_state6_blk <= ap_const_logic_0;
    ap_ST_fsm_state7_blk <= ap_const_logic_0;
    ap_ST_fsm_state8_blk <= ap_const_logic_0;
    ap_ST_fsm_state9_blk <= ap_const_logic_0;

    ap_block_state1_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_block_state1 <= ((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0));
    end process;


    ap_condition_476_assign_proc : process(icmp_ln1086_reg_554, empty_18_reg_598, empty_19_reg_602, empty_20_reg_606, empty_21_reg_610, ap_CS_fsm_state8)
    begin
                ap_condition_476 <= ((empty_21_reg_610 = ap_const_lv1_0) and (empty_20_reg_606 = ap_const_lv1_0) and (empty_19_reg_602 = ap_const_lv1_0) and (empty_18_reg_598 = ap_const_lv1_0) and (icmp_ln1086_reg_554 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state8));
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state8)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_phi_mux_this_V_write_assign_phi_fu_104_p12_assign_proc : process(grp_fu_129_p2, this_V_write_assign_reg_100, ret_V_1_fu_475_p2, ap_condition_476)
    begin
        if ((ap_const_boolean_1 = ap_condition_476)) then
            if ((grp_fu_129_p2 = ap_const_lv1_0)) then 
                ap_phi_mux_this_V_write_assign_phi_fu_104_p12 <= ap_const_lv26_1000000;
            elsif ((grp_fu_129_p2 = ap_const_lv1_1)) then 
                ap_phi_mux_this_V_write_assign_phi_fu_104_p12 <= ret_V_1_fu_475_p2(49 downto 24);
            else 
                ap_phi_mux_this_V_write_assign_phi_fu_104_p12 <= this_V_write_assign_reg_100;
            end if;
        else 
            ap_phi_mux_this_V_write_assign_phi_fu_104_p12 <= this_V_write_assign_reg_100;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state8)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_return_assign_proc : process(ap_phi_mux_this_V_write_assign_phi_fu_104_p12, ap_CS_fsm_state8, ap_return_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
            ap_return <= ap_phi_mux_this_V_write_assign_phi_fu_104_p12;
        else 
            ap_return <= ap_return_preg;
        end if; 
    end process;

    bitcast_ln800_fu_423_p1 <= p_Result_18_fu_411_p5;
    empty_fu_434_p2 <= (notrhs_reg_583 or notlhs_fu_428_p2);

    grp_fu_120_p0_assign_proc : process(bitcast_ln800_fu_423_p1, bitcast_ln800_reg_588, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state7)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state7) or (ap_const_logic_1 = ap_CS_fsm_state6) or (ap_const_logic_1 = ap_CS_fsm_state5) or (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            grp_fu_120_p0 <= bitcast_ln800_reg_588;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            grp_fu_120_p0 <= bitcast_ln800_fu_423_p1;
        else 
            grp_fu_120_p0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_120_p1_assign_proc : process(ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state7)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
            grp_fu_120_p1 <= ap_const_lv64_4010000000000000;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            grp_fu_120_p1 <= ap_const_lv64_4000000000000000;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            grp_fu_120_p1 <= ap_const_lv64_0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            grp_fu_120_p1 <= ap_const_lv64_C000000000000000;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            grp_fu_120_p1 <= ap_const_lv64_C010000000000000;
        else 
            grp_fu_120_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    grp_fu_129_p2 <= (grp_fu_120_p2 and empty_reg_593);
    icmp_ln1086_fu_134_p0 <= p_read1;
    icmp_ln1086_fu_134_p2 <= "1" when (icmp_ln1086_fu_134_p0 = ap_const_lv32_0) else "0";
    icmp_ln1097_fu_199_p2 <= "1" when (signed(tmp_7_fu_189_p4) > signed(ap_const_lv31_0)) else "0";
    icmp_ln1098_fu_231_p2 <= "0" when (p_Result_s_fu_225_p2 = ap_const_lv32_0) else "1";
    icmp_ln1109_fu_289_p2 <= "1" when (signed(lsb_index_fu_183_p2) > signed(ap_const_lv32_0)) else "0";
    
    l_fu_169_p3_proc : process(p_Result_17_fu_159_p4)
    begin
        l_fu_169_p3 <= std_logic_vector(to_unsigned(32, 32));
        for i in 0 to 32 - 1 loop
            if p_Result_17_fu_159_p4(i) = '1' then
                l_fu_169_p3 <= std_logic_vector(to_unsigned(i,32));
                exit;
            end if;
        end loop;
    end process;

    lsb_index_fu_183_p2 <= std_logic_vector(unsigned(sub_ln1095_fu_177_p2) + unsigned(ap_const_lv32_FFFFFFCB));
    lshr_ln1098_fu_219_p2 <= std_logic_vector(shift_right(unsigned(ap_const_lv32_FFFFFFFF),to_integer(unsigned('0' & zext_ln1098_fu_215_p1(31-1 downto 0)))));
    lshr_ln1109_fu_305_p2 <= std_logic_vector(shift_right(unsigned(zext_ln1108_fu_285_p1),to_integer(unsigned('0' & zext_ln1109_fu_301_p1(31-1 downto 0)))));
    m_2_fu_327_p3 <= 
        lshr_ln1109_fu_305_p2 when (icmp_ln1109_fu_289_p2(0) = '1') else 
        shl_ln1110_fu_321_p2;
    m_3_fu_339_p2 <= std_logic_vector(unsigned(m_2_fu_327_p3) + unsigned(zext_ln1112_fu_335_p1));
    notlhs_fu_428_p2 <= "0" when (add_ln1122_fu_398_p2 = ap_const_lv11_7FF) else "1";
    notrhs_fu_377_p2 <= "1" when (tmp_5_fu_367_p4 = ap_const_lv52_0) else "0";
    or_ln1100_fu_271_p2 <= (and_ln1100_fu_265_p2 or a_fu_237_p2);
    or_ln_i_fu_277_p3 <= (ap_const_lv1_0 & or_ln1100_fu_271_p2);
    p_Result_16_fu_146_p1 <= p_read1;
    p_Result_16_fu_146_p3 <= p_Result_16_fu_146_p1(31 downto 31);
    
    p_Result_17_fu_159_p4_proc : process(tmp_V_6_fu_153_p3)
    variable vlo_cpy : STD_LOGIC_VECTOR(32+32 - 1 downto 0);
    variable vhi_cpy : STD_LOGIC_VECTOR(32+32 - 1 downto 0);
    variable v0_cpy : STD_LOGIC_VECTOR(32 - 1 downto 0);
    variable p_Result_17_fu_159_p4_i : integer;
    variable section : STD_LOGIC_VECTOR(32 - 1 downto 0);
    variable tmp_mask : STD_LOGIC_VECTOR(32 - 1 downto 0);
    variable resvalue, res_value, res_mask : STD_LOGIC_VECTOR(32 - 1 downto 0);
    begin
        vlo_cpy := (others => '0');
        vlo_cpy(5 - 1 downto 0) := ap_const_lv32_1F(5 - 1 downto 0);
        vhi_cpy := (others => '0');
        vhi_cpy(5 - 1 downto 0) := ap_const_lv32_0(5 - 1 downto 0);
        v0_cpy := tmp_V_6_fu_153_p3;
        if (vlo_cpy(5 - 1 downto 0) > vhi_cpy(5 - 1 downto 0)) then
            vhi_cpy(5-1 downto 0) := std_logic_vector(32-1-unsigned(ap_const_lv32_0(5-1 downto 0)));
            vlo_cpy(5-1 downto 0) := std_logic_vector(32-1-unsigned(ap_const_lv32_1F(5-1 downto 0)));
            for p_Result_17_fu_159_p4_i in 0 to 32-1 loop
                v0_cpy(p_Result_17_fu_159_p4_i) := tmp_V_6_fu_153_p3(32-1-p_Result_17_fu_159_p4_i);
            end loop;
        end if;
        res_value := std_logic_vector(shift_right(unsigned(v0_cpy), to_integer(unsigned('0' & vlo_cpy(5-1 downto 0)))));

        section := (others=>'0');
        section(5-1 downto 0) := std_logic_vector(unsigned(vhi_cpy(5-1 downto 0)) - unsigned(vlo_cpy(5-1 downto 0)));
        tmp_mask := (others => '1');
        res_mask := std_logic_vector(shift_left(unsigned(tmp_mask),to_integer(unsigned('0' & section(31-1 downto 0)))));
        res_mask := res_mask(32-2 downto 0) & '0';
        resvalue := res_value and not res_mask;
        p_Result_17_fu_159_p4 <= resvalue(32-1 downto 0);
    end process;

    p_Result_18_fu_411_p5 <= (tmp_1_i_fu_404_p3 & zext_ln1113_fu_383_p1(51 downto 0));
    p_Result_1_fu_257_p3 <= tmp_V_6_fu_153_p3(to_integer(unsigned(lsb_index_fu_183_p2)) downto to_integer(unsigned(lsb_index_fu_183_p2))) when (to_integer(unsigned(lsb_index_fu_183_p2)) >= 0 and to_integer(unsigned(lsb_index_fu_183_p2)) <=31) else "-";
    p_Result_s_fu_225_p2 <= (tmp_V_6_fu_153_p3 and lshr_ln1098_fu_219_p2);
    r_V_1_fu_495_p3 <= (trunc_ln1319_fu_492_p1 & ap_const_lv22_0);
    r_V_2_fu_442_p3 <= (trunc_ln1319_1_fu_439_p1 & ap_const_lv22_0);
    r_V_3_fu_469_p1 <= ap_const_lv50_199999(22 - 1 downto 0);
    r_V_fu_522_p1 <= ap_const_lv50_199999(22 - 1 downto 0);
    ret_V_1_fu_475_p2 <= std_logic_vector(unsigned(r_V_3_fu_469_p2) + unsigned(ap_const_lv50_CCCCCC000000));
    ret_V_fu_528_p2 <= std_logic_vector(unsigned(r_V_fu_522_p2) + unsigned(ap_const_lv50_333333000000));
    select_ln1094_fu_386_p3 <= 
        ap_const_lv11_3FF when (p_Result_2_reg_573(0) = '1') else 
        ap_const_lv11_3FE;
    shl_ln1110_fu_321_p2 <= std_logic_vector(shift_left(unsigned(zext_ln1108_fu_285_p1),to_integer(unsigned('0' & zext_ln1110_fu_317_p1(31-1 downto 0)))));
    sub_ln1095_fu_177_p2 <= std_logic_vector(unsigned(ap_const_lv32_20) - unsigned(l_fu_169_p3));
    sub_ln1098_fu_209_p2 <= std_logic_vector(unsigned(ap_const_lv6_16) - unsigned(trunc_ln1098_fu_205_p1));
    sub_ln1110_fu_311_p2 <= std_logic_vector(unsigned(ap_const_lv32_36) - unsigned(sub_ln1095_fu_177_p2));
    sub_ln1116_fu_393_p2 <= std_logic_vector(unsigned(ap_const_lv11_8) - unsigned(trunc_ln1094_reg_578));
    tmp_1_i_fu_404_p3 <= (p_Result_16_reg_563 & add_ln1122_fu_398_p2);
    tmp_5_fu_367_p4 <= m_3_fu_339_p2(52 downto 1);
    tmp_7_fu_189_p4 <= lsb_index_fu_183_p2(31 downto 1);
    tmp_8_fu_243_p3 <= lsb_index_fu_183_p2(31 downto 31);
    tmp_V_6_fu_153_p2 <= p_read1;
    tmp_V_6_fu_153_p3 <= 
        tmp_V_reg_558 when (p_Result_16_fu_146_p3(0) = '1') else 
        tmp_V_6_fu_153_p2;
    tmp_V_fu_140_p1 <= p_read1;
    tmp_V_fu_140_p2 <= std_logic_vector(unsigned(ap_const_lv32_0) - unsigned(tmp_V_fu_140_p1));
    trunc_ln1094_fu_363_p1 <= l_fu_169_p3(11 - 1 downto 0);
    trunc_ln1098_fu_205_p1 <= sub_ln1095_fu_177_p2(6 - 1 downto 0);
    trunc_ln1319_1_fu_439_p0 <= p_read1;
    trunc_ln1319_1_fu_439_p1 <= trunc_ln1319_1_fu_439_p0(28 - 1 downto 0);
    trunc_ln1319_fu_492_p0 <= p_read1;
    trunc_ln1319_fu_492_p1 <= trunc_ln1319_fu_492_p0(28 - 1 downto 0);
    xor_ln1100_fu_251_p2 <= (tmp_8_fu_243_p3 xor ap_const_lv1_1);
    zext_ln1098_fu_215_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sub_ln1098_fu_209_p2),32));
    zext_ln1108_fu_285_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_V_6_fu_153_p3),64));
    zext_ln1109_fu_301_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln1109_fu_295_p2),64));
    zext_ln1110_fu_317_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sub_ln1110_fu_311_p2),64));
    zext_ln1112_fu_335_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(or_ln_i_fu_277_p3),64));
    zext_ln1113_fu_383_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(m_reg_568),64));
end behav;