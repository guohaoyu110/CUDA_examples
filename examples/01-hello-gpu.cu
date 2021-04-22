'''
@File    :   01-hello-gpu.cu
@Time    :   2021/04/22 18:05:30
@Author  :   Haoyu Guo 
@Version :   1.0
@Contact :   haoyuguo@usc.edu
'''
#include<stidio.h>
// 执行下面的指令
// nvcc -arch=sm_70 -o hello-gpu 01-hello-gpu.cu -run
void helloCPU()
{
  printf("Hello from the CPU.\n");
}

/*
 * Refactor the `helloGPU` definition to be a kernel
 * that can be launched on the GPU. Update its message
 * to read "Hello from the GPU!"
 */

 __global__ void helloGPU() 
{
  printf("Hello also from the GPU.\n");
}

int main()
{

  helloCPU();

  /*
   * Refactor this call to `helloGPU` so that it launches
   * as a kernel on the GPU.
   */

  //helloGPU();
  helloGPU<<<1, 1>>>();

  /*
   * Add code below to synchronize on the completion of the
   * `helloGPU` kernel completion before continuing the CPU
   * thread.
   */
   cudaDeviceSynchronize();
}
