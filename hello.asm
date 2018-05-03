global    _start
section   .text
_start:
      mov	rax,[str+0]
      mov	dword [str+0],10
      mov	rdx,[str+0]
      xor	rdx,10
      not	rdx
      cmp	rcx,0
      je	_1else
_0if:
      mov	rax,[str+0]
      mov	dword [str+0],20
_1else:
      mov	rcx,[str+0]
      mov	dword [str+0],30
_1ifback:
      mov	rax,[str+0]
      mov	rdi,rax
      mov	rax,60
      syscall
section   .bss
str:      resb      64  
