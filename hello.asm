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
check:
      push	rbp
      mov	rbp,rsp
      sub	rsp,200
      mov 	r8,0
      jmp	_0whilecheck
_0for:
      mov 	r9,0
      mov 	r14,0
      jmp	_1whilecheck
_1for:
      mov 	r10,r8
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov 	r10,r14
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov	r10,[sjtulcsat]
      add	r10,r12
      mov	r10,[r10]
      add	r10,r13
      mov	r10,[r10]
      mov 	r15,r10
      mov 	r10,r15
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov 	r13,r10
      mov 	r10,r13
      cmp	r10,0
      je	_0check
      mov 	r10,r15
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulcassignment]
      add	r11,r12
      mov	r10,[r11]
      cmp	r10,1
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r13
      and 	r10,r12
_0check:
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_0else
_0if:
      mov 	r9,1
      jmp	_0ifback
_0else:
_0ifback:
      mov 	r10,r15
      cmp	r10,0
      setl r10b
      movzx r10,r10b
      mov 	r13,r10
      mov 	r10,r13
      cmp	r10,0
      je	_1check
      mov 	r10,r15
      not	r10
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulcassignment]
      add	r11,r12
      mov	r10,[r11]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r13
      and 	r10,r12
_1check:
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_1else
_1if:
      mov 	r9,1
      jmp	_1ifback
_1else:
_1ifback:
_1while:
      mov 	r10,r14
      add	r10,1
      mov 	r14,r10
_1whilecheck:
      mov 	r10,r14
      cmp	r10,3
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_1for
_1forback:
      mov 	r10,r9
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_2else
_2if:
      mov	rax,0
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_2ifback
_2else:
_2ifback:
_0while:
      mov 	r10,r8
      add	r10,1
      mov 	r8,r10
_0whilecheck:
      mov 	r10,r8
      cmp	r10,[sjtulcm]
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_0for
_0forback:
      mov	rax,1
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
myprint:
      push	rbp
      mov	rbp,rsp
      sub	rsp,56
      mov 	r13,rdi
      mov 	r14,0
      jmp	_2whilecheck
_2for:
      mov 	rdi,r13
      mov 	rsi,r14
      push	r13
      push	r14
      call	string.ord
      pop	r14
      pop	r13
      mov 	r12,rax
      mov	r10,[sjtulcmyHash]
      add 	r10,r12
      mov 	r12,r10
      mov 	r10,r12
      mov	[sjtulcmyHash],r10
_2while:
      mov 	r10,r14
      add	r10,1
      mov 	r14,r10
_2whilecheck:
      mov 	rdi,r13
      push	r14
      call	string.length
      pop	r14
      mov 	r12,rax
      mov 	r10,r14
      cmp 	r10,r12
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_2for
_2forback:
      mov	rsp,rbp
      pop rbp
      ret
payoff:
      push	rbp
      mov	rbp,rsp
      sub	rsp,112
      mov 	r15,rdi
      mov 	r9,rsi
      mov 	r14,0
      mov 	r13,0
      jmp	_3whilecheck
_3for:
      mov 	r10,r13
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov 	r10,r13
      add	r10,1
      mov 	r8,r10
      mov 	r10,r8
      imul	r10,8
      mov 	r8,r10
      mov	r11,r15
      add	r11,r12
      mov	r10,[r11]
      mov	r11,r9
      add	r11,r8
      cmp	r10,[r11]
      setne r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_3else
_3if:
      mov 	r10,r14
      mov 	r12,r10
      mov 	r10,r14
      add	r10,1
      mov 	r14,r10
      jmp	_3ifback
_3else:
_3ifback:
_3while:
      mov 	r10,r13
      add	r10,1
      mov 	r13,r10
_3whilecheck:
      mov 	r10,r13
      cmp	r10,3
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_3for
_3forback:
      mov 	rax,r14
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
print_cond:
      push	rbp
      mov	rbp,rsp
      sub	rsp,256
      mov 	r13,rdi
      mov 	r10,r13
      cmp	r10,[sjtulcn]
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_5else
_5if:
      mov 	r13,lcstr0
      mov	rdi,[sjtulccond_ass]
      mov	rsi,[sjtulcassignment]
      push	r13
      call	payoff
      pop	r13
      mov 	r12,rax
      mov 	rdi,r12
      push	r13
      call	toString
      pop	r13
      mov 	r12,rax
      mov 	rdi,r13
      mov 	rsi,r12
      call	string.add
      mov 	r12,rax
      mov 	r13,lcstr1
      mov 	rdi,r12
      mov 	rsi,r13
      call	string.add
      mov 	r12,rax
      mov 	rdi,r12
      mov	rax,0
      call	myprint
      mov 	r12,rax
      mov 	r13,0
      jmp	_4whilecheck
