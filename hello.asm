global    main
section   .text
main:
      mov	rax,10
      mov	rcx,0
      mov	rdx,1
      mov	rsp,1
_0for:
      add	rcx,rdx
      mov	rbx,rcx
      mov	rcx,rdx
      mov	rdx,rbx
      add	rsp,1
      cmp	rsp,rax
      jl	_0cmp
      mov	rbp,0
      jmp	_0cmpback
_0cmp:
      mov	rbp,1
_0cmpback:
      cmp	rbp,1
      je	_0for
_0forback:
      mov	rdi,rbx
      mov	rax,60
      syscall
section   .bss
str:      resb      64  