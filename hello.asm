global    main
section   .text
main:
      mov	rax,5
      mov	rcx,0
      cmp	rcx,0
      je	_0else
_0if:
      mov	rdx,10
      jmp	_0ifback
_0else:
      mov	rdx,20
_0ifback:
      xor	rdx,10
      not	rdx
      xor	rax,0
      not	rax
      xor	rax,5
      not	rax
      mov	rsp,rbp
      cmp	rsp,0
      je	_1else
_1if:
      mov	rdx,30
      jmp	_1ifback
_1else:
_1ifback:
      mov	rdi,rdx
      mov	rax,60
      syscall
section   .bss
str:      resb      64  
