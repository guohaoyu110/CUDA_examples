'''
@File    :   01-thread-and-block-idx.cu
@Time    :   2021/04/22 18:04:40
@Author  :   Haoyu Guo 
@Version :   1.1
@Contact :   haoyuguo@usc.edu
'''
#include<stdio.h>

// Currently the 01-thread-and-block-idx.cu file contains a working kernel 
// that is printing a failure message. Open the file to learn how to update 
// the execution configuration so that the success message will print. After refactoring, 
// compile and run the code with the code execution cell below to confirm your work. 
// Refer to the solution if you get stuck.

__global__ void printSuccessForCorrectExecutionConfiguration(){
    if(threadIdx.x == 9 && blockIdx.x == 9){
        printf("Success!\n");
    } 
    else {
        printf("Failure. Update the execution configuration as necessary.\n");
  }
}


int main()
{
  /*
   * Update the execution configuration so that the kernel
   * will print `"Success!"`.
   */

  printSuccessForCorrectExecutionConfiguration<<<10,10>>>();
  cudaDeviceSynchronize();
  // printSuccessForCorrectExecutionConfiguration<<<1, 1>>>();
}


