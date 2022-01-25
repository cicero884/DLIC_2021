vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_5
vlib modelsim_lib/msim/processing_system7_vip_v1_0_7
vlib modelsim_lib/msim/generic_baseblocks_v2_1_0
vlib modelsim_lib/msim/axi_register_slice_v2_1_19
vlib modelsim_lib/msim/fifo_generator_v13_2_4
vlib modelsim_lib/msim/axi_data_fifo_v2_1_18
vlib modelsim_lib/msim/axi_crossbar_v2_1_20
vlib modelsim_lib/msim/lib_pkg_v1_0_2
vlib modelsim_lib/msim/lib_srl_fifo_v1_0_2
vlib modelsim_lib/msim/lib_fifo_v1_0_13
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/axi_datamover_v5_1_21
vlib modelsim_lib/msim/axi_sg_v4_1_12
vlib modelsim_lib/msim/axi_cdma_v4_1_19
vlib modelsim_lib/msim/axi_bram_ctrl_v4_1_1
vlib modelsim_lib/msim/blk_mem_gen_v8_4_3
vlib modelsim_lib/msim/axi_lite_ipif_v3_0_4
vlib modelsim_lib/msim/interrupt_control_v3_1_4
vlib modelsim_lib/msim/axi_gpio_v2_0_21
vlib modelsim_lib/msim/proc_sys_reset_v5_0_13
vlib modelsim_lib/msim/axi_protocol_converter_v2_1_19
vlib modelsim_lib/msim/axi_clock_converter_v2_1_18
vlib modelsim_lib/msim/axi_dwidth_converter_v2_1_19

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_5 modelsim_lib/msim/axi_vip_v1_1_5
vmap processing_system7_vip_v1_0_7 modelsim_lib/msim/processing_system7_vip_v1_0_7
vmap generic_baseblocks_v2_1_0 modelsim_lib/msim/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_19 modelsim_lib/msim/axi_register_slice_v2_1_19
vmap fifo_generator_v13_2_4 modelsim_lib/msim/fifo_generator_v13_2_4
vmap axi_data_fifo_v2_1_18 modelsim_lib/msim/axi_data_fifo_v2_1_18
vmap axi_crossbar_v2_1_20 modelsim_lib/msim/axi_crossbar_v2_1_20
vmap lib_pkg_v1_0_2 modelsim_lib/msim/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 modelsim_lib/msim/lib_srl_fifo_v1_0_2
vmap lib_fifo_v1_0_13 modelsim_lib/msim/lib_fifo_v1_0_13
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap axi_datamover_v5_1_21 modelsim_lib/msim/axi_datamover_v5_1_21
vmap axi_sg_v4_1_12 modelsim_lib/msim/axi_sg_v4_1_12
vmap axi_cdma_v4_1_19 modelsim_lib/msim/axi_cdma_v4_1_19
vmap axi_bram_ctrl_v4_1_1 modelsim_lib/msim/axi_bram_ctrl_v4_1_1
vmap blk_mem_gen_v8_4_3 modelsim_lib/msim/blk_mem_gen_v8_4_3
vmap axi_lite_ipif_v3_0_4 modelsim_lib/msim/axi_lite_ipif_v3_0_4
vmap interrupt_control_v3_1_4 modelsim_lib/msim/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_21 modelsim_lib/msim/axi_gpio_v2_0_21
vmap proc_sys_reset_v5_0_13 modelsim_lib/msim/proc_sys_reset_v5_0_13
vmap axi_protocol_converter_v2_1_19 modelsim_lib/msim/axi_protocol_converter_v2_1_19
vmap axi_clock_converter_v2_1_18 modelsim_lib/msim/axi_clock_converter_v2_1_18
vmap axi_dwidth_converter_v2_1_19 modelsim_lib/msim/axi_dwidth_converter_v2_1_19

vlog -work xilinx_vip -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L xilinx_vip "+incdir+C:/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L xilinx_vip "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/8c62/hdl" "+incdir+../../../bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+C:/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/8c62/hdl" "+incdir+../../../bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+C:/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_5 -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L xilinx_vip "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/8c62/hdl" "+incdir+../../../bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+C:/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/d4a8/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_7 -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L xilinx_vip "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/8c62/hdl" "+incdir+../../../bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+C:/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/8c62/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/8c62/hdl" "+incdir+../../../bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+C:/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_processing_system7_0_0/sim/design_1_processing_system7_0_0.v" \

