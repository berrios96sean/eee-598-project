# Get the current user's home directory dynamically
set userHome [file normalize ~]
set project_name "project_1"

# Set the path to the Xilinx board repository in the user's home directory
set repoPath "$userHome/.Xilinx/Vivado/2022.1/xhub/board_store/xilinx_board_store"
set_param board.repoPaths "$repoPath"
puts "repo path: $repoPath"
# Set the specific board you are checking for (PYNQ-Z2 in this case)
set board "pynq-z2"

# Search the repository for the board
if { [catch {xhub::get_xitems tulembedded.com:xilinx_board_store:$board:1.0}] } {
    # Board not found, so install it
    puts "Board not found. Installing $board..."
    set_param board.repoPaths "$repoPath"
    xhub::install [xhub::get_xitems tulembedded.com:xilinx_board_store:$board:1.0]
} else {
    # Board already installed, skipping installation
    puts "$board is already installed. Skipping installation."
}


create_project $project_name ./build/$project_name -part xc7z020clg400-1
# Get the project directory and store it in a variable
set project_dir [get_property DIRECTORY [current_project]]
set current_dir [pwd]

puts "$current_dir"
puts "$project_dir"

source ./build/import_files.tcl
source ./src/block_design/design_1.tcl

close_project

open_project ./build/project_1/project_1.xpr
start_gui
#get_board_parts
#set_property board_part tul.com.tw:pynq-z2:part0:1.0 [current_project]
