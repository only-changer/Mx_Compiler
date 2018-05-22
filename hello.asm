global    main
section   .text
min:
      mov	rax,rdi
      mov	rcx,rsi
      cmp	rax,rcx
      jle	_0cmp
      mov	rdx,0
      jmp	_0cmpback
_0cmp:
      mov	rdx,1
_0cmpback:
      cmp	rdx,0
      je	_0else
_0if:
      mov	rax,rax
      ret
      jmp	_0ifback
_0else:
_0ifback:
      mov	rax,rcx
      ret
main:
      mov	rax,10
      mov	rcx,20
      push	rax
      mov	[str+32],rax
      push	rcx
      mov	[str+40],rcx
      mov	rdi,[str+32]
      mov	rsi,[str+40]
      call	min
      mov	rdx,rax
      pop	rcx
      pop	rax
      mov	rdi,rdx
      mov	rax,60
      syscall
section   .bss
str:      resb      64  
