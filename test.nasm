global    _start
section   .text
_origin:
      mov	rax,[str+44]
      mov	dword [str+44],0
      mov	rcx,[str+44]
      mov	rdx,[str+0]
_check:
      mov	rax,[str+0]
      mov	rcx,[str+0]
      mov	rdx,[str+0]
      mov	rdi,rax
      mov	rax,60
      syscall
_addList:
_start:
      mov	rax,[str+16]
      mov	rcx,[str+0]
      mov	dword [str+16],1temp
      mov	rax,[str+20]
      mov	rcx,[str+0]
      mov	dword [str+20],1temp
