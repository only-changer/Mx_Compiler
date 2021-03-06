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
AOptimizer:
      push	rbp
      mov	rbp,rsp
      sub	rsp,1248
      mov	[rbp - 8],rdi
 mov	 r10,2
 add 	r10,1
 mov	[rbp - 16],r10
 mov	r10,[rbp - 16]
imul	r10,8
 mov	[rbp - 16],r10
 mov	rdi,[rbp-16]
push	r10
 push	r11
call	malloc
 pop	r11
 pop	r10
 mov	[rbp -  24],rax
 mov	r11,[rbp - 24]
add 	r11,0
mov	 qword[r11],2
mov 	r10,[rbp - 24]
mov 	r12,r10
 mov	qword[rbp - 32],0
jmp 	_0whilechecka
_0fora:
mov	    r10,[rbp - 32]
add	    r10,1
mov	    [rbp - 128],r10
mov 	r10,[rbp - 128]
imul	r10,8
mov 	[rbp - 128],r10
mov 	r10,2
add	    r10,1
mov 	[rbp - 136],r10
mov	    r10,[rbp - 136]
imul	r10,8
mov	    [rbp - 136],r10
mov 	rdi,[rbp-136]
push	r10
push	r11
call	malloc
pop	    r11
pop	    r10
mov	    [rbp -  144],rax
mov 	r11,[rbp - 144]
add	    r11,0
mov 	qword[r11],2
mov 	r10,[rbp - 144]
mov	    r11,r12
add	    r11,[rbp - 128]
mov	    [r11],r10
mov	    qword[rbp - 40],0
jmp	    _1whilechecka
_1fora:
mov	    r10,[rbp - 32]
add 	r10,1
mov 	[rbp - 168],r10
mov 	r10,[rbp - 168]
imul	r10,8
mov	    [rbp - 168],r10
mov 	r10,[rbp - 40]
add	    r10,1
mov 	[rbp - 176],r10
mov	    r10,[rbp - 176]
imul	r10,8
mov	    [rbp - 176],r10
mov 	r10,2
add 	r10,1
mov 	[rbp - 184],r10
mov	    r10,[rbp - 184]
imul	    r10,8
mov	    [rbp - 184],r10
mov	    rdi,[rbp-184]
push	r10
push	r11
call	malloc
pop 	r11
pop 	r10
mov 	[rbp -  192],rax
mov 	r11,[rbp - 192]
add	    r11,0
mov	    qword[r11],2
mov 	r10,[rbp - 192]
mov	    r11,r12
add 	r11,[rbp - 168]
mov 	r11,[r11]
add 	r11,[rbp - 176]
mov	    [r11],r10
mov	    qword[rbp - 48],0
jmp	    _2whilechecka
_2fora:
mov 	r10,[rbp - 32]
add	    r10,1
mov	    [rbp - 216],r10
mov 	r10,[rbp - 216]
imul	r10,8
mov	    [rbp - 216],r10
mov 	r10,[rbp - 40]
add 	r10,1
mov	    [rbp - 224],r10
mov	    r10,[rbp - 224]
imul	r10,8
mov	    [rbp - 224],r10
mov	    r10,[rbp - 48]
add	    r10,1
mov	    [rbp - 232],r10
mov 	r10,[rbp - 232]
imul	r10,8
mov	    [rbp - 232],r10
mov 	r10,2
add	    r10,1
mov	    [rbp - 240],r10
mov 	r10,[rbp - 240]
imul	r10,8
mov 	[rbp - 240],r10
mov 	rdi,[rbp-240]
push	r10
push	r11
call	malloc
pop 	r11
pop 	r10
mov	    [rbp -  248],rax
mov 	r11,[rbp - 248]
add	    r11,0
mov	    qword[r11],2
mov 	r10,[rbp - 248]
mov	    r11,r12
add	    r11,[rbp - 216]
mov	    r11,[r11]
add 	r11,[rbp - 224]
mov	    r11,[r11]
add	    r11,[rbp - 232]
mov	    [r11],r10
mov	    qword[rbp - 56],0
jmp	    _3whilechecka
_3fora:
mov 	r10,[rbp - 32]
add	    r10,1
mov	    [rbp - 272],r10
mov	    r10,[rbp - 272]
imul	r10,8
mov	    [rbp - 272],r10
mov	    r10,[rbp - 40]
add 	r10,1
mov	    [rbp - 280],r10
mov 	r10,[rbp - 280]
imul	r10,8
mov	    [rbp - 280],r10
mov	    r10,[rbp - 48]
add	    r10,1
mov	    [rbp - 288],r10
mov	    r10,[rbp - 288]
imul	r10,8
mov	    [rbp - 288],r10
mov 	r10,[rbp - 56]
add	    r10,1
mov 	[rbp - 296],r10
mov 	r10,[rbp - 296]
imul	r10,8
mov	    [rbp - 296],r10
mov 	r10,2
add	    r10,1
mov	    [rbp - 304],r10
mov	    r10,[rbp - 304]
imul	r10,8
mov 	[rbp - 304],r10
mov	    rdi,[rbp-304]
push	r10
push	r11
call	malloc
pop	    r11
pop 	r10
mov	    [rbp -  312],rax
mov	    r11,[rbp - 312]
add 	r11,0
mov	    qword[r11],2
mov 	r10,[rbp - 312]
mov 	r11,r12
add	    r11,[rbp - 272]
mov 	r11,[r11]
add	    r11,[rbp - 280]
mov	    r11,[r11]
add	    r11,[rbp - 288]
mov    	r11,[r11]
add	    r11,[rbp - 296]
mov	    [r11],r10
mov	    qword[rbp - 64],0
jmp	    _4whilechecka
_4fora:
mov	    r10,[rbp - 32]
add	    r10,1
mov	    [rbp - 336],r10
mov	    r10,[rbp - 336]
imul	r10,8
mov	    [rbp - 336],r10
mov	    r10,[rbp - 40]
add 	r10,1
mov 	[rbp - 344],r10
mov 	r10,[rbp - 344]
imul	r10,8
mov 	[rbp - 344],r10
mov 	r10,[rbp - 48]
add	    r10,1
mov 	[rbp - 352],r10
mov 	r10,[rbp - 352]
imul    	r10,8
mov 	[rbp - 352],r10
mov 	r10,[rbp - 56]
add 	r10,1
mov	    [rbp - 360],r10
mov 	r10,[rbp - 360]
imul	r10,8
mov	    [rbp - 360],r10
mov 	r10,[rbp - 64]
add	    r10,1
mov	    [rbp - 368],r10
mov	    r10,[rbp - 368]
imul	r10,8
mov 	[rbp - 368],r10
mov 	r10,2
add	    r10,1
mov 	[rbp - 376],r10
mov 	r10,[rbp - 376]
imul	r10,8
mov 	[rbp - 376],r10
mov 	rdi,[rbp-376]
push	r10
push	r11
call	malloc
pop     r11
pop 	r10
mov	    [rbp -  384],rax
mov	    r11,[rbp - 384]
add	    r11,0
mov	    qword[r11],2
mov 	r10,[rbp - 384]
mov	    r11,r12
add 	r11,[rbp - 336]
mov 	r11,[r11]
add	    r11,[rbp - 344]
mov 	r11,[r11]
add	    r11,[rbp - 352]
mov	    r11,[r11]
add	    r11,[rbp - 360]
mov	    r11,[r11]
add	    r11,[rbp - 368]
mov 	[r11],r10
mov 	qword[rbp - 72],0
jmp	    _5whilechecka
_5fora:
mov 	r10,[rbp - 32]
add	    r10,1
mov	    [rbp - 408],r10
mov	    r10,[rbp - 408]
imul	r10,8
mov 	[rbp - 408],r10
mov	    r10,[rbp - 40]
add	    r10,1
mov	    [rbp - 416],r10
mov 	r10,[rbp - 416]
imul	r10,8
mov 	[rbp - 416],r10
mov 	r10,[rbp - 48]
add 	r10,1
mov	    [rbp - 424],r10
mov 	r10,[rbp - 424]
imul	r10,8
mov	    [rbp - 424],r10
mov	    r10,[rbp - 56]
add	    r10,1
mov 	[rbp - 432],r10
mov	    r10,[rbp - 432]
imul	r10,8
mov	    [rbp - 432],r10
mov	    r10,[rbp - 64]
add 	r10,1
mov	    [rbp - 440],r10
mov 	r10,[rbp - 440]
imul	r10,8
mov	    [rbp - 440],r10
mov	    r10,[rbp - 72]
add 	r10,1
mov	    [rbp - 448],r10
mov 	r10,[rbp - 448]
imul	r10,8
mov	    [rbp - 448],r10
mov	    r10,2
add 	r10,1
mov	    [rbp - 456],r10
mov 	r10,[rbp - 456]
imul	r10,8
mov 	[rbp - 456],r10
mov	    rdi,[rbp-456]
push	r10
push	r11
call	malloc
pop	    r11
pop	    r10
mov	    [rbp -  464],rax
mov	    r11,[rbp - 464]
add	    r11,0
mov	    qword[r11],2
mov	    r10,[rbp - 464]
mov	    r11,r12
add 	r11,[rbp - 408]
mov 	r11,[r11]
add	    r11,[rbp - 416]
mov 	r11,[r11]
add 	r11,[rbp - 424]
mov 	r11,[r11]
add	    r11,[rbp - 432]
mov 	r11,[r11]
add 	r11,[rbp - 440]
mov 	r11,[r11]
add 	r11,[rbp - 448]
mov 	[r11],r10
mov 	qword[rbp - 80],0
jmp 	_6whilechecka
_6fora:
mov	    r10,[rbp - 32]
add 	r10,1
mov	    [rbp - 488],r10
mov	    r10,[rbp - 488]
imul	r10,8
mov 	[rbp - 488],r10
mov	    r10,[rbp - 40]
add 	r10,1
mov 	[rbp - 496],r10
mov	    r10,[rbp - 496]
imul	r10,8
mov	    [rbp - 496],r10
mov 	r10,[rbp - 48]
add	    r10,1
mov	    [rbp - 504],r10
mov 	r10,[rbp - 504]
imul	r10,8
mov	    [rbp - 504],r10
mov	    r10,[rbp - 56]
add	    r10,1
mov	    [rbp - 512],r10
mov	    r10,[rbp - 512]
imul	r10,8
mov	    [rbp - 512],r10
mov 	r10,[rbp - 64]
add	    r10,1
mov 	[rbp - 520],r10
mov	    r10,[rbp - 520]
imul	r10,8
mov	    [rbp - 520],r10
mov	    r10,[rbp - 72]
add 	r10,1
mov	    [rbp - 528],r10
mov 	r10,[rbp - 528]
imul	r10,8
mov 	[rbp - 528],r10
mov 	r10,[rbp - 80]
add	    r10,1
mov	    [rbp - 536],r10
mov 	r10,[rbp - 536]
imul	r10,8
mov 	[rbp - 536],r10
mov	    r10,2
add 	r10,1
mov 	[rbp - 544],r10
mov 	r10,[rbp - 544]
imul	r10,8
mov 	[rbp - 544],r10
mov	    rdi,[rbp-544]
push	r10
push	r11
call	malloc
pop	    r11
pop	    r10
mov	    [rbp -  552],rax
mov 	r11,[rbp - 552]
add 	r11,0
mov 	qword[r11],2
mov 	r10,[rbp - 552]
mov	    r11,r12
add	    r11,[rbp - 488]
mov 	r11,[r11]
add 	r11,[rbp - 496]
mov	    r11,[r11]
add	    r11,[rbp - 504]
mov 	r11,[r11]
add 	r11,[rbp - 512]
mov 	r11,[r11]
add	    r11,[rbp - 520]
mov	    r11,[r11]
add	    r11,[rbp - 528]
mov 	r11,[r11]
add	    r11,[rbp - 536]
mov 	[r11],r10
mov	    qword[rbp - 88],0
jmp	    _7whilechecka
_7fora:
mov 	r10,[rbp - 32]
add	    r10,1
mov	    [rbp - 576],r10
mov	    r10,[rbp - 576]
imul	r10,8
mov	    [rbp - 576],r10
mov	    r10,[rbp - 40]
add     r10,1
mov	    [rbp - 584],r10
mov 	r10,[rbp - 584]
imul	r10,8
mov	    [rbp - 584],r10
mov 	r10,[rbp - 48]
add	    r10,1
mov 	[rbp - 592],r10
mov	    r10,[rbp - 592]
imul	r10,8
mov	    [rbp - 592],r10
mov	    r10,[rbp - 56]
add	    r10,1
mov	    [rbp - 600],r10
mov	    r10,[rbp - 600]
imul	r10,8
mov	    [rbp - 600],r10
mov	    r10,[rbp - 64]
add	    r10,1
mov 	[rbp - 608],r10
mov 	r10,[rbp - 608]
imul	r10,8
mov	    [rbp - 608],r10
mov	    r10,[rbp - 72]
add 	r10,1
mov	    [rbp - 616],r10
mov	    r10,[rbp - 616]
imul	r10,8
mov	    [rbp - 616],r10
mov 	r10,[rbp - 80]
add	    r10,1
mov 	[rbp - 624],r10
mov 	r10,[rbp - 624]
imul	r10,8
mov 	[rbp - 624],r10
mov 	r10,[rbp - 88]
add 	r10,1
mov	    [rbp - 632],r10
mov 	r10,[rbp - 632]
imul	r10,8
mov 	[rbp - 632],r10
mov	    r10,2
add	    r10,1
mov	    [rbp - 640],r10
mov	    r10,[rbp - 640]
imul	r10,8
mov	    [rbp - 640],r10
mov	    rdi,[rbp-640]
push	r10
push	r11
call	malloc
pop	    r11
pop	    r10
mov	    [rbp -  648],rax
mov 	r11,[rbp - 648]
add	    r11,0
mov 	qword[r11],2
mov	    r10,[rbp - 648]
mov	    r11,r12
add	    r11,[rbp - 576]
mov 	r11,[r11]
add	    r11,[rbp - 584]
mov	    r11,[r11]
add	    r11,[rbp - 592]
mov	    r11,[r11]
add 	r11,[rbp - 600]
mov 	r11,[r11]
add 	r11,[rbp - 608]
mov 	r11,[r11]
add 	r11,[rbp - 616]
mov 	r11,[r11]
add 	r11,[rbp - 624]
mov	    r11,[r11]
add 	r11,[rbp - 632]
mov 	[r11],r10
mov 	qword[rbp - 96],0
jmp	    _8whilechecka
_8fora:
mov	    r10,[rbp - 32]
add	    r10,1
mov 	[rbp - 672],r10
mov 	r10,[rbp - 672]
imul	r10,8
mov	    [rbp - 672],r10
mov	    r10,[rbp - 40]
add	    r10,1
mov	    [rbp - 680],r10
mov	    r10,[rbp - 680]
imul	r10,8
mov	    [rbp - 680],r10
mov 	r10,[rbp - 48]
add	    r10,1
mov	    [rbp - 688],r10
mov	    r10,[rbp - 688]
imul	r10,8
mov	    [rbp - 688],r10
mov 	r10,[rbp - 56]
add 	r10,1
mov	    [rbp - 696],r10
mov 	r10,[rbp - 696]
imul	r10,8
mov	    [rbp - 696],r10
mov	    r10,[rbp - 64]
add	    r10,1
mov	    [rbp - 704],r10
mov 	r10,[rbp - 704]
imul	r10,8
mov 	[rbp - 704],r10
mov 	r10,[rbp - 72]
add 	r10,1
mov	    [rbp - 712],r10
mov	    r10,[rbp - 712]
imul	r10,8
mov 	[rbp - 712],r10
mov	    r10,[rbp - 80]
add 	r10,1
mov	    [rbp - 720],r10
mov 	r10,[rbp - 720]
imul	r10,8
mov 	[rbp - 720],r10
mov 	r10,[rbp - 88]
add	    r10,1
mov 	[rbp - 728],r10
mov 	r10,[rbp - 728]
imul	r10,8
mov 	[rbp - 728],r10
mov 	r10,[rbp - 96]
add	    r10,1
mov	    [rbp - 736],r10
mov	    r10,[rbp - 736]
imul	r10,8
mov	    [rbp - 736],r10
mov 	r10,2
add	    r10,1
mov	    [rbp - 744],r10
mov 	r10,[rbp - 744]
imul	r10,8
mov	    [rbp - 744],r10
mov 	rdi,[rbp-744]
push	r10
push	r11
call	malloc
pop 	r11
pop 	r10
mov	    [rbp -  752],rax
mov 	r11,[rbp - 752]
add 	r11,0
mov     qword[r11],2
mov 	r10,[rbp - 752]
mov 	r11,r12
add 	r11,[rbp - 672]
mov 	r11,[r11]
add 	r11,[rbp - 680]
mov 	r11,[r11]
add	    r11,[rbp - 688]
mov 	r11,[r11]
add	    r11,[rbp - 696]
mov	    r11,[r11]
add 	r11,[rbp - 704]
mov	    r11,[r11]
add	    r11,[rbp - 712]
mov 	r11,[r11]
add	    r11,[rbp - 720]
mov	    r11,[r11]
add	    r11,[rbp - 728]
mov 	r11,[r11]
add 	r11,[rbp - 736]
mov 	[r11],r10
_8whilea:
mov 	r10,[rbp - 96]
add	    r10,1
mov	    [rbp - 96],r10
_8whilechecka:
mov 	r10,[rbp - 96]
cmp	    r10,2
setl     r10b
movzx   r10,r10b
mov 	[rbp - 760],r10
mov	    r10,[rbp -  760]
cmp	    r10,1
je  	_8fora
_8forbacka:
_7whilea:
mov 	r10,[rbp - 88]
add	    r10,1
mov	    [rbp - 88],r10
_7whilechecka:
mov	    r10,[rbp - 88]
cmp	    r10,2
setl     r10b
movzx    r10,r10b
mov	    [rbp - 768],r10
mov 	r10,[rbp -  768]
cmp	    r10,1
je  	_7fora
_7forbacka:
_6whilea:
mov 	r10,[rbp - 80]
add	    r10,1
mov 	[rbp - 80],r10
_6whilechecka:
mov 	r10,[rbp - 80]
cmp 	r10,2
setl    r10b
movzx   r10,r10b
mov 	[rbp - 776],r10
mov 	r10,[rbp -  776]
cmp	    r10,1
je  	_6fora
_6forbacka:
_5whilea:
mov	    r10,[rbp - 72]
add	    r10,1
mov	    [rbp - 72],r10
_5whilechecka:
mov 	r10,[rbp - 72]
cmp 	r10,2
setl     r10b
movzx    r10,r10b
mov	    [rbp - 784],r10
mov	    r10,[rbp -  784]
cmp 	r10,1
je	_5fora
_5forbacka:
_4whilea:
mov 	r10,[rbp - 64]
add	    r10,1
mov	    [rbp - 64],r10
_4whilechecka:
mov	    r10,[rbp - 64]
cmp	    r10,2
setl     r10b
movzx   r10,r10b
mov 	[rbp - 792],r10
mov	    r10,[rbp -  792]
cmp 	r10,1
je  	_4fora
_4forbacka:
_3whilea:
mov 	r10,[rbp - 56]
add 	r10,1
mov 	[rbp - 56],r10
_3whilechecka:
mov 	r10,[rbp - 56]
cmp 	r10,2
setl    r10b
movzx   r10,r10b
mov	    [rbp - 800],r10
mov 	r10,[rbp -  800]
cmp	    r10,1
je	_3fora
_3forbacka:
_2whilea:
mov 	r10,[rbp - 48]
add 	r10,1
mov 	[rbp - 48],r10
_2whilechecka:
mov 	r10,[rbp - 48]
cmp 	r10,2
setl    r10b
movzx   r10,r10b
mov	    [rbp - 808],r10
mov 	r10,[rbp -  808]
cmp 	r10,1
je	_2fora
_2forbacka:
_1whilea:
mov 	r10,[rbp - 40]
add	    r10,1
mov	    [rbp - 40],r10
_1whilechecka:
mov	    r10,[rbp - 40]
cmp 	r10,2
setl     r10b
movzx   r10,r10b
mov	    [rbp - 816],r10
mov 	r10,[rbp -  816]
cmp	    r10,1
je	_1fora
_1forbacka:
_0whilea:
mov 	r10,[rbp - 32]
add	    r10,1
mov	    [rbp - 32],r10
_0whilechecka:
mov 	r10,[rbp - 32]
cmp	    r10,2
setl     r10b
movzx   r10,r10b
mov	    [rbp - 824],r10
mov 	r10,[rbp -  824]
cmp 	r10,1
je	_0fora
_0forbacka:
      mov	r10,[rbp - 24]
      mov	[rbp - 16],r10
      mov	qword[rbp - 944],0
      mov	qword[rbp - 936],1
      jmp	_0whilecheck
