create_ip -name mlp -vendor xilinx.com -library hls -version 1.0 -module_name mlp_1
generate_target {instantiation_template} [get_files /home/sfberrio/repos/eee-598-project/build/project_1/project_1.srcs/sources_1/ip/mlp_1/mlp_1.xci]
generate_target all [get_files  /home/sfberrio/repos/eee-598-project/build/project_1/project_1.srcs/sources_1/ip/mlp_1/mlp_1.xci]
catch { config_ip_cache -export [get_ips -all mlp_1] }
export_ip_user_files -of_objects [get_files /home/sfberrio/repos/eee-598-project/build/project_1/project_1.srcs/sources_1/ip/mlp_1/mlp_1.xci] -no_script -sync -force -quiet
create_ip_run [get_files -of_objects [get_fileset sources_1] /home/sfberrio/repos/eee-598-project/build/project_1/project_1.srcs/sources_1/ip/mlp_1/mlp_1.xci]
export_simulation -of_objects [get_files /home/sfberrio/repos/eee-598-project/build/project_1/project_1.srcs/sources_1/ip/mlp_1/mlp_1.xci] -directory /home/sfberrio/repos/eee-598-project/build/project_1/project_1.ip_user_files/sim_scripts -ip_user_files_dir /home/sfberrio/repos/eee-598-project/build/project_1/project_1.ip_user_files -ipstatic_source_dir /home/sfberrio/repos/eee-598-project/build/project_1/project_1.ip_user_files/ipstatic -lib_map_path [list {modelsim=/home/sfberrio/repos/eee-598-project/build/project_1/project_1.cache/compile_simlib/modelsim} {questa=/home/sfberrio/repos/eee-598-project/build/project_1/project_1.cache/compile_simlib/questa} {xcelium=/home/sfberrio/repos/eee-598-project/build/project_1/project_1.cache/compile_simlib/xcelium} {vcs=/home/sfberrio/repos/eee-598-project/build/project_1/project_1.cache/compile_simlib/vcs} {riviera=/home/sfberrio/repos/eee-598-project/build/project_1/project_1.cache/compile_simlib/riviera}] -use_ip_compiled_libs -force -quiet
update_compile_order -fileset sources_1
