# eee-598-project

## Initial Setup
To begin working on the project first you need to source the binaries in the Sol server for vivado and Vitis HLS. You can do this by opening the bashrc file  as follows 
`vim ~/.bashrc` then add the following to the end of the file 

```
   export PATH=$PATH:/packages/apps/fpga/Vivado/2022.1/bin/
   export PATH=$PATH:/packages/apps/fpga/Vitis_HLS/2022.1/bin/
```

## Makefile Commands

Once the paths have been set up you can use the following commands from the root directory to setup the project. 

`make build_gui` - this will build the project and open up a GUI environment. 

`make clean` - this will clean up all uneccesarry files 

>> Note: It is not recommended to make changes in the build GUI, we should use this only to verify that our design pases synthesis, implementation etc. There will also be a SIM command later where we can test our design before building it to ensure the fucntionality of our design. 
