MEMORY
{
  ram      (rx)  : ORIGIN = 0x0000, LENGTH = 0x8000
  rom      (rwx) : ORIGIN = 0x8000, LENGTH = 0xFFFF
}

SECTIONS
{
    .text ORIGIN(rom): {}
}