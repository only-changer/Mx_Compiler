global    main
section   .text
main:
      mov	dword[str+0],10
      mov	dword[str+4],0
_0for:
      mov	rbx,[str+8]
      mov	dword[str+8],1
      mov	rsi,[str+8]
      add	rsi,1
      mov	[str+8],rsi
      mov	rax,[str+4]
      mov	rcx,[str+4]
      mov	rdx,[str+8]
      add	rcx,rdx
      mov	[str+4],rcx
      mov	rsp,[str+8]
      mov	rbp,[str+0]
      cmp	rsp,rbp
      jle	_0cmp
      mov	rsp,0
      jmp	_0cmpback
_0cmp:
      mov	rsp,1
_0cmpback:
      cmp	rsp,1
      je	_0for
_0forback:
_1for:
      mov	rbx,[str+12]
      mov	dword[str+12],1
      mov	rsi,[str+12]
      add	rsi,1
      mov	[str+12],rsi
      mov	rax,[str+4]
      mov	rcx,[str+4]
      add	rcx,10
      mov	rdx,[str+12]
      add	rcx,rdx
      mov	[str+4],rcx
      mov	rsp,[str+12]
      mov	rbp,[str+0]
      cmp	rsp,rbp
      jle	_1cmp
      mov	rsp,0
      jmp	_1cmpback
_1cmp:
      mov	rsp,1
_1cmpback:
      cmp	rsp,1
      je	_1for
_1forback:
      mov	rax,[str+4]
      mov	rdi,rax
      mov	rax,60
      syscall
section   .bss
str:      resb      64  