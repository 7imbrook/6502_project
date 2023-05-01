MEMORY
{
  ram      (rx)  : ORIGIN = 0x0000, LENGTH = 0x6000
  via      (rw)  : ORIGIN = 0x6000, LENGTH = 4
  rom      (rwx) : ORIGIN = 0x8000, LENGTH = 0xFFFF
}

SECTIONS
{
  /* Text aka the code lives in rom */
  .text ORIGIN(rom): { *(.text) } 
  .data : { *(.data) } 
  .bss :  { *(.bss)  *(COMMON) }
  /* TODO put address of _start symbol at 0xFFFC */
  .fill : {
    /* Pad with nop instructions */
    FILL8(0xEA);
    /* Move up to end of rom where reset looks for program start */
    . = ORIGIN(rom) + 0xFFFd;
    BYTE(0xFF);
    BYTE(0x00);
    BYTE(0x00);
  }
}