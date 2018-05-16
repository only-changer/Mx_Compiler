global    main
section   .text
main:
      mov	rax,5
      mov	rcx,10
      mov	rdx,2416+ 8 * 0
      mov	qword[str+rdx],16
      mov	rdx,2416+ 8 * 1
      mov	qword[str+rdx],816
      mov	rdx,0
      mov	rbx,0
_1for:
      mov	rsp,0
_0for:
      mov	rbp,[str+2416+ 8 * rbx]
      mov	rsi,rsp
      imul	rsi,8
      add	rbp,rsi
      add	rdx,1
      mov	[str+rbp],rdx
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
      add	rbx,1
      cmp	rbx,2
      jl	_1cmp
      mov	rbp,0
      jmp	_1cmpback
_1cmp:
      mov	rbp,1
_1cmpback:
      cmp	rbp,1
      je	_1for
_1forback:
      mov	rsp,rax
_2for:
      mov	rbp,[str+2416+ 8 * 1]
      mov	rsi,rsp
      imul	rsi,8
      add	rbp,rsi
      add	rdx,1
      mov	[str+rbp],rdx
      add	rsp,1
      cmp	rsp,rcx
      jl	_2cmp
      mov	rbp,0
      jmp	_2cmpback
_2cmp:
      mov	rbp,1
_2cmpback:
      cmp	rbp,1
      je	_2for
_2forback:
      mov	rbp,0
      mov	rbx,0
_3for:
      mov	rdi,rbx
      imul	rdi,8
      add	rdi,16
      mov	rsi,rdi
      add	rbp,[str+rsi]
      add	rbx,1
      cmp	rbx,rax
      jl	_3cmp
      mov	rsi,0
      jmp	_3cmpback
_3cmp:
      mov	rsi,1
_3cmpback:
      cmp	rsi,1
      je	_3for
_3forback:
      mov	rbx,0
_4for:
      mov	rdi,rbx
      imul	rdi,8
      add	rdi,816
      mov	rsi,rdi
      add	rbp,[str+rsi]
      add	rbx,1
      cmp	rbx,rcx
      jl	_4cmp
      mov	rsi,0
      jmp	_4cmpback
_4cmp:
      mov	rsi,1
_4cmpback:
      cmp	rsi,1
      je	_4for
_4forback:   
	  mov	rdi,rbp
      mov	rax,60
      syscall
section   .bss
str:      resb      64  
