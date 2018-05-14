global    main
section   .text
main:
      mov	rax,10
      mov	rcx,rax
      xor	rax,10
      not	rax
      cmp	rax,0
      je	_0else
_0if:
      mov	rax,20
      mov	rcx,rax
      jmp	_0ifback
_0else:
_0ifback:
      mov	rdi,rcx
      mov	rax,60
      syscall
section   .bss
str:      resb      64  