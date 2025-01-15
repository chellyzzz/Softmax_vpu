#include <stdio.h>
#include <stdlib.h>

#include "tensor.h"
#include "softmax.h"
#include "params.h"
#include <riscv_vector.h>


void generate_test_input(float32_t *data, int size) {
    for (int i = 0; i < size; i++) {
        data[i] = (float32_t)i / size;
    }
}

int main(int argc, char **argv)
{
    // printf("Begin\n");

    int h = H;
    int w = W;
    int size = h * w;

    // if (DEBUG_PRINT) {
    //     printf("In Shape:\n\t(h, w) = (%d, %d)\n",
    //                 h, w);
    // }

    float32_t *srcData = (float32_t *)malloc(size * sizeof(float32_t));
    float32_t *dstData = (float32_t *)malloc(size * sizeof(float32_t));
    generate_test_input(srcData, size);
    
    Tensor srcMat, dstMat;
    tensor_new_2d(srcMat, H, W, sizeof(float32_t), srcData);
    tensor_new_2d(dstMat, H, W, sizeof(float32_t), &dstData);

    // PERF_BEGIN();

    for (int i = 0; i < NLOOPS; i++) {
        softmax(&dstMat, &srcMat);
    }

    free(srcData);
    free(dstData);


    // PERF_END();        
    // printf("End\n");

    return 0;
}