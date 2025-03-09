#include <isa.h>
#include <mem.h>

static const char *img_file = "/home/chelly/grad/test/build/main.bin";

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
  PRINTF("ISA INITIALIZED\n");
}

static void load_img() {
  if(img_file == NULL) {
    PRINTF("No image is given. Use built-in image.\n");
    assert(0);
  }
  FILE *fp = fopen(img_file, "rb");
  assert(fp != NULL);
  fseek(fp, 0, SEEK_END);
  long size = ftell(fp);

  printf("The image is %s, size = %ld\n", img_file, size);

  fseek(fp, 0, SEEK_SET);

  int ret = fread(guest_to_host(RESET_VECTOR), size, 1, fp);
  assert(ret == 1);
  fclose(fp); 

  return ;
}

void init_sys(int argc,char *argv[]){
  init_mem(CONFIG_MSIZE);
  init_isa();
  load_img();
}