_0for:
      mov	r10,123
      add	r10,[rbp - 936]
      mov	[rbp - 1048],r10
      mov	r10,[rbp - 1048]
      mov	r11,[rbp - 16]
      add	r11,8
      mov	r11,[r11]
      add	r11,16
      mov	r11,[r11]
      add	r11,8
      mov	r11,[r11]
      add	r11,16
      mov	r11,[r11]
      add	r11,8
      mov	r11,[r11]
      add	r11,16
      mov	r11,[r11]
      add	r11,8
      mov	r11,[r11]
      add	r11,16
      mov	r11,[r11]
      add	r11,8
      mov	r11,[r11]
      add	r11,16
      mov	[r11],r10
      mov	r10,[rbp - 944]
      mov	r11,[rbp - 16]
      add	r11,8
      mov	r11,[r11]
      add	r11,16
      mov	r11,[r11]
      add	r11,8
      mov	r11,[r11]
      add	r11,16
      mov	r11,[r11]
      add	r11,8
      mov	r11,[r11]
      add	r11,16
      mov	r11,[r11]
      add	r11,8
      mov	r11,[r11]
      add	r11,16
      mov	r11,[r11]
      add	r11,8
      mov	r11,[r11]
      add	r11,16
      add	r10,[r11]
      mov	[rbp - 1152],r10
      mov	r10,[rbp - 1152]
      mov	[rbp - 944],r10
