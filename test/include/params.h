#ifndef __PARAMS_H__
#define __PARAMS_H__

#ifndef H
#define H 1
#endif

#ifndef W
#define W 1001
#endif

#define SIZE  (H * W)

#ifndef NLOOPS
#define NLOOPS 1
#endif


#define INCBIN(var, binfile, section) \
    extern uint8_t var[]; \
    __asm__(".section " section ", \"a\", @progbits\n\t" \
            ".global " #var "\n\t" \
            ".type " #var ", @object \n\t" \
            ".align 20 \n" \
            #var ":\n\t" \
            ".incbin  \"" binfile "\"\n\t")
            
#endif
