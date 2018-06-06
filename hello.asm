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
hilo:
      push	rbp
      mov	rbp,rsp
      sub	rsp,40
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	r10,[rbp - 8]
      sal	r10,16
      mov	[rbp - 24],r10
      mov	r10,[rbp - 16]
      or	r10,[rbp - 24]
_0check:
      mov	[rbp - 32],r10
      mov	rax,[rbp -  32]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
shift_l:
      push	rbp
      mov	rbp,rsp
      sub	rsp,72
      mov	[rbp - 40],rdi
      mov	[rbp - 48],rsi
      mov	r10,[rbp - 40]
      mov	cl,[rbp - 48]
      sal	r10,cl
      mov	[rbp - 56],r10
      mov	rdi,32767
      mov	rsi,65535
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	r10,[rbp - 8]
      sal	r10,16
      mov	[rbp - 24],r10
      mov	r10,[rbp - 16]
      or	r10,[rbp - 24]
_1check:
      mov	[rbp - 32],r10
      mov	r10,[rbp - 32]
      mov	rax,r10
      mov	r10,[rbp - 56]
      and	r10,rax
_2check:
      mov	[rbp - 64],r10
      mov	rax,[rbp -  64]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
shift_r:
      push	rbp
      mov	rbp,rsp
      sub	rsp,136
      mov	[rbp - 72],rdi
      mov	[rbp - 80],rsi
      mov	rdi,32767
      mov	rsi,65536
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	r10,[rbp - 8]
      sal	r10,16
      mov	[rbp - 24],r10
      mov	r10,[rbp - 16]
      or	r10,[rbp - 24]
_3check:
      mov	[rbp - 32],r10
      mov	r10,[rbp - 32]
      mov	rax,r10
      mov	r10,rax
      mov	cl,[rbp - 80]
      sar	r10,cl
      mov	[rbp - 88],r10
      mov	r10,[rbp - 88]
      sal	r10,2
      mov	[rbp - 96],r10
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 104],r10
      mov	r10,[rbp - 72]
      mov	cl,[rbp - 80]
      sar	r10,cl
      mov	[rbp - 112],r10
      mov	r10,[rbp - 104]
      and	r10,[rbp - 112]
_4check:
      mov	[rbp - 120],r10
      mov	rdi,32767
      mov	rsi,65535
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	r10,[rbp - 8]
      sal	r10,16
      mov	[rbp - 24],r10
      mov	r10,[rbp - 16]
      or	r10,[rbp - 24]
_5check:
      mov	[rbp - 32],r10
      mov	r10,[rbp - 32]
      mov	rax,r10
      mov	r10,[rbp - 120]
      and	r10,rax
_6check:
      mov	[rbp - 128],r10
      mov	rax,[rbp -  128]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
xorshift:
      push	rbp
      mov	rbp,rsp
      sub	rsp,232
      mov 	r12,rdi
      mov	[rbp - 144],rsi
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      mov	[rbp - 152],r10
      mov	qword[rbp - 168],0
      jmp	_0whilecheck
_0for:
      mov	r10,[rbp - 152]
      mov	rdi,r10
      mov	rsi,13
      mov	[rbp - 40],rdi
      mov	[rbp - 48],rsi
      mov	r10,[rbp - 40]
      mov	cl,[rbp - 48]
      sal	r10,cl
      mov	[rbp - 56],r10
      mov	rdi,32767
      mov	rsi,65535
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	r10,[rbp - 8]
      sal	r10,16
      mov	[rbp - 24],r10
      mov	r10,[rbp - 16]
      or	r10,[rbp - 24]
_7check:
      mov	[rbp - 32],r10
      mov	r10,[rbp - 32]
      mov	rax,r10
      mov	r10,[rbp - 56]
      and	r10,rax
_8check:
      mov	[rbp - 64],r10
      mov	r10,[rbp - 64]
      mov	rax,r10
      mov	r10,[rbp - 152]
      xor	r10,rax
      mov 	r12,r10
      mov 	r10,r12
      mov	[rbp - 152],r10
      mov	r10,[rbp - 152]
      mov	rdi,r10
      mov	rsi,17
      mov	[rbp - 72],rdi
      mov	[rbp - 80],rsi
      mov	rdi,32767
      mov	rsi,65536
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	r10,[rbp - 8]
      sal	r10,16
      mov	[rbp - 24],r10
      mov	r10,[rbp - 16]
      or	r10,[rbp - 24]
_9check:
      mov	[rbp - 32],r10
      mov	r10,[rbp - 32]
      mov	rax,r10
      mov	r10,rax
      mov	cl,[rbp - 80]
      sar	r10,cl
      mov	[rbp - 88],r10
      mov	r10,[rbp - 88]
      sal	r10,2
      mov	[rbp - 96],r10
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 104],r10
      mov	r10,[rbp - 72]
      mov	cl,[rbp - 80]
      sar	r10,cl
      mov	[rbp - 112],r10
      mov	r10,[rbp - 104]
      and	r10,[rbp - 112]
