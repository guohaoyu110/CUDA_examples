#include <stdio.h>

// 执行的指令
// nvcc -arch=sm_70 -o first-parallel 01-first-parallel.cu -run

/*
 * Refactor firstParallel so that it can run on the GPU.
 */

//  void firstParallel(){
//     printf("This should be running in parallel. \n");
//  }
__global__ void firstParallel(){
    printf("This should be running in parallel. \n");
}

 int main(){
   /*
   * Refactor this call to firstParallel to execute in parallel
   * on the GPU.
   */
    firstParallel<<<5, 5>>>();
    // <<< NUMBER_OF_BLOCKS, NUMBER_OF_THREADS_PER_BLOCK>>>
    cudaDeviceSynchronize();
    /*
   * Refactor this call to firstParallel to execute in parallel
   * on the GPU.
   */
 }

 // 这样就可以执行25次一共。