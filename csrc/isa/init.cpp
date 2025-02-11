#include <isa.h>
#include <mem.h>

static const char *img_file = "../test/build/main.bin";

static const uint32_t img [] = {
  0xfff78793,  // addi a5, a5, 0xfff
  0x02000713,  // addi a4, zero, 32
  0x00e7d7b3,  // srl	a5,a5,a4
  0x00100073,  // ebreak (used as nemu_trap)
  0xdeadbeef,  // some data
};


void init_isa() {
  /* Load built-in image. */
  memcpy(guest_to_host(RESET_VECTOR), img, sizeof(img));

}


static void load_img() {

  FILE *fp = fopen(img_file, "rb");
  assert(fp != NULL);

  fseek(fp, 0, SEEK_END);
  long size = ftell(fp);

  printf("The image is %s, size = %ld", img_file, size);

  fseek(fp, 0, SEEK_SET);
  int ret = fread(guest_to_host(RESET_VECTOR), size, 1, fp);
  assert(ret == 1);
  fclose(fp);
  
}

void init_sys(){
  init_mem(CONFIG_MSIZE);
  init_isa();
  load_img();
}