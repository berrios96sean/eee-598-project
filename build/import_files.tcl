file mkdir "$project_dir/$project_name.srcs/sources_1/new"


# file copy -force $current_dir/src/top/top.v $project_dir/$project_name.srcs/sources_1/new/top.v
file copy -force $current_dir/src/axis/axis_mux.v $project_dir/$project_name.srcs/sources_1/new/axis_mux.v
file copy -force $current_dir/src/axis/axis_majority_vote.v $project_dir/$project_name.srcs/sources_1/new/axis_majority_vote.v
file copy -force $current_dir/src/wrapper/$ensemble_name.v $project_dir/$project_name.srcs/sources_1/new/$ensemble_name.v
file copy -force $current_dir/src/wrapper/ensemble_wrapper_1.v $project_dir/$project_name.srcs/sources_1/new/ensemble_wrapper_1.v
file copy -force $current_dir/src/wrapper/ensemble_wrapper_2.v $project_dir/$project_name.srcs/sources_1/new/ensemble_wrapper_2.v
file copy -force $current_dir/src/wrapper/ensemble_wrapper_3.v $project_dir/$project_name.srcs/sources_1/new/ensemble_wrapper_3.v
file copy -force $current_dir/src/wrapper/ensemble_wrapper_4.v $project_dir/$project_name.srcs/sources_1/new/ensemble_wrapper_4.v
file copy -force $current_dir/src/wrapper/ensemble_wrapper_5.v $project_dir/$project_name.srcs/sources_1/new/ensemble_wrapper_5.v
file copy -force $current_dir/src/wrapper/ensemble_wrapper_6.v $project_dir/$project_name.srcs/sources_1/new/ensemble_wrapper_6.v
file copy -force $current_dir/src/wrapper/ensemble_wrapper_7.v $project_dir/$project_name.srcs/sources_1/new/ensemble_wrapper_7.v
file copy -force $current_dir/src/wrapper/ensemble_wrapper_8.v $project_dir/$project_name.srcs/sources_1/new/ensemble_wrapper_8.v
file copy -force $current_dir/src/wrapper/ensemble_wrapper_9.v $project_dir/$project_name.srcs/sources_1/new/ensemble_wrapper_9.v
file copy -force $current_dir/src/wrapper/ensemble_wrapper_10.v $project_dir/$project_name.srcs/sources_1/new/ensemble_wrapper_10.v
# add_files -norecurse $project_dir/$project_name.srcs/sources_1/new/top.v
add_files -norecurse $project_dir/$project_name.srcs/sources_1/new/axis_mux.v
add_files -norecurse $project_dir/$project_name.srcs/sources_1/new/axis_majority_vote.v
add_files -norecurse $project_dir/$project_name.srcs/sources_1/new/$ensemble_name.v
add_files -norecurse $project_dir/$project_name.srcs/sources_1/new/ensemble_wrapper_1.v
add_files -norecurse $project_dir/$project_name.srcs/sources_1/new/ensemble_wrapper_2.v
add_files -norecurse $project_dir/$project_name.srcs/sources_1/new/ensemble_wrapper_3.v
add_files -norecurse $project_dir/$project_name.srcs/sources_1/new/ensemble_wrapper_4.v
add_files -norecurse $project_dir/$project_name.srcs/sources_1/new/ensemble_wrapper_5.v
add_files -norecurse $project_dir/$project_name.srcs/sources_1/new/ensemble_wrapper_6.v
add_files -norecurse $project_dir/$project_name.srcs/sources_1/new/ensemble_wrapper_7.v
add_files -norecurse $project_dir/$project_name.srcs/sources_1/new/ensemble_wrapper_8.v
add_files -norecurse $project_dir/$project_name.srcs/sources_1/new/ensemble_wrapper_9.v
add_files -norecurse $project_dir/$project_name.srcs/sources_1/new/ensemble_wrapper_10.v

# set_property top top [current_fileset]


update_compile_order -fileset sources_1



