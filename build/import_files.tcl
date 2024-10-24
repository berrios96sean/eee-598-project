file mkdir "$project_dir/$project_name.srcs/sources_1/new"


file copy -force $current_dir/src/top/top.v $project_dir/$project_name.srcs/sources_1/new/top.v
add_files -norecurse $project_dir/$project_name.srcs/sources_1/new/top.v

set_property top top [current_fileset]


update_compile_order -fileset sources_1



