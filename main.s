main:
  jmp main

  ; Make start accessible from the linker
  global _start
_start:
  nop
  nop
  nop
  jmp main
