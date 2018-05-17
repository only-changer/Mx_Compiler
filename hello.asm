global    main
section   .text
main:
      mov	rax,10
      mov	rcx,20
      mov	rdx,rax
      cmp	rdx,0
      je	_0else
_0if:
      mov	rbx,40
      jmp	_0ifback
_0else:
      mov	rbx,80
_0ifback:
      add	rax,rcx
      add	rax,rbx
      mov	rdi,rax
      mov	rax,60
      syscall
section   .bss
str:      resb      64  