vlog -work generic_baseblocks_v2_1_0 -64 -incr "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/8c62/hdl" "+incdir+../../../bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+C:/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_19 -64 -incr "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/8c62/hdl" "+incdir+../../../bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+C:/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/4d88/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_4 -64 -incr "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/8c62/hdl" "+incdir+../../../bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+C:/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/1f5a/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_4 -64 -93 \
"../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_4 -64 -incr "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/8c62/hdl" "+incdir+../../../bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+C:/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_18 -64 -incr "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/8c62/hdl" "+incdir+../../../bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+C:/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/5b9c/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_20 -64 -incr "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/8c62/hdl" "+incdir+../../../bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+C:/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/ace7/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/8c62/hdl" "+incdir+../../../bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+C:/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_xbar_0/sim/design_1_xbar_0.v" \
"../../../bd/design_1/ip/design_1_xbar_1/sim/design_1_xbar_1.v" \

vcom -work lib_pkg_v1_0_2 -64 -93 \
"../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -64 -93 \
"../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work lib_fifo_v1_0_13 -64 -93 \
"../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/4dac/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_21 -64 -93 \
"../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/e644/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_12 -64 -93 \
"../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/91f3/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_cdma_v4_1_19 -64 -93 \
"../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/699c/hdl/axi_cdma_v4_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/ip/design_1_axi_cdma_0_0/sim/design_1_axi_cdma_0_0.vhd" \

vcom -work axi_bram_ctrl_v4_1_1 -64 -93 \
"../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/70bf/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/ip/design_1_axi_bram_ctrl_0_0/sim/design_1_axi_bram_ctrl_0_0.vhd" \

vlog -work blk_mem_gen_v8_4_3 -64 -incr "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/8c62/hdl" "+incdir+../../../bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+C:/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/c001/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/8c62/hdl" "+incdir+../../../bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+C:/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_blk_mem_gen_0_0/sim/design_1_blk_mem_gen_0_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -64 -93 \
"../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_21 -64 -93 \
"../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/9c6e/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/ip/design_1_axi_gpio_0_0/sim/design_1_axi_gpio_0_0.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/8c62/hdl" "+incdir+../../../bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+C:/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_blk_mem_gen_0_1/sim/design_1_blk_mem_gen_0_1.v" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/ip/design_1_rst_ps7_0_100M_0/sim/design_1_rst_ps7_0_100M_0.vhd" \
"../../../bd/design_1/ip/design_1_axi_bram_ctrl_1_0/sim/design_1_axi_bram_ctrl_1_0.vhd" \
"../../../bd/design_1/ip/design_1_axi_gpio_0_1/sim/design_1_axi_gpio_0_1.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/8c62/hdl" "+incdir+../../../bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+C:/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/design_1/ipshared/15c3/sources_1/imports/Downloads/ctrl.v" \
"../../../bd/design_1/ipshared/15c3/sources_1/imports/Downloads/dp.v" \
"../../../bd/design_1/ipshared/15c3/sources_1/imports/Downloads/conv.v" \
"../../../bd/design_1/ip/design_1_conv_0_1/sim/design_1_conv_0_1.v" \

vlog -work axi_protocol_converter_v2_1_19 -64 -incr "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/8c62/hdl" "+incdir+../../../bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+C:/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/c83a/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/8c62/hdl" "+incdir+../../../bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+C:/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_auto_pc_0/sim/design_1_auto_pc_0.v" \

vlog -work axi_clock_converter_v2_1_18 -64 -incr "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/8c62/hdl" "+incdir+../../../bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+C:/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/ac9d/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work axi_dwidth_converter_v2_1_19 -64 -incr "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/8c62/hdl" "+incdir+../../../bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+C:/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/e578/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/8c62/hdl" "+incdir+../../../bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0" "+incdir+../../../../DLIC_2020_hw5.srcs/sources_1/bd/design_1/ipshared/15c3/sources_1/imports/Downloads" "+incdir+C:/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_auto_us_0/sim/design_1_auto_us_0.v" \
"../../../bd/design_1/ip/design_1_auto_pc_1/sim/design_1_auto_pc_1.v" \
"../../../bd/design_1/ip/design_1_auto_ds_0/sim/design_1_auto_ds_0.v" \
"../../../bd/design_1/ip/design_1_auto_ds_1/sim/design_1_auto_ds_1.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

