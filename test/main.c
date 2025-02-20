#include <stdio.h>
#include <stdlib.h>

#include "tensor.h"
// #include "softmax.h"
#include "params.h"
#include <riscv_vector.h>
#include "exp.h"
vfloat16m1_t vfexp_f16m1(vfloat16m1_t vs1, int vl);

// void generate_test_input(float32_t *data, int size) {
//     for (int i = 0; i < size; i++) {
//         data[i] = (float32_t)i / size;
//     }
// }

// int main(int argc, char **argv)
// {
//     // printf("Begin\n");

//     int h = H;
//     int w = W;
//     int size = h * w;

//     // if (DEBUG_PRINT) {
//     //     printf("In Shape:\n\t(h, w) = (%d, %d)\n",
//     //                 h, w);
//     // }

//     float32_t *srcData = (float32_t *)malloc(size * sizeof(float32_t));
//     float32_t *dstData = (float32_t *)malloc(size * sizeof(float32_t));
//     generate_test_input(srcData, size);
    
//     Tensor srcMat, dstMat;
//     tensor_new_2d(srcMat, H, W, sizeof(float32_t), srcData);
//     tensor_new_2d(dstMat, H, W, sizeof(float32_t), &dstData);

//     // PERF_BEGIN();

//     for (int i = 0; i < NLOOPS; i++) {
//         softmax(&dstMat, &srcMat);
//     }

//     free(srcData);
//     free(dstData);


//     // PERF_END();        
//     // printf("End\n");

//     return 0;
// }


int main()
{

    float32_t input_data[VLEN/32];
    float32_t output_data[VLEN/32];

    // 初始化输入数据
    for (int i = 0; i < VLEN/32; i++) {
        input_data[i] = (float32_t)(i - 4); // 输入范围 [-4, 3]
    }

    // 加载输入数据到向量寄存器
    vfloat32m1_t vs1 = __riscv_vle32_v_f32m1(input_data, VLEN/32);

    // 调用 vfexp_f16m1 函数
    vfloat32m1_t result = vfexp_f32m1(vs1, VLEN/32);

    // 存储结果到输出数组
    __riscv_vse32_v_f32m1(output_data, result, VLEN/32);

    return 0;

}