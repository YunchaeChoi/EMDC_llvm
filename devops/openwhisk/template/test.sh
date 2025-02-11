DOCKER_IMAGE=sunginh/emdc-oneapi-base-cuda:v1.0
#enter action name here
ACTION_NAME=		
ACTION=Action.zip

# compile using clang++ compiler if need

#SRC=main.cpp
#clang++ -fsycl -fsycl-targets=spir64_x86_64,spir64_fpga,nvptx64-nvidia-cuda $SRC -o exec.exe

# zip a new action files
zip $ACTION exec exec.exe

# delete the action
wsk action delete $ACTION_NAME

# create a new action using custom docker image
wsk action create -i $ACTION_NAME --docker $DOCKER_IMAGE $ACTION

# invoke the action with SYCL device select parameters. for listing available devices, use sycl-ls.
wsk action invoke -i $ACTION_NAME --result --param SYCL_DEVICE_FILTER cuda