_0while:
      mov	r10,[rbp - 936]
      mov	[rbp - 1160],r10
      mov	r10,[rbp - 936]
      add	r10,1
      mov	[rbp - 936],r10
_0whilecheck:
      mov	r10,[rbp - 936]
      cmp	r10,1000
      setle r10b
      movzx r10,r10b
      mov	[rbp - 1168],r10
      mov	r10,[rbp -  1168]
      cmp	r10,1
      je	_0for
_0forback:
      mov	rdi,[rbp-944]
      call	toString
      mov	[rbp -  1176],rax
      mov	rdi,[rbp-1176]
      mov	rax,0
      call	println
      mov	[rbp -  1184],rax
      mov	qword[rbp - 936],1
      jmp	_1whilecheck
_1for:
      mov	r10,[rbp - 944]
      add	r10,8
      mov	[rbp - 1192],r10
      mov	r10,[rbp - 1192]
      mov	[rbp - 944],r10
_1while:
      mov	r10,[rbp - 936]
      mov	[rbp - 1200],r10
      mov	r10,[rbp - 936]
      add	r10,1
      mov	[rbp - 936],r10
_1whilecheck:
      mov	r10,[rbp - 936]
      cmp	r10,1000000
      setle r10b
      movzx r10,r10b
      mov	[rbp - 1208],r10
      mov	r10,[rbp -  1208]
      cmp	r10,1
      je	_1for
_1forback:
      mov	rdi,[rbp-944]
      call	toString
      mov	[rbp -  1216],rax
      mov	rdi,[rbp-1216]
      mov	rax,0
      call	println
      mov	[rbp -  1224],rax
      mov	qword[rbp - 936],1
      jmp	_2whilecheck
_2for:
_2while:
      mov	r10,[rbp - 936]
      mov	[rbp - 1232],r10
      mov	r10,[rbp - 936]
      add	r10,1
      mov	[rbp - 936],r10
_2whilecheck:
      mov	r10,[rbp - 936]
      cmp	r10,200000000
      setle r10b
      movzx r10,r10b
      mov	[rbp - 1240],r10
      mov	r10,[rbp -  1240]
      cmp	r10,1
      je	_2for
_2forback:
      mov	rsp,rbp
      pop rbp
      ret
restore:
      push	rbp
      mov	rbp,rsp
      sub	rsp,80
      mov	qword[rbp - 8],1
      jmp	_3whilecheck
