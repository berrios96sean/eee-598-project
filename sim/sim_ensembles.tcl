set userHome [file normalize ~]

create_project sim_proj ./sim/sim_proj -force -part xczu5eg-sfvc784-1-e

add_files ./src/axis/axis_mux.v
add_files ./src/axis/axis_majority_vote.v
add_files ./src/wrapper/ensemble_wrapper_1.v
add_files ./src/wrapper/ensemble_wrapper_2.v
add_files ./src/wrapper/ensemble_wrapper_3.v
add_files ./src/wrapper/ensemble_wrapper_4.v

update_compile_order -fileset sources_1
set_property SOURCE_SET sources_1 [get_filesets sim_1]

set tb_path "$userHome/repos/eee-598-project/sim/datapath_tb.v"
add_files -fileset sim_1 -norecurse $tb_path
update_compile_order -fileset sim_1


set ip_path "$userHome/repos/eee-598-project/ip"
set_property  ip_repo_paths  $ip_path [current_project]
update_ip_catalog

source ./build/import_ips.tcl

close_project

open_project ./sim/sim_proj/sim_proj.xpr

start_gui


