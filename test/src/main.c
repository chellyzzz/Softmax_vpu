// #include "tensor.h"
// #include <stddef.h>
// #include <riscv_vector.h>
// #include "common.h"

// #define H 64
// #define W 64
// #define NLOOPS 10

// int main(int argc, char **argv)
// {
//     // float src[] = {1.0f, 2.0f, 3.0f, 4.0f, 5.0f};
//     // size_t n = sizeof(src) / sizeof(src[0]);
//     // float dst[n];

//     // softmax_stable_rvv_fp32(dst, src, n);
    
//     int avl = 10;
//     volatile size_t vl = __riscv_vsetvl_e32m2(avl);
//     return 0;
// }

#include <riscv_vector.h>
#include <stdint.h>
#include <stddef.h>

int32_t x[10] = {1,2,3,4,5,6,7,8,9,0};
int32_t y[10] = {0,9,8,7,6,5,4,3,2,1};
int32_t z[10];

void vec_add_rvv(int32_t* dst, const int32_t* lhs, const int32_t* rhs, size_t avl) {
    vint32m2_t vlhs, vrhs, vres;
    for (size_t vl; (vl = __riscv_vsetvl_e32m2(avl));
         avl -= vl, lhs += vl, rhs += vl, dst += vl) {
        vlhs = __riscv_vle32_v_i32m2(lhs, vl);
        vrhs = __riscv_vle32_v_i32m2(rhs, vl);
        vres = __riscv_vadd_vv_i32m2(vlhs, vrhs, vl);
        __riscv_vse32_v_i32m2(dst, vres, vl);
    }
}


int main(int argc, char const* argv[]) {

    vec_add_rvv(z, x, y, 10);
    return 0;
    
}

