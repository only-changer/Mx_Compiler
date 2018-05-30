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
push    rbp
mov     rbp, rsp
sub     rsp, 32
 mov     qword [rbp-18H], rdi
mov     qword [rbp-20H], rsi
mov     edi, 256
call    malloc
 mov     qword [rbp-8H], rax
 mov     dword [rbp-10H], 0
mov     dword [rbp-0CH], 0
jmp     Lc_002
Lc_001: 
mov     eax, dword [rbp-10H]
movsxd  rdx, eax
mov     rax, qword [rbp-8H]
add     rdx, rax
mov     eax, dword [rbp-10H]
movsxd  rcx, eax
 mov     rax, qword [rbp-18H]
add     rax, rcx
movzx   eax, byte [rax]
mov     byte [rdx], al
add     dword [rbp-10H], 1
Lc_002: 
mov     eax, dword [rbp-10H]
movsxd  rdx, eax
mov     rax, qword [rbp-18H]
 add     rax, rdx
movzx   eax, byte [rax]
test    al, al
jnz     Lc_001
jmp     Lc_004
Lc_003:  
mov     edx, dword [rbp-0CH]
mov     eax, dword [rbp-10H]
add     eax, edx
movsxd  rdx, eax
mov     rax, qword [rbp-8H]
add     rdx, rax
mov     eax, dword [rbp-0CH]
movsxd  rcx, eax
mov     rax, qword [rbp-20H]
add     rax, rcx
 movzx   eax, byte [rax]
mov     byte [rdx], al
add     dword [rbp-0CH], 1
Lc_004: 
mov     eax, dword [rbp-0CH]
movsxd  rdx, eax
mov     rax, qword [rbp-20H]
add     rax, rdx
movzx   eax, byte [rax]
test    al, al
jnz     Lc_003
mov     edx, dword [rbp-10H]
 mov     eax, dword [rbp-0CH]
add     eax, edx
movsxd  rdx, eax
 mov     rax, qword [rbp-8H]
add     rax, rdx
mov     byte [rax], 0
mov     rax, qword [rbp-8H]
leave
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
main:
      push	rbp
      mov	rbp,rsp
      sub	rsp,880
      mov	qword[h],99
      mov	qword[i],100
      mov	qword[j],101
      mov	qword[k],102
      mov	qword[total],0
      push	r10
      push	r11
      call	getInt
      pop	r11
      pop	r10
      mov	[rbp -  56],rax
      mov	r10,[rbp - 56]
      mov	[N],r10
      mov	qword[rbp - 8],1
_5for:
      mov	qword[rbp - 16],1
_4for:
      mov	qword[rbp - 24],1
_3for:
      mov	qword[rbp - 32],1
_2for:
      mov	qword[rbp - 40],1
_1for:
      mov	qword[rbp - 48],1
