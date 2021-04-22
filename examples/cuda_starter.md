# cuda_starter
- Declare variables, write loops, and use if / else statements in C.
- Define and invoke functions in C.
- Allocate arrays in C.

## *Compiling and Running Accelerated CUDA Code*

The CUDA platform ships with the NVIDIA CUDA Compiler nvcc, which can compile CUDA accelerated applications, both the host, and the device code they contain. For the purposes of this lab, nvcc discussion will be pragmatically scoped to suit our immediate needs. After completing the lab, For anyone interested in a deeper dive into nvcc, start with the documentation.

nvcc will be very familiar to experienced gcc users. Compiling, for example, a some-CUDA.cu file, is simply:
*nvcc -arch=sm_70 -o out some-CUDA.cu -run*


- nvcc is the command line command for using the nvcc compiler.
- some-CUDA.cu is passed as the file to compile.
- The o flag is used to specify the output file for the compiled program.
- The arch flag indicates for which architecture the files must be compiled. For the present case sm_70 will serve to compile specifically for the GPU this lab is running on, but for those interested in a deeper dive, please refer to the docs about the arch flag, virtual architecture features and GPU features.
- As a matter of convenience, providing the run flag will execute the successfully compiled binary.


Thus, under the assumption that a kernel called someKernel has been defined, the following are true:
- someKernel<<<1, 1>>() is configured to run in a single thread block which has a single thread and will therefore run only once.
- someKernel<<<1, 10>>() is configured to run in a single thread block which has 10 threads and will therefore run 10 times.
- someKernel<<<10, 1>>() is configured to run in 10 thread blocks which each have a single thread and will therefore run 10 times.
- someKernel<<<10, 10>>() is configured to run in 10 thread blocks which each have 10 threads and will therefore run 100 times.


There is a limit to the number of threads that can exist in a thread block: 1024 to be precise. In order to increase the amount of parallelism in accelerated applications, we must be able to coordinate among multiple thread blocks.

- threadIdx.x + blockIdx.x * blockDim.x




