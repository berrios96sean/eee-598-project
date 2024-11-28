#create_project sim_project ./sim_project -force

exec xvlog -work work ../src/axis/axis_mux.v
exec xvlog -work work ../src/axis/axis_majority_vote.v
exec xvlog -work work ../src/wrapper/ensemble_wrapper_black_box.v
exec xvlog -work work ./datapath_tb.v
exec xelab -debug typical axis_testbench -s my_sim

exec xsim my_sim --gui 

#set_property top axis_testbench [current_fileset]

launch_simulation