_10check:
      mov	[rbp - 120],r10
      mov	rdi,32767
      mov	rsi,65535
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	r10,[rbp - 8]
      sal	r10,16
      mov	[rbp - 24],r10
      mov	r10,[rbp - 16]
      or	r10,[rbp - 24]
_11check:
      mov	[rbp - 32],r10
      mov	r10,[rbp - 32]
      mov	rax,r10
      mov	r10,[rbp - 120]
      and	r10,rax
_12check:
      mov	[rbp - 128],r10
      mov	r10,[rbp - 128]
      mov	rax,r10
      mov	r10,[rbp - 152]
      xor	r10,rax
      mov	[rbp - 184],r10
      mov	r10,[rbp - 184]
      mov	[rbp - 152],r10
      mov	r10,[rbp - 152]
      mov	rdi,r10
      mov	rsi,5
      mov	[rbp - 40],rdi
      mov	[rbp - 48],rsi
      mov	r10,[rbp - 40]
      mov	cl,[rbp - 48]
      sal	r10,cl
      mov	[rbp - 56],r10
      mov	rdi,32767
      mov	rsi,65535
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	r10,[rbp - 8]
      sal	r10,16
      mov	[rbp - 24],r10
      mov	r10,[rbp - 16]
      or	r10,[rbp - 24]
_13check:
      mov	[rbp - 32],r10
      mov	r10,[rbp - 32]
      mov	rax,r10
      mov	r10,[rbp - 56]
      and	r10,rax
_14check:
      mov	[rbp - 64],r10
      mov	r10,[rbp - 64]
      mov	rax,r10
      mov	r10,[rbp - 152]
      xor	r10,rax
      mov	[rbp - 192],r10
      mov	r10,[rbp - 192]
      mov	[rbp - 152],r10
_0while:
      mov	r10,[rbp - 168]
      mov	[rbp - 200],r10
      mov	r10,[rbp - 168]
      add	r10,1
      mov	[rbp - 168],r10
_0whilecheck:
      mov	r10,[rbp - 144]
      imul	r10,10
      mov	[rbp - 208],r10
      mov	r10,[rbp - 168]
      cmp	r10,[rbp - 208]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 216],r10
      mov	r10,[rbp -  216]
      cmp	r10,1
      je	_0for
_0forback:
      mov	r10,[rbp - 152]
      xor	r10,123456789
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
      sub	rsp,696
      call	getInt
      mov 	r12,rax
      mov 	r10,r12
      mov 	r8,r10
      mov 	r10,r8
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov 	rdi,r12
      push	r8
      call	malloc
      pop	r8
      mov 	r14,rax
      mov 	r10,r8
      mov	r11,r14
      add	r11,0
      mov	[r11],r10
      mov 	r10,r14
      mov 	r15,r10
      mov 	r13,0
_0arr:
      mov 	r10,r13
      add	r10,1
      mov 	r13,r10
      mov 	r10,r14
      add	r10,8
      mov 	r14,r10
      mov 	r10,r8
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov 	rdi,r12
      push	r13
      push	r14
      push	r15
      push	r8
      call	malloc
      pop	r8
      pop	r15
      pop	r14
      pop	r13
      mov 	r12,rax
      mov 	r10,r8
      mov	r11,r12
      add	r11,0
      mov	[r11],r10
      mov 	r10,r12
      mov	r11,r14
      add	r11,0
      mov	[r11],r10
      mov 	r10,r13
      cmp 	r10,r8
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_0arr
      mov 	r10,r15
      mov 	r15,r10
      mov	qword[rbp - 248],0
      jmp	_1whilecheck
_1for:
      mov	qword[rbp - 256],0
      jmp	_2whilecheck
_2for:
      mov 	rbx,0
      jmp	_3whilecheck
_3for:
      mov	r10,[rbp - 248]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,0
      je	_15check
      mov	r10,[rbp - 256]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov 	r13,r10
      mov 	r10,r12
      and 	r10,r13
_15check:
      mov 	r13,r10
      mov 	r10,r13
      cmp	r10,0
      je	_16check
      mov 	r10,rbx
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r13
      and 	r10,r12