_0for:
      mov	r10,[rbp - 8]
      cmp	r10,[rbp - 16]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 72],r10
      mov	r10,[rbp - 8]
      cmp	r10,[rbp - 24]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 80],r10
      mov	r10,[rbp - 72]
      and	r10,[rbp - 80]
      mov	[rbp - 88],r10
      mov	r10,[rbp - 8]
      cmp	r10,[rbp - 32]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 96],r10
      mov	r10,[rbp - 88]
      and	r10,[rbp - 96]
      mov	[rbp - 104],r10
      mov	r10,[rbp - 8]
      cmp	r10,[rbp - 40]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 112],r10
      mov	r10,[rbp - 104]
      and	r10,[rbp - 112]
      mov	[rbp - 120],r10
      mov	r10,[rbp - 8]
      cmp	r10,[rbp - 48]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 128],r10
      mov	r10,[rbp - 120]
      and	r10,[rbp - 128]
      mov	[rbp - 136],r10
      mov	r10,[rbp - 8]
      cmp	r10,[h]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 144],r10
      mov	r10,[rbp - 136]
      and	r10,[rbp - 144]
      mov	[rbp - 152],r10
      mov	r10,[rbp - 8]
      cmp	r10,[i]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 160],r10
      mov	r10,[rbp - 152]
      and	r10,[rbp - 160]
      mov	[rbp - 168],r10
      mov	r10,[rbp - 8]
      cmp	r10,[j]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 176],r10
      mov	r10,[rbp - 168]
      and	r10,[rbp - 176]
      mov	[rbp - 184],r10
      mov	r10,[rbp - 8]
      cmp	r10,[k]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 192],r10
      mov	r10,[rbp - 184]
      and	r10,[rbp - 192]
      mov	[rbp - 200],r10
      mov	r10,[rbp - 16]
      cmp	r10,[rbp - 24]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 208],r10
      mov	r10,[rbp - 200]
      and	r10,[rbp - 208]
      mov	[rbp - 216],r10
      mov	r10,[rbp - 16]
      cmp	r10,[rbp - 32]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 224],r10
      mov	r10,[rbp - 216]
      and	r10,[rbp - 224]
      mov	[rbp - 232],r10
      mov	r10,[rbp - 16]
      cmp	r10,[rbp - 40]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 240],r10
      mov	r10,[rbp - 232]
      and	r10,[rbp - 240]
      mov	[rbp - 248],r10
      mov	r10,[rbp - 16]
      cmp	r10,[rbp - 48]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 256],r10
      mov	r10,[rbp - 248]
      and	r10,[rbp - 256]
      mov	[rbp - 264],r10
      mov	r10,[rbp - 16]
      cmp	r10,[h]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 272],r10
      mov	r10,[rbp - 264]
      and	r10,[rbp - 272]
      mov	[rbp - 280],r10
      mov	r10,[rbp - 16]
      cmp	r10,[i]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 288],r10
      mov	r10,[rbp - 280]
      and	r10,[rbp - 288]
      mov	[rbp - 296],r10
      mov	r10,[rbp - 16]
      cmp	r10,[j]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 304],r10
      mov	r10,[rbp - 296]
      and	r10,[rbp - 304]
      mov	[rbp - 312],r10
      mov	r10,[rbp - 16]
      cmp	r10,[k]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 320],r10
      mov	r10,[rbp - 312]
      and	r10,[rbp - 320]
      mov	[rbp - 328],r10
      mov	r10,[rbp - 24]
      cmp	r10,[rbp - 32]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 336],r10
      mov	r10,[rbp - 328]
      and	r10,[rbp - 336]
      mov	[rbp - 344],r10
      mov	r10,[rbp - 24]
      cmp	r10,[rbp - 40]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 352],r10
      mov	r10,[rbp - 344]
      and	r10,[rbp - 352]
      mov	[rbp - 360],r10
      mov	r10,[rbp - 24]
      cmp	r10,[rbp - 48]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 368],r10
      mov	r10,[rbp - 360]
      and	r10,[rbp - 368]
      mov	[rbp - 376],r10
      mov	r10,[rbp - 24]
      cmp	r10,[h]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 384],r10
      mov	r10,[rbp - 376]
      and	r10,[rbp - 384]
      mov	[rbp - 392],r10
      mov	r10,[rbp - 24]
      cmp	r10,[i]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 400],r10
      mov	r10,[rbp - 392]
      and	r10,[rbp - 400]
      mov	[rbp - 408],r10
      mov	r10,[rbp - 24]
      cmp	r10,[j]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 416],r10
      mov	r10,[rbp - 408]
      and	r10,[rbp - 416]
      mov	[rbp - 424],r10
      mov	r10,[rbp - 24]
      cmp	r10,[k]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 432],r10
      mov	r10,[rbp - 424]
      and	r10,[rbp - 432]
      mov	[rbp - 440],r10
      mov	r10,[rbp - 32]
      cmp	r10,[rbp - 40]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 448],r10
      mov	r10,[rbp - 440]
      and	r10,[rbp - 448]
      mov	[rbp - 456],r10
      mov	r10,[rbp - 32]
      cmp	r10,[rbp - 48]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 464],r10
      mov	r10,[rbp - 456]
      and	r10,[rbp - 464]
      mov	[rbp - 472],r10
      mov	r10,[rbp - 32]
      cmp	r10,[h]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 480],r10
      mov	r10,[rbp - 472]
      and	r10,[rbp - 480]
      mov	[rbp - 488],r10
      mov	r10,[rbp - 32]
      cmp	r10,[i]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 496],r10
      mov	r10,[rbp - 488]
      and	r10,[rbp - 496]
      mov	[rbp - 504],r10
      mov	r10,[rbp - 32]
      cmp	r10,[j]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 512],r10
      mov	r10,[rbp - 504]
      and	r10,[rbp - 512]
      mov	[rbp - 520],r10
      mov	r10,[rbp - 32]
      cmp	r10,[k]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 528],r10
      mov	r10,[rbp - 520]
      and	r10,[rbp - 528]
      mov	[rbp - 536],r10
      mov	r10,[rbp - 40]
      cmp	r10,[rbp - 48]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 544],r10
      mov	r10,[rbp - 536]
      and	r10,[rbp - 544]
      mov	[rbp - 552],r10
      mov	r10,[rbp - 40]
      cmp	r10,[h]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 560],r10
      mov	r10,[rbp - 552]
      and	r10,[rbp - 560]
      mov	[rbp - 568],r10
      mov	r10,[rbp - 40]
      cmp	r10,[i]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 576],r10
      mov	r10,[rbp - 568]
      and	r10,[rbp - 576]
      mov	[rbp - 584],r10
      mov	r10,[rbp - 40]
      cmp	r10,[j]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 592],r10
      mov	r10,[rbp - 584]
      and	r10,[rbp - 592]
      mov	[rbp - 600],r10
      mov	r10,[rbp - 40]
      cmp	r10,[k]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 608],r10
      mov	r10,[rbp - 600]
      and	r10,[rbp - 608]
      mov	[rbp - 616],r10
      mov	r10,[rbp - 48]
      cmp	r10,[h]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 624],r10
      mov	r10,[rbp - 616]
      and	r10,[rbp - 624]
      mov	[rbp - 632],r10
      mov	r10,[rbp - 48]
      cmp	r10,[i]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 640],r10
      mov	r10,[rbp - 632]
      and	r10,[rbp - 640]
      mov	[rbp - 648],r10
      mov	r10,[rbp - 48]
      cmp	r10,[j]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 656],r10
      mov	r10,[rbp - 648]
      and	r10,[rbp - 656]
      mov	[rbp - 664],r10
      mov	r10,[rbp - 48]
      cmp	r10,[k]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 672],r10
      mov	r10,[rbp - 664]
      and	r10,[rbp - 672]
      mov	[rbp - 680],r10
      mov	r10,[i]
      cmp	r10,[j]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 688],r10
      mov	r10,[rbp - 680]
      and	r10,[rbp - 688]
      mov	[rbp - 696],r10
      mov	r10,[h]
      cmp	r10,[k]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 704],r10
      mov	r10,[rbp - 696]
      and	r10,[rbp - 704]
      mov	[rbp - 712],r10
      mov	 r10,[rbp-712]
      cmp	 r10,0
      je	_0else
