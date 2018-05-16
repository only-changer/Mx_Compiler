global    main
section   .text
main:
      mov	rax,5
      mov	rcx,0
      mov	rdx,0
_0for:
      imul	rdx,4
      add	rdx,4
      mov	rbx,rdx
      add	rcx,1
      mov	[str+rbx],rcx
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
      mov	rbx,0
      mov	rdx,0
_1for:
      imul	rdx,4
      add	rdx,4
      mov	rsp,rdx
      add	rbx,[str+rsp]
      add	rdx,1
      cmp	rdx,rax
      jl	_1cmp
      mov	rsp,0
      jmp	_1cmpback
_1cmp:
      mov	rsp,1
_1cmpback:
      cmp	rsp,1
      je	_1for
_1forback:
      mov	rdi,rbx
      mov	rax,60
      syscall
section   .bss
str:      resb      64  
