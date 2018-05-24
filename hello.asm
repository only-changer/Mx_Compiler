global    main
section   .text
main:
      mov	qword[str+0],3
      mov	byte[str+8],'a'
      mov	byte[str+9],'a'
      mov	byte[str+10],'a'
      mov	qword[str+800],5
      mov	byte[str+808],'b'
      mov	byte[str+809],'b'
      mov	byte[str+810],'b'
      mov	byte[str+811],'b'
      mov	byte[str+812],'b'
      mov	r13,[str+0]
      mov	r15,0
_0str:
      mov	r14b,[str+8+0+r15]
      mov	[str+2408+r15],r14b
      add	r15,1
      cmp	r15,qword[str+0]
      jl	_0str
      mov	r15,0
_1str:
      mov	r14b,[str+8+800+r15]
      mov	[str+r13+2408+r15],r14b
      add	r15,1
      cmp	r15,qword[str+800]
      jl	_1str
      add	r13,[str+800]
      mov	[str+2400],r13
      mov	rbp,[str+2400]
      mov	rsi,5
      mov	dil,[str+2400+rsi]
      movzx	rdi,dil
      mov	r8,rbp
      add	r8,rdi
      mov	rdi,r8
      mov	rax,60
      syscall
section   .bss
str:      resb      64  