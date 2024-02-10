.global _start
.section .text
_start:
   LDR X0, =_stack_top
   MOV SP, X0
   B main

.section .bss
_stack:
   .space 4096
_stack_top:
