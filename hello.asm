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
hex2int:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 8],rdi
      mov	qword[rbp - 24],0
      mov	qword[rbp - 16],0
_0for:
      mov	rdi,[rbp-8]
      mov	rsi,[rbp-16]
      push	r10
      push	r11
      call	string.ord
      pop	r11
      pop	r10
      mov	[rbp -  40],rax
      mov	r10,[rbp - 40]
      mov	[rbp - 32],r10
      mov	r10,[rbp - 32]
      cmp	r10,48
      setge r10b
      movzx r10,r10b
      mov	[rbp - 184],r10
      mov	r10,[rbp - 184]
      cmp	r10,0
      je	_0check
      mov	r10,[rbp - 32]
      cmp	r10,57
      setle r10b
      movzx r10,r10b
      mov	[rbp - 192],r10
      mov	r10,[rbp - 184]
      and	r10,[rbp - 192]
_0check:
      mov	[rbp - 200],r10
      mov	 r10,[rbp-200]
      cmp	 r10,0
      je	_0else
_0if:
      mov	r10,[rbp - 24]
      imul	r10,16
      mov	[rbp - 48],r10
      mov	r10,[rbp - 48]
      add	r10,[rbp - 32]
      mov	[rbp - 56],r10
      mov	r10,[rbp - 56]
      sub	r10,48
      mov	[rbp - 64],r10
      mov	r10,[rbp - 64]
      mov	[rbp - 24],r10
      jmp	_0ifback
_0else:
      mov	r10,[rbp - 32]
      cmp	r10,65
      setge r10b
      movzx r10,r10b
      mov	[rbp - 160],r10
      mov	r10,[rbp - 160]
      cmp	r10,0
      je	_1check
      mov	r10,[rbp - 32]
      cmp	r10,70
      setle r10b
      movzx r10,r10b
      mov	[rbp - 168],r10
      mov	r10,[rbp - 160]
      and	r10,[rbp - 168]
_1check:
      mov	[rbp - 176],r10
      mov	 r10,[rbp-176]
      cmp	 r10,0
      je	_1else
_1if:
      mov	r10,[rbp - 24]
      imul	r10,16
      mov	[rbp - 72],r10
      mov	r10,[rbp - 72]
      add	r10,[rbp - 32]
      mov	[rbp - 80],r10
      mov	r10,[rbp - 80]
      sub	r10,65
      mov	[rbp - 88],r10
      mov	r10,[rbp - 88]
      add	r10,10
      mov	[rbp - 96],r10
      mov	r10,[rbp - 96]
      mov	[rbp - 24],r10
      jmp	_1ifback
_1else:
      mov	r10,[rbp - 32]
      cmp	r10,97
      setge r10b
      movzx r10,r10b
      mov	[rbp - 136],r10
      mov	r10,[rbp - 136]
      cmp	r10,0
      je	_2check
      mov	r10,[rbp - 32]
      cmp	r10,102
      setle r10b
      movzx r10,r10b
      mov	[rbp - 144],r10
      mov	r10,[rbp - 136]
      and	r10,[rbp - 144]
_2check:
      mov	[rbp - 152],r10
      mov	 r10,[rbp-152]
      cmp	 r10,0
      je	_2else
_2if:
      mov	r10,[rbp - 24]
      imul	r10,16
      mov	[rbp - 104],r10
      mov	r10,[rbp - 104]
      add	r10,[rbp - 32]
      mov	[rbp - 112],r10
      mov	r10,[rbp - 112]
      sub	r10,97
      mov	[rbp - 120],r10
      mov	r10,[rbp - 120]
      add	r10,10
      mov	[rbp - 128],r10
      mov	r10,[rbp - 128]
      mov	[rbp - 24],r10
      jmp	_2ifback
_2else:
      mov	rax,0
      mov	rsp,rbp
      pop rbp
      ret
_2ifback:
_1ifback:
_0ifback:
_0while:
      mov	r10,[rbp - 16]
      mov	[rbp - 208],r10
      mov	r10,[rbp - 16]
      add	r10,1
      mov	[rbp - 16],r10
      mov	rdi,[rbp-8]
      push	r10
      push	r11
      call	string.length
      pop	r11
      pop	r10
      mov	[rbp -  216],rax
      mov	r10,[rbp - 16]
      cmp	r10,[rbp - 216]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 224],r10
      mov	r10,[rbp -  224]
      cmp	r10,1
      je	_0for
_0forback:
      mov	rax,[rbp -  24]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
int2chr:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 240],rdi
      mov	r10,[rbp - 240]
      cmp	r10,32
      setge r10b
      movzx r10,r10b
      mov	[rbp - 272],r10
      mov	r10,[rbp - 272]
      cmp	r10,0
      je	_3check
      mov	r10,[rbp - 240]
      cmp	r10,126
      setle r10b
      movzx r10,r10b
      mov	[rbp - 280],r10
      mov	r10,[rbp - 272]
      and	r10,[rbp - 280]
_3check:
      mov	[rbp - 288],r10
      mov	 r10,[rbp-288]
      cmp	 r10,0
      je	_3else
_3if:
      mov	r10,[rbp - 240]
      sub	r10,32
      mov	[rbp - 248],r10
      mov	r10,[rbp - 240]
      sub	r10,32
      mov	[rbp - 256],r10
      mov	rdi,[lcasciiTable]
      mov	rsi,[rbp-248]
      mov	rdx,[rbp-256]
      push	r10
      push	r11
      call	string.substring
      pop	r11
      pop	r10
      mov	[rbp -  264],rax
      mov	rax,[rbp -  264]
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_3ifback
_3else:
_3ifback:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],0
      mov	[rbp - 296],rax
      mov	rax,[rbp -  296]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
toStringHex:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 304],rdi
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],0
      mov	[rbp - 320],rax
      mov	r10,[rbp - 320]
      mov	[rbp - 312],r10
      mov	qword[rbp - 328],28
_1for:
      mov	r10,[rbp - 304]
      mov	cl,[rbp - 328]
      shr	r10,cl
      mov	[rbp - 344],r10
      mov	r10,[rbp - 344]
      and	r10,15
_4check:
      mov	[rbp - 352],r10
      mov	r10,[rbp - 352]
      mov	[rbp - 336],r10
      mov	r10,[rbp - 336]
      cmp	r10,10
      setl r10b
      movzx r10,r10b
      mov	[rbp - 416],r10
      mov	 r10,[rbp-416]
      cmp	 r10,0
      je	_4else
_4if:
      mov	r10,48
      add	r10,[rbp - 336]
      mov	[rbp - 360],r10
      mov	rdi,[rbp-360]
      push	r10
      push	r11
      call	int2chr
      pop	r11
      pop	r10
      mov	[rbp -  368],rax
      mov	rdi,[rbp-312]
      mov	rsi,[rbp-368]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  376],rax
      mov	r10,[rbp - 376]
      mov	[rbp - 312],r10
      jmp	_4ifback
_4else:
      mov	r10,65
      add	r10,[rbp - 336]
      mov	[rbp - 384],r10
      mov	r10,[rbp - 384]
      sub	r10,10
      mov	[rbp - 392],r10
      mov	rdi,[rbp-392]
      push	r10
      push	r11
      call	int2chr
      pop	r11
      pop	r10
      mov	[rbp -  400],rax
      mov	rdi,[rbp-312]
      mov	rsi,[rbp-400]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  408],rax
      mov	r10,[rbp - 408]
      mov	[rbp - 312],r10
_4ifback:
_1while:
      mov	r10,[rbp - 328]
      sub	r10,4
      mov	[rbp - 424],r10
      mov	r10,[rbp - 424]
      mov	[rbp - 328],r10
      mov	r10,[rbp - 328]
      cmp	r10,0
      setge r10b
      movzx r10,r10b
      mov	[rbp - 432],r10
      mov	r10,[rbp -  432]
      cmp	r10,1
      je	_1for
_1forback:
      mov	rax,[rbp -  312]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
rotate_left:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 440],rdi
      mov	[rbp - 448],rsi
      mov	r10,[rbp - 448]
      cmp	r10,1
      sete r10b
      movzx r10,r10b
      mov	[rbp - 496],r10
      mov	 r10,[rbp-496]
      cmp	 r10,0
      je	_5else
_5if:
      mov	r10,[rbp - 440]
      and	r10,2147483647
_5check:
      mov	[rbp - 456],r10
      mov	r10,[rbp - 456]
      shl	r10,1
      mov	[rbp - 464],r10
      mov	r10,[rbp - 440]
      shr	r10,31
      mov	[rbp - 472],r10
      mov	r10,[rbp - 472]
      and	r10,1
_6check:
      mov	[rbp - 480],r10
      mov	r10,[rbp - 464]
      or	r10,[rbp - 480]
_7check:
      mov	[rbp - 488],r10
      mov	rax,[rbp -  488]
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_5ifback
_5else:
_5ifback:
      mov	r10,[rbp - 448]
      cmp	r10,31
      sete r10b
      movzx r10,r10b
      mov	[rbp - 544],r10
      mov	 r10,[rbp-544]
      cmp	 r10,0
      je	_6else
_6if:
      mov	r10,[rbp - 440]
      and	r10,1
_8check:
      mov	[rbp - 504],r10
      mov	r10,[rbp - 504]
      shl	r10,31
      mov	[rbp - 512],r10
      mov	r10,[rbp - 440]
      shr	r10,1
      mov	[rbp - 520],r10
      mov	r10,[rbp - 520]
      and	r10,2147483647
_9check:
      mov	[rbp - 528],r10
      mov	r10,[rbp - 512]
      or	r10,[rbp - 528]
_10check:
      mov	[rbp - 536],r10
      mov	rax,[rbp -  536]
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_6ifback
_6else:
_6ifback:
      mov	r10,32
      sub	r10,[rbp - 448]
      mov	[rbp - 552],r10
      mov	r10,1
      mov	cl,[rbp - 552]
      shl	r10,cl
      mov	[rbp - 560],r10
      mov	r10,[rbp - 560]
      sub	r10,1
      mov	[rbp - 568],r10
      mov	r10,[rbp - 440]
      and	r10,[rbp - 568]
_11check:
      mov	[rbp - 576],r10
      mov	r10,[rbp - 576]
      mov	cl,[rbp - 448]
      shl	r10,cl
      mov	[rbp - 584],r10
      mov	r10,32
      sub	r10,[rbp - 448]
      mov	[rbp - 592],r10
      mov	r10,[rbp - 440]
      mov	cl,[rbp - 592]
      shr	r10,cl
      mov	[rbp - 600],r10
      mov	r10,1
      mov	cl,[rbp - 448]
      shl	r10,cl
      mov	[rbp - 608],r10
      mov	r10,[rbp - 608]
      sub	r10,1
      mov	[rbp - 616],r10
      mov	r10,[rbp - 600]
      and	r10,[rbp - 616]
_12check:
      mov	[rbp - 624],r10
      mov	r10,[rbp - 584]
      or	r10,[rbp - 624]
_13check:
      mov	[rbp - 632],r10
      mov	rax,[rbp -  632]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
add:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 640],rdi
      mov	[rbp - 648],rsi
      mov	r10,[rbp - 640]
      and	r10,65535
_14check:
      mov	[rbp - 664],r10
      mov	r10,[rbp - 648]
      and	r10,65535
_15check:
      mov	[rbp - 672],r10
      mov	r10,[rbp - 664]
      add	r10,[rbp - 672]
      mov	[rbp - 680],r10
      mov	r10,[rbp - 680]
      mov	[rbp - 656],r10
      mov	r10,[rbp - 640]
      shr	r10,16
      mov	[rbp - 696],r10
      mov	r10,[rbp - 696]
      and	r10,65535
_16check:
      mov	[rbp - 704],r10
      mov	r10,[rbp - 648]
      shr	r10,16
      mov	[rbp - 712],r10
      mov	r10,[rbp - 712]
      and	r10,65535
_17check:
      mov	[rbp - 720],r10
      mov	r10,[rbp - 704]
      add	r10,[rbp - 720]
      mov	[rbp - 728],r10
      mov	r10,[rbp - 656]
      shr	r10,16
      mov	[rbp - 736],r10
      mov	r10,[rbp - 728]
      add	r10,[rbp - 736]
      mov	[rbp - 744],r10
      mov	r10,[rbp - 744]
      and	r10,65535
_18check:
      mov	[rbp - 752],r10
      mov	r10,[rbp - 752]
      mov	[rbp - 688],r10
      mov	r10,[rbp - 688]
      shl	r10,16
      mov	[rbp - 760],r10
      mov	r10,[rbp - 656]
      and	r10,65535
_19check:
      mov	[rbp - 768],r10
      mov	r10,[rbp - 760]
      or	r10,[rbp - 768]
_20check:
      mov	[rbp - 776],r10
      mov	rax,[rbp -  776]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
lohi:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 784],rdi
      mov	[rbp - 792],rsi
      mov	r10,[rbp - 792]
      shl	r10,16
      mov	[rbp - 800],r10
      mov	r10,[rbp - 784]
      or	r10,[rbp - 800]
_21check:
      mov	[rbp - 808],r10
      mov	rax,[rbp -  808]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
sha1:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 928],rdi
      mov	[rbp - 936],rsi
      mov	r10,[rbp - 936]
      add	r10,64
      mov	[rbp - 952],r10
      mov	r10,[rbp - 952]
      sub	r10,56
      mov	[rbp - 960],r10
      mov	eax,[rbp - 960]
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 968],rax
      mov	r10,[rbp - 968]
      add	r10,1
      mov	[rbp - 976],r10
      mov	r10,[rbp - 976]
      mov	[rbp - 944],r10
      mov	r10,[rbp - 944]
      cmp	r10,[lcMAXCHUNK]
      setg r10b
      movzx r10,r10b
      mov	[rbp - 1000],r10
      mov	 r10,[rbp-1000]
      cmp	 r10,0
      je	_7else
_7if:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'n'
      mov	byte[rax + 1],'C'
      mov	byte[rax + 2],'h'
      mov	byte[rax + 3],'u'
      mov	byte[rax + 4],'n'
      mov	byte[rax + 5],'k'
      mov	byte[rax + 6],' '
      mov	byte[rax + 7],'>'
      mov	byte[rax + 8],' '
      mov	byte[rax + 9],'M'
      mov	byte[rax + 10],'A'
      mov	byte[rax + 11],'X'
      mov	byte[rax + 12],'C'
      mov	byte[rax + 13],'H'
      mov	byte[rax + 14],'U'
      mov	byte[rax + 15],'N'
      mov	byte[rax + 16],'K'
      mov	byte[rax + 17],'!'
      mov	byte[rax + 18],0
      mov	[rbp - 984],rax
      mov	rdi,[rbp-984]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  992],rax
      mov	rax,0
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_7ifback
_7else:
_7ifback:
      mov	qword[rbp - 1008],0
_2for:
      mov	qword[rbp - 1016],0
_3for:
      mov	r10,[rbp - 1008]
      add	r10,1
      mov	[rbp - 1040],r10
      mov	r10,[rbp - 1040]
      imul	r10,8
      mov	[rbp - 1040],r10
      mov	r10,[rbp - 1016]
      add	r10,1
      mov	[rbp - 1048],r10
      mov	r10,[rbp - 1048]
      imul	r10,8
      mov	[rbp - 1048],r10
      mov	r11,[lcchunks]
      add	r11,[rbp - 1040]
      mov	r11,[r11]
      add	r11,[rbp - 1048]
      mov	qword[r11],0
_3while:
      mov	r10,[rbp - 1016]
      mov	[rbp - 1056],r10
      mov	r10,[rbp - 1016]
      add	r10,1
      mov	[rbp - 1016],r10
      mov	r10,[rbp - 1016]
      cmp	r10,80
      setl r10b
      movzx r10,r10b
      mov	[rbp - 1064],r10
      mov	r10,[rbp -  1064]
      cmp	r10,1
      je	_3for
_3forback:
_2while:
      mov	r10,[rbp - 1008]
      mov	[rbp - 1072],r10
      mov	r10,[rbp - 1008]
      add	r10,1
      mov	[rbp - 1008],r10
      mov	r10,[rbp - 1008]
      cmp	r10,[rbp - 944]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 1080],r10
      mov	r10,[rbp -  1080]
      cmp	r10,1
      je	_2for
_2forback:
      mov	qword[rbp - 1008],0
_4for:
      mov	eax,[rbp - 1008]
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 1104],rax
      mov	r10,[rbp - 1104]
      add	r10,1
      mov	[rbp - 1112],r10
      mov	r10,[rbp - 1112]
      imul	r10,8
      mov	[rbp - 1112],r10
      mov	eax,[rbp - 1008]
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 1120],rdx
      mov	eax,[rbp - 1120]
      mov	r10d,4
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 1128],rax
      mov	r10,[rbp - 1128]
      add	r10,1
      mov	[rbp - 1136],r10
      mov	r10,[rbp - 1136]
      imul	r10,8
      mov	[rbp - 1136],r10
      mov	eax,[rbp - 1008]
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 1160],rax
      mov	r10,[rbp - 1160]
      add	r10,1
      mov	[rbp - 1168],r10
      mov	r10,[rbp - 1168]
      imul	r10,8
      mov	[rbp - 1168],r10
      mov	eax,[rbp - 1008]
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 1176],rdx
      mov	eax,[rbp - 1176]
      mov	r10d,4
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 1184],rax
      mov	r10,[rbp - 1184]
      add	r10,1
      mov	[rbp - 1192],r10
      mov	r10,[rbp - 1192]
      imul	r10,8
      mov	[rbp - 1192],r10
      mov	r10,[rbp - 1008]
      add	r10,1
      mov	[rbp - 1216],r10
      mov	r10,[rbp - 1216]
      imul	r10,8
      mov	[rbp - 1216],r10
      mov	eax,[rbp - 1008]
      mov	r10d,4
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 1224],rdx
      mov	r10,3
      sub	r10,[rbp - 1224]
      mov	[rbp - 1232],r10
      mov	r10,[rbp - 1232]
      imul	r10,8
      mov	[rbp - 1240],r10
      mov	r10,[rbp - 928]
      mov	cl,[rbp - 1240]
      shl	r10,cl
      mov	[rbp - 1248],r10
      mov	r10,[lcchunks]
      or	r10,[rbp - 1248]
_22check:
      mov	[rbp - 1256],r10
      mov	r10,[rbp - 1256]
      mov	r11,[lcchunks]
      add	r11,[rbp - 1112]
      mov	r11,[r11]
      add	r11,[rbp - 1136]
      mov	[r11],r10
_4while:
      mov	r10,[rbp - 1008]
      mov	[rbp - 1264],r10
      mov	r10,[rbp - 1008]
      add	r10,1
      mov	[rbp - 1008],r10
      mov	r10,[rbp - 1008]
      cmp	r10,[rbp - 936]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 1272],r10
      mov	r10,[rbp -  1272]
      cmp	r10,1
      je	_4for
_4forback:
      mov	eax,[rbp - 1008]
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 1296],rax
      mov	r10,[rbp - 1296]
      add	r10,1
      mov	[rbp - 1304],r10
      mov	r10,[rbp - 1304]
      imul	r10,8
      mov	[rbp - 1304],r10
      mov	eax,[rbp - 1008]
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 1312],rdx
      mov	eax,[rbp - 1312]
      mov	r10d,4
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 1320],rax
      mov	r10,[rbp - 1320]
      add	r10,1
      mov	[rbp - 1328],r10
      mov	r10,[rbp - 1328]
      imul	r10,8
      mov	[rbp - 1328],r10
      mov	eax,[rbp - 1008]
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 1352],rax
      mov	r10,[rbp - 1352]
      add	r10,1
      mov	[rbp - 1360],r10
      mov	r10,[rbp - 1360]
      imul	r10,8
      mov	[rbp - 1360],r10
      mov	eax,[rbp - 1008]
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 1368],rdx
      mov	eax,[rbp - 1368]
      mov	r10d,4
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 1376],rax
      mov	r10,[rbp - 1376]
      add	r10,1
      mov	[rbp - 1384],r10
      mov	r10,[rbp - 1384]
      imul	r10,8
      mov	[rbp - 1384],r10
      mov	eax,[rbp - 1008]
      mov	r10d,4
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 1392],rdx
      mov	r10,3
      sub	r10,[rbp - 1392]
      mov	[rbp - 1400],r10
      mov	r10,[rbp - 1400]
      imul	r10,8
      mov	[rbp - 1408],r10
      mov	r10,128
      mov	cl,[rbp - 1408]
      shl	r10,cl
      mov	[rbp - 1416],r10
      mov	r10,[lcchunks]
      or	r10,[rbp - 1416]
_23check:
      mov	[rbp - 1424],r10
      mov	r10,[rbp - 1424]
      mov	r11,[lcchunks]
      add	r11,[rbp - 1304]
      mov	r11,[r11]
      add	r11,[rbp - 1328]
      mov	[r11],r10
      mov	r10,[rbp - 944]
      sub	r10,1
      mov	[rbp - 1448],r10
      mov	r10,[rbp - 1448]
      add	r10,1
      mov	[rbp - 1456],r10
      mov	r10,[rbp - 1456]
      imul	r10,8
      mov	[rbp - 1456],r10
      mov	r10,15
      add	r10,1
      mov	[rbp - 1464],r10
      mov	r10,[rbp - 1464]
      imul	r10,8
      mov	[rbp - 1464],r10
      mov	r10,[rbp - 936]
      shl	r10,3
      mov	[rbp - 1472],r10
      mov	r10,[rbp - 1472]
      mov	r11,[lcchunks]
      add	r11,[rbp - 1456]
      mov	r11,[r11]
      add	r11,[rbp - 1464]
      mov	[r11],r10
      mov	r10,[rbp - 944]
      sub	r10,1
      mov	[rbp - 1496],r10
      mov	r10,[rbp - 1496]
      add	r10,1
      mov	[rbp - 1504],r10
      mov	r10,[rbp - 1504]
      imul	r10,8
      mov	[rbp - 1504],r10
      mov	r10,14
      add	r10,1
      mov	[rbp - 1512],r10
      mov	r10,[rbp - 1512]
      imul	r10,8
      mov	[rbp - 1512],r10
      mov	r10,[rbp - 936]
      shr	r10,29
      mov	[rbp - 1520],r10
      mov	r10,[rbp - 1520]
      and	r10,7
_24check:
      mov	[rbp - 1528],r10
      mov	r10,[rbp - 1528]
      mov	r11,[lcchunks]
      add	r11,[rbp - 1504]
      mov	r11,[r11]
      add	r11,[rbp - 1512]
      mov	[r11],r10
      mov	qword[rbp - 1536],1732584193
      mov	rdi,43913
      mov	rsi,61389
      push	r10
      push	r11
      call	lohi
      pop	r11
      pop	r10
      mov	[rbp -  1552],rax
      mov	r10,[rbp - 1552]
      mov	[rbp - 1544],r10
      mov	rdi,56574
      mov	rsi,39098
      push	r10
      push	r11
      call	lohi
      pop	r11
      pop	r10
      mov	[rbp -  1568],rax
      mov	r10,[rbp - 1568]
      mov	[rbp - 1560],r10
      mov	qword[rbp - 1576],271733878
      mov	rdi,57840
      mov	rsi,50130
      push	r10
      push	r11
      call	lohi
      pop	r11
      pop	r10
      mov	[rbp -  1592],rax
      mov	r10,[rbp - 1592]
      mov	[rbp - 1584],r10
      mov	qword[rbp - 1008],0
_5for:
      mov	qword[rbp - 1016],16
_6for:
      mov	r10,[rbp - 1008]
      add	r10,1
      mov	[rbp - 1616],r10
      mov	r10,[rbp - 1616]
      imul	r10,8
      mov	[rbp - 1616],r10
      mov	r10,[rbp - 1016]
      add	r10,1
      mov	[rbp - 1624],r10
      mov	r10,[rbp - 1624]
      imul	r10,8
      mov	[rbp - 1624],r10
      mov	r10,[rbp - 1008]
      add	r10,1
      mov	[rbp - 1648],r10
      mov	r10,[rbp - 1648]
      imul	r10,8
      mov	[rbp - 1648],r10
      mov	r10,[rbp - 1016]
      sub	r10,3
      mov	[rbp - 1656],r10
      mov	r10,[rbp - 1656]
      add	r10,1
      mov	[rbp - 1664],r10
      mov	r10,[rbp - 1664]
      imul	r10,8
      mov	[rbp - 1664],r10
      mov	r10,[rbp - 1008]
      add	r10,1
      mov	[rbp - 1688],r10
      mov	r10,[rbp - 1688]
      imul	r10,8
      mov	[rbp - 1688],r10
      mov	r10,[rbp - 1016]
      sub	r10,8
      mov	[rbp - 1696],r10
      mov	r10,[rbp - 1696]
      add	r10,1
      mov	[rbp - 1704],r10
      mov	r10,[rbp - 1704]
      imul	r10,8
      mov	[rbp - 1704],r10
      mov	r10,[lcchunks]
      add	r10,[rbp - 1648]
      mov	r10,[r10]
      add	r10,[rbp - 1664]
      mov	r10,[r10]
      mov	r11,[lcchunks]
      add	r11,[rbp - 1688]
      mov	r11,[r11]
      add	r11,[rbp - 1704]
      xor	r10,[r11]
      mov	[rbp - 1712],r10
      mov	r10,[rbp - 1008]
      add	r10,1
      mov	[rbp - 1736],r10
      mov	r10,[rbp - 1736]
      imul	r10,8
      mov	[rbp - 1736],r10
      mov	r10,[rbp - 1016]
      sub	r10,14
      mov	[rbp - 1744],r10
      mov	r10,[rbp - 1744]
      add	r10,1
      mov	[rbp - 1752],r10
      mov	r10,[rbp - 1752]
      imul	r10,8
      mov	[rbp - 1752],r10
      mov	r10,[rbp - 1712]
      mov	r11,[lcchunks]
      add	r11,[rbp - 1736]
      mov	r11,[r11]
      add	r11,[rbp - 1752]
      xor	r10,[r11]
      mov	[rbp - 1760],r10
      mov	r10,[rbp - 1008]
      add	r10,1
      mov	[rbp - 1784],r10
      mov	r10,[rbp - 1784]
      imul	r10,8
      mov	[rbp - 1784],r10
      mov	r10,[rbp - 1016]
      sub	r10,16
      mov	[rbp - 1792],r10
      mov	r10,[rbp - 1792]
      add	r10,1
      mov	[rbp - 1800],r10
      mov	r10,[rbp - 1800]
      imul	r10,8
      mov	[rbp - 1800],r10
      mov	r10,[rbp - 1760]
      mov	r11,[lcchunks]
      add	r11,[rbp - 1784]
      mov	r11,[r11]
      add	r11,[rbp - 1800]
      xor	r10,[r11]
      mov	[rbp - 1808],r10
      mov	rdi,[rbp-1808]
      mov	rsi,1
      push	r10
      push	r11
      call	rotate_left
      pop	r11
      pop	r10
      mov	[rbp -  1816],rax
      mov	r10,[rbp - 1816]
      mov	r11,[lcchunks]
      add	r11,[rbp - 1616]
      mov	r11,[r11]
      add	r11,[rbp - 1624]
      mov	[r11],r10
_6while:
      mov	r10,[rbp - 1016]
      mov	[rbp - 1824],r10
      mov	r10,[rbp - 1016]
      add	r10,1
      mov	[rbp - 1016],r10
      mov	r10,[rbp - 1016]
      cmp	r10,80
      setl r10b
      movzx r10,r10b
      mov	[rbp - 1832],r10
      mov	r10,[rbp -  1832]
      cmp	r10,1
      je	_6for
_6forback:
      mov	r10,[rbp - 1536]
      mov	[rbp - 1840],r10
      mov	r10,[rbp - 1544]
      mov	[rbp - 1848],r10
      mov	r10,[rbp - 1560]
      mov	[rbp - 1856],r10
      mov	r10,[rbp - 1576]
      mov	[rbp - 1864],r10
      mov	r10,[rbp - 1584]
      mov	[rbp - 1872],r10
      mov	qword[rbp - 1016],0
_7for:
      mov	r10,[rbp - 1016]
      cmp	r10,20
      setl r10b
      movzx r10,r10b
      mov	[rbp - 2032],r10
      mov	 r10,[rbp-2032]
      cmp	 r10,0
      je	_8else
_8if:
      mov	r10,[rbp - 1848]
      and	r10,[rbp - 1856]
_25check:
      mov	[rbp - 1896],r10
      mov	r10,[rbp - 1904]
      and	r10,[rbp - 1864]
_26check:
      mov	[rbp - 1912],r10
      mov	r10,[rbp - 1896]
      or	r10,[rbp - 1912]
_27check:
      mov	[rbp - 1920],r10
      mov	r10,[rbp - 1920]
      mov	[rbp - 1880],r10
      mov	qword[rbp - 1888],1518500249
      jmp	_8ifback
_8else:
      mov	r10,[rbp - 1016]
      cmp	r10,40
      setl r10b
      movzx r10,r10b
      mov	[rbp - 2024],r10
      mov	 r10,[rbp-2024]
      cmp	 r10,0
      je	_9else
_9if:
      mov	r10,[rbp - 1848]
      xor	r10,[rbp - 1856]
      mov	[rbp - 1928],r10
      mov	r10,[rbp - 1928]
      xor	r10,[rbp - 1864]
      mov	[rbp - 1936],r10
      mov	r10,[rbp - 1936]
      mov	[rbp - 1880],r10
      mov	qword[rbp - 1888],1859775393
      jmp	_9ifback
_9else:
      mov	r10,[rbp - 1016]
      cmp	r10,60
      setl r10b
      movzx r10,r10b
      mov	[rbp - 2016],r10
      mov	 r10,[rbp-2016]
      cmp	 r10,0
      je	_10else
_10if:
      mov	r10,[rbp - 1848]
      and	r10,[rbp - 1856]
_28check:
      mov	[rbp - 1944],r10
      mov	r10,[rbp - 1848]
      and	r10,[rbp - 1864]
_29check:
      mov	[rbp - 1952],r10
      mov	r10,[rbp - 1944]
      or	r10,[rbp - 1952]
_30check:
      mov	[rbp - 1960],r10
      mov	r10,[rbp - 1856]
      and	r10,[rbp - 1864]
_31check:
      mov	[rbp - 1968],r10
      mov	r10,[rbp - 1960]
      or	r10,[rbp - 1968]
_32check:
      mov	[rbp - 1976],r10
      mov	r10,[rbp - 1976]
      mov	[rbp - 1880],r10
      mov	rdi,48348
      mov	rsi,36635
      push	r10
      push	r11
      call	lohi
      pop	r11
      pop	r10
      mov	[rbp -  1984],rax
      mov	r10,[rbp - 1984]
      mov	[rbp - 1888],r10
      jmp	_10ifback
_10else:
      mov	r10,[rbp - 1848]
      xor	r10,[rbp - 1856]
      mov	[rbp - 1992],r10
      mov	r10,[rbp - 1992]
      xor	r10,[rbp - 1864]
      mov	[rbp - 2000],r10
      mov	r10,[rbp - 2000]
      mov	[rbp - 1880],r10
      mov	rdi,49622
      mov	rsi,51810
      push	r10
      push	r11
      call	lohi
      pop	r11
      pop	r10
      mov	[rbp -  2008],rax
      mov	r10,[rbp - 2008]
      mov	[rbp - 1888],r10
_10ifback:
_9ifback:
_8ifback:
      mov	rdi,[rbp-1840]
      mov	rsi,5
      push	r10
      push	r11
      call	rotate_left
      pop	r11
      pop	r10
      mov	[rbp -  2048],rax
      mov	rdi,[rbp-2048]
      mov	rsi,[rbp-1872]
      push	r10
      push	r11
      call	add
      pop	r11
      pop	r10
      mov	[rbp -  2056],rax
      mov	rdi,[rbp-1880]
      mov	rsi,[rbp-1888]
      push	r10
      push	r11
      call	add
      pop	r11
      pop	r10
      mov	[rbp -  2064],rax
      mov	rdi,[rbp-2056]
      mov	rsi,[rbp-2064]
      push	r10
      push	r11
      call	add
      pop	r11
      pop	r10
      mov	[rbp -  2072],rax
      mov	r10,[rbp - 1008]
      add	r10,1
      mov	[rbp - 2096],r10
      mov	r10,[rbp - 2096]
      imul	r10,8
      mov	[rbp - 2096],r10
      mov	r10,[rbp - 1016]
      add	r10,1
      mov	[rbp - 2104],r10
      mov	r10,[rbp - 2104]
      imul	r10,8
      mov	[rbp - 2104],r10
      mov	rdi,[rbp-2072]
      mov	r10,[lcchunks]
      add	r10,[rbp - 2096]
      mov	r10,[r10]
      add	r10,[rbp - 2104]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	add
      pop	r11
      pop	r10
      mov	[rbp -  2112],rax
      mov	r10,[rbp - 2112]
      mov	[rbp - 2040],r10
      mov	r10,[rbp - 1864]
      mov	[rbp - 1872],r10
      mov	r10,[rbp - 1856]
      mov	[rbp - 1864],r10
      mov	rdi,[rbp-1848]
      mov	rsi,30
      push	r10
      push	r11
      call	rotate_left
      pop	r11
      pop	r10
      mov	[rbp -  2120],rax
      mov	r10,[rbp - 2120]
      mov	[rbp - 1856],r10
      mov	r10,[rbp - 1840]
      mov	[rbp - 1848],r10
      mov	r10,[rbp - 2040]
      mov	[rbp - 1840],r10
_7while:
      mov	r10,[rbp - 1016]
      mov	[rbp - 2128],r10
      mov	r10,[rbp - 1016]
      add	r10,1
      mov	[rbp - 1016],r10
      mov	r10,[rbp - 1016]
      cmp	r10,80
      setl r10b
      movzx r10,r10b
      mov	[rbp - 2136],r10
      mov	r10,[rbp -  2136]
      cmp	r10,1
      je	_7for
_7forback:
      mov	rdi,[rbp-1536]
      mov	rsi,[rbp-1840]
      push	r10
      push	r11
      call	add
      pop	r11
      pop	r10
      mov	[rbp -  2144],rax
      mov	r10,[rbp - 2144]
      mov	[rbp - 1536],r10
      mov	rdi,[rbp-1544]
      mov	rsi,[rbp-1848]
      push	r10
      push	r11
      call	add
      pop	r11
      pop	r10
      mov	[rbp -  2152],rax
      mov	r10,[rbp - 2152]
      mov	[rbp - 1544],r10
      mov	rdi,[rbp-1560]
      mov	rsi,[rbp-1856]
      push	r10
      push	r11
      call	add
      pop	r11
      pop	r10
      mov	[rbp -  2160],rax
      mov	r10,[rbp - 2160]
      mov	[rbp - 1560],r10
      mov	rdi,[rbp-1576]
      mov	rsi,[rbp-1864]
      push	r10
      push	r11
      call	add
      pop	r11
      pop	r10
      mov	[rbp -  2168],rax
      mov	r10,[rbp - 2168]
      mov	[rbp - 1576],r10
      mov	rdi,[rbp-1584]
      mov	rsi,[rbp-1872]
      push	r10
      push	r11
      call	add
      pop	r11
      pop	r10
      mov	[rbp -  2176],rax
      mov	r10,[rbp - 2176]
      mov	[rbp - 1584],r10
_5while:
      mov	r10,[rbp - 1008]
      mov	[rbp - 2184],r10
      mov	r10,[rbp - 1008]
      add	r10,1
      mov	[rbp - 1008],r10
      mov	r10,[rbp - 1008]
      cmp	r10,[rbp - 944]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 2192],r10
      mov	r10,[rbp -  2192]
      cmp	r10,1
      je	_5for
_5forback:
      mov	r10,0
      add	r10,1
      mov	[rbp - 2216],r10
      mov	r10,[rbp - 2216]
      imul	r10,8
      mov	[rbp - 2216],r10
      mov	r10,[rbp - 1536]
      mov	r11,[lcoutputBuffer]
      add	r11,[rbp - 2216]
      mov	[r11],r10
      mov	r10,1
      add	r10,1
      mov	[rbp - 2240],r10
      mov	r10,[rbp - 2240]
      imul	r10,8
      mov	[rbp - 2240],r10
      mov	r10,[rbp - 1544]
      mov	r11,[lcoutputBuffer]
      add	r11,[rbp - 2240]
      mov	[r11],r10
      mov	r10,2
      add	r10,1
      mov	[rbp - 2264],r10
      mov	r10,[rbp - 2264]
      imul	r10,8
      mov	[rbp - 2264],r10
      mov	r10,[rbp - 1560]
      mov	r11,[lcoutputBuffer]
      add	r11,[rbp - 2264]
      mov	[r11],r10
      mov	r10,3
      add	r10,1
      mov	[rbp - 2288],r10
      mov	r10,[rbp - 2288]
      imul	r10,8
      mov	[rbp - 2288],r10
      mov	r10,[rbp - 1576]
      mov	r11,[lcoutputBuffer]
      add	r11,[rbp - 2288]
      mov	[r11],r10
      mov	r10,4
      add	r10,1
      mov	[rbp - 2312],r10
      mov	r10,[rbp - 2312]
      imul	r10,8
      mov	[rbp - 2312],r10
      mov	r10,[rbp - 1584]
      mov	r11,[lcoutputBuffer]
      add	r11,[rbp - 2312]
      mov	[r11],r10
      mov	rax,[lcoutputBuffer]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
computeSHA1:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 2320],rdi
      mov	qword[rbp - 2328],0
_8for:
      mov	r10,[rbp - 2328]
      add	r10,1
      mov	[rbp - 2352],r10
      mov	r10,[rbp - 2352]
      imul	r10,8
      mov	[rbp - 2352],r10
      mov	rdi,[rbp-2320]
      mov	rsi,[rbp-2328]
      push	r10
      push	r11
      call	string.ord
      pop	r11
      pop	r10
      mov	[rbp -  2360],rax
      mov	r10,[rbp - 2360]
      mov	r11,[lcinputBuffer]
      add	r11,[rbp - 2352]
      mov	[r11],r10
_8while:
      mov	r10,[rbp - 2328]
      mov	[rbp - 2368],r10
      mov	r10,[rbp - 2328]
      add	r10,1
      mov	[rbp - 2328],r10
      mov	rdi,[rbp-2320]
      push	r10
      push	r11
      call	string.length
      pop	r11
      pop	r10
      mov	[rbp -  2376],rax
      mov	r10,[rbp - 2328]
      cmp	r10,[rbp - 2376]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 2384],r10
      mov	r10,[rbp -  2384]
      cmp	r10,1
      je	_8for
_8forback:
      mov	rdi,[rbp-2320]
      push	r10
      push	r11
      call	string.length
      pop	r11
      pop	r10
      mov	[rbp -  2400],rax
      mov	rdi,[lcinputBuffer]
      mov	rsi,[rbp-2400]
      push	r10
      push	r11
      call	sha1
      pop	r11
      pop	r10
      mov	[rbp -  2408],rax
      mov	r10,[rbp - 2408]
      mov	[rbp - 2392],r10
      mov	qword[rbp - 2328],0
_9for:
      mov	r10,[rbp - 2328]
      add	r10,1
      mov	[rbp - 2432],r10
      mov	r10,[rbp - 2432]
      imul	r10,8
      mov	[rbp - 2432],r10
      mov	r10,[rbp - 2392]
      add	r10,[rbp - 2432]
      mov	rdi,[r10]
      push	r10
      push	r11
      call	toStringHex
      pop	r11
      pop	r10
      mov	[rbp -  2440],rax
      mov	rdi,[rbp-2440]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  2448],rax
_9while:
      mov	r10,[rbp - 2328]
      mov	[rbp - 2456],r10
      mov	r10,[rbp - 2328]
      add	r10,1
      mov	[rbp - 2328],r10
      mov	r10,[rbp - 2392]
      add	r10,0
      mov	r10,[r10]
      add	r10,0
      mov	[rbp - 2464],r10
      mov	r10,[rbp - 2328]
      cmp	r10,[rbp - 2464]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 2472],r10
      mov	r10,[rbp -  2472]
      cmp	r10,1
      je	_9for
_9forback:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],0
      mov	[rbp - 2480],rax
      mov	rdi,[rbp-2480]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  2488],rax
      mov	rsp,rbp
      pop rbp
      ret
nextLetter:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 2496],rdi
      mov	r10,[rbp - 2496]
      cmp	r10,122
      sete r10b
      movzx r10,r10b
      mov	[rbp - 2512],r10
      mov	 r10,[rbp-2512]
      cmp	 r10,0
      je	_11else
_11if:
      mov	r10,1
      not	r10
      add	r10,1
      mov	[rbp - 2504],r10
      mov	rax,[rbp -  2504]
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_11ifback
_11else:
_11ifback:
      mov	r10,[rbp - 2496]
      cmp	r10,90
      sete r10b
      movzx r10,r10b
      mov	[rbp - 2520],r10
      mov	 r10,[rbp-2520]
      cmp	 r10,0
      je	_12else
_12if:
      mov	rax,97
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_12ifback
_12else:
_12ifback:
      mov	r10,[rbp - 2496]
      cmp	r10,57
      sete r10b
      movzx r10,r10b
      mov	[rbp - 2528],r10
      mov	 r10,[rbp-2528]
      cmp	 r10,0
      je	_13else
_13if:
      mov	rax,65
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_13ifback
_13else:
_13ifback:
      mov	r10,[rbp - 2496]
      add	r10,1
      mov	[rbp - 2536],r10
      mov	rax,[rbp -  2536]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
nextText:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 2544],rdi
      mov	[rbp - 2552],rsi
      mov	r10,[rbp - 2552]
      sub	r10,1
      mov	[rbp - 2696],r10
      mov	r10,[rbp - 2696]
      mov	[rbp - 2560],r10
_10for:
      mov	r10,[rbp - 2560]
      add	r10,1
      mov	[rbp - 2584],r10
      mov	r10,[rbp - 2584]
      imul	r10,8
      mov	[rbp - 2584],r10
      mov	r10,[rbp - 2560]
      add	r10,1
      mov	[rbp - 2608],r10
      mov	r10,[rbp - 2608]
      imul	r10,8
      mov	[rbp - 2608],r10
      mov	r10,[rbp - 2544]
      add	r10,[rbp - 2608]
      mov	rdi,[r10]
      push	r10
      push	r11
      call	nextLetter
      pop	r11
      pop	r10
      mov	[rbp -  2616],rax
      mov	r10,[rbp - 2616]
      mov	r11,[rbp - 2544]
      add	r11,[rbp - 2584]
      mov	[r11],r10
      mov	r10,[rbp - 2560]
      add	r10,1
      mov	[rbp - 2664],r10
      mov	r10,[rbp - 2664]
      imul	r10,8
      mov	[rbp - 2664],r10
      mov	r10,1
      not	r10
      add	r10,1
      mov	[rbp - 2672],r10
      mov	r11,[rbp - 2544]
      add	r11,[rbp - 2664]
      mov	r10,[r11]
      cmp	r10,[rbp - 2672]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 2680],r10
      mov	 r10,[rbp-2680]
      cmp	 r10,0
      je	_14else
_14if:
      mov	r10,[rbp - 2560]
      add	r10,1
      mov	[rbp - 2640],r10
      mov	r10,[rbp - 2640]
      imul	r10,8
      mov	[rbp - 2640],r10
      mov	r11,[rbp - 2544]
      add	r11,[rbp - 2640]
      mov	qword[r11],48
      jmp	_14ifback
_14else:
      mov	rax,1
      mov	rsp,rbp
      pop rbp
      ret
_14ifback:
_10while:
      mov	r10,[rbp - 2560]
      mov	[rbp - 2688],r10
      mov	r10,[rbp - 2560]
      sub	r10,1
      mov	[rbp - 2560],r10
      mov	r10,[rbp - 2560]
      cmp	r10,0
      setge r10b
      movzx r10,r10b
      mov	[rbp - 2704],r10
      mov	r10,[rbp -  2704]
      cmp	r10,1
      je	_10for
_10forback:
      mov	rax,0
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
array_equal:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 2712],rdi
      mov	[rbp - 2720],rsi
      mov	r10,[rbp - 2712]
      add	r10,0
      mov	r10,[r10]
      add	r10,0
      mov	[rbp - 2728],r10
      mov	r10,[rbp - 2720]
      add	r10,0
      mov	r10,[r10]
      add	r10,0
      mov	[rbp - 2736],r10
      mov	r10,[rbp - 2728]
      cmp	r10,[rbp - 2736]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 2744],r10
      mov	 r10,[rbp-2744]
      cmp	 r10,0
      je	_15else
_15if:
      mov	rax,0
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_15ifback
_15else:
_15ifback:
      mov	qword[rbp - 2752],0
_11for:
      mov	r10,[rbp - 2752]
      add	r10,1
      mov	[rbp - 2776],r10
      mov	r10,[rbp - 2776]
      imul	r10,8
      mov	[rbp - 2776],r10
      mov	r10,[rbp - 2752]
      add	r10,1
      mov	[rbp - 2800],r10
      mov	r10,[rbp - 2800]
      imul	r10,8
      mov	[rbp - 2800],r10
      mov	r11,[rbp - 2712]
      add	r11,[rbp - 2776]
      mov	r10,[r11]
      cmp	r10,[rbp - 2720]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 2808],r10
      mov	 r10,[rbp-2808]
      cmp	 r10,0
      je	_16else
_16if:
      mov	rax,0
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_16ifback
_16else:
_16ifback:
_11while:
      mov	r10,[rbp - 2752]
      mov	[rbp - 2816],r10
      mov	r10,[rbp - 2752]
      add	r10,1
      mov	[rbp - 2752],r10
      mov	r10,[rbp - 2712]
      add	r10,0
      mov	r10,[r10]
      add	r10,0
      mov	[rbp - 2824],r10
      mov	r10,[rbp - 2752]
      cmp	r10,[rbp - 2824]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 2832],r10
      mov	r10,[rbp -  2832]
      cmp	r10,1
      je	_11for
_11forback:
      mov	rax,1
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
crackSHA1:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 2840],rdi
      mov	r10,5
      add	r10,1
      mov	[rbp - 2856],r10
      mov	r10,[rbp - 2856]
      imul	r10,8
      mov	[rbp - 2856],r10
      mov	rdi,[rbp-2856]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  2864],rax
      mov	r11,[rbp - 2864]
      add	r11,0
      mov	qword[r11],5
      mov	r10,[rbp - 2864]
      mov	[rbp - 2848],r10
      mov	rdi,[rbp-2840]
      push	r10
      push	r11
      call	string.length
      pop	r11
      pop	r10
      mov	[rbp -  2888],rax
      mov	r10,[rbp - 2888]
      cmp	r10,40
      setne r10b
      movzx r10,r10b
      mov	[rbp - 2896],r10
      mov	 r10,[rbp-2896]
      cmp	 r10,0
      je	_17else
_17if:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'I'
      mov	byte[rax + 1],'n'
      mov	byte[rax + 2],'v'
      mov	byte[rax + 3],'a'
      mov	byte[rax + 4],'l'
      mov	byte[rax + 5],'i'
      mov	byte[rax + 6],'d'
      mov	byte[rax + 7],' '
      mov	byte[rax + 8],'i'
      mov	byte[rax + 9],'n'
      mov	byte[rax + 10],'p'
      mov	byte[rax + 11],'u'
      mov	byte[rax + 12],'t'
      mov	byte[rax + 13],0
      mov	[rbp - 2872],rax
      mov	rdi,[rbp-2872]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  2880],rax
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_17ifback
_17else:
_17ifback:
      mov	qword[rbp - 2904],0
_12for:
      mov	r10,[rbp - 2904]
      add	r10,1
      mov	[rbp - 2928],r10
      mov	r10,[rbp - 2928]
      imul	r10,8
      mov	[rbp - 2928],r10
      mov	r11,[rbp - 2848]
      add	r11,[rbp - 2928]
      mov	qword[r11],0
