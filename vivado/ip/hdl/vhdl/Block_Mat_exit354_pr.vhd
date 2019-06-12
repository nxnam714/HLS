-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.3
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Block_Mat_exit354_pr is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    rows : IN STD_LOGIC_VECTOR (31 downto 0);
    cols : IN STD_LOGIC_VECTOR (31 downto 0);
    rows_out_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    rows_out_full_n : IN STD_LOGIC;
    rows_out_write : OUT STD_LOGIC;
    cols_out_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    cols_out_full_n : IN STD_LOGIC;
    cols_out_write : OUT STD_LOGIC;
    ap_return_0 : OUT STD_LOGIC_VECTOR (18 downto 0);
    ap_return_1 : OUT STD_LOGIC_VECTOR (17 downto 0);
    ap_return_2 : OUT STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of Block_Mat_exit354_pr is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv18_3FFFF : STD_LOGIC_VECTOR (17 downto 0) := "111111111111111111";
    constant ap_const_lv19_0 : STD_LOGIC_VECTOR (18 downto 0) := "0000000000000000000";
    constant ap_const_lv18_0 : STD_LOGIC_VECTOR (17 downto 0) := "000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal rows_out_blk_n : STD_LOGIC;
    signal cols_out_blk_n : STD_LOGIC;
    signal ap_block_state1 : BOOLEAN;
    signal base_size_fu_58_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal base_size_fu_58_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal base_size_fu_58_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_fu_64_p1 : STD_LOGIC_VECTOR (17 downto 0);
    signal tmp_9_out_fu_72_p2 : STD_LOGIC_VECTOR (17 downto 0);
    signal tmp_19_fu_68_p1 : STD_LOGIC_VECTOR (18 downto 0);
    signal tmp_9_cast344_out_fu_78_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_return_0_preg : STD_LOGIC_VECTOR (18 downto 0) := "0000000000000000000";
    signal ap_return_1_preg : STD_LOGIC_VECTOR (17 downto 0) := "000000000000000000";
    signal ap_return_2_preg : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);


begin




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
                elsif ((not(((ap_start = ap_const_logic_0) or (cols_out_full_n = ap_const_logic_0) or (rows_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_return_0_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_0_preg <= ap_const_lv19_0;
            else
                if ((not(((ap_start = ap_const_logic_0) or (cols_out_full_n = ap_const_logic_0) or (rows_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_return_0_preg <= tmp_19_fu_68_p1;
                end if; 
            end if;
        end if;
    end process;


    ap_return_1_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_1_preg <= ap_const_lv18_0;
            else
                if ((not(((ap_start = ap_const_logic_0) or (cols_out_full_n = ap_const_logic_0) or (rows_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_return_1_preg <= tmp_9_out_fu_72_p2;
                end if; 
            end if;
        end if;
    end process;


    ap_return_2_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_2_preg(0) <= '0';
                ap_return_2_preg(1) <= '0';
                ap_return_2_preg(2) <= '0';
                ap_return_2_preg(3) <= '0';
                ap_return_2_preg(4) <= '0';
                ap_return_2_preg(5) <= '0';
                ap_return_2_preg(6) <= '0';
                ap_return_2_preg(7) <= '0';
                ap_return_2_preg(8) <= '0';
                ap_return_2_preg(9) <= '0';
                ap_return_2_preg(10) <= '0';
                ap_return_2_preg(11) <= '0';
                ap_return_2_preg(12) <= '0';
                ap_return_2_preg(13) <= '0';
                ap_return_2_preg(14) <= '0';
                ap_return_2_preg(15) <= '0';
                ap_return_2_preg(16) <= '0';
                ap_return_2_preg(17) <= '0';
            else
                if ((not(((ap_start = ap_const_logic_0) or (cols_out_full_n = ap_const_logic_0) or (rows_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                                        ap_return_2_preg(17 downto 0) <= tmp_9_cast344_out_fu_78_p1(17 downto 0);
                end if; 
            end if;
        end if;
    end process;

    ap_return_2_preg(31 downto 18) <= "00000000000000";

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, rows_out_full_n, cols_out_full_n)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);

    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, rows_out_full_n, cols_out_full_n)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (cols_out_full_n = ap_const_logic_0) or (rows_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_done_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, rows_out_full_n, cols_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (cols_out_full_n = ap_const_logic_0) or (rows_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, rows_out_full_n, cols_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (cols_out_full_n = ap_const_logic_0) or (rows_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_return_0_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, rows_out_full_n, cols_out_full_n, tmp_19_fu_68_p1, ap_return_0_preg)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (cols_out_full_n = ap_const_logic_0) or (rows_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_return_0 <= tmp_19_fu_68_p1;
        else 
            ap_return_0 <= ap_return_0_preg;
        end if; 
    end process;


    ap_return_1_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, rows_out_full_n, cols_out_full_n, tmp_9_out_fu_72_p2, ap_return_1_preg)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (cols_out_full_n = ap_const_logic_0) or (rows_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_return_1 <= tmp_9_out_fu_72_p2;
        else 
            ap_return_1 <= ap_return_1_preg;
        end if; 
    end process;


    ap_return_2_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, rows_out_full_n, cols_out_full_n, tmp_9_cast344_out_fu_78_p1, ap_return_2_preg)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (cols_out_full_n = ap_const_logic_0) or (rows_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_return_2 <= tmp_9_cast344_out_fu_78_p1;
        else 
            ap_return_2 <= ap_return_2_preg;
        end if; 
    end process;

    base_size_fu_58_p0 <= cols;
    base_size_fu_58_p1 <= rows;
    base_size_fu_58_p2 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(std_logic_vector(signed(base_size_fu_58_p0) * signed(base_size_fu_58_p1))), 32));

    cols_out_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, cols_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            cols_out_blk_n <= cols_out_full_n;
        else 
            cols_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    cols_out_din <= cols;

    cols_out_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, rows_out_full_n, cols_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (cols_out_full_n = ap_const_logic_0) or (rows_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            cols_out_write <= ap_const_logic_1;
        else 
            cols_out_write <= ap_const_logic_0;
        end if; 
    end process;


    rows_out_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, rows_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            rows_out_blk_n <= rows_out_full_n;
        else 
            rows_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    rows_out_din <= rows;

    rows_out_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, rows_out_full_n, cols_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (cols_out_full_n = ap_const_logic_0) or (rows_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            rows_out_write <= ap_const_logic_1;
        else 
            rows_out_write <= ap_const_logic_0;
        end if; 
    end process;

    tmp_19_fu_68_p1 <= base_size_fu_58_p2(19 - 1 downto 0);
    tmp_9_cast344_out_fu_78_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_9_out_fu_72_p2),32));
    tmp_9_out_fu_72_p2 <= std_logic_vector(signed(ap_const_lv18_3FFFF) + signed(tmp_fu_64_p1));
    tmp_fu_64_p1 <= base_size_fu_58_p2(18 - 1 downto 0);
end behav;