_3for:
      mov	r10,[rbp - 8]
      add	r10,1
      mov	[rbp - 32],r10
      mov	r10,[rbp - 32]
      imul	r10,8
      mov	[rbp - 32],r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov	[rbp - 56],r10
      mov	r10,[rbp - 56]
      imul	r10,8
      mov	[rbp - 56],r10
      mov	r10,[sjtulcbak]
      add	r10,[rbp - 56]
      mov	r10,[r10]
      mov	r11,[sjtulca]
      add	r11,[rbp - 32]
      mov	[r11],r10
_3while:
      mov	r10,[rbp - 8]
      mov	[rbp - 64],r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov	[rbp - 8],r10
_3whilecheck:
      mov	r10,[rbp - 8]
      cmp	r10,[sjtulcn]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 72],r10
      mov	r10,[rbp -  72]
      cmp	r10,1
      je	_3for
_3forback:
      mov	rsp,rbp
      pop rbp
      ret
quicksort:
      push	rbp
      mov	rbp,rsp
      sub	rsp,624
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	qword[rbp - 136],0
      mov	r10,[rbp - 8]
      add	r10,1
      mov	[rbp - 168],r10
      mov	r10,[rbp - 168]
      imul	r10,8
      mov	[rbp - 168],r10
      mov	r10,[sjtulca]
      add	r10,[rbp - 168]
      mov	r10,[r10]
      mov	[rbp - 144],r10
      mov	qword[rbp - 176],0
      mov	qword[rbp - 184],0
      mov	r10,[rbp - 8]
      add	r10,1
      mov	[rbp - 360],r10
      mov	r10,[rbp - 360]
      mov	[rbp - 192],r10
      jmp	_4whilecheck
_4for:
      mov	r10,[rbp - 136]
      mov	[rbp - 200],r10
      mov	r10,[rbp - 136]
      add	r10,1
      mov	[rbp - 136],r10
      mov	r10,[rbp - 192]
      add	r10,1
      mov	[rbp - 336],r10
      mov	r10,[rbp - 336]
      imul	r10,8
      mov	[rbp - 336],r10
      mov	r11,[sjtulca]
      add	r11,[rbp - 336]
      mov	r10,[r11]
      cmp	r10,[rbp - 144]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 344],r10
      mov	 r10,[rbp-344]
      cmp	 r10,0
      je	_0else
_0if:
      mov	r10,[rbp - 176]
      mov	[rbp - 224],r10
      mov	r10,[rbp - 176]
      add	r10,1
      mov	[rbp - 176],r10
      mov	r10,[rbp - 224]
      add	r10,1
      mov	[rbp - 232],r10
      mov	r10,[rbp - 232]
      imul	r10,8
      mov	[rbp - 232],r10
      mov	r10,[rbp - 192]
      add	r10,1
      mov	[rbp - 256],r10
      mov	r10,[rbp - 256]
      imul	r10,8
      mov	[rbp - 256],r10
      mov	r10,[sjtulca]
      add	r10,[rbp - 256]
      mov	r10,[r10]
      mov	r11,[sjtulca_left]
      add	r11,[rbp - 232]
      mov	[r11],r10
      jmp	_0ifback
_0else:
      mov	r10,[rbp - 184]
      mov	[rbp - 280],r10
      mov	r10,[rbp - 184]
      add	r10,1
      mov	[rbp - 184],r10
      mov	r10,[rbp - 280]
      add	r10,1
      mov	[rbp - 288],r10
      mov	r10,[rbp - 288]
      imul	r10,8
      mov	[rbp - 288],r10
      mov	r10,[rbp - 192]
      add	r10,1
      mov	[rbp - 312],r10
      mov	r10,[rbp - 312]
      imul	r10,8
      mov	[rbp - 312],r10
      mov	r10,[sjtulca]
      add	r10,[rbp - 312]
      mov	r10,[r10]
      mov	r11,[sjtulca_right]
      add	r11,[rbp - 288]
      mov	[r11],r10
_0ifback:
_4while:
      mov	r10,[rbp - 192]
      mov	[rbp - 352],r10
      mov	r10,[rbp - 192]
      add	r10,1
      mov	[rbp - 192],r10
_4whilecheck:
      mov	r10,[rbp - 192]
      cmp	r10,[rbp - 16]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 368],r10
      mov	r10,[rbp -  368]
      cmp	r10,1
      je	_4for
_4forback:
      mov	r10,[rbp - 8]
      mov	[rbp - 376],r10
      mov	qword[rbp - 192],0
      jmp	_5whilecheck
_5for:
      mov	r10,[rbp - 376]
      mov	[rbp - 400],r10
      mov	r10,[rbp - 376]
      add	r10,1
      mov	[rbp - 376],r10
      mov	r10,[rbp - 400]
      add	r10,1
      mov	[rbp - 408],r10
      mov	r10,[rbp - 408]
      imul	r10,8
      mov	[rbp - 408],r10
      mov	r10,[rbp - 192]
      add	r10,1
      mov	[rbp - 432],r10
      mov	r10,[rbp - 432]
      imul	r10,8
      mov	[rbp - 432],r10
      mov	r10,[sjtulca_left]
      add	r10,[rbp - 432]
      mov	r10,[r10]
      mov	r11,[sjtulca]
      add	r11,[rbp - 408]
      mov	[r11],r10
_5while:
      mov	r10,[rbp - 192]
      mov	[rbp - 440],r10
      mov	r10,[rbp - 192]
      add	r10,1
      mov	[rbp - 192],r10
_5whilecheck:
      mov	r10,[rbp - 192]
      cmp	r10,[rbp - 176]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 448],r10
      mov	r10,[rbp -  448]
      cmp	r10,1
      je	_5for
_5forback:
      mov	r10,[rbp - 376]
      mov	[rbp - 472],r10
      mov	r10,[rbp - 376]
      add	r10,1
      mov	[rbp - 376],r10
      mov	r10,[rbp - 472]
      add	r10,1
      mov	[rbp - 480],r10
      mov	r10,[rbp - 480]
      imul	r10,8
      mov	[rbp - 480],r10
      mov	r10,[rbp - 144]
      mov	r11,[sjtulca]
      add	r11,[rbp - 480]
      mov	[r11],r10
      mov	qword[rbp - 192],0
      jmp	_6whilecheck
_6for:
      mov	r10,[rbp - 376]
      mov	[rbp - 504],r10
      mov	r10,[rbp - 376]
      add	r10,1
      mov	[rbp - 376],r10
      mov	r10,[rbp - 504]
      add	r10,1
      mov	[rbp - 512],r10
      mov	r10,[rbp - 512]
      imul	r10,8
      mov	[rbp - 512],r10
      mov	r10,[rbp - 192]
      add	r10,1
      mov	[rbp - 536],r10
      mov	r10,[rbp - 536]
      imul	r10,8
      mov	[rbp - 536],r10
      mov	r10,[sjtulca_right]
      add	r10,[rbp - 536]
      mov	r10,[r10]
      mov	r11,[sjtulca]
      add	r11,[rbp - 512]
      mov	[r11],r10
_6while:
      mov	r10,[rbp - 192]
      mov	[rbp - 544],r10
      mov	r10,[rbp - 192]
      add	r10,1
      mov	[rbp - 192],r10
_6whilecheck:
      mov	r10,[rbp - 192]
      cmp	r10,[rbp - 184]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 552],r10
      mov	r10,[rbp -  552]
      cmp	r10,1
      je	_6for
_6forback:
      mov	r10,[rbp - 176]
      cmp	r10,1
      setg r10b
      movzx r10,r10b
      mov	[rbp - 584],r10
      mov	 r10,[rbp-584]
      cmp	 r10,0
      je	_1else
_1if:
      mov	r10,[rbp - 8]
      add	r10,[rbp - 176]
      mov	[rbp - 560],r10
      mov	rdi,[rbp-8]
      mov	rsi,[rbp-560]
      call	quicksort
      mov	[rbp -  568],rax
      mov	r10,[rbp - 136]
      add	r10,[rbp - 568]
      mov	[rbp - 576],r10
      mov	r10,[rbp - 576]
      mov	[rbp - 136],r10
      jmp	_1ifback
_1else:
_1ifback:
      mov	r10,[rbp - 184]
      cmp	r10,1
      setg r10b
      movzx r10,r10b
      mov	[rbp - 616],r10
      mov	 r10,[rbp-616]
      cmp	 r10,0
      je	_2else