_12while:
      mov	r10,[rbp - 2904]
      mov	[rbp - 2936],r10
      mov	r10,[rbp - 2904]
      add	r10,1
      mov	[rbp - 2904],r10
      mov	r10,[rbp - 2904]
      cmp	r10,5
      setl r10b
      movzx r10,r10b
      mov	[rbp - 2944],r10
      mov	r10,[rbp -  2944]
      cmp	r10,1
      je	_12for
_12forback:
      mov	qword[rbp - 2904],0
_13for:
      mov	eax,[rbp - 2904]
      mov	r10d,8
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 2968],rax
      mov	r10,[rbp - 2968]
      add	r10,1
      mov	[rbp - 2976],r10
      mov	r10,[rbp - 2976]
      imul	r10,8
      mov	[rbp - 2976],r10
      mov	eax,[rbp - 2904]
      mov	r10d,8
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 3000],rax
      mov	r10,[rbp - 3000]
      add	r10,1
      mov	[rbp - 3008],r10
      mov	r10,[rbp - 3008]
      imul	r10,8
      mov	[rbp - 3008],r10
      mov	r10,[rbp - 2904]
      add	r10,3
      mov	[rbp - 3016],r10
      mov	rdi,[rbp-2840]
      mov	rsi,[rbp-2904]
      mov	rdx,[rbp-3016]
      push	r10
      push	r11
      call	string.substring
      pop	r11
      pop	r10
      mov	[rbp -  3024],rax
      mov	rdi,[rbp-3024]
      push	r10
      push	r11
      call	hex2int
      pop	r11
      pop	r10
      mov	[rbp -  3032],rax
      mov	eax,[rbp - 2904]
      mov	r10d,4
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 3040],rax
      mov	eax,[rbp - 3040]
      mov	r10d,2
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 3048],rdx
      mov	r10,1
      sub	r10,[rbp - 3048]
      mov	[rbp - 3056],r10
      mov	r10,[rbp - 3056]
      imul	r10,16
      mov	[rbp - 3064],r10
      mov	r10,[rbp - 3032]
      mov	cl,[rbp - 3064]
      shl	r10,cl
      mov	[rbp - 3072],r10
      mov	r10,[rbp - 2848]
      or	r10,[rbp - 3072]
_33check:
      mov	[rbp - 3080],r10
      mov	r10,[rbp - 3080]
      mov	r11,[rbp - 2848]
      add	r11,[rbp - 2976]
      mov	[r11],r10
_13while:
      mov	r10,[rbp - 2904]
      add	r10,4
      mov	[rbp - 3088],r10
      mov	r10,[rbp - 3088]
      mov	[rbp - 2904],r10
      mov	r10,[rbp - 2904]
      cmp	r10,40
      setl r10b
      movzx r10,r10b
      mov	[rbp - 3096],r10
      mov	r10,[rbp -  3096]
      cmp	r10,1
      je	_13for
_13forback:
      mov	qword[rbp - 3104],4
      mov	qword[rbp - 3112],1
_14for:
      mov	qword[rbp - 2904],0
_15for:
      mov	r10,[rbp - 2904]
      add	r10,1
      mov	[rbp - 3136],r10
      mov	r10,[rbp - 3136]
      imul	r10,8
      mov	[rbp - 3136],r10
      mov	r11,[lcinputBuffer]
      add	r11,[rbp - 3136]
      mov	qword[r11],48
_15while:
      mov	r10,[rbp - 2904]
      mov	[rbp - 3144],r10
      mov	r10,[rbp - 2904]
      add	r10,1
      mov	[rbp - 2904],r10
      mov	r10,[rbp - 2904]
      cmp	r10,[rbp - 3112]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 3152],r10
      mov	r10,[rbp -  3152]
      cmp	r10,1
      je	_15for
_15forback:
      jmp	_16while
_16for:
      mov	rdi,[lcinputBuffer]
      mov	rsi,[rbp-3112]
      push	r10
      push	r11
      call	sha1
      pop	r11
      pop	r10
      mov	[rbp -  3168],rax
      mov	r10,[rbp - 3168]
      mov	[rbp - 3160],r10
      mov	rdi,[rbp-3160]
      mov	rsi,[rbp-2848]
      push	r10
      push	r11
      call	array_equal
      pop	r11
      pop	r10
      mov	[rbp -  3248],rax
      mov	 r10,[rbp-3248]
      cmp	 r10,0
      je	_18else
_18if:
      mov	qword[rbp - 2904],0
_17for:
      mov	r10,[rbp - 2904]
      add	r10,1
      mov	[rbp - 3192],r10
      mov	r10,[rbp - 3192]
      imul	r10,8
      mov	[rbp - 3192],r10
      mov	r10,[lcinputBuffer]
      add	r10,[rbp - 3192]
      mov	rdi,[r10]
      push	r10
      push	r11
      call	int2chr
      pop	r11
      pop	r10
      mov	[rbp -  3200],rax
      mov	rdi,[rbp-3200]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  3208],rax
_17while:
      mov	r10,[rbp - 2904]
      mov	[rbp - 3216],r10
      mov	r10,[rbp - 2904]
      add	r10,1
      mov	[rbp - 2904],r10
      mov	r10,[rbp - 2904]
      cmp	r10,[rbp - 3112]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 3224],r10
      mov	r10,[rbp -  3224]
      cmp	r10,1
      je	_17for
_17forback:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],0
      mov	[rbp - 3232],rax
      mov	rdi,[rbp-3232]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  3240],rax
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_18ifback
_18else:
_18ifback:
      mov	rdi,[lcinputBuffer]
      mov	rsi,[rbp-3112]
      push	r10
      push	r11
      call	nextText
      pop	r11
      pop	r10
      mov	[rbp -  3256],rax
      mov	r10,[rbp -  3256]
      xor	r10,1
      mov	[rbp - 3264],r10
      mov	 r10,[rbp-3264]
      cmp	 r10,0
      je	_19else
_19if:
      jmp	_16forback
      jmp	_19ifback
_19else:
_19ifback:
_16while:
      mov	r10,1
      cmp	r10,1
      je	_16for
_16forback:
_14while:
      mov	r10,[rbp - 3112]
      mov	[rbp - 3272],r10
      mov	r10,[rbp - 3112]
      add	r10,1
      mov	[rbp - 3112],r10
      mov	r10,[rbp - 3112]
      cmp	r10,[rbp - 3104]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 3280],r10
      mov	r10,[rbp -  3280]
      cmp	r10,1
      je	_14for
_14forback:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'N'
      mov	byte[rax + 1],'o'
      mov	byte[rax + 2],'t'
      mov	byte[rax + 3],' '
      mov	byte[rax + 4],'F'
      mov	byte[rax + 5],'o'
      mov	byte[rax + 6],'u'
      mov	byte[rax + 7],'n'
      mov	byte[rax + 8],'d'
      mov	byte[rax + 9],'!'
      mov	byte[rax + 10],0
      mov	[rbp - 3288],rax
      mov	rdi,[rbp-3288]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  3296],rax
      mov	rsp,rbp
      pop rbp
      ret
main:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],' '
      mov	byte[rax + 1],'!'
      mov	byte[rax + 2],34
      mov	byte[rax + 3],'#'
      mov	byte[rax + 4],'$'
      mov	byte[rax + 5],'%'
      mov	byte[rax + 6],'&'
      mov	byte[rax + 7],39
      mov	byte[rax + 8],'('
      mov	byte[rax + 9],')'
      mov	byte[rax + 10],'*'
      mov	byte[rax + 11],'+'
      mov	byte[rax + 12],','
      mov	byte[rax + 13],'-'
      mov	byte[rax + 14],'.'
      mov	byte[rax + 15],'/'
      mov	byte[rax + 16],'0'
      mov	byte[rax + 17],'1'
      mov	byte[rax + 18],'2'
      mov	byte[rax + 19],'3'
      mov	byte[rax + 20],'4'
      mov	byte[rax + 21],'5'
      mov	byte[rax + 22],'6'
      mov	byte[rax + 23],'7'
      mov	byte[rax + 24],'8'
      mov	byte[rax + 25],'9'
      mov	byte[rax + 26],':'
      mov	byte[rax + 27],';'
      mov	byte[rax + 28],'<'
      mov	byte[rax + 29],'='
      mov	byte[rax + 30],'>'
      mov	byte[rax + 31],'?'
      mov	byte[rax + 32],'@'
      mov	byte[rax + 33],'A'
      mov	byte[rax + 34],'B'
      mov	byte[rax + 35],'C'
      mov	byte[rax + 36],'D'
      mov	byte[rax + 37],'E'
      mov	byte[rax + 38],'F'
      mov	byte[rax + 39],'G'
      mov	byte[rax + 40],'H'
      mov	byte[rax + 41],'I'
      mov	byte[rax + 42],'J'
      mov	byte[rax + 43],'K'
      mov	byte[rax + 44],'L'
      mov	byte[rax + 45],'M'
      mov	byte[rax + 46],'N'
      mov	byte[rax + 47],'O'
      mov	byte[rax + 48],'P'
      mov	byte[rax + 49],'Q'
      mov	byte[rax + 50],'R'
      mov	byte[rax + 51],'S'
      mov	byte[rax + 52],'T'
      mov	byte[rax + 53],'U'
      mov	byte[rax + 54],'V'
      mov	byte[rax + 55],'W'
      mov	byte[rax + 56],'X'
      mov	byte[rax + 57],'Y'
      mov	byte[rax + 58],'Z'
      mov	byte[rax + 59],'['
      mov	byte[rax + 60],92
      mov	byte[rax + 61],']'
      mov	byte[rax + 62],'^'
      mov	byte[rax + 63],'_'
      mov	byte[rax + 64],'`'
      mov	byte[rax + 65],'a'
      mov	byte[rax + 66],'b'
      mov	byte[rax + 67],'c'
      mov	byte[rax + 68],'d'
      mov	byte[rax + 69],'e'
      mov	byte[rax + 70],'f'
      mov	byte[rax + 71],'g'
      mov	byte[rax + 72],'h'
      mov	byte[rax + 73],'i'
      mov	byte[rax + 74],'j'
      mov	byte[rax + 75],'k'
      mov	byte[rax + 76],'l'
      mov	byte[rax + 77],'m'
      mov	byte[rax + 78],'n'
      mov	byte[rax + 79],'o'
      mov	byte[rax + 80],'p'
      mov	byte[rax + 81],'q'
      mov	byte[rax + 82],'r'
      mov	byte[rax + 83],'s'
      mov	byte[rax + 84],'t'
      mov	byte[rax + 85],'u'
      mov	byte[rax + 86],'v'
      mov	byte[rax + 87],'w'
      mov	byte[rax + 88],'x'
      mov	byte[rax + 89],'y'
      mov	byte[rax + 90],'z'
      mov	byte[rax + 91],'{'
      mov	byte[rax + 92],'|'
      mov	byte[rax + 93],'}'
      mov	byte[rax + 94],'~'
      mov	byte[rax + 95],0
      mov	[rbp - 232],rax
      mov	r10,[rbp - 232]
      mov	[lcasciiTable],r10
      mov	qword[lcMAXCHUNK],100
      mov	r10,[lcMAXCHUNK]
      sub	r10,1
      mov	[rbp - 816],r10
      mov	r10,[rbp - 816]
      imul	r10,64
      mov	[rbp - 824],r10
      mov	r10,[rbp - 824]
      sub	r10,16
      mov	[rbp - 832],r10
      mov	r10,[rbp - 832]
      mov	[lcMAXLENGTH],r10
      mov	r10,[lcMAXCHUNK]
      add	r10,1
      mov	[rbp - 840],r10
      mov	r10,[rbp - 840]
      imul	r10,8
      mov	[rbp - 840],r10
      mov	rdi,[rbp-840]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  848],rax
      mov	r11,[rbp - 848]
      add	r11,0
      mov	r10,[lcMAXCHUNK]
      mov	qword[r11],r10
      mov	r10,[rbp - 848]
      mov	[rbp - 864],r10
      mov	qword[rbp - 856],0
_0arr:
      mov	r10,[rbp - 856]
      add	r10,1
      mov	[rbp - 856],r10
      mov	r10,[rbp - 848]
      add	r10,8
      mov	[rbp - 848],r10
      mov	r10,80
      add	r10,1
      mov	[rbp - 872],r10
      mov	r10,[rbp - 872]
      imul	r10,8
      mov	[rbp - 872],r10
      mov	rdi,[rbp-872]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  880],rax
      mov	r11,[rbp - 880]
      add	r11,0
      mov	qword[r11],80
      mov	r10,[rbp - 880]
      mov	r11,[rbp - 848]
      add	r11,0
      mov	[r11],r10
      mov	r10,[rbp - 856]
      cmp	r10,80
      setl r10b
      movzx r10,r10b
      mov	[rbp - 888],r10
      mov	r10,[rbp - 888]
      cmp	r10,1
      je	_0arr
      mov	r10,[rbp - 864]
      mov	[lcchunks],r10
      mov	r10,[lcMAXLENGTH]
      add	r10,1
      mov	[rbp - 896],r10
      mov	r10,[rbp - 896]
      imul	r10,8
      mov	[rbp - 896],r10
      mov	rdi,[rbp-896]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  904],rax
      mov	r11,[rbp - 904]
      add	r11,0
      mov	r10,[lcMAXLENGTH]
      mov	qword[r11],r10
      mov	r10,[rbp - 904]
      mov	[lcinputBuffer],r10
      mov	r10,5
      add	r10,1
      mov	[rbp - 912],r10
      mov	r10,[rbp - 912]
      imul	r10,8
      mov	[rbp - 912],r10
      mov	rdi,[rbp-912]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  920],rax
      mov	r11,[rbp - 920]
      add	r11,0
      mov	qword[r11],5
      mov	r10,[rbp - 920]
      mov	[lcoutputBuffer],r10
      jmp	_18while
_18for:
      push	r10
      push	r11
      call	getInt
      pop	r11
      pop	r10
      mov	[rbp -  3320],rax
      mov	r10,[rbp - 3320]
      mov	[rbp - 3304],r10
      mov	r10,[rbp - 3304]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov	[rbp - 3328],r10
      mov	 r10,[rbp-3328]
      cmp	 r10,0
      je	_20else
_20if:
      jmp	_18forback
      jmp	_20ifback
_20else:
_20ifback:
      mov	r10,[rbp - 3304]
      cmp	r10,1
      sete r10b
      movzx r10,r10b
      mov	[rbp - 3376],r10
      mov	 r10,[rbp-3376]
      cmp	 r10,0
      je	_21else
_21if:
      push	r10
      push	r11
      call	getString
      pop	r11
      pop	r10
      mov	[rbp -  3336],rax
      mov	r10,[rbp - 3336]
      mov	[rbp - 3312],r10
      mov	rdi,[rbp-3312]
      push	r10
      push	r11
      call	computeSHA1
      pop	r11
      pop	r10
      mov	[rbp -  3344],rax
      jmp	_21ifback
_21else:
      mov	r10,[rbp - 3304]
      cmp	r10,2
      sete r10b
      movzx r10,r10b
      mov	[rbp - 3368],r10
      mov	 r10,[rbp-3368]
      cmp	 r10,0
      je	_22else
_22if:
      push	r10
      push	r11
      call	getString
      pop	r11
      pop	r10
      mov	[rbp -  3352],rax
      mov	r10,[rbp - 3352]
      mov	[rbp - 3312],r10
      mov	rdi,[rbp-3312]
      push	r10
      push	r11
      call	crackSHA1
      pop	r11
      pop	r10
      mov	[rbp -  3360],rax
      jmp	_22ifback
_22else:
_22ifback:
_21ifback:
_18while:
      mov	r10,1
      cmp	r10,1
      je	_18for
_18forback:
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

lcasciiTable:
	dq 0
lcMAXCHUNK:
	dq 0
lcMAXLENGTH:
	dq 0
lcchunks:
	dq 0
lcinputBuffer:
	dq 0
lcoutputBuffer:
	dq 0
section .bss
stringbuffer:
	resb 256

