global    _start
section   .text
_get:
      mov	rax,[str+0]
      xor	rax,0
      not	rax
      cmp	rcx,0
      je	_1else
_0if:
      mov	rdi,rax
      mov	rax,60
      syscall
_1else:
_1ifback:
_start:
      mov	rdi,rax
      mov	rax,60
      syscall
section   .bss
str:      resb      64  
