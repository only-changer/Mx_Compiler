global    main
section   .text
main:
      mov	rax,10
      mov	rcx,0
      mov	rdx,1
_0for:
      add	rcx,rdx
      add	rdx,1
      cmp	rdx,rax
      jle	_0cmp
      mov	rbx,0
      jmp	_0cmpback
_0cmp:
      mov	rbx,1
_0cmpback:
      cmp	rbx,1
      je	_0for
_0forback:
      mov	rsp,1
_1for:
      add	rcx,10
      add	rcx,rsp
      add	rsp,1
      cmp	rsp,rax
      jle	_1cmp
      mov	rbp,0
      jmp	_1cmpback
_1cmp:
      mov	rbp,1
_1cmpback:
      cmp	rbp,1
      je	_1for
_1forback:
      mov	rdi,rcx
      mov	rax,60
      syscall
section   .bss
str:      resb      64  