  .org $8000
main:
  jmp main

_start:
  jmp main

  .org $fffc
  .word _start
  .word $0000