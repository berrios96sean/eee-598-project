# Get the current user's home directory dynamically
set userHome [file normalize ~]
set project_name "project_1"

# Set the path to the Xilinx board repository in the user's home directory
set repoPath "$userHome/.Xilinx/Vivado/2022.1/xhub/board_store/xilinx_board_store"
set_param board.repoPaths "$repoPath"
puts "repo path: $repoPath"
# Set the specific board you are checking for (PYNQ-Z2 in this case)
set board "pynqzu"

# Search the repository for the board
if { [catch {xhub::get_xitems tulembedded.com:xilinx_board_store:$board:1.1}] } {
    # Board not found, so install it
    puts "Board not found. Installing $board..."
    set_param board.repoPaths "$repoPath"
    #xhub::install [xhub::get_xitems tulembedded.com:xilinx_board_store:$board:1.0]
    xhub::install [xhub::get_xitems tul.com.tw:xilinx_board_store:pynqzu:1.1]
} else {
    # Board already installed, skipping installation
    puts "$board is already installed. Skipping installation."
}


#create_project $project_name ./build/$project_name -part xc7z020clg400-1
create_project $project_name ./build/$project_name -part xczu5eg-sfvc784-1-e
# Get the project directory and store it in a variable
set project_dir [get_property DIRECTORY [current_project]]
set current_dir [pwd]
set ensemble_name "ensemble_wrapper_black_box"

puts "$current_dir"
puts "$project_dir"

set ip_path "$userHome/repos/eee-598-project/ip"
set_property  ip_repo_paths  $ip_path [current_project]
update_ip_catalog

source ./build/import_files.tcl
source ./src/block_design/bb/design_1_zu.tcl
#source ./src/block_design/_1/design_1_zu.tcl
#source ./src/block_design/_2/design_1_zu.tcl
#source ./src/block_design/_3/design_1_zu.tcl
#source ./src/block_design/_4/design_1_zu.tcl
source ./build/import_ips.tcl

# IMPORTANT!! Change this path to match where you have the repo installed -- for example I have it installed in a directory named 'repos'
set block_design_path "$userHome/repos/eee-598-project/build/project_1/project_1.srcs/sources_1/bd/design_1_zu/design_1_zu.bd"
make_wrapper -files [get_files $block_design_path] -top
set wrapper_file "$userHome/repos/eee-598-project/build/project_1/project_1.gen/sources_1/bd/design_1_zu/hdl/design_1_zu_wrapper.v"
add_files $wrapper_file
set_property top design_1_zu_wrapper [current_fileset]

# Run Synthesis and Implementation 
#launch_runs synth_1 -jobs 8
#launch_runs impl_1 -jobs 8

close_project

open_project ./build/project_1/project_1.xpr
start_gui
#get_board_parts
#set_property board_part tul.com.tw:pynq-z2:part0:1.0 [current_project]
