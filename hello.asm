global    main
section   .text
main:
      mov	dword[str+0],10
      mov	dword[str+4],0
_0for:
      mov	rdx,[str+8]
      mov	rdx,1
      mov	rdx,[str+8]
      add	rdx,1
      mov	[str+8],rdx
      mov	rax,[str+4]
      mov	rcx,[str+4]
      mov	rcx,[str+8]
      add	rcx,rcx
      mov	rax,rcx
      mov	rdx,[str+8]
      mov	rdx,[str+0]
      cmp	rdx,rdx
      jle	_0cmp
      mov	rdx,0
      jmp	_0cmpback
_0cmp:
      mov	rdx,1
_0cmpback:
      cmp	rdx,1
      je	_0for
_0forback:
_1for:
      mov	rsp,[str+12]
      mov	rsp,1
      mov	rsp,[str+12]
      add	rsp,1
      mov	[str+12],rsp
      mov	rcx,[str+4]
      mov	rcx,[str+4]
      add	rcx,10
      mov	rbx,[str+12]
      add	rcx,rbx
      mov	rcx,rcx
      mov	rsp,[str+12]
      mov	rbx,[str+0]
      cmp	rsp,rbx
      jle	_1cmp
      mov	rsp,0
      jmp	_1cmpback
_1cmp:
      mov	rsp,1
_1cmpback:
      cmp	rsp,1
      je	_1for
_1forback:
      mov	rcx,[str+4]
      mov	rdi,rcx
      mov	rax,60
      syscall
section   .bss
str:      resb      64  