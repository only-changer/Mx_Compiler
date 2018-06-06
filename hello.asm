global main

extern puts
extern getchar
extern putchar
extern __stack_chk_fail
extern malloc
extern printf
extern sprintf
extern strlen
extern memcpy
extern scanf
toString:
	push rbp
	mov rbp,rsp
	mov rdx,rdi
	mov rax,0
	mov rdi,stringbuffer
	mov rsi,format1
	call sprintf
	mov rdi,stringbuffer
	call transtring
	mov rsp,rbp
	pop rbp
	ret
println:
	call puts
	ret

array.size:
	mov	rax, qword [rdi - 8]
	ret

string.add:
push rbp
mov rbp,rsp
push rsi
 mov rsi,rdi
mov rdi,stringbuffer
mov rdx,[rsi-8]
 push rdx
call memcpy
pop rdi
pop rsi
add rdi,stringbuffer
 mov rdx,[rsi-8]
add rdx,1
 call memcpy
mov rdi,stringbuffer
call transtring
mov rsp,rbp
pop rbp
ret
getInt:
	push rbp
	mov rbp,rsp
	mov rax,0
	mov rdi,format1
	mov rsi,intbuffer
	call scanf
	mov rax,[intbuffer]
	mov rsp,rbp
	pop rbp
	ret
string.length:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     dword [rbp-4H], 0
	jmp     Llen_002