_4for:
      mov 	rax,r13
      mov	r10d,10
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov 	r10,r12
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov 	r14,r10
      mov 	r10,r14
      cmp	 r10,0
      je	_4else
_4if:
      mov 	r10,r13
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[sjtulccond_ass]
      add	r10,r12
      mov	rdi,[r10]
      push	r13
      call	toString
      pop	r13
      mov 	r12,rax
      mov 	rdi,r12
      push	r13
      mov	rax,0
      call	myprint
      pop	r13
      mov 	r12,rax
      jmp	_4ifback
_4else:
_4ifback:
_4while:
      mov 	r10,r13
      add	r10,1
      mov 	r13,r10
_4whilecheck:
      mov 	r10,r13
      cmp	r10,[sjtulcn]
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_4for
_4forback:
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_5ifback
_5else:
_5ifback:
      mov 	r10,r13
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulccond_ass]
      add	r11,r12
      mov	qword[r11],1
      mov 	r10,r13
      add	r10,1
      mov 	r12,r10
      mov 	rdi,r12
      push	r13
      mov	rax,0
      call	print_cond
      pop	r13
      mov 	r12,rax
      mov 	r10,r13
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulccond_ass]
      add	r11,r12
      mov	qword[r11],0
      mov 	r10,r13
      add	r10,1
      mov 	r12,r10
      mov 	rdi,r12
      mov	rax,0
      call	print_cond
      mov 	r12,rax
      mov	rsp,rbp
      pop rbp
      ret
dfs:
      push	rbp
      mov	rbp,rsp
      sub	rsp,176
      mov 	r13,rdi
      mov 	r10,r13
      cmp	r10,[sjtulcn]
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_7else
_7if:
      call	check
      mov 	r13,rax
      mov 	r10,r13
      cmp	r10,1
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_6else
_6if:
      mov 	r12,lcstr2
      mov 	rdi,r12
      mov	rax,0
      call	myprint
      mov 	r12,rax
      mov	rdi,0
      mov	rax,0
      call	print_cond
      mov 	r12,rax
      mov 	r12,lcstr3
      mov 	rdi,r12
      mov	rax,0
      call	myprint
      mov 	r12,rax
      jmp	_6ifback
_6else:
_6ifback:
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_7ifback
_7else:
_7ifback:
      mov 	r10,r13
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulcassignment]
      add	r11,r12
      mov	qword[r11],1
      mov 	r10,r13
      add	r10,1
      mov 	r12,r10
      mov 	rdi,r12
      push	r13
      call	dfs
      pop	r13
      mov 	r12,rax
      mov 	r10,r13
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulcassignment]
      add	r11,r12
      mov	qword[r11],0
      mov 	r10,r13
      add	r10,1
      mov 	r12,r10
      mov 	rdi,r12
      call	dfs
      mov 	r12,rax
      mov	rsp,rbp
      pop rbp
      ret
print_last_cond:
      push	rbp
      mov	rbp,rsp
      sub	rsp,288
      mov 	r13,rdi
      mov 	r10,r13
      cmp	r10,[sjtulcn]
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_10else
_10if:
      mov 	r12,lcstr4
      mov 	rdi,r12
      mov	rax,0
      call	myprint
      mov 	r12,rax
      mov 	r14,1
      mov 	r13,0
      jmp	_5whilecheck
_5for:
      mov 	r10,r13
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulcassignment]
      add	r11,r12
      mov	r10,[r11]
      cmp	r10,1
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_8else
_8if:
      mov 	r14,0
      jmp	_8ifback
_8else:
_8ifback:
      mov 	r10,r13
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[sjtulcassignment]
      add	r10,r12
      mov	rdi,[r10]
      push	r13
      push	r14
      call	toString
      pop	r14
      pop	r13
      mov 	r12,rax
      mov 	rdi,r12
      push	r13
      push	r14
      mov	rax,0
      call	myprint
      pop	r14
      pop	r13
      mov 	r12,rax
_5while:
      mov 	r10,r13
      add	r10,1
      mov 	r13,r10
_5whilecheck:
      mov 	r10,r13
      cmp	r10,[sjtulcn]
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_5for
_5forback:
      mov 	r10,r14
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_9else
_9if:
      mov 	r12,lcstr5
      mov 	rdi,r12
      mov	rax,0
      call	myprint
      mov 	r12,rax
      jmp	_9ifback
_9else:
      mov 	r12,lcstr6
      mov 	rdi,r12
      mov	rax,0
      call	myprint
      mov 	r12,rax