_2if:
      mov	r10,[rbp - 16]
      sub	r10,[rbp - 184]
      mov	[rbp - 592],r10
      mov	rdi,[rbp-592]
      mov	rsi,[rbp-16]
      call	quicksort
      mov	[rbp -  600],rax
      mov	r10,[rbp - 136]
      add	r10,[rbp - 600]
      mov	[rbp - 608],r10
      mov	r10,[rbp - 608]
      mov	[rbp - 136],r10
      jmp	_2ifback
_2else:
_2ifback:
      mov	rax,[rbp -  136]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
calc:
      push	rbp
      mov	rbp,rsp
      sub	rsp,416
      mov	qword[rbp - 120],1
      jmp	_7whilecheck
_7for:
      mov	r10,[rbp - 120]
      add	r10,1
      mov	[rbp - 144],r10
      mov	r10,[rbp - 144]
      imul	r10,8
      mov	[rbp - 144],r10
      mov	r10,[rbp - 120]
      sub	r10,1
      mov	[rbp - 152],r10
      mov	r10,[rbp - 152]
      mov	r11,[sjtulca_left]
      add	r11,[rbp - 144]
      mov	[r11],r10
      mov	r10,[rbp - 120]
      add	r10,1
      mov	[rbp - 176],r10
      mov	r10,[rbp - 176]
      imul	r10,8
      mov	[rbp - 176],r10
      mov	r10,[rbp - 120]
      add	r10,1
      mov	[rbp - 184],r10
      mov	r10,[rbp - 184]
      mov	r11,[sjtulca_right]
      add	r11,[rbp - 176]
      mov	[r11],r10
_7while:
      mov	r10,[rbp - 120]
      mov	[rbp - 192],r10
      mov	r10,[rbp - 120]
      add	r10,1
      mov	[rbp - 120],r10
_7whilecheck:
      mov	r10,[rbp - 120]
      cmp	r10,[sjtulcn]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 200],r10
      mov	r10,[rbp -  200]
      cmp	r10,1
      je	_7for
_7forback:
      mov	qword[rbp - 208],0
      mov	r10,[sjtulcn]
      mov	[rbp-120],r10
      jmp	_8whilecheck
_8for:
      mov	r10,[rbp - 120]
      add	r10,1
      mov	[rbp - 256],r10
      mov	r10,[rbp - 256]
      imul	r10,8
      mov	[rbp - 256],r10
      mov	r10,[sjtulca]
      add	r10,[rbp - 256]
      mov	r10,[r10]
      add	r10,1
      mov	[rbp - 264],r10
      mov	r10,[rbp - 264]
      imul	r10,8
      mov	[rbp - 264],r10
      mov	r10,[sjtulca_left]
      add	r10,[rbp - 264]
      mov	r10,[r10]
      mov	[rbp - 216],r10
      mov	r10,[rbp - 120]
      add	r10,1
      mov	[rbp - 312],r10
      mov	r10,[rbp - 312]
      imul	r10,8
      mov	[rbp - 312],r10
      mov	r10,[sjtulca]
      add	r10,[rbp - 312]
      mov	r10,[r10]
      add	r10,1
      mov	[rbp - 320],r10
      mov	r10,[rbp - 320]
      imul	r10,8
      mov	[rbp - 320],r10
      mov	r10,[sjtulca_right]
      add	r10,[rbp - 320]
      mov	r10,[r10]
      mov	[rbp - 272],r10
      mov	r10,[rbp - 216]
      add	r10,1
      mov	[rbp - 344],r10
      mov	r10,[rbp - 344]
      imul	r10,8
      mov	[rbp - 344],r10
      mov	r10,[rbp - 272]
      mov	r11,[sjtulca_right]
      add	r11,[rbp - 344]
      mov	[r11],r10
      mov	r10,[rbp - 272]
      add	r10,1
      mov	[rbp - 368],r10
      mov	r10,[rbp - 368]
      imul	r10,8
      mov	[rbp - 368],r10
      mov	r10,[rbp - 216]
      mov	r11,[sjtulca_left]
      add	r11,[rbp - 368]
      mov	[r11],r10
      mov	r10,[rbp - 208]
      add	r10,[rbp - 272]
      mov	[rbp - 376],r10
      mov	r10,[rbp - 376]
      sub	r10,[rbp - 216]
      mov	[rbp - 384],r10
      mov	r10,[rbp - 384]
      sub	r10,2
      mov	[rbp - 392],r10
      mov	r10,[rbp - 392]
      mov	[rbp - 208],r10
_8while:
      mov	r10,[rbp - 120]
      mov	[rbp - 400],r10
      mov	r10,[rbp - 120]
      sub	r10,1
      mov	[rbp - 120],r10
_8whilecheck:
      mov	r10,[rbp - 120]
      cmp	r10,1
      setge r10b
      movzx r10,r10b
      mov	[rbp - 408],r10
      mov	r10,[rbp -  408]
      cmp	r10,1
      je	_8for
_8forback:
      mov	rax,[rbp -  208]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
mergesort:
      push	rbp
      mov	rbp,rsp
      sub	rsp,768
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	r10,[rbp - 8]
      add	r10,1
      mov	[rbp - 136],r10
      mov	r10,[rbp - 136]
      cmp	r10,[rbp - 16]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 144],r10
      mov	 r10,[rbp-144]
      cmp	 r10,0
      je	_3else
_3if:
      mov	rax,0
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_3ifback
_3else:
_3ifback:
      mov	r10,[rbp - 8]
      add	r10,[rbp - 16]
      mov	[rbp - 160],r10
      mov	r10,[rbp - 160]
      sar	r10,1
      mov	[rbp - 168],r10
      mov	r10,[rbp - 168]
      mov	[rbp - 152],r10
      mov	qword[rbp - 176],0
      mov	rdi,[rbp-8]
      mov	rsi,[rbp-152]
      call	mergesort
      mov	[rbp -  184],rax
      mov	r10,[rbp - 176]
      add	r10,[rbp - 184]
      mov	[rbp - 192],r10
      mov	r10,[rbp - 192]
      mov	[rbp - 176],r10
      mov	rdi,[rbp-152]
      mov	rsi,[rbp-16]
      call	mergesort
      mov	[rbp -  200],rax
      mov	r10,[rbp - 176]
      add	r10,[rbp - 200]
      mov	[rbp - 208],r10
      mov	r10,[rbp - 208]
      mov	[rbp - 176],r10
      mov	qword[rbp - 216],0
      mov	qword[rbp - 224],0
      mov	r10,[rbp - 8]
      mov	[rbp - 232],r10
      jmp	_9whilecheck
_9for:
      mov	r10,[rbp - 216]
      mov	[rbp - 256],r10
      mov	r10,[rbp - 216]
      add	r10,1
      mov	[rbp - 216],r10
      mov	r10,[rbp - 256]
      add	r10,1
      mov	[rbp - 264],r10
      mov	r10,[rbp - 264]
      imul	r10,8
      mov	[rbp - 264],r10
      mov	r10,[rbp - 232]
      add	r10,1
      mov	[rbp - 288],r10
      mov	r10,[rbp - 288]
      imul	r10,8
      mov	[rbp - 288],r10
      mov	r10,[sjtulca]
      add	r10,[rbp - 288]
      mov	r10,[r10]
      mov	r11,[sjtulca_left]
      add	r11,[rbp - 264]
      mov	[r11],r10
_9while:
      mov	r10,[rbp - 232]
      mov	[rbp - 296],r10
      mov	r10,[rbp - 232]
      add	r10,1
      mov	[rbp - 232],r10
_9whilecheck:
      mov	r10,[rbp - 232]
      cmp	r10,[rbp - 152]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 304],r10
      mov	r10,[rbp -  304]
      cmp	r10,1
      je	_9for
_9forback:
      mov	r10,[rbp - 152]
      mov	[rbp - 232],r10
      jmp	_10whilecheck
_10for:
      mov	r10,[rbp - 224]
      mov	[rbp - 328],r10
      mov	r10,[rbp - 224]
      add	r10,1
      mov	[rbp - 224],r10
      mov	r10,[rbp - 328]
      add	r10,1
      mov	[rbp - 336],r10
      mov	r10,[rbp - 336]
      imul	r10,8
      mov	[rbp - 336],r10
      mov	r10,[rbp - 232]
      add	r10,1
      mov	[rbp - 360],r10
      mov	r10,[rbp - 360]
      imul	r10,8
      mov	[rbp - 360],r10
      mov	r10,[sjtulca]
      add	r10,[rbp - 360]
      mov	r10,[r10]
      mov	r11,[sjtulca_right]
      add	r11,[rbp - 336]
      mov	[r11],r10
