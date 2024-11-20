file mkdir "$project_dir/$project_name.srcs/sources_1/new"


file copy -force $current_dir/src/top/top.v $project_dir/$project_name.srcs/sources_1/new/top.v
file copy -force $current_dir/src/axis/axis_mux.v $project_dir/$project_name.srcs/sources_1/new/axis_mux.v
file copy -force $current_dir/src/axis/axis_majority_vote.v $project_dir/$project_name.srcs/sources_1/new/axis_majority_vote.v
file copy -force $current_dir/src/wrapper/classifier_wrapper.v $project_dir/$project_name.srcs/sources_1/new/classifier_wrapper.v
add_files -norecurse $project_dir/$project_name.srcs/sources_1/new/top.v
add_files -norecurse $project_dir/$project_name.srcs/sources_1/new/axis_mux.v
add_files -norecurse $project_dir/$project_name.srcs/sources_1/new/axis_majority_vote.v
add_files -norecurse $project_dir/$project_name.srcs/sources_1/new/classifier_wrapper.v

set_property top top [current_fileset]


update_compile_order -fileset sources_1