Llen_001:  add     dword [rbp-4H], 1
Llen_002:  mov     eax, dword [rbp-4H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jnz     Llen_001
	mov     eax, dword [rbp-4H]
	pop     rbp
	ret
string.ord:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     dword [rbp-1CH], esi
	mov     eax, dword [rbp-1CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	movsx   eax, al
	mov     dword [rbp-4H], eax
	mov     eax, dword [rbp-4H]
	pop     rbp
	ret
print:
	push rbp
	mov rbp,rsp
	mov rax,0
	mov rsi,rdi
	mov rdi,format2
	call printf
	mov rsp,rbp
	pop rbp
	ret
transtring:

	push rbp
	mov rbp,rsp
	call strlen
	push rdi
	mov rdi,rax
	push rdi
	add rdi,9
	call malloc
	pop rdi
	mov [rax],rdi
	add rax,8
	mov rdx,rdi
	add rdx,1
	mov rdi,rax
	pop rsi
	sub rsp,8
	push rax
	call memcpy
	pop rax
	mov rsp,rbp
	pop rbp
	ret

getString:

	push rbp
	mov rbp,rsp
	mov rax,0
	mov rdi,format2
	mov rsi,stringbuffer
	call scanf
	mov rdi,stringbuffer
	call transtring
	mov rsp,rbp
	pop rbp
	ret

string.substring:
	push rbp
	mov rbp,rsp
	push rdi
	push rsi
	mov rdi,rdx
	sub rdi,rsi
	add rdi,1
	push rdi
	add rdi,9
	call malloc
	pop rdx
	mov [rax],rdx
	add rax,8
	pop rsi
	pop rdi
	add rsi,rdi
	mov rdi,rax
	push rdx
	push rax
	call memcpy
	pop rax
	pop rdx
	mov qword[rax+rdx],0
	mov rsp,rbp
	pop rbp
	ret

string.parseInt:
	push    rbp
	mov     rbp, rsp
	sub     rsp, 32
	mov     qword [rbp-18H], rdi
	mov     edi, 256
	call    malloc
	mov     qword [rbp-8H], rax
	mov     dword [rbp-10H], 0
	mov     dword [rbp-0CH], 0
	jmp     Lpar_002
Lpar_001:  add     dword [rbp-10H], 1
Lpar_002:  mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Lpar_004
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Lpar_001
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Lpar_001
	jmp     Lpar_004
Lpar_003:  mov     edx, dword [rbp-0CH]
	mov     eax, edx
	shl     eax, 2
	add     eax, edx
	add     eax, eax
	mov     ecx, eax
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	movsx   eax, al
	add     eax, ecx
	sub     eax, 48
	mov     dword [rbp-0CH], eax
	add     dword [rbp-10H], 1
Lpar_004:  mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 47
	jle     Lpar_005
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jle     Lpar_003
Lpar_005:  mov     eax, dword [rbp-0CH]
	leave
	ret
	string.eq:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     qword [rbp-20H], rsi
	mov     dword [rbp-0CH], 0
	mov     dword [rbp-8H], 0
	jmp     Leq_002
Leq_001:  add     dword [rbp-0CH], 1
Leq_002:  mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Leq_004
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Leq_001
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Leq_001
	jmp     Leq_004
Leq_003:  add     dword [rbp-8H], 1
Leq_004:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Leq_005
	mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Leq_003
	mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Leq_003
Leq_005:  mov     eax, dword [rbp-0CH]
	cmp     eax, dword [rbp-8H]
	jz      Leq_006
	mov     eax, 0
	jmp     Leq_010
Leq_006:  mov     dword [rbp-4H], 0
	mov     dword [rbp-4H], 0
	jmp     Leq_009
Leq_007:  mov     eax, dword [rbp-4H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-4H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jz      Leq_008
	mov     eax, 0
	jmp     Leq_010
Leq_008:  add     dword [rbp-4H], 1
Leq_009:  mov     eax, dword [rbp-4H]
	cmp     eax, dword [rbp-0CH]
	jl      Leq_007
	mov     eax, 1
Leq_010:  pop     rbp
	ret
string.s:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     qword [rbp-20H], rsi
	mov     dword [rbp-10H], 0
	mov     dword [rbp-0CH], 0
	jmp     Ll_012
Ll_011:  add     dword [rbp-10H], 1
Ll_012:  mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Ll_014
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Ll_011
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Ll_011
	jmp     Ll_014
Ll_013:  add     dword [rbp-0CH], 1
Ll_014:  mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Ll_015
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Ll_013
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Ll_013
Ll_015:  mov     eax, dword [rbp-0CH]
	cmp     dword [rbp-10H], eax
	cmovle  eax, dword [rbp-10H]
	mov     dword [rbp-4H], eax
	mov     dword [rbp-8H], 0
	mov     dword [rbp-8H], 0
	jmp     Ll_019
Ll_016:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-8H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jge     Ll_017
	mov     eax, 1
	jmp     Ll_021
Ll_017:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-8H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jle     Ll_018
	mov     eax, 0
	jmp     Ll_021
Ll_018:  add     dword [rbp-8H], 1
Ll_019:  mov     eax, dword [rbp-8H]
	cmp     eax, dword [rbp-4H]
	jl      Ll_016
	mov     eax, dword [rbp-10H]
	cmp     eax, dword [rbp-0CH]
	jl      Ll_020
	mov     eax, 0
	jmp     Ll_021
Ll_020:  mov     eax, 1
Ll_021:  pop     rbp
	ret
string.g:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     qword [rbp-20H], rsi
	mov     dword [rbp-10H], 0
	mov     dword [rbp-0CH], 0
	jmp     Lg_023
Lg_022:  add     dword [rbp-10H], 1
Lg_023:  mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Lg_025
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Lg_022
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Lg_022
	jmp     Lg_025
Lg_024:  add     dword [rbp-0CH], 1
Lg_025:  mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Lg_026
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Lg_024
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Lg_024
Lg_026:  mov     eax, dword [rbp-0CH]
	cmp     dword [rbp-10H], eax
	cmovle  eax, dword [rbp-10H]
	mov     dword [rbp-4H], eax
	mov     dword [rbp-8H], 0
	mov     dword [rbp-8H], 0
	jmp     Lg_030
Lg_027:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-8H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jle     Lg_028
	mov     eax, 1
	jmp     Lg_032
Lg_028:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-8H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jge     Lg_029
	mov     eax, 0
	jmp     Lg_032
Lg_029:  add     dword [rbp-8H], 1
Lg_030:  mov     eax, dword [rbp-8H]
	cmp     eax, dword [rbp-4H]
	jl      Lg_027
	mov     eax, dword [rbp-10H]
	cmp     eax, dword [rbp-0CH]
	jg      Lg_031
	mov     eax, 0
	jmp     Lg_032
Lg_031:  mov     eax, 1
Lg_032:  pop     rbp
	ret
	string.le:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     qword [rbp-20H], rsi
	mov     dword [rbp-10H], 0
	mov     dword [rbp-0CH], 0
	jmp     Llege_002
Llege_001:  add     dword [rbp-10H], 1
Llege_002:  mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Llege_004
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Llege_001
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Llege_001
	jmp     Llege_004
Llege_003:  add     dword [rbp-0CH], 1
Llege_004:  mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Llege_005
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Llege_003
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Llege_003
Llege_005:  mov     eax, dword [rbp-0CH]
	cmp     dword [rbp-10H], eax
	cmovle  eax, dword [rbp-10H]
	mov     dword [rbp-4H], eax
	mov     dword [rbp-8H], 0
	mov     dword [rbp-8H], 0
	jmp     Llege_009
Llege_006:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-8H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jge     Llege_007
	mov     eax, 1
	jmp     Llege_011
Llege_007:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-8H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jle     Llege_008
	mov     eax, 0
	jmp     Llege_011
Llege_008:  add     dword [rbp-8H], 1
Llege_009:  mov     eax, dword [rbp-8H]
	cmp     eax, dword [rbp-4H]
	jl      Llege_006
	mov     eax, dword [rbp-10H]
	cmp     eax, dword [rbp-0CH]
	jle     Llege_010
	mov     eax, 0
	jmp     Llege_011
	Llege_010:  mov     eax, 1
	Llege_011:  pop     rbp
	ret
	string.ge:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     qword [rbp-20H], rsi
	mov     dword [rbp-10H], 0
	mov     dword [rbp-0CH], 0
	jmp     Llege_013
Llege_012:  add     dword [rbp-10H], 1
Llege_013:  mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Llege_015
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Llege_012
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Llege_012
	jmp     Llege_015
Llege_014:  add     dword [rbp-0CH], 1
Llege_015:  mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Llege_016
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Llege_014
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Llege_014
Llege_016:  mov     eax, dword [rbp-0CH]
	cmp     dword [rbp-10H], eax
	cmovle  eax, dword [rbp-10H]
	mov     dword [rbp-4H], eax
	mov     dword [rbp-8H], 0
	mov     dword [rbp-8H], 0
	jmp     Llege_020
Llege_017:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-8H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jle     Llege_018
	mov     eax, 1
	jmp     Llege_022
Llege_018:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-8H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jge     Llege_019
	mov     eax, 0
	jmp     Llege_022
Llege_019:  add     dword [rbp-8H], 1
Llege_020:  mov     eax, dword [rbp-8H]
	cmp     eax, dword [rbp-4H]
	jl      Llege_017
	mov     eax, dword [rbp-10H]
	cmp     eax, dword [rbp-0CH]
	jge     Llege_021
	mov     eax, 0
	jmp     Llege_022
Llege_021:  mov     eax, 1
Llege_022:  pop     rbp
	ret
section   .text
xorshift:
      push	rbp
      mov	rbp,rsp
      sub	rsp,240
      mov 	r12,rdi
      mov 	r15,rsi
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      mov 	r14,r10
      mov	qword[rbp - 176],0
      jmp	_0whilecheck
_0for:
      mov 	r10,r14
      mov	rdi,r10
      mov	rsi,13
      mov 	r8,rdi
      mov	[rbp - 48],rsi
      mov 	r10,r8
      mov	cl,[rbp - 48]
      sal	r10,cl
      mov 	r9,r10
      mov	rdi,32767
      mov	rsi,65535
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	r10,[rbp - 8]
      sal	r10,16
      mov 	r12,r10
      mov	r10,[rbp - 16]
      or 	r10,r12
_0check:
      mov 	r12,r10
      mov 	r10,r12
      mov	rax,r10
      mov 	r10,r9
      and	r10,rax
_1check:
      mov 	r12,r10
      mov 	r10,r12
      mov	rax,r10
      mov 	r10,r14
      xor	r10,rax
      mov 	r12,r10
      mov 	r10,r12
      mov 	r14,r10
      mov 	r10,r14
      mov	rdi,r10
      mov	rsi,17
      mov 	rbx,rdi
      mov	[rbp - 80],rsi
      mov	rdi,32767
      mov	rsi,65535
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	r10,[rbp - 8]
      sal	r10,16
      mov 	r12,r10
      mov	r10,[rbp - 16]
      or 	r10,r12
_2check:
      mov 	r12,r10
      mov 	r10,r12
      mov	rax,r10
      mov 	r13,rax
      mov 	r10,r13
      mov	cl,[rbp - 80]
      sar	r10,cl
      mov	r12,r10
      mov 	r10,r12
      sal	r10,1
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      mov 	r13,r10
      mov 	r10,rbx
      mov	cl,[rbp - 80]
      sar	r10,cl
      mov	r12,r10
      mov 	r10,r13
      and 	r10,r12
_3check:
      mov 	r12,r10
      mov 	r10,r12
      mov 	r13,r10
      mov	rdi,32767
      mov	rsi,65535
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	r10,[rbp - 8]
      sal	r10,16
      mov 	r12,r10
      mov	r10,[rbp - 16]
      or 	r10,r12
_4check:
      mov 	r12,r10
      mov 	r10,r12
      mov	rax,r10
      mov 	r10,r13
      and	r10,rax
_5check:
      mov 	r12,r10
      mov 	r10,r12
      mov	rax,r10
      mov 	r10,r14
      xor	r10,rax
      mov 	r12,r10
      mov 	r10,r12
      mov 	r14,r10
      mov 	r10,r14
      mov	rdi,r10
      mov	rsi,5
      mov 	r8,rdi
      mov	[rbp - 48],rsi
      mov 	r10,r8
      mov	cl,[rbp - 48]
      sal	r10,cl
      mov 	r9,r10
      mov	rdi,32767
      mov	rsi,65535
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	r10,[rbp - 8]
      sal	r10,16
      mov 	r12,r10
      mov	r10,[rbp - 16]
      or 	r10,r12
_6check:
      mov 	r12,r10
      mov 	r10,r12
      mov	rax,r10
      mov 	r10,r9
      and	r10,rax
_7check:
      mov 	r12,r10
      mov 	r10,r12
      mov	rax,r10
      mov 	r10,r14
      xor	r10,rax
      mov 	r12,r10
      mov 	r10,r12
      mov 	r14,r10
_0while:
      mov	r10,[rbp - 176]
      mov 	r12,r10
      mov	r10,[rbp - 176]
      add	r10,1
      mov	[rbp - 176],r10
_0whilecheck:
      mov 	r10,r15
      imul	r10,10
      mov 	r12,r10
      mov	r10,[rbp - 176]
      cmp 	r10,r12
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_0for
_0forback:
      mov 	r10,r14
      xor	r10,123456789
      mov 	r12,r10
      mov 	rax,r12
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
int2chr:
      push	rbp
      mov	rbp,rsp
      sub	rsp,312
      mov 	r14,rdi
      mov 	r10,r14
      cmp	r10,32
      setge r10b
      movzx r10,r10b
      mov 	r13,r10
      mov 	r10,r13
      cmp	r10,0
      je	_8check
      mov 	r10,r14
      cmp	r10,126
      setle r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r13
      and 	r10,r12
_8check:
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_0else
_0if:
      mov 	r10,r14
      sub	r10,32
      mov 	r13,r10
      mov 	r10,r14
      sub	r10,32
      mov 	r12,r10
      mov	rdi,[sjtulcasciiTable]
      mov 	rsi,r13
      mov 	rdx,r12
      call	string.substring
      mov 	r12,rax
      mov 	rax,r12
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_0ifback
_0else:
_0ifback:
      mov 	r12,lcstr1
      mov 	rax,r12
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
toStringHex:
      push	rbp
      mov	rbp,rsp
      sub	rsp,448
      mov 	r8,rdi
      mov 	r12,lcstr2
      mov 	r10,r12
      mov 	r13,r10
      mov 	r14,28
      jmp	_1whilecheck
_1for:
      mov 	r10,r8
      mov 	rcx,r14
      sar	r10,cl
      mov	r12,r10
      mov 	r10,r12
      and	r10,15
_9check:
      mov 	r12,r10
      mov 	r10,r12
      mov 	r15,r10
      mov 	r10,r15
      cmp	r10,10
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_1else
_1if:
      mov	r10,48
      add 	r10,r15
      mov 	r12,r10
      mov 	rdi,r12
      push	r13
      push	r14
      push	r15
      push	r8
      call	int2chr
      pop	r8
      pop	r15
      pop	r14
      pop	r13
      mov 	r12,rax
      mov 	rdi,r13
      mov 	rsi,r12
      push	r14
      push	r15
      push	r8
      call	string.add
      pop	r8
      pop	r15
      pop	r14
      mov 	r12,rax
      mov 	r10,r12
      mov 	r13,r10
      jmp	_1ifback
_1else:
      mov	r10,65
      add 	r10,r15
      mov 	r12,r10
      mov 	r10,r12
      sub	r10,10
      mov 	r12,r10
      mov 	rdi,r12
      push	r13
      push	r14
      push	r8
      call	int2chr
      pop	r8
      pop	r14
      pop	r13
      mov 	r12,rax
      mov 	rdi,r13
      mov 	rsi,r12
      push	r14
      push	r8
      call	string.add
      pop	r8
      pop	r14
      mov 	r12,rax
      mov 	r10,r12
      mov 	r13,r10
_1ifback:
_1while:
      mov 	r10,r14
      sub	r10,4
      mov 	r12,r10
      mov 	r10,r12
      mov 	r14,r10
_1whilecheck:
      mov 	r10,r14
      cmp	r10,0
      setge r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_1for
_1forback:
      mov 	rax,r13
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
getnumber:
      push	rbp
      mov	rbp,rsp
      sub	rsp,520
      mov 	r14,rdi
      mov 	r13,rsi
      mov 	r12,rdx
      mov 	r10,r12
      and	r10,31
_10check:
      mov 	r12,r10
      mov 	r10,r12
      mov 	r15,r10
      mov 	rdi,r14
      mov 	rsi,r13
      push	r15
      push	r8
      push	rbx
      call	xorshift
      pop	rbx
      pop	r8
      pop	r15
      mov 	r12,rax
      mov 	r10,r12
      mov 	r13,r10
      mov 	r10,r13
      mov	rdi,r10
      mov 	r10,r15
      mov	rsi,r10
      mov 	r8,rdi
      mov	[rbp - 48],rsi
      mov 	r10,r8
      mov	cl,[rbp - 48]
      sal	r10,cl
      mov 	r9,r10
      mov	rdi,32767
      mov	rsi,65535
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	r10,[rbp - 8]
      sal	r10,16
      mov 	r12,r10
      mov	r10,[rbp - 16]
      or 	r10,r12
_11check:
      mov 	r12,r10
      mov 	r10,r12
      mov	rax,r10
      mov 	r10,r9
      and	r10,rax
_12check:
      mov 	r12,r10
      mov 	r10,r12
      mov	rax,r10
      mov	r10,32
      sub 	r10,r15
      mov 	r12,r10
      mov 	r10,r13
      mov	rdi,r10
      mov 	r10,r12
      mov	rsi,r10
      mov 	rbx,rdi
      mov	[rbp - 80],rsi
      mov	rdi,32767
      mov	rsi,65535
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	r10,[rbp - 8]
      sal	r10,16
      mov 	r12,r10
      mov	r10,[rbp - 16]
      or 	r10,r12
_13check:
      mov 	r12,r10
      mov 	r10,r12
      mov	rax,r10
      mov 	r13,rax
      mov 	r10,r13
      mov	cl,[rbp - 80]
      sar	r10,cl
      mov	r12,r10
      mov 	r10,r12
      sal	r10,1
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      mov 	r13,r10
      mov 	r10,rbx
      mov	cl,[rbp - 80]
      sar	r10,cl
      mov	r12,r10
      mov 	r10,r13
      and 	r10,r12
_14check:
      mov 	r12,r10
      mov 	r10,r12
      mov 	r13,r10
      mov	rdi,32767
      mov	rsi,65535
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	r10,[rbp - 8]
      sal	r10,16
      mov 	r12,r10
      mov	r10,[rbp - 16]
      or 	r10,r12
_15check:
      mov 	r12,r10
      mov 	r10,r12
      mov	rax,r10
      mov 	r10,r13
      and	r10,rax
_16check:
      mov 	r12,r10
      mov 	r10,r12
      mov	rax,r10
      mov	r10,rax
      or	r10,rax
_17check:
      mov 	r12,r10
      mov 	rax,r12
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
main:
      push	rbp
      mov	rbp,rsp
      sub	rsp,1088
      mov 	r12,lcstr0
      mov 	r10,r12
      mov	[sjtulcasciiTable],r10
      call	getInt
      mov 	r12,rax
      mov 	r10,r12
      mov	[rbp - 520],r10
      call	getInt
      mov 	r12,rax
      mov 	r10,r12
      mov	[rbp - 528],r10
      call	getInt
      mov 	r12,rax
      mov 	r10,r12
      mov	[rbp - 536],r10
      call	getInt
      mov 	r12,rax
      mov 	r10,r12
      mov	[rbp - 544],r10
      call	getInt
      mov 	r12,rax
      mov 	r10,r12
      mov	[rbp - 552],r10
      call	getInt
      mov 	r12,rax
      mov 	r10,r12
      mov	[rbp - 560],r10
      mov	qword[rbp - 640],30
      mov	qword[rbp - 648],0
      mov	qword[rbp - 656],0
      mov	qword[rbp - 664],0
      mov	qword[rbp - 672],0
      mov	r10,[rbp - 520]
      mov	[rbp - 568],r10
      jmp	_2whilecheck
_2for:
      mov	r10,[rbp - 536]
      mov	[rbp - 576],r10
      jmp	_3whilecheck
_3for:
      mov	r10,[rbp - 552]
      mov	[rbp - 584],r10
      jmp	_4whilecheck
_4for:
      mov	rdi,[rbp-520]
      mov	rsi,[rbp-640]
      mov	rdx,[rbp-584]
      call	getnumber
      mov	[rbp -  688],rax
      mov	r10,[rbp - 688]
      mov	[rbp - 680],r10
      mov	rdi,[rbp-568]
      mov	rsi,[rbp-640]
      mov	rdx,[rbp-584]
      call	getnumber
      mov	[rbp -  704],rax
      mov	r10,[rbp - 704]
      mov	[rbp - 696],r10
      mov	rdi,[rbp-576]
      mov	rsi,[rbp-640]
      mov	rdx,[rbp-584]
      call	getnumber
      mov	[rbp -  720],rax
      mov	r10,[rbp - 720]
      mov	[rbp - 712],r10
      mov	r10,[rbp - 568]
      xor	r10,[rbp - 576]
      mov	[rbp - 736],r10
      mov	rdi,[rbp-736]
      mov	rsi,[rbp-640]
      mov	rdx,[rbp-584]
      call	getnumber
      mov	[rbp -  744],rax
      mov	r10,[rbp - 744]
      mov	[rbp - 728],r10
      mov	rdi,[rbp-584]
      mov	rsi,1
      call	xorshift
      mov	[rbp -  760],rax
      mov	rdi,[rbp-576]
      mov	rsi,1
      call	xorshift
      mov	[rbp -  768],rax
      mov	r10,[rbp - 760]
      xor	r10,[rbp - 768]
      mov	[rbp - 776],r10
      mov	rdi,[rbp-568]
      mov	rsi,1
      call	xorshift
      mov	[rbp -  784],rax
      mov	r10,[rbp - 776]
      xor	r10,[rbp - 784]
      mov	[rbp - 792],r10
      mov	r10,[rbp - 792]
      mov	[rbp - 752],r10
      mov	r10,[rbp - 680]
      xor	r10,[rbp - 752]
      mov	[rbp - 800],r10
      mov	rdi,[rbp-800]
      mov	rsi,1
      call	xorshift
      mov	[rbp -  808],rax
      mov	r10,[rbp - 648]
      add	r10,[rbp - 808]
      mov	[rbp - 816],r10
      mov	r10,[rbp - 816]
      mov	[rbp - 648],r10
      mov	r10,[rbp - 696]
      xor	r10,[rbp - 752]
      mov	[rbp - 824],r10
      mov	rdi,[rbp-824]
      mov	rsi,1
      call	xorshift
      mov	[rbp -  832],rax
      mov	r10,[rbp - 656]
      add	r10,[rbp - 832]
      mov	[rbp - 840],r10
      mov	r10,[rbp - 840]
      mov	[rbp - 656],r10
      mov	r10,[rbp - 712]
      xor	r10,[rbp - 752]
      mov	[rbp - 848],r10
      mov	rdi,[rbp-848]
      mov	rsi,1
      call	xorshift
      mov	[rbp -  856],rax
      mov	r10,[rbp - 664]
      add	r10,[rbp - 856]
      mov	[rbp - 864],r10
      mov	r10,[rbp - 864]
      mov	[rbp - 664],r10
      mov	r10,[rbp - 728]
      xor	r10,[rbp - 752]
      mov	[rbp - 872],r10
      mov	rdi,[rbp-872]
      mov	rsi,1
      call	xorshift
      mov	[rbp -  880],rax
      mov	r10,[rbp - 672]
      add	r10,[rbp - 880]
      mov	[rbp - 888],r10
      mov	r10,[rbp - 888]
      mov	[rbp - 672],r10
_4while:
      mov	r10,[rbp - 584]
      mov	[rbp - 896],r10
      mov	r10,[rbp - 584]
      add	r10,1
      mov	[rbp - 584],r10
_4whilecheck:
      mov	r10,[rbp - 584]
      cmp	r10,[rbp - 560]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 904],r10
      mov	r10,[rbp -  904]
      cmp	r10,1
      je	_4for
_4forback:
_3while:
      mov	r10,[rbp - 576]
      mov	[rbp - 912],r10
      mov	r10,[rbp - 576]
      add	r10,1
      mov	[rbp - 576],r10
_3whilecheck:
      mov	r10,[rbp - 576]
      cmp	r10,[rbp - 544]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 920],r10
      mov	r10,[rbp -  920]
      cmp	r10,1
      je	_3for
_3forback:
_2while:
      mov	r10,[rbp - 568]
      mov	[rbp - 928],r10
      mov	r10,[rbp - 568]
      add	r10,1
      mov	[rbp - 568],r10
_2whilecheck:
      mov	r10,[rbp - 568]
      cmp	r10,[rbp - 528]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 936],r10
      mov	r10,[rbp -  936]
      cmp	r10,1
      je	_2for