_10while:
      mov	r10,[rbp - 232]
      mov	[rbp - 368],r10
      mov	r10,[rbp - 232]
      add	r10,1
      mov	[rbp - 232],r10
_10whilecheck:
      mov	r10,[rbp - 232]
      cmp	r10,[rbp - 16]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 376],r10
      mov	r10,[rbp -  376]
      cmp	r10,1
      je	_10for
_10forback:
      mov	qword[rbp - 384],0
      mov	qword[rbp - 392],0
      mov	r10,[rbp - 8]
      mov	[rbp - 400],r10
      jmp	_11while
_11for:
      mov	r10,[rbp - 176]
      mov	[rbp - 408],r10
      mov	r10,[rbp - 176]
      add	r10,1
      mov	[rbp - 176],r10
      mov	r10,[rbp - 384]
      add	r10,1
      mov	[rbp - 560],r10
      mov	r10,[rbp - 560]
      imul	r10,8
      mov	[rbp - 560],r10
      mov	r10,[rbp - 392]
      add	r10,1
      mov	[rbp - 584],r10
      mov	r10,[rbp - 584]
      imul	r10,8
      mov	[rbp - 584],r10
      mov	r11,[sjtulca_left]
      add	r11,[rbp - 560]
      mov	r10,[r11]
      mov	r11,[sjtulca_right]
      add	r11,[rbp - 584]
      cmp	r10,[r11]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 592],r10
      mov	 r10,[rbp-592]
      cmp	 r10,0
      je	_4else
_4if:
      mov	r10,[rbp - 400]
      mov	[rbp - 432],r10
      mov	r10,[rbp - 400]
      add	r10,1
      mov	[rbp - 400],r10
      mov	r10,[rbp - 432]
      add	r10,1
      mov	[rbp - 440],r10
      mov	r10,[rbp - 440]
      imul	r10,8
      mov	[rbp - 440],r10
      mov	r10,[rbp - 384]
      mov	[rbp - 464],r10
      mov	r10,[rbp - 384]
      add	r10,1
      mov	[rbp - 384],r10
      mov	r10,[rbp - 464]
      add	r10,1
      mov	[rbp - 472],r10
      mov	r10,[rbp - 472]
      imul	r10,8
      mov	[rbp - 472],r10
      mov	r10,[sjtulca_left]
      add	r10,[rbp - 472]
      mov	r10,[r10]
      mov	r11,[sjtulca]
      add	r11,[rbp - 440]
      mov	[r11],r10
      jmp	_4ifback
_4else:
      mov	r10,[rbp - 400]
      mov	[rbp - 496],r10
      mov	r10,[rbp - 400]
      add	r10,1
      mov	[rbp - 400],r10
      mov	r10,[rbp - 496]
      add	r10,1
      mov	[rbp - 504],r10
      mov	r10,[rbp - 504]
      imul	r10,8
      mov	[rbp - 504],r10
      mov	r10,[rbp - 392]
      mov	[rbp - 528],r10
      mov	r10,[rbp - 392]
      add	r10,1
      mov	[rbp - 392],r10
      mov	r10,[rbp - 528]
      add	r10,1
      mov	[rbp - 536],r10
      mov	r10,[rbp - 536]
      imul	r10,8
      mov	[rbp - 536],r10
      mov	r10,[sjtulca_right]
      add	r10,[rbp - 536]
      mov	r10,[r10]
      mov	r11,[sjtulca]
      add	r11,[rbp - 504]
      mov	[r11],r10
_4ifback:
_11while:
      mov	r10,[rbp - 384]
      cmp	r10,[rbp - 216]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 600],r10
      mov	r10,[rbp - 600]
      cmp	r10,0
      je	_0check
      mov	r10,[rbp - 392]
      cmp	r10,[rbp - 224]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 608],r10
      mov	r10,[rbp - 600]
      and	r10,[rbp - 608]
_0check:
      mov	[rbp - 616],r10
      mov	r10,[rbp -  616]
      cmp	r10,1
      je	_11for
_11forback:
      jmp	_12while
_12for:
      mov	r10,[rbp - 400]
      mov	[rbp - 640],r10
      mov	r10,[rbp - 400]
      add	r10,1
      mov	[rbp - 400],r10
      mov	r10,[rbp - 640]
      add	r10,1
      mov	[rbp - 648],r10
      mov	r10,[rbp - 648]
      imul	r10,8
      mov	[rbp - 648],r10
      mov	r10,[rbp - 384]
      mov	[rbp - 672],r10
      mov	r10,[rbp - 384]
      add	r10,1
      mov	[rbp - 384],r10
      mov	r10,[rbp - 672]
      add	r10,1
      mov	[rbp - 680],r10
      mov	r10,[rbp - 680]
      imul	r10,8
      mov	[rbp - 680],r10
      mov	r10,[sjtulca_left]
      add	r10,[rbp - 680]
      mov	r10,[r10]
      mov	r11,[sjtulca]
      add	r11,[rbp - 648]
      mov	[r11],r10
_12while:
      mov	r10,[rbp - 384]
      cmp	r10,[rbp - 216]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 688],r10
      mov	r10,[rbp -  688]
      cmp	r10,1
      je	_12for
_12forback:
      jmp	_13while
_13for:
      mov	r10,[rbp - 400]
      mov	[rbp - 712],r10
      mov	r10,[rbp - 400]
      add	r10,1
      mov	[rbp - 400],r10
      mov	r10,[rbp - 712]
      add	r10,1
      mov	[rbp - 720],r10
      mov	r10,[rbp - 720]
      imul	r10,8
      mov	[rbp - 720],r10
      mov	r10,[rbp - 392]
      mov	[rbp - 744],r10
      mov	r10,[rbp - 392]
      add	r10,1
      mov	[rbp - 392],r10
      mov	r10,[rbp - 744]
      add	r10,1
      mov	[rbp - 752],r10
      mov	r10,[rbp - 752]
      imul	r10,8
      mov	[rbp - 752],r10
      mov	r10,[sjtulca_right]
      add	r10,[rbp - 752]
      mov	r10,[r10]
      mov	r11,[sjtulca]
      add	r11,[rbp - 720]
      mov	[r11],r10
_13while:
      mov	r10,[rbp - 392]
      cmp	r10,[rbp - 224]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 760],r10
      mov	r10,[rbp -  760]
      cmp	r10,1
      je	_13for
_13forback:
      mov	rax,[rbp -  176]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
heapsort:
      push	rbp
      mov	rbp,rsp
      sub	rsp,840
      mov	qword[rbp - 120],0
      mov	qword[rbp - 128],1
      jmp	_14whilecheck
_14for:
      mov	r10,[rbp - 128]
      add	r10,1
      mov	[rbp - 160],r10
      mov	r10,[rbp - 160]
      imul	r10,8
      mov	[rbp - 160],r10
      mov	r10,[rbp - 128]
      add	r10,1
      mov	[rbp - 184],r10
      mov	r10,[rbp - 184]
      imul	r10,8
      mov	[rbp - 184],r10
      mov	r10,[sjtulca]
      add	r10,[rbp - 184]
      mov	r10,[r10]
      mov	r11,[sjtulcheap]
      add	r11,[rbp - 160]
      mov	[r11],r10
      mov	r10,[rbp - 128]
      mov	[rbp - 192],r10
      jmp	_15while
_15for:
      mov	r10,[rbp - 120]
      mov	[rbp - 200],r10
      mov	r10,[rbp - 120]
      add	r10,1
      mov	[rbp - 120],r10
      mov	r10,[rbp - 192]
      add	r10,1
      mov	[rbp - 224],r10
      mov	r10,[rbp - 224]
      imul	r10,8
      mov	[rbp - 224],r10
      mov	r10,[rbp - 192]
      sar	r10,1
      mov	[rbp - 248],r10
      mov	r10,[rbp - 248]
      add	r10,1
      mov	[rbp - 256],r10
      mov	r10,[rbp - 256]
      imul	r10,8
      mov	[rbp - 256],r10
      mov	r11,[sjtulcheap]
      add	r11,[rbp - 224]
      mov	r10,[r11]
      mov	r11,[sjtulcheap]
      add	r11,[rbp - 256]
      cmp	r10,[r11]
      setg r10b
      movzx r10,r10b
      mov	[rbp - 264],r10
      mov	 r10,[rbp-264]
      cmp	 r10,0
      je	_5else
