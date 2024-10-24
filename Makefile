

build_gui:
	vivado -mode batch -source build/build.tcl

clean:
	rm -rf *.jou
	rm -rf *.log
	rm -rf ./build/project_1

