global    main
section   .text
main:
      mov	rax,10
      xor	rax,10
      not	rax
      cmp	rax,0
      je	_0else
_0if:
      mov	rax,20
      jmp	_0ifback
_0else:
      mov	rax,30
_0ifback:
      mov	rdi,rax
      mov	rax,60
      syscall
section   .bss
str:      resb      64  