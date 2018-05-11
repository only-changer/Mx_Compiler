global    main
section   .text
main:
      mov	rax,[str+0]
      mov	dword [str+0],10
      mov	rax,[str+4]
      mov	dword [str+4],20
      mov	rax,[str+0]
      mov	rcx,[str+4]
      add	rax,rcx
      mov	[str+8],rax
      mov	rax,[str+8]
      mov	rdi,rax
      mov	rax,60
      syscall
section   .bss
str:      resb      64  