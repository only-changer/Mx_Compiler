global    main
section   .text
main:
      mov	rax,10
      imul	rdx,rax
      mov	rdi,2
      mov	rax,60
      syscall
section   .bss
str:      resb      64  