_2forback:
      mov	rdi,[rbp-648]
      call	toStringHex
      mov 	r13,rax
      mov 	r12,lcstr3
      mov 	rdi,r13
      mov 	rsi,r12
      call	string.add
      mov 	r12,rax
      mov 	rdi,r12
      mov	rax,0
      call	print
      mov 	r12,rax
      mov	rdi,[rbp-656]
      call	toStringHex
      mov 	r12,rax
      mov 	r13,lcstr4
      mov 	rdi,r12
      mov 	rsi,r13
      call	string.add
      mov 	r12,rax
      mov 	rdi,r12
      mov	rax,0
      call	print
      mov 	r12,rax
      mov	rdi,[rbp-664]
      call	toStringHex
      mov 	r13,rax
      mov 	r12,lcstr5
      mov 	rdi,r13
      mov 	rsi,r12
      call	string.add
      mov 	r12,rax
      mov 	rdi,r12
      mov	rax,0
      call	print
      mov 	r12,rax
      mov	rdi,[rbp-672]
      call	toStringHex
      mov 	r12,rax
      mov 	r13,lcstr6
      mov 	rdi,r12
      mov 	rsi,r13
      call	string.add
      mov 	r12,rax
      mov 	rdi,r12
      mov	rax,0
      call	print
      mov 	r12,rax
      mov 	r12,lcstr7
      mov 	rdi,r12
      mov	rax,0
      call	println
      mov 	r12,rax
      mov	rax,0
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
section .data
intbuffer:
	dq 0
format1:
	db"%lld",0
format2:
	db"%s",0

sjtulcasciiTable:
	dq 0
	dq 95
lcstr0:
	db	32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,0
	dq 0
lcstr1:
	db	0
	dq 0
lcstr2:
	db	0
	dq 1
lcstr3:
	db	32,0
	dq 1
lcstr4:
	db	32,0
	dq 1
lcstr5:
	db	32,0
	dq 1
lcstr6:
	db	32,0
	dq 0
lcstr7:
	db	0
section .bss
stringbuffer:
	resb 256

