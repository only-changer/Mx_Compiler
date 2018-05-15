global    main
section   .text
main:
      mov	rax,5
      mov	rcx,0
      mov	rdx,0
_0for:
      add	rcx,1
      mov	[str+4+4*rdx],rcx
      add	rdx,1
      cmp	rdx,rax
      jl	_0cmp
      mov	rbx,0
      jmp	_0cmpback
_0cmp:
      mov	rbx,1
_0cmpback:
      cmp	rbx,1
      je	_0for
_0forback:
      mov	rsp,0
      mov	rdx,0
_1for:
      add	rsp,[str+4+4*rdx]
      add	rdx,1
      cmp	rdx,rax
      jl	_1cmp
      mov	rbp,0
      jmp	_1cmpback
_1cmp:
      mov	rbp,1
_1cmpback:
      cmp	rbp,1
      je	_1for
_1forback:
      mov	rdi,rsp
      mov	rax,60
      syscall
section   .bss
str:      resb      64  