_16check:
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_1else
_1if:
      mov	eax,[rbp - 248]
      mov	r10d,[rbp - 256]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov	eax,[rbp - 256]
      mov 	r10,rbx
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r13,rdx
      mov 	r10,r12
      cmp 	r10,r13
      setne r10b
      movzx r10,r10b
      mov 	r13,r10
      mov 	r10,r13
      cmp	r10,0
      je	_17check
      mov	eax,[rbp - 256]
      mov 	r10,rbx
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov 	rax,rbx
      mov	r10d,[rbp - 248]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r14,rdx
      mov 	r10,r12
      cmp 	r10,r14
      setne r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r13
      and 	r10,r12
_17check:
      mov 	r13,r10
      mov 	r10,r13
      cmp	r10,0
      je	_18check
      mov	eax,[rbp - 248]
      mov	r10d,[rbp - 256]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r14,rdx
      mov 	rax,rbx
      mov	r10d,[rbp - 248]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov 	r10,r14
      cmp 	r10,r12
      setne r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r13
      and 	r10,r12
_18check:
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_0else
_0if:
      mov	r10,[rbp - 248]
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov	r10,[rbp - 256]
      add	r10,1
      mov 	r14,r10
      mov 	r10,r14
      imul	r10,8
      mov 	r14,r10
      mov	r10,[rbp - 248]
      and	r10,[rbp - 256]
_19check:
      mov 	r12,r10
      mov 	r10,r12
      and 	r10,rbx
_20check:
      mov 	r9,r10
      mov	r10,[rbp - 248]
      add	r10,[rbp - 256]
      mov 	r12,r10
      mov 	r10,r12
      add 	r10,rbx
      mov 	r12,r10
      mov 	rdi,r9
      mov 	rsi,r12
      push	r13
      push	r14
      push	r15
      push	r8
      push	rbx
      call	xorshift
      pop	rbx
      pop	r8
      pop	r15
      pop	r14
      pop	r13
      mov 	r12,rax
      mov 	r10,r12
      mov	r11,r15
      add	r11,r13
      mov	r11,[r11]
      add	r11,r14
      mov	[r11],r10
      jmp	_0ifback
_0else:
_0ifback:
      jmp	_1ifback
_1else:
_1ifback:
_3while:
      mov 	r10,rbx
      add	r10,1
      mov 	rbx,r10
_3whilecheck:
      mov 	r10,rbx
      cmp 	r10,r8
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_3for
_3forback:
_2while:
      mov	r10,[rbp - 256]
      add	r10,1
      mov	[rbp - 256],r10
_2whilecheck:
      mov	r10,[rbp - 256]
      cmp 	r10,r8
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_2for
_2forback:
_1while:
      mov	r10,[rbp - 248]
      add	r10,1
      mov	[rbp - 248],r10
_1whilecheck:
      mov	r10,[rbp - 248]
      cmp 	r10,r8
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_1for
_1forback:
      mov 	r14,0
      mov	qword[rbp - 248],0
      jmp	_4whilecheck
_4for:
      mov	qword[rbp - 256],0
      jmp	_5whilecheck
_5for:
      mov 	rbx,0
      jmp	_6whilecheck
_6for:
      mov	r10,[rbp - 248]
      cmp	r10,[rbp - 256]
      setge r10b
      movzx r10,r10b
      mov 	r13,r10
      mov 	r10,r13
      cmp	r10,0
      je	_21check
      mov	r10,[rbp - 256]
      cmp 	r10,rbx
      setge r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r13
      and 	r10,r12
_21check:
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_2else
_2if:
      mov	r10,[rbp - 248]
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov	r10,[rbp - 256]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov 	r10,r14
      mov	r11,r15
      add	r11,r13
      mov	r11,[r11]
      add	r11,r12
      add	r10,[r11]
      mov 	r12,r10
      mov 	r10,r12
      and	r10,1073741823
_22check:
      mov 	r12,r10
      mov 	r10,r12
      mov 	r14,r10
      jmp	_2ifback
_2else:
_2ifback:
_6while:
      mov 	r10,rbx
      add	r10,1
      mov 	rbx,r10
_6whilecheck:
      mov 	r10,rbx
      cmp 	r10,r8
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_6for
_6forback:
_5while:
      mov	r10,[rbp - 256]
      add	r10,1
      mov	[rbp - 256],r10
_5whilecheck:
      mov	r10,[rbp - 256]
      cmp 	r10,r8
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_5for
_5forback:
_4while:
      mov	r10,[rbp - 248]
      add	r10,1
      mov	[rbp - 248],r10
_4whilecheck:
      mov	r10,[rbp - 248]
      cmp 	r10,r8
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_4for
_4forback:
      mov 	r13,lcstr0
      mov 	rdi,r14
      push	r13
      call	toString
      pop	r13
      mov 	r12,rax
      mov 	rdi,r13
      mov 	rsi,r12
      call	string.add
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

	dq 7
lcstr0:
	db	65,110,115,32,105,115,32,0
section .bss
stringbuffer:
	resb 256

