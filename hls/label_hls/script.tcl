############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project label_hls
set_top hw_label_accel
add_files label_hls/xf_label_accel.cpp -cflags "-Ilabel_hls/include"
add_files label_hls/xf_label_config.h
add_files -tb label_hls/xf_headers.h -cflags "-Wno-unknown-pragmas"
add_files -tb label_hls/xf_label_tb.cpp -cflags "-Ilabel_hls/include -Wno-unknown-pragmas"
open_solution "solution1"
set_part {xczu3eg-sbva484-1-e} -tool vivado
create_clock -period 10 -name default
config_export -description {hw_label based on HLS} -display_name hw_label -format ip_catalog -rtl verilog
set_clock_uncertainty 27.0%
#source "./label_hls/solution1/directives.tcl"
csim_design -argv {../../../img_soft.png}
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog -description "hw_label based on HLS" -display_name "hw_label"