_5if:
      jmp	_15forback
      jmp	_5ifback
_5else:
_5ifback:
      mov	r10,[rbp - 192]
      add	r10,1
      mov	[rbp - 288],r10
      mov	r10,[rbp - 288]
      imul	r10,8
      mov	[rbp - 288],r10
      mov	r10,[sjtulcheap]
      add	r10,[rbp - 288]
      mov	r10,[r10]
      mov	[rbp - 136],r10
      mov	r10,[rbp - 192]
      add	r10,1
      mov	[rbp - 312],r10
      mov	r10,[rbp - 312]
      imul	r10,8
      mov	[rbp - 312],r10
      mov	r10,[rbp - 192]
      sar	r10,1
      mov	[rbp - 336],r10
      mov	r10,[rbp - 336]
      add	r10,1
      mov	[rbp - 344],r10
      mov	r10,[rbp - 344]
      imul	r10,8
      mov	[rbp - 344],r10
      mov	r10,[sjtulcheap]
      add	r10,[rbp - 344]
      mov	r10,[r10]
      mov	r11,[sjtulcheap]
      add	r11,[rbp - 312]
      mov	[r11],r10
      mov	r10,[rbp - 192]
      sar	r10,1
      mov	[rbp - 368],r10
      mov	r10,[rbp - 368]
      add	r10,1
      mov	[rbp - 376],r10
      mov	r10,[rbp - 376]
      imul	r10,8
      mov	[rbp - 376],r10
      mov	r10,[rbp - 136]
      mov	r11,[sjtulcheap]
      add	r11,[rbp - 376]
      mov	[r11],r10
      mov	r10,[rbp - 192]
      sar	r10,1
      mov	[rbp - 384],r10
      mov	r10,[rbp - 384]
      mov	[rbp - 192],r10
_15while:
      mov	r10,[rbp - 192]
      cmp	r10,1
      setne r10b
      movzx r10,r10b
      mov	[rbp - 392],r10
      mov	r10,[rbp -  392]
      cmp	r10,1
      je	_15for
_15forback:
_14while:
      mov	r10,[rbp - 128]
      mov	[rbp - 400],r10
      mov	r10,[rbp - 128]
      add	r10,1
      mov	[rbp - 128],r10
_14whilecheck:
      mov	r10,[rbp - 128]
      cmp	r10,[sjtulcn]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 408],r10
      mov	r10,[rbp -  408]
      cmp	r10,1
      je	_14for
_14forback:
      mov	r10,[sjtulcn]
      mov	[rbp-416],r10
      mov	qword[rbp - 128],1
      jmp	_16whilecheck
_16for:
      mov	r10,[rbp - 128]
      add	r10,1
      mov	[rbp - 440],r10
      mov	r10,[rbp - 440]
      imul	r10,8
      mov	[rbp - 440],r10
      mov	r10,[sjtulcheap]
      add	r10,16
      mov	r10,[r10]
      mov	r11,[sjtulca]
      add	r11,[rbp - 440]
      mov	[r11],r10
      mov	r10,[rbp - 416]
      mov	[rbp - 512],r10
      mov	r10,[rbp - 416]
      sub	r10,1
      mov	[rbp - 416],r10
      mov	r10,[rbp - 512]
      add	r10,1
      mov	[rbp - 520],r10
      mov	r10,[rbp - 520]
      imul	r10,8
      mov	[rbp - 520],r10
      mov	r10,[sjtulcheap]
      add	r10,[rbp - 520]
      mov	r10,[r10]
      mov	r11,[sjtulcheap]
      add	r11,16
      mov	[r11],r10
      mov	qword[rbp - 528],1
      jmp	_17while
_17for:
      mov	r10,[rbp - 528]
      sal	r10,1
      mov	[rbp - 544],r10
      mov	r10,[rbp - 544]
      mov	[rbp - 536],r10
      mov	r10,[rbp - 536]
      add	r10,1
      mov	[rbp - 560],r10
      mov	r10,[rbp - 560]
      mov	[rbp - 552],r10
      mov	r10,[rbp - 536]
      mov	[rbp - 568],r10
      mov	r10,[rbp - 552]
      cmp	r10,[rbp - 416]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 640],r10
      mov	 r10,[rbp-640]
      cmp	 r10,0
      je	_7else
_7if:
      mov	r10,[rbp - 120]
      mov	[rbp - 576],r10
      mov	r10,[rbp - 120]
      add	r10,1
      mov	[rbp - 120],r10
      mov	r10,[rbp - 552]
      add	r10,1
      mov	[rbp - 600],r10
      mov	r10,[rbp - 600]
      imul	r10,8
      mov	[rbp - 600],r10
      mov	r10,[rbp - 536]
      add	r10,1
      mov	[rbp - 624],r10
      mov	r10,[rbp - 624]
      imul	r10,8
      mov	[rbp - 624],r10
      mov	r11,[sjtulcheap]
      add	r11,[rbp - 600]
      mov	r10,[r11]
      mov	r11,[sjtulcheap]
      add	r11,[rbp - 624]
      cmp	r10,[r11]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 632],r10
      mov	 r10,[rbp-632]
      cmp	 r10,0
      je	_6else
_6if:
      mov	r10,[rbp - 552]
      mov	[rbp - 568],r10
      jmp	_6ifback
_6else:
_6ifback:
      jmp	_7ifback
_7else:
_7ifback:
      mov	r10,[rbp - 120]
      mov	[rbp - 648],r10
      mov	r10,[rbp - 120]
      add	r10,1
      mov	[rbp - 120],r10
      mov	r10,[rbp - 528]
      add	r10,1
      mov	[rbp - 672],r10
      mov	r10,[rbp - 672]
      imul	r10,8
      mov	[rbp - 672],r10
      mov	r10,[rbp - 568]
      add	r10,1
      mov	[rbp - 696],r10
      mov	r10,[rbp - 696]
      imul	r10,8
      mov	[rbp - 696],r10
      mov	r11,[sjtulcheap]
      add	r11,[rbp - 672]
      mov	r10,[r11]
      mov	r11,[sjtulcheap]
      add	r11,[rbp - 696]
      cmp	r10,[r11]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 704],r10
      mov	 r10,[rbp-704]
      cmp	 r10,0
      je	_8else
_8if:
      jmp	_17forback
      jmp	_8ifback
_8else:
_8ifback:
      mov	r10,[rbp - 528]
      add	r10,1
      mov	[rbp - 728],r10
      mov	r10,[rbp - 728]
      imul	r10,8
      mov	[rbp - 728],r10
      mov	r10,[sjtulcheap]
      add	r10,[rbp - 728]
      mov	r10,[r10]
      mov	[rbp - 136],r10
      mov	r10,[rbp - 528]
      add	r10,1
      mov	[rbp - 752],r10
      mov	r10,[rbp - 752]
      imul	r10,8
      mov	[rbp - 752],r10
      mov	r10,[rbp - 568]
      add	r10,1
      mov	[rbp - 776],r10
      mov	r10,[rbp - 776]
      imul	r10,8
      mov	[rbp - 776],r10
      mov	r10,[sjtulcheap]
      add	r10,[rbp - 776]
      mov	r10,[r10]
      mov	r11,[sjtulcheap]
      add	r11,[rbp - 752]
      mov	[r11],r10
      mov	r10,[rbp - 568]
      add	r10,1
      mov	[rbp - 800],r10
      mov	r10,[rbp - 800]
      imul	r10,8
      mov	[rbp - 800],r10
      mov	r10,[rbp - 136]
      mov	r11,[sjtulcheap]
      add	r11,[rbp - 800]
      mov	[r11],r10
      mov	r10,[rbp - 528]
      mov	[rbp - 136],r10
      mov	r10,[rbp - 568]
      mov	[rbp - 528],r10
      mov	r10,[rbp - 136]
      mov	[rbp - 568],r10
_17while:
      mov	r10,[rbp - 528]
      sal	r10,1
      mov	[rbp - 808],r10
      mov	r10,[rbp - 808]
      cmp	r10,[rbp - 416]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 816],r10
      mov	r10,[rbp -  816]
      cmp	r10,1
      je	_17for
_17forback:
_16while:
      mov	r10,[rbp - 128]
      mov	[rbp - 824],r10
      mov	r10,[rbp - 128]
      add	r10,1
      mov	[rbp - 128],r10