_9ifback:
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_10ifback
_10else:
_10ifback:
      mov 	r10,r13
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulcassignment]
      add	r11,r12
      mov	qword[r11],1
      mov 	r10,r13
      add	r10,1
      mov 	r12,r10
      mov 	rdi,r12
      push	r13
      mov	rax,0
      call	print_last_cond
      pop	r13
      mov 	r12,rax
      mov 	r10,r13
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulcassignment]
      add	r11,r12
      mov	qword[r11],0
      mov 	r10,r13
      add	r10,1
      mov 	r12,r10
      mov 	rdi,r12
      mov	rax,0
      call	print_last_cond
      mov 	r12,rax
      mov	rsp,rbp
      pop rbp
      ret
main:
      push	rbp
      mov	rbp,rsp
      sub	rsp,1352
      mov	qword[sjtulcmyHash],0
      call	getInt
      mov 	r12,rax
      mov 	r10,r12
      mov	[sjtulck],r10
      mov	r10,2
      imul	r10,[sjtulck]
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      mov	[sjtulcn],r10
      mov	r10,[sjtulck]
      mov	[sjtulcm],r10
      mov	qword[sjtulclast],1
      mov 	r12,lcstr7
      mov 	rdi,r12
      mov	rax,0
      call	myprint
      mov 	r12,rax
      mov	r10,[sjtulcm]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov 	rdi,r12
      call	malloc
      mov 	r12,rax
      mov	r11,r12
      add	r11,0
      mov	r10,[sjtulcm]
      mov	qword[r11],r10
      mov 	r10,r12
      mov	[sjtulcsat],r10
      mov 	r14,0
      jmp	_6whilecheck
_6for:
      mov 	r12,32
      mov 	rdi,r12
      push	r14
      call	malloc
      pop	r14
      mov 	r12,rax
      mov	r11,r12
      add	r11,0
      mov	qword[r11],3
      mov 	r10,r12
      mov 	r13,r10
      mov	r11,r13
      add	r11,8
      mov	r10,[sjtulclast]
      mov	qword[r11],r10
      mov	r10,[sjtulclast]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      mov	r11,r13
      add	r11,16
      mov	[r11],r10
      mov	r10,[sjtulclast]
      add	r10,2
      mov 	r12,r10
      mov 	r10,r12
      not	r10
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      mov	r11,r13
      add	r11,24
      mov	[r11],r10
      mov	r10,[sjtulclast]
      add	r10,2
      mov 	r12,r10
      mov 	r10,r12
      mov	[sjtulclast],r10
      mov 	r10,r14
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov 	r10,r13
      mov	r11,[sjtulcsat]
      add	r11,r12
      mov	[r11],r10
_6while:
      mov 	r10,r14
      add	r10,1
      mov 	r14,r10
_6whilecheck:
      mov 	r10,r14
      cmp	r10,[sjtulcm]
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_6for
_6forback:
      mov	r10,[sjtulcn]
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov 	rdi,r12
      push	r13
      call	malloc
      pop	r13
      mov 	r12,rax
      mov 	r10,r13
      mov	r11,r12
      add	r11,0
      mov	[r11],r10
      mov 	r10,r12
      mov	[sjtulcassignment],r10
      mov	r10,[sjtulcn]
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov 	rdi,r12
      push	r13
      call	malloc
      pop	r13
      mov 	r12,rax
      mov 	r10,r13
      mov	r11,r12
      add	r11,0
      mov	[r11],r10
      mov 	r10,r12
      mov	[sjtulccond_ass],r10
      mov	rdi,0
      call	dfs
      mov 	r12,rax
      mov	rdi,0
      mov	rax,0
      call	print_last_cond
      mov 	r12,rax
      mov	rdi,[sjtulcmyHash]
      call	toString
      mov 	r12,rax
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

sjtulcsat:
	dq 0
sjtulcassignment:
	dq 0
sjtulccond_ass:
	dq 0
sjtulck:
	dq 0
sjtulcn:
	dq 0
sjtulcm:
	dq 0
sjtulclast:
	dq 0
sjtulcmyHash:
	dq 0
	dq 2
lcstr0:
	db	45,32,0
	dq 2
lcstr1:
	db	42,120,0
	dq 3
lcstr2:
	db	120,122,32,0
	dq 7
lcstr3:
	db	32,60,61,32,48,59,10,0
	dq 1
lcstr4:
	db	120,0
	dq 3
lcstr5:
	db	32,43,32,0
	dq 6
lcstr6:
	db	32,61,32,49,59,10,0
	dq 9
lcstr7:
	db	109,97,120,58,32,120,122,59,10,0
section .bss
stringbuffer:
	resb 256

