set gauss_nb_path "$userHome/repos/eee-598-project/build/project_1/project_1.srcs/sources_1/ip/gaussian_nb_0/gaussian_nb_0.xci"
set lr_path "$userHome/repos/eee-598-project/build/project_1/project_1.srcs/sources_1/ip/logistic_regression_0/logistic_regression_0.xci"
set gradient_path "$userHome/repos/eee-598-project/build/project_1/project_1.srcs/sources_1/ip/gradient_boost_0/gradient_boost_0.xci"
set mlp_path "$userHome/repos/eee-598-project/build/project_1/project_1.srcs/sources_1/ip/mlp_0/mlp_0.xci"
set svm_path "$userHome/repos/eee-598-project/build/project_1/project_1.srcs/sources_1/ip/svm_0/svm_0.xci"

create_ip -name gaussian_nb -vendor xilinx.com -library hls -version 1.0 -module_name gaussian_nb_0
generate_target {instantiation_template} [get_files $gauss_nb_path]
update_compile_order -fileset sources_1

create_ip -name logistic_regression -vendor xilinx.com -library hls -version 1.0 -module_name logistic_regression_0
generate_target {instantiation_template} [get_files $lr_path]
update_compile_order -fileset sources_1

create_ip -name gradient_boost -vendor xilinx.com -library hls -version 1.0 -module_name gradient_boost_0
generate_target {instantiation_template} [get_files $gradient_path]
update_compile_order -fileset sources_1

create_ip -name mlp -vendor xilinx.com -library hls -version 1.0 -module_name mlp_0
generate_target {instantiation_template} [get_files $mlp_path]
update_compile_order -fileset sources_1


create_ip -name svm -vendor xilinx.com -library hls -version 1.0 -module_name svm_0
generate_target {instantiation_template} [get_files $svm_path]
update_compile_order -fileset sources_1


