global    main
section   .text
main:
      mov	rax,10
      mov	rcx,20
      add	rax,rcx
      mov	rdx,rax
      mov	rdi,rdx
      mov	rax,60
      syscall
section   .bss
str:      resb      64  