// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module xfMat2axis (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        p_dst_data_V_address0,
        p_dst_data_V_ce0,
        p_dst_data_V_q0,
        dst_TDATA,
        dst_TVALID,
        dst_TREADY,
        dst_TLAST,
        rows,
        cols
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_pp0_stage0 = 4'd4;
parameter    ap_ST_fsm_state6 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [17:0] p_dst_data_V_address0;
output   p_dst_data_V_ce0;
input  [15:0] p_dst_data_V_q0;
output  [15:0] dst_TDATA;
output   dst_TVALID;
input   dst_TREADY;
output  [0:0] dst_TLAST;
input  [8:0] rows;
input  [8:0] cols;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg p_dst_data_V_ce0;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [15:0] dst_data_V_1_data_out;
reg    dst_data_V_1_vld_in;
wire    dst_data_V_1_vld_out;
wire    dst_data_V_1_ack_in;
wire    dst_data_V_1_ack_out;
reg   [15:0] dst_data_V_1_payload_A;
reg   [15:0] dst_data_V_1_payload_B;
reg    dst_data_V_1_sel_rd;
reg    dst_data_V_1_sel_wr;
wire    dst_data_V_1_sel;
wire    dst_data_V_1_load_A;
wire    dst_data_V_1_load_B;
reg   [1:0] dst_data_V_1_state;
wire    dst_data_V_1_state_cmp_full;
reg   [0:0] dst_last_V_1_data_out;
reg    dst_last_V_1_vld_in;
wire    dst_last_V_1_vld_out;
wire    dst_last_V_1_ack_in;
wire    dst_last_V_1_ack_out;
reg   [0:0] dst_last_V_1_payload_A;
reg   [0:0] dst_last_V_1_payload_B;
reg    dst_last_V_1_sel_rd;
reg    dst_last_V_1_sel_wr;
wire    dst_last_V_1_sel;
wire    dst_last_V_1_load_A;
wire    dst_last_V_1_load_B;
reg   [1:0] dst_last_V_1_state;
wire    dst_last_V_1_state_cmp_full;
reg    dst_TDATA_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg   [0:0] exitcond_reg_255;
reg    ap_enable_reg_pp0_iter2;
reg   [0:0] exitcond_reg_255_pp0_iter1_reg;
reg   [8:0] j_i_reg_111;
reg    ap_block_state1;
wire   [17:0] cols_cast2_i_cast6_fu_122_p1;
reg   [17:0] cols_cast2_i_cast6_reg_221;
wire   [9:0] tmp_i_fu_130_p2;
reg   [9:0] tmp_i_reg_226;
wire   [9:0] tmp_1_i_fu_140_p2;
reg   [9:0] tmp_1_i_reg_231;
wire   [17:0] next_mul_fu_146_p2;
reg   [17:0] next_mul_reg_236;
wire    ap_CS_fsm_state2;
reg    ap_block_state2;
wire   [0:0] exitcond1_fu_155_p2;
wire   [8:0] i_fu_160_p2;
reg   [8:0] i_reg_245;
wire   [0:0] tmp_3_i_fu_166_p2;
reg   [0:0] tmp_3_i_reg_250;
wire   [0:0] exitcond_fu_179_p2;
wire    ap_block_state3_pp0_stage0_iter0;
wire    ap_block_state4_pp0_stage0_iter1;
reg    ap_block_state4_io;
wire    ap_block_state5_pp0_stage0_iter2;
reg    ap_block_state5_io;
reg    ap_block_pp0_stage0_11001;
wire   [8:0] j_fu_184_p2;
reg    ap_enable_reg_pp0_iter0;
wire   [0:0] p_i_fu_195_p2;
reg   [0:0] p_i_reg_264;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state3;
reg   [8:0] i_i_reg_88;
wire    ap_CS_fsm_state6;
reg   [17:0] phi_mul_reg_99;
wire   [63:0] tmp_8_i_fu_206_p1;
wire    ap_block_pp0_stage0_01001;
wire   [9:0] rows_cast_i_cast_fu_126_p1;
wire   [9:0] cols_cast_i_cast_fu_136_p1;
wire   [9:0] i_cast_i_cast4_fu_151_p1;
wire   [9:0] j_cast_i_cast2_fu_175_p1;
wire   [0:0] tmp_6_i_fu_190_p2;
wire   [17:0] j_cast_i_cast3_fu_171_p1;
wire   [17:0] tmp_7_i_fu_200_p2;
reg   [3:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 4'd1;
#0 dst_data_V_1_sel_rd = 1'b0;
#0 dst_data_V_1_sel_wr = 1'b0;
#0 dst_data_V_1_state = 2'd0;
#0 dst_last_V_1_sel_rd = 1'b0;
#0 dst_last_V_1_sel_wr = 1'b0;
#0 dst_last_V_1_state = 2'd0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
end

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
        end else if ((~((dst_data_V_1_ack_in == 1'b0) | (dst_last_V_1_ack_in == 1'b0)) & (exitcond1_fu_155_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state3) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((~((dst_data_V_1_ack_in == 1'b0) | (dst_last_V_1_ack_in == 1'b0)) & (exitcond1_fu_155_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state3)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state3);
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if ((~((dst_data_V_1_ack_in == 1'b0) | (dst_last_V_1_ack_in == 1'b0)) & (exitcond1_fu_155_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        dst_data_V_1_sel_rd <= 1'b0;
    end else begin
        if (((dst_data_V_1_ack_out == 1'b1) & (dst_data_V_1_vld_out == 1'b1))) begin
            dst_data_V_1_sel_rd <= ~dst_data_V_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        dst_data_V_1_sel_wr <= 1'b0;
    end else begin
        if (((dst_data_V_1_ack_in == 1'b1) & (dst_data_V_1_vld_in == 1'b1))) begin
            dst_data_V_1_sel_wr <= ~dst_data_V_1_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        dst_data_V_1_state <= 2'd0;
    end else begin
        if ((((dst_data_V_1_state == 2'd2) & (dst_data_V_1_vld_in == 1'b0)) | ((dst_data_V_1_state == 2'd3) & (dst_data_V_1_vld_in == 1'b0) & (dst_data_V_1_ack_out == 1'b1)))) begin
            dst_data_V_1_state <= 2'd2;
        end else if ((((dst_data_V_1_state == 2'd1) & (dst_data_V_1_ack_out == 1'b0)) | ((dst_data_V_1_state == 2'd3) & (dst_data_V_1_ack_out == 1'b0) & (dst_data_V_1_vld_in == 1'b1)))) begin
            dst_data_V_1_state <= 2'd1;
        end else if (((~((dst_data_V_1_vld_in == 1'b0) & (dst_data_V_1_ack_out == 1'b1)) & ~((dst_data_V_1_ack_out == 1'b0) & (dst_data_V_1_vld_in == 1'b1)) & (dst_data_V_1_state == 2'd3)) | ((dst_data_V_1_state == 2'd1) & (dst_data_V_1_ack_out == 1'b1)) | ((dst_data_V_1_state == 2'd2) & (dst_data_V_1_vld_in == 1'b1)))) begin
            dst_data_V_1_state <= 2'd3;
        end else begin
            dst_data_V_1_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        dst_last_V_1_sel_rd <= 1'b0;
    end else begin
        if (((dst_last_V_1_ack_out == 1'b1) & (dst_last_V_1_vld_out == 1'b1))) begin
            dst_last_V_1_sel_rd <= ~dst_last_V_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        dst_last_V_1_sel_wr <= 1'b0;
    end else begin
        if (((dst_last_V_1_ack_in == 1'b1) & (dst_last_V_1_vld_in == 1'b1))) begin
            dst_last_V_1_sel_wr <= ~dst_last_V_1_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        dst_last_V_1_state <= 2'd0;
    end else begin
        if ((((dst_last_V_1_state == 2'd2) & (dst_last_V_1_vld_in == 1'b0)) | ((dst_last_V_1_state == 2'd3) & (dst_last_V_1_vld_in == 1'b0) & (dst_last_V_1_ack_out == 1'b1)))) begin
            dst_last_V_1_state <= 2'd2;
        end else if ((((dst_last_V_1_state == 2'd1) & (dst_last_V_1_ack_out == 1'b0)) | ((dst_last_V_1_state == 2'd3) & (dst_last_V_1_ack_out == 1'b0) & (dst_last_V_1_vld_in == 1'b1)))) begin
            dst_last_V_1_state <= 2'd1;
        end else if (((~((dst_last_V_1_vld_in == 1'b0) & (dst_last_V_1_ack_out == 1'b1)) & ~((dst_last_V_1_ack_out == 1'b0) & (dst_last_V_1_vld_in == 1'b1)) & (dst_last_V_1_state == 2'd3)) | ((dst_last_V_1_state == 2'd1) & (dst_last_V_1_ack_out == 1'b1)) | ((dst_last_V_1_state == 2'd2) & (dst_last_V_1_vld_in == 1'b1)))) begin
            dst_last_V_1_state <= 2'd3;
        end else begin
            dst_last_V_1_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        i_i_reg_88 <= i_reg_245;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_i_reg_88 <= 9'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((~((dst_data_V_1_ack_in == 1'b0) | (dst_last_V_1_ack_in == 1'b0)) & (exitcond1_fu_155_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        j_i_reg_111 <= 9'd0;
    end else if (((exitcond_fu_179_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        j_i_reg_111 <= j_fu_184_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        phi_mul_reg_99 <= next_mul_reg_236;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        phi_mul_reg_99 <= 18'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        cols_cast2_i_cast6_reg_221[8 : 0] <= cols_cast2_i_cast6_fu_122_p1[8 : 0];
        tmp_1_i_reg_231 <= tmp_1_i_fu_140_p2;
        tmp_i_reg_226 <= tmp_i_fu_130_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((dst_data_V_1_load_A == 1'b1)) begin
        dst_data_V_1_payload_A <= p_dst_data_V_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((dst_data_V_1_load_B == 1'b1)) begin
        dst_data_V_1_payload_B <= p_dst_data_V_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((dst_last_V_1_load_A == 1'b1)) begin
        dst_last_V_1_payload_A <= p_i_reg_264;
    end
end

always @ (posedge ap_clk) begin
    if ((dst_last_V_1_load_B == 1'b1)) begin
        dst_last_V_1_payload_B <= p_i_reg_264;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        exitcond_reg_255 <= exitcond_fu_179_p2;
        exitcond_reg_255_pp0_iter1_reg <= exitcond_reg_255;
    end
end

always @ (posedge ap_clk) begin
    if ((~((dst_data_V_1_ack_in == 1'b0) | (dst_last_V_1_ack_in == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
        i_reg_245 <= i_fu_160_p2;
        next_mul_reg_236 <= next_mul_fu_146_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_fu_179_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_i_reg_264 <= p_i_fu_195_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((dst_data_V_1_ack_in == 1'b0) | (dst_last_V_1_ack_in == 1'b0)) & (exitcond1_fu_155_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        tmp_3_i_reg_250 <= tmp_3_i_fu_166_p2;
    end
end

always @ (*) begin
    if ((exitcond_fu_179_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state3 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state3 = 1'b0;
    end
end

always @ (*) begin
    if ((~((dst_data_V_1_ack_in == 1'b0) | (dst_last_V_1_ack_in == 1'b0)) & (exitcond1_fu_155_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((dst_data_V_1_ack_in == 1'b0) | (dst_last_V_1_ack_in == 1'b0)) & (exitcond1_fu_155_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((((exitcond_reg_255_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0)) | ((exitcond_reg_255 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)))) begin
        dst_TDATA_blk_n = dst_data_V_1_state[1'd1];
    end else begin
        dst_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((dst_data_V_1_sel == 1'b1)) begin
        dst_data_V_1_data_out = dst_data_V_1_payload_B;
    end else begin
        dst_data_V_1_data_out = dst_data_V_1_payload_A;
    end
end

always @ (*) begin
    if (((exitcond_reg_255 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dst_data_V_1_vld_in = 1'b1;
    end else begin
        dst_data_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if ((dst_last_V_1_sel == 1'b1)) begin
        dst_last_V_1_data_out = dst_last_V_1_payload_B;
    end else begin
        dst_last_V_1_data_out = dst_last_V_1_payload_A;
    end
end

always @ (*) begin
    if (((exitcond_reg_255 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dst_last_V_1_vld_in = 1'b1;
    end else begin
        dst_last_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_dst_data_V_ce0 = 1'b1;
    end else begin
        p_dst_data_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((dst_data_V_1_ack_in == 1'b0) | (dst_last_V_1_ack_in == 1'b0)) & (exitcond1_fu_155_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if ((~((dst_data_V_1_ack_in == 1'b0) | (dst_last_V_1_ack_in == 1'b0)) & (exitcond1_fu_155_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((exitcond_fu_179_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((exitcond_fu_179_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd3];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((1'b1 == ap_block_state5_io) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((1'b1 == ap_block_state4_io) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((1'b1 == ap_block_state5_io) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((1'b1 == ap_block_state4_io) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

always @ (*) begin
    ap_block_state2 = ((dst_data_V_1_ack_in == 1'b0) | (dst_last_V_1_ack_in == 1'b0));
end

assign ap_block_state3_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state4_io = ((exitcond_reg_255 == 1'd0) & (dst_data_V_1_ack_in == 1'b0));
end

assign ap_block_state4_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state5_io = ((exitcond_reg_255_pp0_iter1_reg == 1'd0) & (dst_data_V_1_ack_in == 1'b0));
end

assign ap_block_state5_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign cols_cast2_i_cast6_fu_122_p1 = cols;

assign cols_cast_i_cast_fu_136_p1 = cols;

assign dst_TDATA = dst_data_V_1_data_out;

assign dst_TLAST = dst_last_V_1_data_out;

assign dst_TVALID = dst_last_V_1_state[1'd0];

assign dst_data_V_1_ack_in = dst_data_V_1_state[1'd1];

assign dst_data_V_1_ack_out = dst_TREADY;

assign dst_data_V_1_load_A = (~dst_data_V_1_sel_wr & dst_data_V_1_state_cmp_full);

assign dst_data_V_1_load_B = (dst_data_V_1_state_cmp_full & dst_data_V_1_sel_wr);

assign dst_data_V_1_sel = dst_data_V_1_sel_rd;

assign dst_data_V_1_state_cmp_full = ((dst_data_V_1_state != 2'd1) ? 1'b1 : 1'b0);

assign dst_data_V_1_vld_out = dst_data_V_1_state[1'd0];

assign dst_last_V_1_ack_in = dst_last_V_1_state[1'd1];

assign dst_last_V_1_ack_out = dst_TREADY;

assign dst_last_V_1_load_A = (~dst_last_V_1_sel_wr & dst_last_V_1_state_cmp_full);

assign dst_last_V_1_load_B = (dst_last_V_1_state_cmp_full & dst_last_V_1_sel_wr);

assign dst_last_V_1_sel = dst_last_V_1_sel_rd;

assign dst_last_V_1_state_cmp_full = ((dst_last_V_1_state != 2'd1) ? 1'b1 : 1'b0);

assign dst_last_V_1_vld_out = dst_last_V_1_state[1'd0];

assign exitcond1_fu_155_p2 = ((i_i_reg_88 == rows) ? 1'b1 : 1'b0);

assign exitcond_fu_179_p2 = ((j_i_reg_111 == cols) ? 1'b1 : 1'b0);

assign i_cast_i_cast4_fu_151_p1 = i_i_reg_88;

assign i_fu_160_p2 = (i_i_reg_88 + 9'd1);

assign j_cast_i_cast2_fu_175_p1 = j_i_reg_111;

assign j_cast_i_cast3_fu_171_p1 = j_i_reg_111;

assign j_fu_184_p2 = (j_i_reg_111 + 9'd1);

assign next_mul_fu_146_p2 = (phi_mul_reg_99 + cols_cast2_i_cast6_reg_221);

assign p_dst_data_V_address0 = tmp_8_i_fu_206_p1;

assign p_i_fu_195_p2 = (tmp_6_i_fu_190_p2 & tmp_3_i_reg_250);

assign rows_cast_i_cast_fu_126_p1 = rows;

assign tmp_1_i_fu_140_p2 = ($signed(cols_cast_i_cast_fu_136_p1) + $signed(10'd1023));

assign tmp_3_i_fu_166_p2 = ((i_cast_i_cast4_fu_151_p1 == tmp_i_reg_226) ? 1'b1 : 1'b0);

assign tmp_6_i_fu_190_p2 = ((j_cast_i_cast2_fu_175_p1 == tmp_1_i_reg_231) ? 1'b1 : 1'b0);

assign tmp_7_i_fu_200_p2 = (phi_mul_reg_99 + j_cast_i_cast3_fu_171_p1);

assign tmp_8_i_fu_206_p1 = tmp_7_i_fu_200_p2;

assign tmp_i_fu_130_p2 = ($signed(rows_cast_i_cast_fu_126_p1) + $signed(10'd1023));

always @ (posedge ap_clk) begin
    cols_cast2_i_cast6_reg_221[17:9] <= 9'b000000000;
end

endmodule //xfMat2axis
