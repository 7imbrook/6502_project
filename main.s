main:
  jmp main

_start:
; Setup the stack
  ldx #$ff
  tsx
  ; jsr configure_lcd
  jmp main
