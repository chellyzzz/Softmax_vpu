#include <riscv_vector.h>
#include <stdio.h>
 
int main() {
    size_t n = 10;
    float input[n];
    float output[n];
 
    // 初始化输入数据
    for (size_t i = 0; i < n; i++) {
        input[i] = (float)i;
    }
 
    // 使用矢量内在函数进行计算
    vfloat32m1_t v = vle32_v_f32m1(input, n);
    vfloat32m1_t v_out = vfmul_vf_f32m1(v, 2.0, n);
    vse32_v_f32m1(output, v_out, n);
 
    // 打印输出结果
    for (size_t i = 0; i < n; i++) {
        printf("%f\n", output[i]);
    }
 
    return 0;
}
