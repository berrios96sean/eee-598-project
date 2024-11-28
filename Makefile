

build_gui:
	vivado -mode batch -source build/build.tcl

clean:
	rm -rf *.jou
	rm -rf *.log
	rm -rf *.str
	rm -rf ./build/project_1

sim_bb:
	vivado -mode batch -source sim/sim_bb.tcl

sim_ensemble:
	vivado -mode batch -source sim/sim_ensembles.tcl
