global    _start
section   .text
      mov	rax,[str+12]
      mov	dword [str+12],1000000
_travel:
      mov	rcx,[str+16]
      mov	dword [str+16],10000000
      mov	rcx,[str+16]
      mov	rdi,rax
      mov	rax,60
      syscall
_journalists:
_xu:
      mov	rcx,[str+20]
      mov	dword [str+20],0
      mov	rdi,rax
      mov	rax,60
      syscall
_start:
      mov	rcx,[str+36]
      mov	dword [str+36],2016
      mov	rcx,[str+24]
      mov	dword [str+24],1
      mov	rcx,[str+28]
      mov	dword [str+28],2
      mov	rcx,[str+24]
      mov	rdx,[str+28]
      mov	rcx,[str+24]
      mov	rdx,[str+28]
      mov	rcx,[str+24]
      mov	rdx,[str+28]
      mov	rcx,[str+24]
      mov	rdx,[str+28]
      mov	rcx,[str+24]
      mov	rdx,[str+28]
      mov	rcx,[str+24]
      mov	rcx,[str+24]
      mov	rcx,[str+24]
      mov	rdx,[str+28]
      xor	rcx,2temp
      not	rcx
      mov	rcx,[str+24]
      mov	rdx,[str+28]
      mov	rcx,[str+24]
      mov	rdx,[str+28]
      mov	rcx,[str+24]
      mov	rdx,[str+28]
      mov	rcx,[str+24]
      mov	rcx,[str+40]
      mov	dword [str+40],0
      mov	rcx,[str+40]
      mov	dword [str+40],0
      mov	rdx,[str+40]
      mov	rsp,[str+40]
      mov	dword [str+40],0
      mov	rbp,[str+40]
      mov	rcx,[str+40]
      mov	dword [str+40],0
      mov	rdx,[str+40]
      mov	rbx,[str+36]
      mov	rcx,[str+40]
      mov	rdx,[str+36]
      cmp	rbx,0
      je	_3else
_2if:
_3else:
_3ifback:
      mov	rbx,[str+40]
      mov	rsp,[str+36]
      cmp	rdi,0
      je	_7else
_4if:
_5else:
      mov	rcx,[str+40]
      mov	rdx,[str+36]
      xor	rcx,2temp
      not	rcx
      cmp	rsi,0
      je	_6else
_5if:
_6else:
_6ifback:
_7ifback:
      mov	rcx,[str+40]
      mov	dword [str+40],0
      mov	rcx,[str+40]
      mov	dword [str+40],0
      mov	rdi,rax
      mov	rax,60
      syscall
section   .bss
str:      resb      64  
