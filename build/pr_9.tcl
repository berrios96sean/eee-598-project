open_bd_design {/home/sfberrio/repos/eee-598-project/build/project_1/project_1.srcs/sources_1/bd/design_1_zu/design_1_zu.bd}
delete_bd_objs [get_bd_intf_nets ensemble_wrapper_8_0_m_axis_0] [get_bd_intf_nets ensemble_wrapper_8_0_m_axis_1] [get_bd_intf_nets ensemble_wrapper_8_0_m_axis_2] [get_bd_intf_nets axis_multiplexer_0_m_axis_0] [get_bd_intf_nets axis_multiplexer_0_m_axis_1] [get_bd_intf_nets axis_multiplexer_0_m_axis_2] [get_bd_cells pr_sec]
update_compile_order -fileset sources_1
create_bd_cell -type module -reference ensemble_wrapper_9 ensemble_wrapper_9_0
connect_bd_net [get_bd_pins ensemble_wrapper_9_0/clk] [get_bd_pins zynq_ultra_ps_e_0/pl_clk0]
connect_bd_net [get_bd_pins ensemble_wrapper_9_0/rst_n] [get_bd_pins rst_ps8_0_100M/peripheral_aresetn]
connect_bd_intf_net [get_bd_intf_pins axis_multiplexer_0/m_axis_0] [get_bd_intf_pins ensemble_wrapper_9_0/s_axis_0]
connect_bd_intf_net [get_bd_intf_pins axis_multiplexer_0/m_axis_1] [get_bd_intf_pins ensemble_wrapper_9_0/s_axis_1]
connect_bd_intf_net [get_bd_intf_pins axis_multiplexer_0/m_axis_2] [get_bd_intf_pins ensemble_wrapper_9_0/s_axis_2]
connect_bd_intf_net [get_bd_intf_pins ensemble_wrapper_9_0/m_axis_0] [get_bd_intf_pins axis_majority_vote_0/s_axis_0]
connect_bd_intf_net [get_bd_intf_pins ensemble_wrapper_9_0/m_axis_1] [get_bd_intf_pins axis_majority_vote_0/s_axis_1]
connect_bd_intf_net [get_bd_intf_pins ensemble_wrapper_9_0/m_axis_2] [get_bd_intf_pins axis_majority_vote_0/s_axis_2]
group_bd_cells pr_sec [get_bd_cells ensemble_wrapper_9_0]
regenerate_bd_layout
regenerate_bd_layout
validate_bd_design
# much easier to run synthesis in the gui
# need to let sythesis finsih before writing checkpoint
#write_checkpoint -cell design_1_zu_i/pr_sec/ensemble_wrapper_9_0 ./pr/checkpoints/ensemble_2_cell.dcp