_16whilecheck:
      mov	r10,[rbp - 128]
      cmp	r10,[sjtulcn]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 832],r10
      mov	r10,[rbp -  832]
      cmp	r10,1
      je	_16for
_16forback:
      mov	rax,[rbp -  120]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
main:
      push	rbp
      mov	rbp,rsp
      sub	rsp,4504
      mov	qword[sjtulcN],100000
      mov	r10,[sjtulcN]
      add	r10,1
      mov	[rbp - 8],r10
      mov	r10,[rbp - 8]
      imul	r10,8
      mov	[rbp - 8],r10
      mov	rdi,[rbp-8]
      call	malloc
      mov	[rbp -  16],rax
      mov	r11,[rbp - 16]
      add	r11,0
      mov	r10,[sjtulcN]
      mov	qword[r11],r10
      mov	r10,[rbp - 16]
      mov	[sjtulca],r10
      mov	r10,[sjtulcN]
      add	r10,1
      mov	[rbp - 24],r10
      mov	r10,[rbp - 24]
      imul	r10,8
      mov	[rbp - 24],r10
      mov	rdi,[rbp-24]
      call	malloc
      mov	[rbp -  32],rax
      mov	r11,[rbp - 32]
      add	r11,0
      mov	r10,[sjtulcN]
      mov	qword[r11],r10
      mov	r10,[rbp - 32]
      mov	[sjtulcbak],r10
      mov	r10,[sjtulcN]
      add	r10,1
      mov	[rbp - 40],r10
      mov	r10,[rbp - 40]
      imul	r10,8
      mov	[rbp - 40],r10
      mov	rdi,[rbp-40]
      call	malloc
      mov	[rbp -  48],rax
      mov	r11,[rbp - 48]
      add	r11,0
      mov	r10,[sjtulcN]
      mov	qword[r11],r10
      mov	r10,[rbp - 48]
      mov	[sjtulca_left],r10
      mov	r10,[sjtulcN]
      add	r10,1
      mov	[rbp - 56],r10
      mov	r10,[rbp - 56]
      imul	r10,8
      mov	[rbp - 56],r10
      mov	rdi,[rbp-56]
      call	malloc
      mov	[rbp -  64],rax
      mov	r11,[rbp - 64]
      add	r11,0
      mov	r10,[sjtulcN]
      mov	qword[r11],r10
      mov	r10,[rbp - 64]
      mov	[sjtulca_right],r10
      mov	r10,[sjtulcN]
      add	r10,1
      mov	[rbp - 72],r10
      mov	r10,[rbp - 72]
      imul	r10,8
      mov	[rbp - 72],r10
      mov	rdi,[rbp-72]
      call	malloc
      mov	[rbp -  80],rax
      mov	r11,[rbp - 80]
      add	r11,0
      mov	r10,[sjtulcN]
      mov	qword[r11],r10
      mov	r10,[rbp - 80]
      mov	[sjtulcheap],r10
      call	getInt
      mov	[rbp -  4136],rax
      mov	r10,[rbp - 4136]
      mov	[sjtulcn],r10
      call	getInt
      mov	[rbp -  4152],rax
      mov	r10,[rbp - 4152]
      mov	[rbp - 4144],r10
      mov	qword[rbp - 4160],1
      jmp	_18whilecheck
_18for:
      mov	r10,[rbp - 4160]
      add	r10,1
      mov	[rbp - 4184],r10
      mov	r10,[rbp - 4184]
      imul	r10,8
      mov	[rbp - 4184],r10
      mov	r10,[rbp - 4160]
      mov	r11,[sjtulca]
      add	r11,[rbp - 4184]
      mov	[r11],r10
      mov	r10,[rbp - 4160]
      cmp	r10,[rbp - 4144]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 4232],r10
      mov	 r10,[rbp-4232]
      cmp	 r10,0
      je	_9else
_9if:
      mov	r10,[rbp - 4160]
      add	r10,1
      mov	[rbp - 4208],r10
      mov	r10,[rbp - 4208]
      imul	r10,8
      mov	[rbp - 4208],r10
      mov	r10,[rbp - 4144]
      add	r10,1
      mov	[rbp - 4216],r10
      mov	r10,[rbp - 4216]
      sub	r10,[rbp - 4160]
      mov	[rbp - 4224],r10
      mov	r10,[rbp - 4224]
      mov	r11,[sjtulca]
      add	r11,[rbp - 4208]
      mov	[r11],r10
      jmp	_9ifback
_9else:
_9ifback:
      mov	r10,[rbp - 4160]
      add	r10,1
      mov	[rbp - 4256],r10
      mov	r10,[rbp - 4256]
      imul	r10,8
      mov	[rbp - 4256],r10
      mov	r10,[rbp - 4160]
      add	r10,1
      mov	[rbp - 4280],r10
      mov	r10,[rbp - 4280]
      imul	r10,8
      mov	[rbp - 4280],r10
      mov	r10,[sjtulca]
      add	r10,[rbp - 4280]
      mov	r10,[r10]
      mov	r11,[sjtulcbak]
      add	r11,[rbp - 4256]
      mov	[r11],r10
_18while:
      mov	r10,[rbp - 4160]
      mov	[rbp - 4288],r10
      mov	r10,[rbp - 4160]
      add	r10,1
      mov	[rbp - 4160],r10
_18whilecheck:
      mov	r10,[rbp - 4160]
      cmp	r10,[sjtulcn]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 4296],r10
      mov	r10,[rbp -  4296]
      cmp	r10,1
      je	_18for
_18forback:
      mov	r10,[sjtulcn]
      add	r10,1
      mov	[rbp - 4312],r10
      mov	rdi,1
      mov	rsi,[rbp-4312]
      call	quicksort
      mov	[rbp -  4320],rax
      mov	r10,[rbp - 4320]
      mov	[rbp - 4304],r10
      call	restore
      mov	[rbp -  4328],rax
      call	calc
      mov	[rbp -  4344],rax
      mov	r10,[rbp - 4344]
      mov	[rbp - 4336],r10
      call	restore
      mov	[rbp -  4352],rax
      mov	r10,[sjtulcn]
      add	r10,1
      mov	[rbp - 4368],r10
      mov	rdi,1
      mov	rsi,[rbp-4368]
      call	mergesort
      mov	[rbp -  4376],rax
      mov	r10,[rbp - 4376]
      mov	[rbp - 4360],r10
      call	restore
      mov	[rbp -  4384],rax
      call	heapsort
      mov	[rbp -  4400],rax
      mov	r10,[rbp - 4400]
      mov	[rbp - 4392],r10
      mov	rdi,[rbp-4304]
      call	toString
      mov	[rbp -  4408],rax
      mov	rdi,[rbp-4408]
      mov	rax,0
      call	println
      mov	[rbp -  4416],rax
      mov	rdi,[rbp-4336]
      call	toString
      mov	[rbp -  4424],rax
      mov	rdi,[rbp-4424]
      mov	rax,0
      call	println
      mov	[rbp -  4432],rax
      mov	rdi,[rbp-4360]
      call	toString
      mov	[rbp -  4440],rax
      mov	rdi,[rbp-4440]
      mov	rax,0
      call	println
      mov	[rbp -  4448],rax
      mov	rdi,[rbp-4392]
      call	toString
      mov	[rbp -  4456],rax
      mov	rdi,[rbp-4456]
      mov	rax,0
      call	println
      mov	[rbp -  4464],rax
      mov	rdi,8
      call	malloc
      mov	[rbp -  4480],rax
      mov	r10,[rbp - 4480]
      mov	[rbp - 4472],r10
      mov	rdi,[rbp-4472]
      call	AOptimizer
      mov	[rbp -  4496],rax
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

sjtulcN:
	dq 0
sjtulcn:
	dq 0
sjtulca:
	dq 0
sjtulcbak:
	dq 0
sjtulca_left:
	dq 0
sjtulca_right:
	dq 0
sjtulcheap:
	dq 0
sjtulci1:
	dq 0
sjtulci2:
	dq 0
sjtulci3:
	dq 0
sjtulci4:
	dq 0
sjtulci5:
	dq 0
sjtulci6:
	dq 0
sjtulci7:
	dq 0
sjtulci8:
	dq 0
sjtulci9:
	dq 0
sjtulci10:
	dq 0
sjtulci11:
	dq 0
sjtulci12:
	dq 0
sjtulci13:
	dq 0
sjtulci14:
	dq 0
section .bss
stringbuffer:
	resb 256

