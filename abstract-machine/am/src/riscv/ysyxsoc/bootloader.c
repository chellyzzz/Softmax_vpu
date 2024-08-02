void fsbl() __attribute__((section(".text.fsbl")));
void ssbl() __attribute__((section(".text.ssbl"), noinline));

void fsbl(){
    extern char _ssbl, ssbl_flash_start, _essbl;
    volatile char *src = &ssbl_flash_start;
    volatile char *dst = &_ssbl;
    volatile char *end = &_essbl;
    /* ROM has data at end of text; copy it.  */
    while (dst < end)
      *dst++ = *src++;
    ssbl();
}

void ssbl(){
    extern char _text, text_flash_start, _edata;
    volatile char *src = &text_flash_start;
    volatile char *dst = &_text;
    volatile char *end = &_edata;
    /* ROM has data at end of text; copy it.  */
    while (dst < end)
      *dst++ = *src++;

    // extern char _rodata, rodata_flash_start, _erodata;
    // src = &rodata_flash_start;
    // dst = &_rodata;
    // end = &_erodata;    
    // while (dst < end)
    //   *dst++ = *src++;

    // extern char _data, data_flash_start, _edata;
    // src = &data_flash_start;
    // dst = &_data;
    // end = &_edata;
    // while (dst < end)
    //   *dst++ = *src++;

    // /* Zero bss.  */
    // //TODO: zero bss
    // extern char _bstart, _bend;
    // dst = &_bstart;
    // end = &_bend;
    // /* ROM has data at end of text; copy it.  */
    // while (dst < end)
    //   *dst++ = 0;
}