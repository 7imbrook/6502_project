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
  .entry 0xFFFC: {
    SHORT(_start);
    SHORT(0x0000);
  }
}