_0if:
      mov	r10,[total]
      mov	[rbp-64],r10
      mov	r10,[total]
      add	r10,1
      mov	[ total],r10
      jmp	_0ifback
_0else:
_0ifback:
      mov	r10,[rbp - 48]
      mov	[rbp - 720],r10
      mov	r10,[rbp - 48]
      add	r10,1
      mov	[rbp - 48],r10
      mov	r10,[rbp - 48]
      cmp	r10,[N]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 728],r10
      mov	r10,[rbp -  728]
      cmp	r10,1
      je	_0for
_0forback:
      mov	r10,[rbp - 40]
      mov	[rbp - 744],r10
      mov	r10,[rbp - 40]
      add	r10,1
      mov	[rbp - 40],r10
      mov	r10,[rbp - 40]
      cmp	r10,[N]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 752],r10
      mov	r10,[rbp -  752]
      cmp	r10,1
      je	_1for
_1forback:
      mov	r10,[rbp - 32]
      mov	[rbp - 768],r10
      mov	r10,[rbp - 32]
      add	r10,1
      mov	[rbp - 32],r10
      mov	r10,[rbp - 32]
      cmp	r10,[N]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 776],r10
      mov	r10,[rbp -  776]
      cmp	r10,1
      je	_2for
_2forback:
      mov	r10,[rbp - 24]
      mov	[rbp - 792],r10
      mov	r10,[rbp - 24]
      add	r10,1
      mov	[rbp - 24],r10
      mov	r10,[rbp - 24]
      cmp	r10,[N]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 800],r10
      mov	r10,[rbp -  800]
      cmp	r10,1
      je	_3for
_3forback:
      mov	r10,[rbp - 16]
      mov	[rbp - 816],r10
      mov	r10,[rbp - 16]
      add	r10,1
      mov	[rbp - 16],r10
      mov	r10,[rbp - 16]
      cmp	r10,[N]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 824],r10
      mov	r10,[rbp -  824]
      cmp	r10,1
      je	_4for
_4forback:
      mov	r10,[rbp - 8]
      mov	[rbp - 840],r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov	[rbp - 8],r10
      mov	r10,[rbp - 8]
      cmp	r10,[N]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 848],r10
      mov	r10,[rbp -  848]
      cmp	r10,1
      je	_5for
_5forback:
      mov	rdi,[total]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  864],rax
      mov	rdi,[rbp-864]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  872],rax
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

N:
	dq 0
h:
	dq 0
i:
	dq 0
j:
	dq 0
k:
	dq 0
total:
	dq 0
section .bss
stringbuffer:
	resb 256

