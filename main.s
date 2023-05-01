message: .asciiz "Now with linking!"

main:
  ldx #0
print:
  lda message,x
  beq loop
  jsr print_char
  inx
  jmp print

loop:
  jmp loop

  ; Make start accessible from the linker
  global _start
_start:
  ; Probably need to reset the stack pointers
  ldx #$ff
  txs
  ; Configure output
  jsr configure_lcd
  jmp main
