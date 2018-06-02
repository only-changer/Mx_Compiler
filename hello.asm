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
digt:
      push	rbp
      mov	rbp,rsp
      sub	rsp,2000
      mov	[rbp - 8],rdi
      mov	r10,[rbp - 8]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov	[rbp - 24],r10
      mov	 r10,[rbp-24]
      cmp	 r10,0
      je	_0else
_0if:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'0'
      mov	byte[rax + 1],0
      mov	[rbp - 16],rax
      mov	rax,[rbp -  16]
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_0ifback
_0else:
_0ifback:
      mov	r10,[rbp - 8]
      cmp	r10,1
      sete r10b
      movzx r10,r10b
      mov	[rbp - 40],r10
      mov	 r10,[rbp-40]
      cmp	 r10,0
      je	_1else
_1if:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'1'
      mov	byte[rax + 1],0
      mov	[rbp - 32],rax
      mov	rax,[rbp -  32]
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_1ifback
_1else:
_1ifback:
      mov	r10,[rbp - 8]
      cmp	r10,2
      sete r10b
      movzx r10,r10b
      mov	[rbp - 56],r10
      mov	 r10,[rbp-56]
      cmp	 r10,0
      je	_2else
_2if:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'2'
      mov	byte[rax + 1],0
      mov	[rbp - 48],rax
      mov	rax,[rbp -  48]
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_2ifback
_2else:
_2ifback:
      mov	r10,[rbp - 8]
      cmp	r10,3
      sete r10b
      movzx r10,r10b
      mov	[rbp - 72],r10
      mov	 r10,[rbp-72]
      cmp	 r10,0
      je	_3else
_3if:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'3'
      mov	byte[rax + 1],0
      mov	[rbp - 64],rax
      mov	rax,[rbp -  64]
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_3ifback
_3else:
_3ifback:
      mov	r10,[rbp - 8]
      cmp	r10,4
      sete r10b
      movzx r10,r10b
      mov	[rbp - 88],r10
      mov	 r10,[rbp-88]
      cmp	 r10,0
      je	_4else
_4if:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'4'
      mov	byte[rax + 1],0
      mov	[rbp - 80],rax
      mov	rax,[rbp -  80]
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_4ifback
_4else:
_4ifback:
      mov	r10,[rbp - 8]
      cmp	r10,5
      sete r10b
      movzx r10,r10b
      mov	[rbp - 104],r10
      mov	 r10,[rbp-104]
      cmp	 r10,0
      je	_5else
_5if:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'5'
      mov	byte[rax + 1],0
      mov	[rbp - 96],rax
      mov	rax,[rbp -  96]
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_5ifback
_5else:
_5ifback:
      mov	r10,[rbp - 8]
      cmp	r10,6
      sete r10b
      movzx r10,r10b
      mov	[rbp - 120],r10
      mov	 r10,[rbp-120]
      cmp	 r10,0
      je	_6else
_6if:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'6'
      mov	byte[rax + 1],0
      mov	[rbp - 112],rax
      mov	rax,[rbp -  112]
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_6ifback
_6else:
_6ifback:
      mov	r10,[rbp - 8]
      cmp	r10,7
      sete r10b
      movzx r10,r10b
      mov	[rbp - 136],r10
      mov	 r10,[rbp-136]
      cmp	 r10,0
      je	_7else
_7if:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'7'
      mov	byte[rax + 1],0
      mov	[rbp - 128],rax
      mov	rax,[rbp -  128]
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_7ifback
_7else:
_7ifback:
      mov	r10,[rbp - 8]
      cmp	r10,8
      sete r10b
      movzx r10,r10b
      mov	[rbp - 152],r10
      mov	 r10,[rbp-152]
      cmp	 r10,0
      je	_8else
_8if:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'8'
      mov	byte[rax + 1],0
      mov	[rbp - 144],rax
      mov	rax,[rbp -  144]
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_8ifback
_8else:
_8ifback:
      mov	r10,[rbp - 8]
      cmp	r10,9
      sete r10b
      movzx r10,r10b
      mov	[rbp - 168],r10
      mov	 r10,[rbp-168]
      cmp	 r10,0
      je	_9else
_9if:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'9'
      mov	byte[rax + 1],0
      mov	[rbp - 160],rax
      mov	rax,[rbp -  160]
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_9ifback
_9else:
_9ifback:
      mov	rsp,rbp
      pop rbp
      ret
s2:
      push	rbp
      mov	rbp,rsp
      sub	rsp,2000
      mov	[rbp - 208],rdi
      mov	r10,[rbp - 208]
      cmp	r10,9
      setle r10b
      movzx r10,r10b
      mov	[rbp - 256],r10
      mov	 r10,[rbp-256]
      cmp	 r10,0
      je	_10else
_10if:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'s'
      mov	byte[rax + 1],'['
      mov	byte[rax + 2],0
      mov	[rbp - 216],rax
      mov	rdi,[rbp-208]
      push	r10
      push	r11
      call	digt
      pop	r11
      pop	r10
      mov	[rbp -  224],rax
      mov	rdi,[rbp-216]
      mov	rsi,[rbp-224]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  232],rax
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],']'
      mov	byte[rax + 1],'='
      mov	byte[rax + 2],0
      mov	[rbp - 240],rax
      mov	rdi,[rbp-232]
      mov	rsi,[rbp-240]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  248],rax
      mov	rax,[rbp -  248]
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_10ifback
_10else:
_10ifback:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'s'
      mov	byte[rax + 1],'['
      mov	byte[rax + 2],0
      mov	[rbp - 264],rax
      mov	eax,[rbp - 208]
      mov	r10d,10
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 272],rax
      mov	rdi,[rbp-272]
      push	r10
      push	r11
      call	digt
      pop	r11
      pop	r10
      mov	[rbp -  280],rax
      mov	rdi,[rbp-264]
      mov	rsi,[rbp-280]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  288],rax
      mov	eax,[rbp - 208]
      mov	r10d,10
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 296],rdx
      mov	rdi,[rbp-296]
      push	r10
      push	r11
      call	digt
      pop	r11
      pop	r10
      mov	[rbp -  304],rax
      mov	rdi,[rbp-288]
      mov	rsi,[rbp-304]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  312],rax
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],']'
      mov	byte[rax + 1],'='
      mov	byte[rax + 2],0
      mov	[rbp - 320],rax
      mov	rdi,[rbp-312]
      mov	rsi,[rbp-320]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  328],rax
      mov	rax,[rbp -  328]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
c2:
      push	rbp
      mov	rbp,rsp
      sub	rsp,2000
      mov	[rbp - 336],rdi
      mov	r10,[rbp - 336]
      cmp	r10,9
      setle r10b
      movzx r10,r10b
      mov	[rbp - 384],r10
      mov	 r10,[rbp-384]
      cmp	 r10,0
      je	_11else
_11if:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'c'
      mov	byte[rax + 1],'['
      mov	byte[rax + 2],0
      mov	[rbp - 344],rax
      mov	rdi,[rbp-336]
      push	r10
      push	r11
      call	digt
      pop	r11
      pop	r10
      mov	[rbp -  352],rax
      mov	rdi,[rbp-344]
      mov	rsi,[rbp-352]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  360],rax
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],']'
      mov	byte[rax + 1],'='
      mov	byte[rax + 2],0
      mov	[rbp - 368],rax
      mov	rdi,[rbp-360]
      mov	rsi,[rbp-368]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  376],rax
      mov	rax,[rbp -  376]
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_11ifback
_11else:
_11ifback:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'c'
      mov	byte[rax + 1],'['
      mov	byte[rax + 2],0
      mov	[rbp - 392],rax
      mov	eax,[rbp - 336]
      mov	r10d,10
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 400],rax
      mov	rdi,[rbp-400]
      push	r10
      push	r11
      call	digt
      pop	r11
      pop	r10
      mov	[rbp -  408],rax
      mov	rdi,[rbp-392]
      mov	rsi,[rbp-408]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  416],rax
      mov	eax,[rbp - 336]
      mov	r10d,10
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 424],rdx
      mov	rdi,[rbp-424]
      push	r10
      push	r11
      call	digt
      pop	r11
      pop	r10
      mov	[rbp -  432],rax
      mov	rdi,[rbp-416]
      mov	rsi,[rbp-432]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  440],rax
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],']'
      mov	byte[rax + 1],'='
      mov	byte[rax + 2],0
      mov	[rbp - 448],rax
      mov	rdi,[rbp-440]
      mov	rsi,[rbp-448]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  456],rax
      mov	rax,[rbp -  456]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
main:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	r10,256
      add	r10,1
      mov	[rbp - 176],r10
      mov	r10,[rbp - 176]
      imul	r10,256
      mov	[rbp - 176],r10
      mov	rdi,[rbp-176]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  184],rax
      mov	r11,[rbp - 184]
      add	r11,0
      mov	qword[r11],256
      mov	r10,[rbp - 184]
      mov	[lcs],r10
      mov	r10,256
      add	r10,1
      mov	[rbp - 192],r10
      mov	r10,[rbp - 192]
      imul	r10,256
      mov	[rbp - 192],r10
      mov	rdi,[rbp-192]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  200],rax
      mov	r11,[rbp - 200]
      add	r11,0
      mov	qword[r11],256
      mov	r10,[rbp - 200]
      mov	[lcc],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],';'
      mov	byte[rax + 1],0
      mov	[rbp - 464],rax
      mov	r10,[rbp - 464]
      mov	[lcco],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],34
      mov	byte[rax + 1],0
      mov	[rbp - 472],rax
      mov	r10,[rbp - 472]
      mov	[lca2q],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],92
      mov	byte[rax + 1],0
      mov	[rbp - 480],rax
      mov	r10,[rbp - 480]
      mov	[lca2b],r10
      mov	qword[rbp - 488],0
      mov	r10,0
      add	r10,1
      mov	[rbp - 512],r10
      mov	r10,[rbp - 512]
      imul	r10,256
      mov	[rbp - 512],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],' '
      mov	byte[rax + 1],0
      mov	[rbp - 520],rax
      mov	r10,[rbp - 520]
      mov	r11,[lcc]
      add	r11,[rbp - 512]
      mov	[r11],r10
      mov	r10,1
      add	r10,1
      mov	[rbp - 544],r10
      mov	r10,[rbp - 544]
      imul	r10,256
      mov	[rbp - 544],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'!'
      mov	byte[rax + 1],0
      mov	[rbp - 552],rax
      mov	r10,[rbp - 552]
      mov	r11,[lcc]
      add	r11,[rbp - 544]
      mov	[r11],r10
      mov	r10,2
      add	r10,1
      mov	[rbp - 576],r10
      mov	r10,[rbp - 576]
      imul	r10,256
      mov	[rbp - 576],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'#'
      mov	byte[rax + 1],0
      mov	[rbp - 584],rax
      mov	r10,[rbp - 584]
      mov	r11,[lcc]
      add	r11,[rbp - 576]
      mov	[r11],r10
      mov	r10,3
      add	r10,1
      mov	[rbp - 608],r10
      mov	r10,[rbp - 608]
      imul	r10,256
      mov	[rbp - 608],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'$'
      mov	byte[rax + 1],0
      mov	[rbp - 616],rax
      mov	r10,[rbp - 616]
      mov	r11,[lcc]
      add	r11,[rbp - 608]
      mov	[r11],r10
      mov	r10,4
      add	r10,1
      mov	[rbp - 640],r10
      mov	r10,[rbp - 640]
      imul	r10,256
      mov	[rbp - 640],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'%'
      mov	byte[rax + 1],0
      mov	[rbp - 648],rax
      mov	r10,[rbp - 648]
      mov	r11,[lcc]
      add	r11,[rbp - 640]
      mov	[r11],r10
      mov	r10,5
      add	r10,1
      mov	[rbp - 672],r10
      mov	r10,[rbp - 672]
      imul	r10,256
      mov	[rbp - 672],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'&'
      mov	byte[rax + 1],0
      mov	[rbp - 680],rax
      mov	r10,[rbp - 680]
      mov	r11,[lcc]
      add	r11,[rbp - 672]
      mov	[r11],r10
      mov	r10,6
      add	r10,1
      mov	[rbp - 704],r10
      mov	r10,[rbp - 704]
      imul	r10,256
      mov	[rbp - 704],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],39
      mov	byte[rax + 1],0
      mov	[rbp - 712],rax
      mov	r10,[rbp - 712]
      mov	r11,[lcc]
      add	r11,[rbp - 704]
      mov	[r11],r10
      mov	r10,7
      add	r10,1
      mov	[rbp - 736],r10
      mov	r10,[rbp - 736]
      imul	r10,256
      mov	[rbp - 736],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'('
      mov	byte[rax + 1],0
      mov	[rbp - 744],rax
      mov	r10,[rbp - 744]
      mov	r11,[lcc]
      add	r11,[rbp - 736]
      mov	[r11],r10
      mov	r10,8
      add	r10,1
      mov	[rbp - 768],r10
      mov	r10,[rbp - 768]
      imul	r10,256
      mov	[rbp - 768],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],')'
      mov	byte[rax + 1],0
      mov	[rbp - 776],rax
      mov	r10,[rbp - 776]
      mov	r11,[lcc]
      add	r11,[rbp - 768]
      mov	[r11],r10
      mov	r10,9
      add	r10,1
      mov	[rbp - 800],r10
      mov	r10,[rbp - 800]
      imul	r10,256
      mov	[rbp - 800],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'*'
      mov	byte[rax + 1],0
      mov	[rbp - 808],rax
      mov	r10,[rbp - 808]
      mov	r11,[lcc]
      add	r11,[rbp - 800]
      mov	[r11],r10
      mov	r10,10
      add	r10,1
      mov	[rbp - 832],r10
      mov	r10,[rbp - 832]
      imul	r10,256
      mov	[rbp - 832],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'+'
      mov	byte[rax + 1],0
      mov	[rbp - 840],rax
      mov	r10,[rbp - 840]
      mov	r11,[lcc]
      add	r11,[rbp - 832]
      mov	[r11],r10
      mov	r10,11
      add	r10,1
      mov	[rbp - 864],r10
      mov	r10,[rbp - 864]
      imul	r10,256
      mov	[rbp - 864],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],','
      mov	byte[rax + 1],0
      mov	[rbp - 872],rax
      mov	r10,[rbp - 872]
      mov	r11,[lcc]
      add	r11,[rbp - 864]
      mov	[r11],r10
      mov	r10,12
      add	r10,1
      mov	[rbp - 896],r10
      mov	r10,[rbp - 896]
      imul	r10,256
      mov	[rbp - 896],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'-'
      mov	byte[rax + 1],0
      mov	[rbp - 904],rax
      mov	r10,[rbp - 904]
      mov	r11,[lcc]
      add	r11,[rbp - 896]
      mov	[r11],r10
      mov	r10,13
      add	r10,1
      mov	[rbp - 928],r10
      mov	r10,[rbp - 928]
      imul	r10,256
      mov	[rbp - 928],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'.'
      mov	byte[rax + 1],0
      mov	[rbp - 936],rax
      mov	r10,[rbp - 936]
      mov	r11,[lcc]
      add	r11,[rbp - 928]
      mov	[r11],r10
      mov	r10,14
      add	r10,1
      mov	[rbp - 960],r10
      mov	r10,[rbp - 960]
      imul	r10,256
      mov	[rbp - 960],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'/'
      mov	byte[rax + 1],0
      mov	[rbp - 968],rax
      mov	r10,[rbp - 968]
      mov	r11,[lcc]
      add	r11,[rbp - 960]
      mov	[r11],r10
      mov	r10,15
      add	r10,1
      mov	[rbp - 992],r10
      mov	r10,[rbp - 992]
      imul	r10,256
      mov	[rbp - 992],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'0'
      mov	byte[rax + 1],0
      mov	[rbp - 1000],rax
      mov	r10,[rbp - 1000]
      mov	r11,[lcc]
      add	r11,[rbp - 992]
      mov	[r11],r10
      mov	r10,16
      add	r10,1
      mov	[rbp - 1024],r10
      mov	r10,[rbp - 1024]
      imul	r10,256
      mov	[rbp - 1024],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'1'
      mov	byte[rax + 1],0
      mov	[rbp - 1032],rax
      mov	r10,[rbp - 1032]
      mov	r11,[lcc]
      add	r11,[rbp - 1024]
      mov	[r11],r10
      mov	r10,17
      add	r10,1
      mov	[rbp - 1056],r10
      mov	r10,[rbp - 1056]
      imul	r10,256
      mov	[rbp - 1056],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'2'
      mov	byte[rax + 1],0
      mov	[rbp - 1064],rax
      mov	r10,[rbp - 1064]
      mov	r11,[lcc]
      add	r11,[rbp - 1056]
      mov	[r11],r10
      mov	r10,18
      add	r10,1
      mov	[rbp - 1088],r10
      mov	r10,[rbp - 1088]
      imul	r10,256
      mov	[rbp - 1088],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'3'
      mov	byte[rax + 1],0
      mov	[rbp - 1096],rax
      mov	r10,[rbp - 1096]
      mov	r11,[lcc]
      add	r11,[rbp - 1088]
      mov	[r11],r10
      mov	r10,19
      add	r10,1
      mov	[rbp - 1120],r10
      mov	r10,[rbp - 1120]
      imul	r10,256
      mov	[rbp - 1120],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'4'
      mov	byte[rax + 1],0
      mov	[rbp - 1128],rax
      mov	r10,[rbp - 1128]
      mov	r11,[lcc]
      add	r11,[rbp - 1120]
      mov	[r11],r10
      mov	r10,20
      add	r10,1
      mov	[rbp - 1152],r10
      mov	r10,[rbp - 1152]
      imul	r10,256
      mov	[rbp - 1152],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'5'
      mov	byte[rax + 1],0
      mov	[rbp - 1160],rax
      mov	r10,[rbp - 1160]
      mov	r11,[lcc]
      add	r11,[rbp - 1152]
      mov	[r11],r10
      mov	r10,21
      add	r10,1
      mov	[rbp - 1184],r10
      mov	r10,[rbp - 1184]
      imul	r10,256
      mov	[rbp - 1184],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'6'
      mov	byte[rax + 1],0
      mov	[rbp - 1192],rax
      mov	r10,[rbp - 1192]
      mov	r11,[lcc]
      add	r11,[rbp - 1184]
      mov	[r11],r10
      mov	r10,22
      add	r10,1
      mov	[rbp - 1216],r10
      mov	r10,[rbp - 1216]
      imul	r10,256
      mov	[rbp - 1216],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'7'
      mov	byte[rax + 1],0
      mov	[rbp - 1224],rax
      mov	r10,[rbp - 1224]
      mov	r11,[lcc]
      add	r11,[rbp - 1216]
      mov	[r11],r10
      mov	r10,23
      add	r10,1
      mov	[rbp - 1248],r10
      mov	r10,[rbp - 1248]
      imul	r10,256
      mov	[rbp - 1248],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'8'
      mov	byte[rax + 1],0
      mov	[rbp - 1256],rax
      mov	r10,[rbp - 1256]
      mov	r11,[lcc]
      add	r11,[rbp - 1248]
      mov	[r11],r10
      mov	r10,24
      add	r10,1
      mov	[rbp - 1280],r10
      mov	r10,[rbp - 1280]
      imul	r10,256
      mov	[rbp - 1280],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'9'
      mov	byte[rax + 1],0
      mov	[rbp - 1288],rax
      mov	r10,[rbp - 1288]
      mov	r11,[lcc]
      add	r11,[rbp - 1280]
      mov	[r11],r10
      mov	r10,25
      add	r10,1
      mov	[rbp - 1312],r10
      mov	r10,[rbp - 1312]
      imul	r10,256
      mov	[rbp - 1312],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],':'
      mov	byte[rax + 1],0
      mov	[rbp - 1320],rax
      mov	r10,[rbp - 1320]
      mov	r11,[lcc]
      add	r11,[rbp - 1312]
      mov	[r11],r10
      mov	r10,26
      add	r10,1
      mov	[rbp - 1344],r10
      mov	r10,[rbp - 1344]
      imul	r10,256
      mov	[rbp - 1344],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],';'
      mov	byte[rax + 1],0
      mov	[rbp - 1352],rax
      mov	r10,[rbp - 1352]
      mov	r11,[lcc]
      add	r11,[rbp - 1344]
      mov	[r11],r10
      mov	r10,27
      add	r10,1
      mov	[rbp - 1376],r10
      mov	r10,[rbp - 1376]
      imul	r10,256
      mov	[rbp - 1376],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'<'
      mov	byte[rax + 1],0
      mov	[rbp - 1384],rax
      mov	r10,[rbp - 1384]
      mov	r11,[lcc]
      add	r11,[rbp - 1376]
      mov	[r11],r10
      mov	r10,28
      add	r10,1
      mov	[rbp - 1408],r10
      mov	r10,[rbp - 1408]
      imul	r10,256
      mov	[rbp - 1408],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'='
      mov	byte[rax + 1],0
      mov	[rbp - 1416],rax
      mov	r10,[rbp - 1416]
      mov	r11,[lcc]
      add	r11,[rbp - 1408]
      mov	[r11],r10
      mov	r10,29
      add	r10,1
      mov	[rbp - 1440],r10
      mov	r10,[rbp - 1440]
      imul	r10,256
      mov	[rbp - 1440],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'>'
      mov	byte[rax + 1],0
      mov	[rbp - 1448],rax
      mov	r10,[rbp - 1448]
      mov	r11,[lcc]
      add	r11,[rbp - 1440]
      mov	[r11],r10
      mov	r10,30
      add	r10,1
      mov	[rbp - 1472],r10
      mov	r10,[rbp - 1472]
      imul	r10,256
      mov	[rbp - 1472],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'?'
      mov	byte[rax + 1],0
      mov	[rbp - 1480],rax
      mov	r10,[rbp - 1480]
      mov	r11,[lcc]
      add	r11,[rbp - 1472]
      mov	[r11],r10
      mov	r10,31
      add	r10,1
      mov	[rbp - 1504],r10
      mov	r10,[rbp - 1504]
      imul	r10,256
      mov	[rbp - 1504],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'@'
      mov	byte[rax + 1],0
      mov	[rbp - 1512],rax
      mov	r10,[rbp - 1512]
      mov	r11,[lcc]
      add	r11,[rbp - 1504]
      mov	[r11],r10
      mov	r10,32
      add	r10,1
      mov	[rbp - 1536],r10
      mov	r10,[rbp - 1536]
      imul	r10,256
      mov	[rbp - 1536],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'A'
      mov	byte[rax + 1],0
      mov	[rbp - 1544],rax
      mov	r10,[rbp - 1544]
      mov	r11,[lcc]
      add	r11,[rbp - 1536]
      mov	[r11],r10
      mov	r10,33
      add	r10,1
      mov	[rbp - 1568],r10
      mov	r10,[rbp - 1568]
      imul	r10,256
      mov	[rbp - 1568],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'B'
      mov	byte[rax + 1],0
      mov	[rbp - 1576],rax
      mov	r10,[rbp - 1576]
      mov	r11,[lcc]
      add	r11,[rbp - 1568]
      mov	[r11],r10
      mov	r10,34
      add	r10,1
      mov	[rbp - 1600],r10
      mov	r10,[rbp - 1600]
      imul	r10,256
      mov	[rbp - 1600],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'C'
      mov	byte[rax + 1],0
      mov	[rbp - 1608],rax
      mov	r10,[rbp - 1608]
      mov	r11,[lcc]
      add	r11,[rbp - 1600]
      mov	[r11],r10
      mov	r10,35
      add	r10,1
      mov	[rbp - 1632],r10
      mov	r10,[rbp - 1632]
      imul	r10,256
      mov	[rbp - 1632],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'D'
      mov	byte[rax + 1],0
      mov	[rbp - 1640],rax
      mov	r10,[rbp - 1640]
      mov	r11,[lcc]
      add	r11,[rbp - 1632]
      mov	[r11],r10
      mov	r10,36
      add	r10,1
      mov	[rbp - 1664],r10
      mov	r10,[rbp - 1664]
      imul	r10,256
      mov	[rbp - 1664],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'E'
      mov	byte[rax + 1],0
      mov	[rbp - 1672],rax
      mov	r10,[rbp - 1672]
      mov	r11,[lcc]
      add	r11,[rbp - 1664]
      mov	[r11],r10
      mov	r10,37
      add	r10,1
      mov	[rbp - 1696],r10
      mov	r10,[rbp - 1696]
      imul	r10,256
      mov	[rbp - 1696],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'F'
      mov	byte[rax + 1],0
      mov	[rbp - 1704],rax
      mov	r10,[rbp - 1704]
      mov	r11,[lcc]
      add	r11,[rbp - 1696]
      mov	[r11],r10
      mov	r10,38
      add	r10,1
      mov	[rbp - 1728],r10
      mov	r10,[rbp - 1728]
      imul	r10,256
      mov	[rbp - 1728],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'G'
      mov	byte[rax + 1],0
      mov	[rbp - 1736],rax
      mov	r10,[rbp - 1736]
      mov	r11,[lcc]
      add	r11,[rbp - 1728]
      mov	[r11],r10
      mov	r10,39
      add	r10,1
      mov	[rbp - 1760],r10
      mov	r10,[rbp - 1760]
      imul	r10,256
      mov	[rbp - 1760],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'H'
      mov	byte[rax + 1],0
      mov	[rbp - 1768],rax
      mov	r10,[rbp - 1768]
      mov	r11,[lcc]
      add	r11,[rbp - 1760]
      mov	[r11],r10
      mov	r10,40
      add	r10,1
      mov	[rbp - 1792],r10
      mov	r10,[rbp - 1792]
      imul	r10,256
      mov	[rbp - 1792],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'I'
      mov	byte[rax + 1],0
      mov	[rbp - 1800],rax
      mov	r10,[rbp - 1800]
      mov	r11,[lcc]
      add	r11,[rbp - 1792]
      mov	[r11],r10
      mov	r10,41
      add	r10,1
      mov	[rbp - 1824],r10
      mov	r10,[rbp - 1824]
      imul	r10,256
      mov	[rbp - 1824],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'J'
      mov	byte[rax + 1],0
      mov	[rbp - 1832],rax
      mov	r10,[rbp - 1832]
      mov	r11,[lcc]
      add	r11,[rbp - 1824]
      mov	[r11],r10
      mov	r10,42
      add	r10,1
      mov	[rbp - 1856],r10
      mov	r10,[rbp - 1856]
      imul	r10,256
      mov	[rbp - 1856],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'K'
      mov	byte[rax + 1],0
      mov	[rbp - 1864],rax
      mov	r10,[rbp - 1864]
      mov	r11,[lcc]
      add	r11,[rbp - 1856]
      mov	[r11],r10
      mov	r10,43
      add	r10,1
      mov	[rbp - 1888],r10
      mov	r10,[rbp - 1888]
      imul	r10,256
      mov	[rbp - 1888],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'L'
      mov	byte[rax + 1],0
      mov	[rbp - 1896],rax
      mov	r10,[rbp - 1896]
      mov	r11,[lcc]
      add	r11,[rbp - 1888]
      mov	[r11],r10
      mov	r10,44
      add	r10,1
      mov	[rbp - 1920],r10
      mov	r10,[rbp - 1920]
      imul	r10,256
      mov	[rbp - 1920],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'M'
      mov	byte[rax + 1],0
      mov	[rbp - 1928],rax
      mov	r10,[rbp - 1928]
      mov	r11,[lcc]
      add	r11,[rbp - 1920]
      mov	[r11],r10
      mov	r10,45
      add	r10,1
      mov	[rbp - 1952],r10
      mov	r10,[rbp - 1952]
      imul	r10,256
      mov	[rbp - 1952],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'N'
      mov	byte[rax + 1],0
      mov	[rbp - 1960],rax
      mov	r10,[rbp - 1960]
      mov	r11,[lcc]
      add	r11,[rbp - 1952]
      mov	[r11],r10
      mov	r10,46
      add	r10,1
      mov	[rbp - 1984],r10
      mov	r10,[rbp - 1984]
      imul	r10,256
      mov	[rbp - 1984],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'O'
      mov	byte[rax + 1],0
      mov	[rbp - 1992],rax
      mov	r10,[rbp - 1992]
      mov	r11,[lcc]
      add	r11,[rbp - 1984]
      mov	[r11],r10
      mov	r10,47
      add	r10,1
      mov	[rbp - 2016],r10
      mov	r10,[rbp - 2016]
      imul	r10,256
      mov	[rbp - 2016],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'P'
      mov	byte[rax + 1],0
      mov	[rbp - 2024],rax
      mov	r10,[rbp - 2024]
      mov	r11,[lcc]
      add	r11,[rbp - 2016]
      mov	[r11],r10
      mov	r10,48
      add	r10,1
      mov	[rbp - 2048],r10
      mov	r10,[rbp - 2048]
      imul	r10,256
      mov	[rbp - 2048],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'Q'
      mov	byte[rax + 1],0
      mov	[rbp - 2056],rax
      mov	r10,[rbp - 2056]
      mov	r11,[lcc]
      add	r11,[rbp - 2048]
      mov	[r11],r10
      mov	r10,49
      add	r10,1
      mov	[rbp - 2080],r10
      mov	r10,[rbp - 2080]
      imul	r10,256
      mov	[rbp - 2080],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'R'
      mov	byte[rax + 1],0
      mov	[rbp - 2088],rax
      mov	r10,[rbp - 2088]
      mov	r11,[lcc]
      add	r11,[rbp - 2080]
      mov	[r11],r10
      mov	r10,50
      add	r10,1
      mov	[rbp - 2112],r10
      mov	r10,[rbp - 2112]
      imul	r10,256
      mov	[rbp - 2112],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'S'
      mov	byte[rax + 1],0
      mov	[rbp - 2120],rax
      mov	r10,[rbp - 2120]
      mov	r11,[lcc]
      add	r11,[rbp - 2112]
      mov	[r11],r10
      mov	r10,51
      add	r10,1
      mov	[rbp - 2144],r10
      mov	r10,[rbp - 2144]
      imul	r10,256
      mov	[rbp - 2144],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'T'
      mov	byte[rax + 1],0
      mov	[rbp - 2152],rax
      mov	r10,[rbp - 2152]
      mov	r11,[lcc]
      add	r11,[rbp - 2144]
      mov	[r11],r10
      mov	r10,52
      add	r10,1
      mov	[rbp - 2176],r10
      mov	r10,[rbp - 2176]
      imul	r10,256
      mov	[rbp - 2176],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'U'
      mov	byte[rax + 1],0
      mov	[rbp - 2184],rax
      mov	r10,[rbp - 2184]
      mov	r11,[lcc]
      add	r11,[rbp - 2176]
      mov	[r11],r10
      mov	r10,53
      add	r10,1
      mov	[rbp - 2208],r10
      mov	r10,[rbp - 2208]
      imul	r10,256
      mov	[rbp - 2208],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'V'
      mov	byte[rax + 1],0
      mov	[rbp - 2216],rax
      mov	r10,[rbp - 2216]
      mov	r11,[lcc]
      add	r11,[rbp - 2208]
      mov	[r11],r10
      mov	r10,54
      add	r10,1
      mov	[rbp - 2240],r10
      mov	r10,[rbp - 2240]
      imul	r10,256
      mov	[rbp - 2240],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'W'
      mov	byte[rax + 1],0
      mov	[rbp - 2248],rax
      mov	r10,[rbp - 2248]
      mov	r11,[lcc]
      add	r11,[rbp - 2240]
      mov	[r11],r10
      mov	r10,55
      add	r10,1
      mov	[rbp - 2272],r10
      mov	r10,[rbp - 2272]
      imul	r10,256
      mov	[rbp - 2272],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'X'
      mov	byte[rax + 1],0
      mov	[rbp - 2280],rax
      mov	r10,[rbp - 2280]
      mov	r11,[lcc]
      add	r11,[rbp - 2272]
      mov	[r11],r10
      mov	r10,56
      add	r10,1
      mov	[rbp - 2304],r10
      mov	r10,[rbp - 2304]
      imul	r10,256
      mov	[rbp - 2304],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'Y'
      mov	byte[rax + 1],0
      mov	[rbp - 2312],rax
      mov	r10,[rbp - 2312]
      mov	r11,[lcc]
      add	r11,[rbp - 2304]
      mov	[r11],r10
      mov	r10,57
      add	r10,1
      mov	[rbp - 2336],r10
      mov	r10,[rbp - 2336]
      imul	r10,256
      mov	[rbp - 2336],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'Z'
      mov	byte[rax + 1],0
      mov	[rbp - 2344],rax
      mov	r10,[rbp - 2344]
      mov	r11,[lcc]
      add	r11,[rbp - 2336]
      mov	[r11],r10
      mov	r10,58
      add	r10,1
      mov	[rbp - 2368],r10
      mov	r10,[rbp - 2368]
      imul	r10,256
      mov	[rbp - 2368],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'['
      mov	byte[rax + 1],0
      mov	[rbp - 2376],rax
      mov	r10,[rbp - 2376]
      mov	r11,[lcc]
      add	r11,[rbp - 2368]
      mov	[r11],r10
      mov	r10,59
      add	r10,1
      mov	[rbp - 2400],r10
      mov	r10,[rbp - 2400]
      imul	r10,256
      mov	[rbp - 2400],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],']'
      mov	byte[rax + 1],0
      mov	[rbp - 2408],rax
      mov	r10,[rbp - 2408]
      mov	r11,[lcc]
      add	r11,[rbp - 2400]
      mov	[r11],r10
      mov	r10,60
      add	r10,1
      mov	[rbp - 2432],r10
      mov	r10,[rbp - 2432]
      imul	r10,256
      mov	[rbp - 2432],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'^'
      mov	byte[rax + 1],0
      mov	[rbp - 2440],rax
      mov	r10,[rbp - 2440]
      mov	r11,[lcc]
      add	r11,[rbp - 2432]
      mov	[r11],r10
      mov	r10,61
      add	r10,1
      mov	[rbp - 2464],r10
      mov	r10,[rbp - 2464]
      imul	r10,256
      mov	[rbp - 2464],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'_'
      mov	byte[rax + 1],0
      mov	[rbp - 2472],rax
      mov	r10,[rbp - 2472]
      mov	r11,[lcc]
      add	r11,[rbp - 2464]
      mov	[r11],r10
      mov	r10,62
      add	r10,1
      mov	[rbp - 2496],r10
      mov	r10,[rbp - 2496]
      imul	r10,256
      mov	[rbp - 2496],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'`'
      mov	byte[rax + 1],0
      mov	[rbp - 2504],rax
      mov	r10,[rbp - 2504]
      mov	r11,[lcc]
      add	r11,[rbp - 2496]
      mov	[r11],r10
      mov	r10,63
      add	r10,1
      mov	[rbp - 2528],r10
      mov	r10,[rbp - 2528]
      imul	r10,256
      mov	[rbp - 2528],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'a'
      mov	byte[rax + 1],0
      mov	[rbp - 2536],rax
      mov	r10,[rbp - 2536]
      mov	r11,[lcc]
      add	r11,[rbp - 2528]
      mov	[r11],r10
      mov	r10,64
      add	r10,1
      mov	[rbp - 2560],r10
      mov	r10,[rbp - 2560]
      imul	r10,256
      mov	[rbp - 2560],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'b'
      mov	byte[rax + 1],0
      mov	[rbp - 2568],rax
      mov	r10,[rbp - 2568]
      mov	r11,[lcc]
      add	r11,[rbp - 2560]
      mov	[r11],r10
      mov	r10,65
      add	r10,1
      mov	[rbp - 2592],r10
      mov	r10,[rbp - 2592]
      imul	r10,256
      mov	[rbp - 2592],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'c'
      mov	byte[rax + 1],0
      mov	[rbp - 2600],rax
      mov	r10,[rbp - 2600]
      mov	r11,[lcc]
      add	r11,[rbp - 2592]
      mov	[r11],r10
      mov	r10,66
      add	r10,1
      mov	[rbp - 2624],r10
      mov	r10,[rbp - 2624]
      imul	r10,256
      mov	[rbp - 2624],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'d'
      mov	byte[rax + 1],0
      mov	[rbp - 2632],rax
      mov	r10,[rbp - 2632]
      mov	r11,[lcc]
      add	r11,[rbp - 2624]
      mov	[r11],r10
      mov	r10,67
      add	r10,1
      mov	[rbp - 2656],r10
      mov	r10,[rbp - 2656]
      imul	r10,256
      mov	[rbp - 2656],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'e'
      mov	byte[rax + 1],0
      mov	[rbp - 2664],rax
      mov	r10,[rbp - 2664]
      mov	r11,[lcc]
      add	r11,[rbp - 2656]
      mov	[r11],r10
      mov	r10,68
      add	r10,1
      mov	[rbp - 2688],r10
      mov	r10,[rbp - 2688]
      imul	r10,256
      mov	[rbp - 2688],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'f'
      mov	byte[rax + 1],0
      mov	[rbp - 2696],rax
      mov	r10,[rbp - 2696]
      mov	r11,[lcc]
      add	r11,[rbp - 2688]
      mov	[r11],r10
      mov	r10,69
      add	r10,1
      mov	[rbp - 2720],r10
      mov	r10,[rbp - 2720]
      imul	r10,256
      mov	[rbp - 2720],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'g'
      mov	byte[rax + 1],0
      mov	[rbp - 2728],rax
      mov	r10,[rbp - 2728]
      mov	r11,[lcc]
      add	r11,[rbp - 2720]
      mov	[r11],r10
      mov	r10,70
      add	r10,1
      mov	[rbp - 2752],r10
      mov	r10,[rbp - 2752]
      imul	r10,256
      mov	[rbp - 2752],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'h'
      mov	byte[rax + 1],0
      mov	[rbp - 2760],rax
      mov	r10,[rbp - 2760]
      mov	r11,[lcc]
      add	r11,[rbp - 2752]
      mov	[r11],r10
      mov	r10,71
      add	r10,1
      mov	[rbp - 2784],r10
      mov	r10,[rbp - 2784]
      imul	r10,256
      mov	[rbp - 2784],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'i'
      mov	byte[rax + 1],0
      mov	[rbp - 2792],rax
      mov	r10,[rbp - 2792]
      mov	r11,[lcc]
      add	r11,[rbp - 2784]
      mov	[r11],r10
      mov	r10,72
      add	r10,1
      mov	[rbp - 2816],r10
      mov	r10,[rbp - 2816]
      imul	r10,256
      mov	[rbp - 2816],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'j'
      mov	byte[rax + 1],0
      mov	[rbp - 2824],rax
      mov	r10,[rbp - 2824]
      mov	r11,[lcc]
      add	r11,[rbp - 2816]
      mov	[r11],r10
      mov	r10,73
      add	r10,1
      mov	[rbp - 2848],r10
      mov	r10,[rbp - 2848]
      imul	r10,256
      mov	[rbp - 2848],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'k'
      mov	byte[rax + 1],0
      mov	[rbp - 2856],rax
      mov	r10,[rbp - 2856]
      mov	r11,[lcc]
      add	r11,[rbp - 2848]
      mov	[r11],r10
      mov	r10,74
      add	r10,1
      mov	[rbp - 2880],r10
      mov	r10,[rbp - 2880]
      imul	r10,256
      mov	[rbp - 2880],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'l'
      mov	byte[rax + 1],0
      mov	[rbp - 2888],rax
      mov	r10,[rbp - 2888]
      mov	r11,[lcc]
      add	r11,[rbp - 2880]
      mov	[r11],r10
      mov	r10,75
      add	r10,1
      mov	[rbp - 2912],r10
      mov	r10,[rbp - 2912]
      imul	r10,256
      mov	[rbp - 2912],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'m'
      mov	byte[rax + 1],0
      mov	[rbp - 2920],rax
      mov	r10,[rbp - 2920]
      mov	r11,[lcc]
      add	r11,[rbp - 2912]
      mov	[r11],r10
      mov	r10,76
      add	r10,1
      mov	[rbp - 2944],r10
      mov	r10,[rbp - 2944]
      imul	r10,256
      mov	[rbp - 2944],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'n'
      mov	byte[rax + 1],0
      mov	[rbp - 2952],rax
      mov	r10,[rbp - 2952]
      mov	r11,[lcc]
      add	r11,[rbp - 2944]
      mov	[r11],r10
      mov	r10,77
      add	r10,1
      mov	[rbp - 2976],r10
      mov	r10,[rbp - 2976]
      imul	r10,256
      mov	[rbp - 2976],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'o'
      mov	byte[rax + 1],0
      mov	[rbp - 2984],rax
      mov	r10,[rbp - 2984]
      mov	r11,[lcc]
      add	r11,[rbp - 2976]
      mov	[r11],r10
      mov	r10,78
      add	r10,1
      mov	[rbp - 3008],r10
      mov	r10,[rbp - 3008]
      imul	r10,256
      mov	[rbp - 3008],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],0
      mov	[rbp - 3016],rax
      mov	r10,[rbp - 3016]
      mov	r11,[lcc]
      add	r11,[rbp - 3008]
      mov	[r11],r10
      mov	r10,79
      add	r10,1
      mov	[rbp - 3040],r10
      mov	r10,[rbp - 3040]
      imul	r10,256
      mov	[rbp - 3040],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'q'
      mov	byte[rax + 1],0
      mov	[rbp - 3048],rax
      mov	r10,[rbp - 3048]
      mov	r11,[lcc]
      add	r11,[rbp - 3040]
      mov	[r11],r10
      mov	r10,80
      add	r10,1
      mov	[rbp - 3072],r10
      mov	r10,[rbp - 3072]
      imul	r10,256
      mov	[rbp - 3072],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'r'
      mov	byte[rax + 1],0
      mov	[rbp - 3080],rax
      mov	r10,[rbp - 3080]
      mov	r11,[lcc]
      add	r11,[rbp - 3072]
      mov	[r11],r10
      mov	r10,81
      add	r10,1
      mov	[rbp - 3104],r10
      mov	r10,[rbp - 3104]
      imul	r10,256
      mov	[rbp - 3104],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'s'
      mov	byte[rax + 1],0
      mov	[rbp - 3112],rax
      mov	r10,[rbp - 3112]
      mov	r11,[lcc]
      add	r11,[rbp - 3104]
      mov	[r11],r10
      mov	r10,82
      add	r10,1
      mov	[rbp - 3136],r10
      mov	r10,[rbp - 3136]
      imul	r10,256
      mov	[rbp - 3136],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'t'
      mov	byte[rax + 1],0
      mov	[rbp - 3144],rax
      mov	r10,[rbp - 3144]
      mov	r11,[lcc]
      add	r11,[rbp - 3136]
      mov	[r11],r10
      mov	r10,83
      add	r10,1
      mov	[rbp - 3168],r10
      mov	r10,[rbp - 3168]
      imul	r10,256
      mov	[rbp - 3168],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'u'
      mov	byte[rax + 1],0
      mov	[rbp - 3176],rax
      mov	r10,[rbp - 3176]
      mov	r11,[lcc]
      add	r11,[rbp - 3168]
      mov	[r11],r10
      mov	r10,84
      add	r10,1
      mov	[rbp - 3200],r10
      mov	r10,[rbp - 3200]
      imul	r10,256
      mov	[rbp - 3200],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'v'
      mov	byte[rax + 1],0
      mov	[rbp - 3208],rax
      mov	r10,[rbp - 3208]
      mov	r11,[lcc]
      add	r11,[rbp - 3200]
      mov	[r11],r10
      mov	r10,85
      add	r10,1
      mov	[rbp - 3232],r10
      mov	r10,[rbp - 3232]
      imul	r10,256
      mov	[rbp - 3232],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'w'
      mov	byte[rax + 1],0
      mov	[rbp - 3240],rax
      mov	r10,[rbp - 3240]
      mov	r11,[lcc]
      add	r11,[rbp - 3232]
      mov	[r11],r10
      mov	r10,86
      add	r10,1
      mov	[rbp - 3264],r10
      mov	r10,[rbp - 3264]
      imul	r10,256
      mov	[rbp - 3264],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'x'
      mov	byte[rax + 1],0
      mov	[rbp - 3272],rax
      mov	r10,[rbp - 3272]
      mov	r11,[lcc]
      add	r11,[rbp - 3264]
      mov	[r11],r10
      mov	r10,87
      add	r10,1
      mov	[rbp - 3296],r10
      mov	r10,[rbp - 3296]
      imul	r10,256
      mov	[rbp - 3296],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'y'
      mov	byte[rax + 1],0
      mov	[rbp - 3304],rax
      mov	r10,[rbp - 3304]
      mov	r11,[lcc]
      add	r11,[rbp - 3296]
      mov	[r11],r10
      mov	r10,88
      add	r10,1
      mov	[rbp - 3328],r10
      mov	r10,[rbp - 3328]
      imul	r10,256
      mov	[rbp - 3328],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'z'
      mov	byte[rax + 1],0
      mov	[rbp - 3336],rax
      mov	r10,[rbp - 3336]
      mov	r11,[lcc]
      add	r11,[rbp - 3328]
      mov	[r11],r10
      mov	r10,89
      add	r10,1
      mov	[rbp - 3360],r10
      mov	r10,[rbp - 3360]
      imul	r10,256
      mov	[rbp - 3360],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'{'
      mov	byte[rax + 1],0
      mov	[rbp - 3368],rax
      mov	r10,[rbp - 3368]
      mov	r11,[lcc]
      add	r11,[rbp - 3360]
      mov	[r11],r10
      mov	r10,90
      add	r10,1
      mov	[rbp - 3392],r10
      mov	r10,[rbp - 3392]
      imul	r10,256
      mov	[rbp - 3392],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'|'
      mov	byte[rax + 1],0
      mov	[rbp - 3400],rax
      mov	r10,[rbp - 3400]
      mov	r11,[lcc]
      add	r11,[rbp - 3392]
      mov	[r11],r10
      mov	r10,91
      add	r10,1
      mov	[rbp - 3424],r10
      mov	r10,[rbp - 3424]
      imul	r10,256
      mov	[rbp - 3424],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'}'
      mov	byte[rax + 1],0
      mov	[rbp - 3432],rax
      mov	r10,[rbp - 3432]
      mov	r11,[lcc]
      add	r11,[rbp - 3424]
      mov	[r11],r10
      mov	r10,92
      add	r10,1
      mov	[rbp - 3456],r10
      mov	r10,[rbp - 3456]
      imul	r10,256
      mov	[rbp - 3456],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'~'
      mov	byte[rax + 1],0
      mov	[rbp - 3464],rax
      mov	r10,[rbp - 3464]
      mov	r11,[lcc]
      add	r11,[rbp - 3456]
      mov	[r11],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 3488],r10
      mov	r10,[rbp - 3488]
      imul	r10,256
      mov	[rbp - 3488],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'i'
      mov	byte[rax + 1],'n'
      mov	byte[rax + 2],'t'
      mov	byte[rax + 3],' '
      mov	byte[rax + 4],'m'
      mov	byte[rax + 5],'a'
      mov	byte[rax + 6],'i'
      mov	byte[rax + 7],'n'
      mov	byte[rax + 8],'('
      mov	byte[rax + 9],')'
      mov	byte[rax + 10],'{'
      mov	byte[rax + 11],'i'
      mov	byte[rax + 12],'n'
      mov	byte[rax + 13],'t'
      mov	byte[rax + 14],' '
      mov	byte[rax + 15],'i'
      mov	byte[rax + 16],'='
      mov	byte[rax + 17],'0'
      mov	byte[rax + 18],';'
      mov	byte[rax + 19],'/'
      mov	byte[rax + 20],'/'
      mov	byte[rax + 21],' '
      mov	byte[rax + 22],'Q'
      mov	byte[rax + 23],'u'
      mov	byte[rax + 24],'i'
      mov	byte[rax + 25],'n'
      mov	byte[rax + 26],'e'
      mov	byte[rax + 27],' '
      mov	byte[rax + 28],'i'
      mov	byte[rax + 29],'s'
      mov	byte[rax + 30],' '
      mov	byte[rax + 31],'a'
      mov	byte[rax + 32],' '
      mov	byte[rax + 33],'a'
      mov	byte[rax + 34],' '
      mov	byte[rax + 35],'p'
      mov	byte[rax + 36],'r'
      mov	byte[rax + 37],'o'
      mov	byte[rax + 38],'g'
      mov	byte[rax + 39],'r'
      mov	byte[rax + 40],'a'
      mov	byte[rax + 41],'m'
      mov	byte[rax + 42],' '
      mov	byte[rax + 43],'t'
      mov	byte[rax + 44],'h'
      mov	byte[rax + 45],'a'
      mov	byte[rax + 46],'t'
      mov	byte[rax + 47],' '
      mov	byte[rax + 48],'p'
      mov	byte[rax + 49],'r'
      mov	byte[rax + 50],'o'
      mov	byte[rax + 51],'d'
      mov	byte[rax + 52],'u'
      mov	byte[rax + 53],'c'
      mov	byte[rax + 54],'e'
      mov	byte[rax + 55],'s'
      mov	byte[rax + 56],' '
      mov	byte[rax + 57],'i'
      mov	byte[rax + 58],'t'
      mov	byte[rax + 59],'s'
      mov	byte[rax + 60],' '
      mov	byte[rax + 61],'s'
      mov	byte[rax + 62],'o'
      mov	byte[rax + 63],'u'
      mov	byte[rax + 64],'r'
      mov	byte[rax + 65],'c'
      mov	byte[rax + 66],'e'
      mov	byte[rax + 67],' '
      mov	byte[rax + 68],'c'
      mov	byte[rax + 69],'o'
      mov	byte[rax + 70],'d'
      mov	byte[rax + 71],'e'
      mov	byte[rax + 72],' '
      mov	byte[rax + 73],'a'
      mov	byte[rax + 74],'s'
      mov	byte[rax + 75],' '
      mov	byte[rax + 76],'o'
      mov	byte[rax + 77],'u'
      mov	byte[rax + 78],'t'
      mov	byte[rax + 79],'p'
      mov	byte[rax + 80],'u'
      mov	byte[rax + 81],'t'
      mov	byte[rax + 82],'.'
      mov	byte[rax + 83],0
      mov	[rbp - 3496],rax
      mov	r10,[rbp - 3496]
      mov	r11,[lcs]
      add	r11,[rbp - 3488]
      mov	[r11],r10
      mov	r10,1
      add	r10,1
      mov	[rbp - 3520],r10
      mov	r10,[rbp - 3520]
      imul	r10,256
      mov	[rbp - 3520],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],'r'
      mov	byte[rax + 2],'i'
      mov	byte[rax + 3],'n'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'n'
      mov	byte[rax + 7],'('
      mov	byte[rax + 8],'c'
      mov	byte[rax + 9],'['
      mov	byte[rax + 10],'8'
      mov	byte[rax + 11],'1'
      mov	byte[rax + 12],']'
      mov	byte[rax + 13],'+'
      mov	byte[rax + 14],'c'
      mov	byte[rax + 15],'['
      mov	byte[rax + 16],'8'
      mov	byte[rax + 17],'2'
      mov	byte[rax + 18],']'
      mov	byte[rax + 19],'+'
      mov	byte[rax + 20],'c'
      mov	byte[rax + 21],'['
      mov	byte[rax + 22],'8'
      mov	byte[rax + 23],'0'
      mov	byte[rax + 24],']'
      mov	byte[rax + 25],'+'
      mov	byte[rax + 26],'c'
      mov	byte[rax + 27],'['
      mov	byte[rax + 28],'7'
      mov	byte[rax + 29],'1'
      mov	byte[rax + 30],']'
      mov	byte[rax + 31],'+'
      mov	byte[rax + 32],'c'
      mov	byte[rax + 33],'['
      mov	byte[rax + 34],'7'
      mov	byte[rax + 35],'6'
      mov	byte[rax + 36],']'
      mov	byte[rax + 37],'+'
      mov	byte[rax + 38],'c'
      mov	byte[rax + 39],'['
      mov	byte[rax + 40],'6'
      mov	byte[rax + 41],'9'
      mov	byte[rax + 42],']'
      mov	byte[rax + 43],'+'
      mov	byte[rax + 44],'c'
      mov	byte[rax + 45],'['
      mov	byte[rax + 46],'0'
      mov	byte[rax + 47],']'
      mov	byte[rax + 48],'+'
      mov	byte[rax + 49],'c'
      mov	byte[rax + 50],'['
      mov	byte[rax + 51],'6'
      mov	byte[rax + 52],'6'
      mov	byte[rax + 53],']'
      mov	byte[rax + 54],'+'
      mov	byte[rax + 55],'c'
      mov	byte[rax + 56],'['
      mov	byte[rax + 57],'7'
      mov	byte[rax + 58],'1'
      mov	byte[rax + 59],']'
      mov	byte[rax + 60],'+'
      mov	byte[rax + 61],'c'
      mov	byte[rax + 62],'['
      mov	byte[rax + 63],'6'
      mov	byte[rax + 64],'9'
      mov	byte[rax + 65],']'
      mov	byte[rax + 66],'+'
      mov	byte[rax + 67],'c'
      mov	byte[rax + 68],'['
      mov	byte[rax + 69],'8'
      mov	byte[rax + 70],'2'
      mov	byte[rax + 71],']'
      mov	byte[rax + 72],'+'
      mov	byte[rax + 73],'c'
      mov	byte[rax + 74],'['
      mov	byte[rax + 75],'7'
      mov	byte[rax + 76],']'
      mov	byte[rax + 77],'+'
      mov	byte[rax + 78],'c'
      mov	byte[rax + 79],'['
      mov	byte[rax + 80],'7'
      mov	byte[rax + 81],'1'
      mov	byte[rax + 82],']'
      mov	byte[rax + 83],'+'
      mov	byte[rax + 84],'c'
      mov	byte[rax + 85],'['
      mov	byte[rax + 86],'7'
      mov	byte[rax + 87],'6'
      mov	byte[rax + 88],']'
      mov	byte[rax + 89],'+'
      mov	byte[rax + 90],'c'
      mov	byte[rax + 91],'['
      mov	byte[rax + 92],'8'
      mov	byte[rax + 93],'2'
      mov	byte[rax + 94],']'
      mov	byte[rax + 95],'+'
      mov	byte[rax + 96],'c'
      mov	byte[rax + 97],'['
      mov	byte[rax + 98],'0'
      mov	byte[rax + 99],']'
      mov	byte[rax + 100],'+'
      mov	byte[rax + 101],'c'
      mov	byte[rax + 102],'['
      mov	byte[rax + 103],'8'
      mov	byte[rax + 104],'6'
      mov	byte[rax + 105],']'
      mov	byte[rax + 106],'+'
      mov	byte[rax + 107],'c'
      mov	byte[rax + 108],'['
      mov	byte[rax + 109],'8'
      mov	byte[rax + 110],']'
      mov	byte[rax + 111],'+'
      mov	byte[rax + 112],'c'
      mov	byte[rax + 113],'['
      mov	byte[rax + 114],'8'
      mov	byte[rax + 115],'9'
      mov	byte[rax + 116],']'
      mov	byte[rax + 117],')'
      mov	byte[rax + 118],';'
      mov	byte[rax + 119],0
      mov	[rbp - 3528],rax
      mov	r10,[rbp - 3528]
      mov	r11,[lcs]
      add	r11,[rbp - 3520]
      mov	[r11],r10
      mov	r10,2
      add	r10,1
      mov	[rbp - 3552],r10
      mov	r10,[rbp - 3552]
      imul	r10,256
      mov	[rbp - 3552],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],'r'
      mov	byte[rax + 2],'i'
      mov	byte[rax + 3],'n'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'n'
      mov	byte[rax + 7],'('
      mov	byte[rax + 8],'c'
      mov	byte[rax + 9],'['
      mov	byte[rax + 10],'7'
      mov	byte[rax + 11],'1'
      mov	byte[rax + 12],']'
      mov	byte[rax + 13],'+'
      mov	byte[rax + 14],'c'
      mov	byte[rax + 15],'['
      mov	byte[rax + 16],'6'
      mov	byte[rax + 17],'8'
      mov	byte[rax + 18],']'
      mov	byte[rax + 19],'+'
      mov	byte[rax + 20],'c'
      mov	byte[rax + 21],'['
      mov	byte[rax + 22],'7'
      mov	byte[rax + 23],']'
      mov	byte[rax + 24],'+'
      mov	byte[rax + 25],'c'
      mov	byte[rax + 26],'['
      mov	byte[rax + 27],'8'
      mov	byte[rax + 28],'6'
      mov	byte[rax + 29],']'
      mov	byte[rax + 30],'+'
      mov	byte[rax + 31],'c'
      mov	byte[rax + 32],'['
      mov	byte[rax + 33],'2'
      mov	byte[rax + 34],'8'
      mov	byte[rax + 35],']'
      mov	byte[rax + 36],'+'
      mov	byte[rax + 37],'c'
      mov	byte[rax + 38],'['
      mov	byte[rax + 39],'2'
      mov	byte[rax + 40],'8'
      mov	byte[rax + 41],']'
      mov	byte[rax + 42],'+'
      mov	byte[rax + 43],'c'
      mov	byte[rax + 44],'['
      mov	byte[rax + 45],'1'
      mov	byte[rax + 46],'5'
      mov	byte[rax + 47],']'
      mov	byte[rax + 48],'+'
      mov	byte[rax + 49],'c'
      mov	byte[rax + 50],'['
      mov	byte[rax + 51],'8'
      mov	byte[rax + 52],']'
      mov	byte[rax + 53],'+'
      mov	byte[rax + 54],'c'
      mov	byte[rax + 55],'['
      mov	byte[rax + 56],'8'
      mov	byte[rax + 57],'0'
      mov	byte[rax + 58],']'
      mov	byte[rax + 59],'+'
      mov	byte[rax + 60],'c'
      mov	byte[rax + 61],'['
      mov	byte[rax + 62],'6'
      mov	byte[rax + 63],'7'
      mov	byte[rax + 64],']'
      mov	byte[rax + 65],'+'
      mov	byte[rax + 66],'c'
      mov	byte[rax + 67],'['
      mov	byte[rax + 68],'8'
      mov	byte[rax + 69],'2'
      mov	byte[rax + 70],']'
      mov	byte[rax + 71],'+'
      mov	byte[rax + 72],'c'
      mov	byte[rax + 73],'['
      mov	byte[rax + 74],'8'
      mov	byte[rax + 75],'3'
      mov	byte[rax + 76],']'
      mov	byte[rax + 77],'+'
      mov	byte[rax + 78],'c'
      mov	byte[rax + 79],'['
      mov	byte[rax + 80],'8'
      mov	byte[rax + 81],'0'
      mov	byte[rax + 82],']'
      mov	byte[rax + 83],'+'
      mov	byte[rax + 84],'c'
      mov	byte[rax + 85],'['
      mov	byte[rax + 86],'7'
      mov	byte[rax + 87],'6'
      mov	byte[rax + 88],']'
      mov	byte[rax + 89],'+'
      mov	byte[rax + 90],'c'
      mov	byte[rax + 91],'['
      mov	byte[rax + 92],'0'
      mov	byte[rax + 93],']'
      mov	byte[rax + 94],'+'
      mov	byte[rax + 95],'a'
      mov	byte[rax + 96],'2'
      mov	byte[rax + 97],'q'
      mov	byte[rax + 98],'+'
      mov	byte[rax + 99],'c'
      mov	byte[rax + 100],'['
      mov	byte[rax + 101],'1'
      mov	byte[rax + 102],'5'
      mov	byte[rax + 103],']'
      mov	byte[rax + 104],'+'
      mov	byte[rax + 105],'a'
      mov	byte[rax + 106],'2'
      mov	byte[rax + 107],'q'
      mov	byte[rax + 108],'+'
      mov	byte[rax + 109],'c'
      mov	byte[rax + 110],'['
      mov	byte[rax + 111],'2'
      mov	byte[rax + 112],'6'
      mov	byte[rax + 113],']'
      mov	byte[rax + 114],')'
      mov	byte[rax + 115],';'
      mov	byte[rax + 116],0
      mov	[rbp - 3560],rax
      mov	r10,[rbp - 3560]
      mov	r11,[lcs]
      add	r11,[rbp - 3552]
      mov	[r11],r10
      mov	r10,3
      add	r10,1
      mov	[rbp - 3584],r10
      mov	r10,[rbp - 3584]
      imul	r10,256
      mov	[rbp - 3584],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],'r'
      mov	byte[rax + 2],'i'
      mov	byte[rax + 3],'n'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'n'
      mov	byte[rax + 7],'('
      mov	byte[rax + 8],'c'
      mov	byte[rax + 9],'['
      mov	byte[rax + 10],'7'
      mov	byte[rax + 11],'1'
      mov	byte[rax + 12],']'
      mov	byte[rax + 13],'+'
      mov	byte[rax + 14],'c'
      mov	byte[rax + 15],'['
      mov	byte[rax + 16],'6'
      mov	byte[rax + 17],'8'
      mov	byte[rax + 18],']'
      mov	byte[rax + 19],'+'
      mov	byte[rax + 20],'c'
      mov	byte[rax + 21],'['
      mov	byte[rax + 22],'7'
      mov	byte[rax + 23],']'
      mov	byte[rax + 24],'+'
      mov	byte[rax + 25],'c'
      mov	byte[rax + 26],'['
      mov	byte[rax + 27],'8'
      mov	byte[rax + 28],'6'
      mov	byte[rax + 29],']'
      mov	byte[rax + 30],'+'
      mov	byte[rax + 31],'c'
      mov	byte[rax + 32],'['
      mov	byte[rax + 33],'2'
      mov	byte[rax + 34],'8'
      mov	byte[rax + 35],']'
      mov	byte[rax + 36],'+'
      mov	byte[rax + 37],'c'
      mov	byte[rax + 38],'['
      mov	byte[rax + 39],'2'
      mov	byte[rax + 40],'8'
      mov	byte[rax + 41],']'
      mov	byte[rax + 42],'+'
      mov	byte[rax + 43],'c'
      mov	byte[rax + 44],'['
      mov	byte[rax + 45],'1'
      mov	byte[rax + 46],'6'
      mov	byte[rax + 47],']'
      mov	byte[rax + 48],'+'
      mov	byte[rax + 49],'c'
      mov	byte[rax + 50],'['
      mov	byte[rax + 51],'8'
      mov	byte[rax + 52],']'
      mov	byte[rax + 53],'+'
      mov	byte[rax + 54],'c'
      mov	byte[rax + 55],'['
      mov	byte[rax + 56],'8'
      mov	byte[rax + 57],'0'
      mov	byte[rax + 58],']'
      mov	byte[rax + 59],'+'
      mov	byte[rax + 60],'c'
      mov	byte[rax + 61],'['
      mov	byte[rax + 62],'6'
      mov	byte[rax + 63],'7'
      mov	byte[rax + 64],']'
      mov	byte[rax + 65],'+'
      mov	byte[rax + 66],'c'
      mov	byte[rax + 67],'['
      mov	byte[rax + 68],'8'
      mov	byte[rax + 69],'2'
      mov	byte[rax + 70],']'
      mov	byte[rax + 71],'+'
      mov	byte[rax + 72],'c'
      mov	byte[rax + 73],'['
      mov	byte[rax + 74],'8'
      mov	byte[rax + 75],'3'
      mov	byte[rax + 76],']'
      mov	byte[rax + 77],'+'
      mov	byte[rax + 78],'c'
      mov	byte[rax + 79],'['
      mov	byte[rax + 80],'8'
      mov	byte[rax + 81],'0'
      mov	byte[rax + 82],']'
      mov	byte[rax + 83],'+'
      mov	byte[rax + 84],'c'
      mov	byte[rax + 85],'['
      mov	byte[rax + 86],'7'
      mov	byte[rax + 87],'6'
      mov	byte[rax + 88],']'
      mov	byte[rax + 89],'+'
      mov	byte[rax + 90],'c'
      mov	byte[rax + 91],'['
      mov	byte[rax + 92],'0'
      mov	byte[rax + 93],']'
      mov	byte[rax + 94],'+'
      mov	byte[rax + 95],'a'
      mov	byte[rax + 96],'2'
      mov	byte[rax + 97],'q'
      mov	byte[rax + 98],'+'
      mov	byte[rax + 99],'c'
      mov	byte[rax + 100],'['
      mov	byte[rax + 101],'1'
      mov	byte[rax + 102],'6'
      mov	byte[rax + 103],']'
      mov	byte[rax + 104],'+'
      mov	byte[rax + 105],'a'
      mov	byte[rax + 106],'2'
      mov	byte[rax + 107],'q'
      mov	byte[rax + 108],'+'
      mov	byte[rax + 109],'c'
      mov	byte[rax + 110],'['
      mov	byte[rax + 111],'2'
      mov	byte[rax + 112],'6'
      mov	byte[rax + 113],']'
      mov	byte[rax + 114],')'
      mov	byte[rax + 115],';'
      mov	byte[rax + 116],0
      mov	[rbp - 3592],rax
      mov	r10,[rbp - 3592]
      mov	r11,[lcs]
      add	r11,[rbp - 3584]
      mov	[r11],r10
      mov	r10,4
      add	r10,1
      mov	[rbp - 3616],r10
      mov	r10,[rbp - 3616]
      imul	r10,256
      mov	[rbp - 3616],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],'r'
      mov	byte[rax + 2],'i'
      mov	byte[rax + 3],'n'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'n'
      mov	byte[rax + 7],'('
      mov	byte[rax + 8],'c'
      mov	byte[rax + 9],'['
      mov	byte[rax + 10],'7'
      mov	byte[rax + 11],'1'
      mov	byte[rax + 12],']'
      mov	byte[rax + 13],'+'
      mov	byte[rax + 14],'c'
      mov	byte[rax + 15],'['
      mov	byte[rax + 16],'6'
      mov	byte[rax + 17],'8'
      mov	byte[rax + 18],']'
      mov	byte[rax + 19],'+'
      mov	byte[rax + 20],'c'
      mov	byte[rax + 21],'['
      mov	byte[rax + 22],'7'
      mov	byte[rax + 23],']'
      mov	byte[rax + 24],'+'
      mov	byte[rax + 25],'c'
      mov	byte[rax + 26],'['
      mov	byte[rax + 27],'8'
      mov	byte[rax + 28],'6'
      mov	byte[rax + 29],']'
      mov	byte[rax + 30],'+'
      mov	byte[rax + 31],'c'
      mov	byte[rax + 32],'['
      mov	byte[rax + 33],'2'
      mov	byte[rax + 34],'8'
      mov	byte[rax + 35],']'
      mov	byte[rax + 36],'+'
      mov	byte[rax + 37],'c'
      mov	byte[rax + 38],'['
      mov	byte[rax + 39],'2'
      mov	byte[rax + 40],'8'
      mov	byte[rax + 41],']'
      mov	byte[rax + 42],'+'
      mov	byte[rax + 43],'c'
      mov	byte[rax + 44],'['
      mov	byte[rax + 45],'1'
      mov	byte[rax + 46],'7'
      mov	byte[rax + 47],']'
      mov	byte[rax + 48],'+'
      mov	byte[rax + 49],'c'
      mov	byte[rax + 50],'['
      mov	byte[rax + 51],'8'
      mov	byte[rax + 52],']'
      mov	byte[rax + 53],'+'
      mov	byte[rax + 54],'c'
      mov	byte[rax + 55],'['
      mov	byte[rax + 56],'8'
      mov	byte[rax + 57],'0'
      mov	byte[rax + 58],']'
      mov	byte[rax + 59],'+'
      mov	byte[rax + 60],'c'
      mov	byte[rax + 61],'['
      mov	byte[rax + 62],'6'
      mov	byte[rax + 63],'7'
      mov	byte[rax + 64],']'
      mov	byte[rax + 65],'+'
      mov	byte[rax + 66],'c'
      mov	byte[rax + 67],'['
      mov	byte[rax + 68],'8'
      mov	byte[rax + 69],'2'
      mov	byte[rax + 70],']'
      mov	byte[rax + 71],'+'
      mov	byte[rax + 72],'c'
      mov	byte[rax + 73],'['
      mov	byte[rax + 74],'8'
      mov	byte[rax + 75],'3'
      mov	byte[rax + 76],']'
      mov	byte[rax + 77],'+'
      mov	byte[rax + 78],'c'
      mov	byte[rax + 79],'['
      mov	byte[rax + 80],'8'
      mov	byte[rax + 81],'0'
      mov	byte[rax + 82],']'
      mov	byte[rax + 83],'+'
      mov	byte[rax + 84],'c'
      mov	byte[rax + 85],'['
      mov	byte[rax + 86],'7'
      mov	byte[rax + 87],'6'
      mov	byte[rax + 88],']'
      mov	byte[rax + 89],'+'
      mov	byte[rax + 90],'c'
      mov	byte[rax + 91],'['
      mov	byte[rax + 92],'0'
      mov	byte[rax + 93],']'
      mov	byte[rax + 94],'+'
      mov	byte[rax + 95],'a'
      mov	byte[rax + 96],'2'
      mov	byte[rax + 97],'q'
      mov	byte[rax + 98],'+'
      mov	byte[rax + 99],'c'
      mov	byte[rax + 100],'['
      mov	byte[rax + 101],'1'
      mov	byte[rax + 102],'7'
      mov	byte[rax + 103],']'
      mov	byte[rax + 104],'+'
      mov	byte[rax + 105],'a'
      mov	byte[rax + 106],'2'
      mov	byte[rax + 107],'q'
      mov	byte[rax + 108],'+'
      mov	byte[rax + 109],'c'
      mov	byte[rax + 110],'['
      mov	byte[rax + 111],'2'
      mov	byte[rax + 112],'6'
      mov	byte[rax + 113],']'
      mov	byte[rax + 114],')'
      mov	byte[rax + 115],';'
      mov	byte[rax + 116],0
      mov	[rbp - 3624],rax
      mov	r10,[rbp - 3624]
      mov	r11,[lcs]
      add	r11,[rbp - 3616]
      mov	[r11],r10
      mov	r10,5
      add	r10,1
      mov	[rbp - 3648],r10
      mov	r10,[rbp - 3648]
      imul	r10,256
      mov	[rbp - 3648],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],'r'
      mov	byte[rax + 2],'i'
      mov	byte[rax + 3],'n'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'n'
      mov	byte[rax + 7],'('
      mov	byte[rax + 8],'c'
      mov	byte[rax + 9],'['
      mov	byte[rax + 10],'7'
      mov	byte[rax + 11],'1'
      mov	byte[rax + 12],']'
      mov	byte[rax + 13],'+'
      mov	byte[rax + 14],'c'
      mov	byte[rax + 15],'['
      mov	byte[rax + 16],'6'
      mov	byte[rax + 17],'8'
      mov	byte[rax + 18],']'
      mov	byte[rax + 19],'+'
      mov	byte[rax + 20],'c'
      mov	byte[rax + 21],'['
      mov	byte[rax + 22],'7'
      mov	byte[rax + 23],']'
      mov	byte[rax + 24],'+'
      mov	byte[rax + 25],'c'
      mov	byte[rax + 26],'['
      mov	byte[rax + 27],'8'
      mov	byte[rax + 28],'6'
      mov	byte[rax + 29],']'
      mov	byte[rax + 30],'+'
      mov	byte[rax + 31],'c'
      mov	byte[rax + 32],'['
      mov	byte[rax + 33],'2'
      mov	byte[rax + 34],'8'
      mov	byte[rax + 35],']'
      mov	byte[rax + 36],'+'
      mov	byte[rax + 37],'c'
      mov	byte[rax + 38],'['
      mov	byte[rax + 39],'2'
      mov	byte[rax + 40],'8'
      mov	byte[rax + 41],']'
      mov	byte[rax + 42],'+'
      mov	byte[rax + 43],'c'
      mov	byte[rax + 44],'['
      mov	byte[rax + 45],'1'
      mov	byte[rax + 46],'8'
      mov	byte[rax + 47],']'
      mov	byte[rax + 48],'+'
      mov	byte[rax + 49],'c'
      mov	byte[rax + 50],'['
      mov	byte[rax + 51],'8'
      mov	byte[rax + 52],']'
      mov	byte[rax + 53],'+'
      mov	byte[rax + 54],'c'
      mov	byte[rax + 55],'['
      mov	byte[rax + 56],'8'
      mov	byte[rax + 57],'0'
      mov	byte[rax + 58],']'
      mov	byte[rax + 59],'+'
      mov	byte[rax + 60],'c'
      mov	byte[rax + 61],'['
      mov	byte[rax + 62],'6'
      mov	byte[rax + 63],'7'
      mov	byte[rax + 64],']'
      mov	byte[rax + 65],'+'
      mov	byte[rax + 66],'c'
      mov	byte[rax + 67],'['
      mov	byte[rax + 68],'8'
      mov	byte[rax + 69],'2'
      mov	byte[rax + 70],']'
      mov	byte[rax + 71],'+'
      mov	byte[rax + 72],'c'
      mov	byte[rax + 73],'['
      mov	byte[rax + 74],'8'
      mov	byte[rax + 75],'3'
      mov	byte[rax + 76],']'
      mov	byte[rax + 77],'+'
      mov	byte[rax + 78],'c'
      mov	byte[rax + 79],'['
      mov	byte[rax + 80],'8'
      mov	byte[rax + 81],'0'
      mov	byte[rax + 82],']'
      mov	byte[rax + 83],'+'
      mov	byte[rax + 84],'c'
      mov	byte[rax + 85],'['
      mov	byte[rax + 86],'7'
      mov	byte[rax + 87],'6'
      mov	byte[rax + 88],']'
      mov	byte[rax + 89],'+'
      mov	byte[rax + 90],'c'
      mov	byte[rax + 91],'['
      mov	byte[rax + 92],'0'
      mov	byte[rax + 93],']'
      mov	byte[rax + 94],'+'
      mov	byte[rax + 95],'a'
      mov	byte[rax + 96],'2'
      mov	byte[rax + 97],'q'
      mov	byte[rax + 98],'+'
      mov	byte[rax + 99],'c'
      mov	byte[rax + 100],'['
      mov	byte[rax + 101],'1'
      mov	byte[rax + 102],'8'
      mov	byte[rax + 103],']'
      mov	byte[rax + 104],'+'
      mov	byte[rax + 105],'a'
      mov	byte[rax + 106],'2'
      mov	byte[rax + 107],'q'
      mov	byte[rax + 108],'+'
      mov	byte[rax + 109],'c'
      mov	byte[rax + 110],'['
      mov	byte[rax + 111],'2'
      mov	byte[rax + 112],'6'
      mov	byte[rax + 113],']'
      mov	byte[rax + 114],')'
      mov	byte[rax + 115],';'
      mov	byte[rax + 116],0
      mov	[rbp - 3656],rax
      mov	r10,[rbp - 3656]
      mov	r11,[lcs]
      add	r11,[rbp - 3648]
      mov	[r11],r10
      mov	r10,6
      add	r10,1
      mov	[rbp - 3680],r10
      mov	r10,[rbp - 3680]
      imul	r10,256
      mov	[rbp - 3680],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],'r'
      mov	byte[rax + 2],'i'
      mov	byte[rax + 3],'n'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'n'
      mov	byte[rax + 7],'('
      mov	byte[rax + 8],'c'
      mov	byte[rax + 9],'['
      mov	byte[rax + 10],'7'
      mov	byte[rax + 11],'1'
      mov	byte[rax + 12],']'
      mov	byte[rax + 13],'+'
      mov	byte[rax + 14],'c'
      mov	byte[rax + 15],'['
      mov	byte[rax + 16],'6'
      mov	byte[rax + 17],'8'
      mov	byte[rax + 18],']'
      mov	byte[rax + 19],'+'
      mov	byte[rax + 20],'c'
      mov	byte[rax + 21],'['
      mov	byte[rax + 22],'7'
      mov	byte[rax + 23],']'
      mov	byte[rax + 24],'+'
      mov	byte[rax + 25],'c'
      mov	byte[rax + 26],'['
      mov	byte[rax + 27],'8'
      mov	byte[rax + 28],'6'
      mov	byte[rax + 29],']'
      mov	byte[rax + 30],'+'
      mov	byte[rax + 31],'c'
      mov	byte[rax + 32],'['
      mov	byte[rax + 33],'2'
      mov	byte[rax + 34],'8'
      mov	byte[rax + 35],']'
      mov	byte[rax + 36],'+'
      mov	byte[rax + 37],'c'
      mov	byte[rax + 38],'['
      mov	byte[rax + 39],'2'
      mov	byte[rax + 40],'8'
      mov	byte[rax + 41],']'
      mov	byte[rax + 42],'+'
      mov	byte[rax + 43],'c'
      mov	byte[rax + 44],'['
      mov	byte[rax + 45],'1'
      mov	byte[rax + 46],'9'
      mov	byte[rax + 47],']'
      mov	byte[rax + 48],'+'
      mov	byte[rax + 49],'c'
      mov	byte[rax + 50],'['
      mov	byte[rax + 51],'8'
      mov	byte[rax + 52],']'
      mov	byte[rax + 53],'+'
      mov	byte[rax + 54],'c'
      mov	byte[rax + 55],'['
      mov	byte[rax + 56],'8'
      mov	byte[rax + 57],'0'
      mov	byte[rax + 58],']'
      mov	byte[rax + 59],'+'
      mov	byte[rax + 60],'c'
      mov	byte[rax + 61],'['
      mov	byte[rax + 62],'6'
      mov	byte[rax + 63],'7'
      mov	byte[rax + 64],']'
      mov	byte[rax + 65],'+'
      mov	byte[rax + 66],'c'
      mov	byte[rax + 67],'['
      mov	byte[rax + 68],'8'
      mov	byte[rax + 69],'2'
      mov	byte[rax + 70],']'
      mov	byte[rax + 71],'+'
      mov	byte[rax + 72],'c'
      mov	byte[rax + 73],'['
      mov	byte[rax + 74],'8'
      mov	byte[rax + 75],'3'
      mov	byte[rax + 76],']'
      mov	byte[rax + 77],'+'
      mov	byte[rax + 78],'c'
      mov	byte[rax + 79],'['
      mov	byte[rax + 80],'8'
      mov	byte[rax + 81],'0'
      mov	byte[rax + 82],']'
      mov	byte[rax + 83],'+'
      mov	byte[rax + 84],'c'
      mov	byte[rax + 85],'['
      mov	byte[rax + 86],'7'
      mov	byte[rax + 87],'6'
      mov	byte[rax + 88],']'
      mov	byte[rax + 89],'+'
      mov	byte[rax + 90],'c'
      mov	byte[rax + 91],'['
      mov	byte[rax + 92],'0'
      mov	byte[rax + 93],']'
      mov	byte[rax + 94],'+'
      mov	byte[rax + 95],'a'
      mov	byte[rax + 96],'2'
      mov	byte[rax + 97],'q'
      mov	byte[rax + 98],'+'
      mov	byte[rax + 99],'c'
      mov	byte[rax + 100],'['
      mov	byte[rax + 101],'1'
      mov	byte[rax + 102],'9'
      mov	byte[rax + 103],']'
      mov	byte[rax + 104],'+'
      mov	byte[rax + 105],'a'
      mov	byte[rax + 106],'2'
      mov	byte[rax + 107],'q'
      mov	byte[rax + 108],'+'
      mov	byte[rax + 109],'c'
      mov	byte[rax + 110],'['
      mov	byte[rax + 111],'2'
      mov	byte[rax + 112],'6'
      mov	byte[rax + 113],']'
      mov	byte[rax + 114],')'
      mov	byte[rax + 115],';'
      mov	byte[rax + 116],0
      mov	[rbp - 3688],rax
      mov	r10,[rbp - 3688]
      mov	r11,[lcs]
      add	r11,[rbp - 3680]
      mov	[r11],r10
      mov	r10,7
      add	r10,1
      mov	[rbp - 3712],r10
      mov	r10,[rbp - 3712]
      imul	r10,256
      mov	[rbp - 3712],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],'r'
      mov	byte[rax + 2],'i'
      mov	byte[rax + 3],'n'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'n'
      mov	byte[rax + 7],'('
      mov	byte[rax + 8],'c'
      mov	byte[rax + 9],'['
      mov	byte[rax + 10],'7'
      mov	byte[rax + 11],'1'
      mov	byte[rax + 12],']'
      mov	byte[rax + 13],'+'
      mov	byte[rax + 14],'c'
      mov	byte[rax + 15],'['
      mov	byte[rax + 16],'6'
      mov	byte[rax + 17],'8'
      mov	byte[rax + 18],']'
      mov	byte[rax + 19],'+'
      mov	byte[rax + 20],'c'
      mov	byte[rax + 21],'['
      mov	byte[rax + 22],'7'
      mov	byte[rax + 23],']'
      mov	byte[rax + 24],'+'
      mov	byte[rax + 25],'c'
      mov	byte[rax + 26],'['
      mov	byte[rax + 27],'8'
      mov	byte[rax + 28],'6'
      mov	byte[rax + 29],']'
      mov	byte[rax + 30],'+'
      mov	byte[rax + 31],'c'
      mov	byte[rax + 32],'['
      mov	byte[rax + 33],'2'
      mov	byte[rax + 34],'8'
      mov	byte[rax + 35],']'
      mov	byte[rax + 36],'+'
      mov	byte[rax + 37],'c'
      mov	byte[rax + 38],'['
      mov	byte[rax + 39],'2'
      mov	byte[rax + 40],'8'
      mov	byte[rax + 41],']'
      mov	byte[rax + 42],'+'
      mov	byte[rax + 43],'c'
      mov	byte[rax + 44],'['
      mov	byte[rax + 45],'2'
      mov	byte[rax + 46],'0'
      mov	byte[rax + 47],']'
      mov	byte[rax + 48],'+'
      mov	byte[rax + 49],'c'
      mov	byte[rax + 50],'['
      mov	byte[rax + 51],'8'
      mov	byte[rax + 52],']'
      mov	byte[rax + 53],'+'
      mov	byte[rax + 54],'c'
      mov	byte[rax + 55],'['
      mov	byte[rax + 56],'8'
      mov	byte[rax + 57],'0'
      mov	byte[rax + 58],']'
      mov	byte[rax + 59],'+'
      mov	byte[rax + 60],'c'
      mov	byte[rax + 61],'['
      mov	byte[rax + 62],'6'
      mov	byte[rax + 63],'7'
      mov	byte[rax + 64],']'
      mov	byte[rax + 65],'+'
      mov	byte[rax + 66],'c'
      mov	byte[rax + 67],'['
      mov	byte[rax + 68],'8'
      mov	byte[rax + 69],'2'
      mov	byte[rax + 70],']'
      mov	byte[rax + 71],'+'
      mov	byte[rax + 72],'c'
      mov	byte[rax + 73],'['
      mov	byte[rax + 74],'8'
      mov	byte[rax + 75],'3'
      mov	byte[rax + 76],']'
      mov	byte[rax + 77],'+'
      mov	byte[rax + 78],'c'
      mov	byte[rax + 79],'['
      mov	byte[rax + 80],'8'
      mov	byte[rax + 81],'0'
      mov	byte[rax + 82],']'
      mov	byte[rax + 83],'+'
      mov	byte[rax + 84],'c'
      mov	byte[rax + 85],'['
      mov	byte[rax + 86],'7'
      mov	byte[rax + 87],'6'
      mov	byte[rax + 88],']'
      mov	byte[rax + 89],'+'
      mov	byte[rax + 90],'c'
      mov	byte[rax + 91],'['
      mov	byte[rax + 92],'0'
      mov	byte[rax + 93],']'
      mov	byte[rax + 94],'+'
      mov	byte[rax + 95],'a'
      mov	byte[rax + 96],'2'
      mov	byte[rax + 97],'q'
      mov	byte[rax + 98],'+'
      mov	byte[rax + 99],'c'
      mov	byte[rax + 100],'['
      mov	byte[rax + 101],'2'
      mov	byte[rax + 102],'0'
      mov	byte[rax + 103],']'
      mov	byte[rax + 104],'+'
      mov	byte[rax + 105],'a'
      mov	byte[rax + 106],'2'
      mov	byte[rax + 107],'q'
      mov	byte[rax + 108],'+'
      mov	byte[rax + 109],'c'
      mov	byte[rax + 110],'['
      mov	byte[rax + 111],'2'
      mov	byte[rax + 112],'6'
      mov	byte[rax + 113],']'
      mov	byte[rax + 114],')'
      mov	byte[rax + 115],';'
      mov	byte[rax + 116],0
      mov	[rbp - 3720],rax
      mov	r10,[rbp - 3720]
      mov	r11,[lcs]
      add	r11,[rbp - 3712]
      mov	[r11],r10
      mov	r10,8
      add	r10,1
      mov	[rbp - 3744],r10
      mov	r10,[rbp - 3744]
      imul	r10,256
      mov	[rbp - 3744],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],'r'
      mov	byte[rax + 2],'i'
      mov	byte[rax + 3],'n'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'n'
      mov	byte[rax + 7],'('
      mov	byte[rax + 8],'c'
      mov	byte[rax + 9],'['
      mov	byte[rax + 10],'7'
      mov	byte[rax + 11],'1'
      mov	byte[rax + 12],']'
      mov	byte[rax + 13],'+'
      mov	byte[rax + 14],'c'
      mov	byte[rax + 15],'['
      mov	byte[rax + 16],'6'
      mov	byte[rax + 17],'8'
      mov	byte[rax + 18],']'
      mov	byte[rax + 19],'+'
      mov	byte[rax + 20],'c'
      mov	byte[rax + 21],'['
      mov	byte[rax + 22],'7'
      mov	byte[rax + 23],']'
      mov	byte[rax + 24],'+'
      mov	byte[rax + 25],'c'
      mov	byte[rax + 26],'['
      mov	byte[rax + 27],'8'
      mov	byte[rax + 28],'6'
      mov	byte[rax + 29],']'
      mov	byte[rax + 30],'+'
      mov	byte[rax + 31],'c'
      mov	byte[rax + 32],'['
      mov	byte[rax + 33],'2'
      mov	byte[rax + 34],'8'
      mov	byte[rax + 35],']'
      mov	byte[rax + 36],'+'
      mov	byte[rax + 37],'c'
      mov	byte[rax + 38],'['
      mov	byte[rax + 39],'2'
      mov	byte[rax + 40],'8'
      mov	byte[rax + 41],']'
      mov	byte[rax + 42],'+'
      mov	byte[rax + 43],'c'
      mov	byte[rax + 44],'['
      mov	byte[rax + 45],'2'
      mov	byte[rax + 46],'1'
      mov	byte[rax + 47],']'
      mov	byte[rax + 48],'+'
      mov	byte[rax + 49],'c'
      mov	byte[rax + 50],'['
      mov	byte[rax + 51],'8'
      mov	byte[rax + 52],']'
      mov	byte[rax + 53],'+'
      mov	byte[rax + 54],'c'
      mov	byte[rax + 55],'['
      mov	byte[rax + 56],'8'
      mov	byte[rax + 57],'0'
      mov	byte[rax + 58],']'
      mov	byte[rax + 59],'+'
      mov	byte[rax + 60],'c'
      mov	byte[rax + 61],'['
      mov	byte[rax + 62],'6'
      mov	byte[rax + 63],'7'
      mov	byte[rax + 64],']'
      mov	byte[rax + 65],'+'
      mov	byte[rax + 66],'c'
      mov	byte[rax + 67],'['
      mov	byte[rax + 68],'8'
      mov	byte[rax + 69],'2'
      mov	byte[rax + 70],']'
      mov	byte[rax + 71],'+'
      mov	byte[rax + 72],'c'
      mov	byte[rax + 73],'['
      mov	byte[rax + 74],'8'
      mov	byte[rax + 75],'3'
      mov	byte[rax + 76],']'
      mov	byte[rax + 77],'+'
      mov	byte[rax + 78],'c'
      mov	byte[rax + 79],'['
      mov	byte[rax + 80],'8'
      mov	byte[rax + 81],'0'
      mov	byte[rax + 82],']'
      mov	byte[rax + 83],'+'
      mov	byte[rax + 84],'c'
      mov	byte[rax + 85],'['
      mov	byte[rax + 86],'7'
      mov	byte[rax + 87],'6'
      mov	byte[rax + 88],']'
      mov	byte[rax + 89],'+'
      mov	byte[rax + 90],'c'
      mov	byte[rax + 91],'['
      mov	byte[rax + 92],'0'
      mov	byte[rax + 93],']'
      mov	byte[rax + 94],'+'
      mov	byte[rax + 95],'a'
      mov	byte[rax + 96],'2'
      mov	byte[rax + 97],'q'
      mov	byte[rax + 98],'+'
      mov	byte[rax + 99],'c'
      mov	byte[rax + 100],'['
      mov	byte[rax + 101],'2'
      mov	byte[rax + 102],'1'
      mov	byte[rax + 103],']'
      mov	byte[rax + 104],'+'
      mov	byte[rax + 105],'a'
      mov	byte[rax + 106],'2'
      mov	byte[rax + 107],'q'
      mov	byte[rax + 108],'+'
      mov	byte[rax + 109],'c'
      mov	byte[rax + 110],'['
      mov	byte[rax + 111],'2'
      mov	byte[rax + 112],'6'
      mov	byte[rax + 113],']'
      mov	byte[rax + 114],')'
      mov	byte[rax + 115],';'
      mov	byte[rax + 116],0
      mov	[rbp - 3752],rax
      mov	r10,[rbp - 3752]
      mov	r11,[lcs]
      add	r11,[rbp - 3744]
      mov	[r11],r10
      mov	r10,9
      add	r10,1
      mov	[rbp - 3776],r10
      mov	r10,[rbp - 3776]
      imul	r10,256
      mov	[rbp - 3776],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],'r'
      mov	byte[rax + 2],'i'
      mov	byte[rax + 3],'n'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'n'
      mov	byte[rax + 7],'('
      mov	byte[rax + 8],'c'
      mov	byte[rax + 9],'['
      mov	byte[rax + 10],'7'
      mov	byte[rax + 11],'1'
      mov	byte[rax + 12],']'
      mov	byte[rax + 13],'+'
      mov	byte[rax + 14],'c'
      mov	byte[rax + 15],'['
      mov	byte[rax + 16],'6'
      mov	byte[rax + 17],'8'
      mov	byte[rax + 18],']'
      mov	byte[rax + 19],'+'
      mov	byte[rax + 20],'c'
      mov	byte[rax + 21],'['
      mov	byte[rax + 22],'7'
      mov	byte[rax + 23],']'
      mov	byte[rax + 24],'+'
      mov	byte[rax + 25],'c'
      mov	byte[rax + 26],'['
      mov	byte[rax + 27],'8'
      mov	byte[rax + 28],'6'
      mov	byte[rax + 29],']'
      mov	byte[rax + 30],'+'
      mov	byte[rax + 31],'c'
      mov	byte[rax + 32],'['
      mov	byte[rax + 33],'2'
      mov	byte[rax + 34],'8'
      mov	byte[rax + 35],']'
      mov	byte[rax + 36],'+'
      mov	byte[rax + 37],'c'
      mov	byte[rax + 38],'['
      mov	byte[rax + 39],'2'
      mov	byte[rax + 40],'8'
      mov	byte[rax + 41],']'
      mov	byte[rax + 42],'+'
      mov	byte[rax + 43],'c'
      mov	byte[rax + 44],'['
      mov	byte[rax + 45],'2'
      mov	byte[rax + 46],'2'
      mov	byte[rax + 47],']'
      mov	byte[rax + 48],'+'
      mov	byte[rax + 49],'c'
      mov	byte[rax + 50],'['
      mov	byte[rax + 51],'8'
      mov	byte[rax + 52],']'
      mov	byte[rax + 53],'+'
      mov	byte[rax + 54],'c'
      mov	byte[rax + 55],'['
      mov	byte[rax + 56],'8'
      mov	byte[rax + 57],'0'
      mov	byte[rax + 58],']'
      mov	byte[rax + 59],'+'
      mov	byte[rax + 60],'c'
      mov	byte[rax + 61],'['
      mov	byte[rax + 62],'6'
      mov	byte[rax + 63],'7'
      mov	byte[rax + 64],']'
      mov	byte[rax + 65],'+'
      mov	byte[rax + 66],'c'
      mov	byte[rax + 67],'['
      mov	byte[rax + 68],'8'
      mov	byte[rax + 69],'2'
      mov	byte[rax + 70],']'
      mov	byte[rax + 71],'+'
      mov	byte[rax + 72],'c'
      mov	byte[rax + 73],'['
      mov	byte[rax + 74],'8'
      mov	byte[rax + 75],'3'
      mov	byte[rax + 76],']'
      mov	byte[rax + 77],'+'
      mov	byte[rax + 78],'c'
      mov	byte[rax + 79],'['
      mov	byte[rax + 80],'8'
      mov	byte[rax + 81],'0'
      mov	byte[rax + 82],']'
      mov	byte[rax + 83],'+'
      mov	byte[rax + 84],'c'
      mov	byte[rax + 85],'['
      mov	byte[rax + 86],'7'
      mov	byte[rax + 87],'6'
      mov	byte[rax + 88],']'
      mov	byte[rax + 89],'+'
      mov	byte[rax + 90],'c'
      mov	byte[rax + 91],'['
      mov	byte[rax + 92],'0'
      mov	byte[rax + 93],']'
      mov	byte[rax + 94],'+'
      mov	byte[rax + 95],'a'
      mov	byte[rax + 96],'2'
      mov	byte[rax + 97],'q'
      mov	byte[rax + 98],'+'
      mov	byte[rax + 99],'c'
      mov	byte[rax + 100],'['
      mov	byte[rax + 101],'2'
      mov	byte[rax + 102],'2'
      mov	byte[rax + 103],']'
      mov	byte[rax + 104],'+'
      mov	byte[rax + 105],'a'
      mov	byte[rax + 106],'2'
      mov	byte[rax + 107],'q'
      mov	byte[rax + 108],'+'
      mov	byte[rax + 109],'c'
      mov	byte[rax + 110],'['
      mov	byte[rax + 111],'2'
      mov	byte[rax + 112],'6'
      mov	byte[rax + 113],']'
      mov	byte[rax + 114],')'
      mov	byte[rax + 115],';'
      mov	byte[rax + 116],0
      mov	[rbp - 3784],rax
      mov	r10,[rbp - 3784]
      mov	r11,[lcs]
      add	r11,[rbp - 3776]
      mov	[r11],r10
      mov	r10,10
      add	r10,1
      mov	[rbp - 3808],r10
      mov	r10,[rbp - 3808]
      imul	r10,256
      mov	[rbp - 3808],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],'r'
      mov	byte[rax + 2],'i'
      mov	byte[rax + 3],'n'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'n'
      mov	byte[rax + 7],'('
      mov	byte[rax + 8],'c'
      mov	byte[rax + 9],'['
      mov	byte[rax + 10],'7'
      mov	byte[rax + 11],'1'
      mov	byte[rax + 12],']'
      mov	byte[rax + 13],'+'
      mov	byte[rax + 14],'c'
      mov	byte[rax + 15],'['
      mov	byte[rax + 16],'6'
      mov	byte[rax + 17],'8'
      mov	byte[rax + 18],']'
      mov	byte[rax + 19],'+'
      mov	byte[rax + 20],'c'
      mov	byte[rax + 21],'['
      mov	byte[rax + 22],'7'
      mov	byte[rax + 23],']'
      mov	byte[rax + 24],'+'
      mov	byte[rax + 25],'c'
      mov	byte[rax + 26],'['
      mov	byte[rax + 27],'8'
      mov	byte[rax + 28],'6'
      mov	byte[rax + 29],']'
      mov	byte[rax + 30],'+'
      mov	byte[rax + 31],'c'
      mov	byte[rax + 32],'['
      mov	byte[rax + 33],'2'
      mov	byte[rax + 34],'8'
      mov	byte[rax + 35],']'
      mov	byte[rax + 36],'+'
      mov	byte[rax + 37],'c'
      mov	byte[rax + 38],'['
      mov	byte[rax + 39],'2'
      mov	byte[rax + 40],'8'
      mov	byte[rax + 41],']'
      mov	byte[rax + 42],'+'
      mov	byte[rax + 43],'c'
      mov	byte[rax + 44],'['
      mov	byte[rax + 45],'2'
      mov	byte[rax + 46],'3'
      mov	byte[rax + 47],']'
      mov	byte[rax + 48],'+'
      mov	byte[rax + 49],'c'
      mov	byte[rax + 50],'['
      mov	byte[rax + 51],'8'
      mov	byte[rax + 52],']'
      mov	byte[rax + 53],'+'
      mov	byte[rax + 54],'c'
      mov	byte[rax + 55],'['
      mov	byte[rax + 56],'8'
      mov	byte[rax + 57],'0'
      mov	byte[rax + 58],']'
      mov	byte[rax + 59],'+'
      mov	byte[rax + 60],'c'
      mov	byte[rax + 61],'['
      mov	byte[rax + 62],'6'
      mov	byte[rax + 63],'7'
      mov	byte[rax + 64],']'
      mov	byte[rax + 65],'+'
      mov	byte[rax + 66],'c'
      mov	byte[rax + 67],'['
      mov	byte[rax + 68],'8'
      mov	byte[rax + 69],'2'
      mov	byte[rax + 70],']'
      mov	byte[rax + 71],'+'
      mov	byte[rax + 72],'c'
      mov	byte[rax + 73],'['
      mov	byte[rax + 74],'8'
      mov	byte[rax + 75],'3'
      mov	byte[rax + 76],']'
      mov	byte[rax + 77],'+'
      mov	byte[rax + 78],'c'
      mov	byte[rax + 79],'['
      mov	byte[rax + 80],'8'
      mov	byte[rax + 81],'0'
      mov	byte[rax + 82],']'
      mov	byte[rax + 83],'+'
      mov	byte[rax + 84],'c'
      mov	byte[rax + 85],'['
      mov	byte[rax + 86],'7'
      mov	byte[rax + 87],'6'
      mov	byte[rax + 88],']'
      mov	byte[rax + 89],'+'
      mov	byte[rax + 90],'c'
      mov	byte[rax + 91],'['
      mov	byte[rax + 92],'0'
      mov	byte[rax + 93],']'
      mov	byte[rax + 94],'+'
      mov	byte[rax + 95],'a'
      mov	byte[rax + 96],'2'
      mov	byte[rax + 97],'q'
      mov	byte[rax + 98],'+'
      mov	byte[rax + 99],'c'
      mov	byte[rax + 100],'['
      mov	byte[rax + 101],'2'
      mov	byte[rax + 102],'3'
      mov	byte[rax + 103],']'
      mov	byte[rax + 104],'+'
      mov	byte[rax + 105],'a'
      mov	byte[rax + 106],'2'
      mov	byte[rax + 107],'q'
      mov	byte[rax + 108],'+'
      mov	byte[rax + 109],'c'
      mov	byte[rax + 110],'['
      mov	byte[rax + 111],'2'
      mov	byte[rax + 112],'6'
      mov	byte[rax + 113],']'
      mov	byte[rax + 114],')'
      mov	byte[rax + 115],';'
      mov	byte[rax + 116],0
      mov	[rbp - 3816],rax
      mov	r10,[rbp - 3816]
      mov	r11,[lcs]
      add	r11,[rbp - 3808]
      mov	[r11],r10
      mov	r10,11
      add	r10,1
      mov	[rbp - 3840],r10
      mov	r10,[rbp - 3840]
      imul	r10,256
      mov	[rbp - 3840],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],'r'
      mov	byte[rax + 2],'i'
      mov	byte[rax + 3],'n'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'n'
      mov	byte[rax + 7],'('
      mov	byte[rax + 8],'c'
      mov	byte[rax + 9],'['
      mov	byte[rax + 10],'7'
      mov	byte[rax + 11],'1'
      mov	byte[rax + 12],']'
      mov	byte[rax + 13],'+'
      mov	byte[rax + 14],'c'
      mov	byte[rax + 15],'['
      mov	byte[rax + 16],'6'
      mov	byte[rax + 17],'8'
      mov	byte[rax + 18],']'
      mov	byte[rax + 19],'+'
      mov	byte[rax + 20],'c'
      mov	byte[rax + 21],'['
      mov	byte[rax + 22],'7'
      mov	byte[rax + 23],']'
      mov	byte[rax + 24],'+'
      mov	byte[rax + 25],'c'
      mov	byte[rax + 26],'['
      mov	byte[rax + 27],'8'
      mov	byte[rax + 28],'6'
      mov	byte[rax + 29],']'
      mov	byte[rax + 30],'+'
      mov	byte[rax + 31],'c'
      mov	byte[rax + 32],'['
      mov	byte[rax + 33],'2'
      mov	byte[rax + 34],'8'
      mov	byte[rax + 35],']'
      mov	byte[rax + 36],'+'
      mov	byte[rax + 37],'c'
      mov	byte[rax + 38],'['
      mov	byte[rax + 39],'2'
      mov	byte[rax + 40],'8'
      mov	byte[rax + 41],']'
      mov	byte[rax + 42],'+'
      mov	byte[rax + 43],'c'
      mov	byte[rax + 44],'['
      mov	byte[rax + 45],'2'
      mov	byte[rax + 46],'4'
      mov	byte[rax + 47],']'
      mov	byte[rax + 48],'+'
      mov	byte[rax + 49],'c'
      mov	byte[rax + 50],'['
      mov	byte[rax + 51],'8'
      mov	byte[rax + 52],']'
      mov	byte[rax + 53],'+'
      mov	byte[rax + 54],'c'
      mov	byte[rax + 55],'['
      mov	byte[rax + 56],'8'
      mov	byte[rax + 57],'0'
      mov	byte[rax + 58],']'
      mov	byte[rax + 59],'+'
      mov	byte[rax + 60],'c'
      mov	byte[rax + 61],'['
      mov	byte[rax + 62],'6'
      mov	byte[rax + 63],'7'
      mov	byte[rax + 64],']'
      mov	byte[rax + 65],'+'
      mov	byte[rax + 66],'c'
      mov	byte[rax + 67],'['
      mov	byte[rax + 68],'8'
      mov	byte[rax + 69],'2'
      mov	byte[rax + 70],']'
      mov	byte[rax + 71],'+'
      mov	byte[rax + 72],'c'
      mov	byte[rax + 73],'['
      mov	byte[rax + 74],'8'
      mov	byte[rax + 75],'3'
      mov	byte[rax + 76],']'
      mov	byte[rax + 77],'+'
      mov	byte[rax + 78],'c'
      mov	byte[rax + 79],'['
      mov	byte[rax + 80],'8'
      mov	byte[rax + 81],'0'
      mov	byte[rax + 82],']'
      mov	byte[rax + 83],'+'
      mov	byte[rax + 84],'c'
      mov	byte[rax + 85],'['
      mov	byte[rax + 86],'7'
      mov	byte[rax + 87],'6'
      mov	byte[rax + 88],']'
      mov	byte[rax + 89],'+'
      mov	byte[rax + 90],'c'
      mov	byte[rax + 91],'['
      mov	byte[rax + 92],'0'
      mov	byte[rax + 93],']'
      mov	byte[rax + 94],'+'
      mov	byte[rax + 95],'a'
      mov	byte[rax + 96],'2'
      mov	byte[rax + 97],'q'
      mov	byte[rax + 98],'+'
      mov	byte[rax + 99],'c'
      mov	byte[rax + 100],'['
      mov	byte[rax + 101],'2'
      mov	byte[rax + 102],'4'
      mov	byte[rax + 103],']'
      mov	byte[rax + 104],'+'
      mov	byte[rax + 105],'a'
      mov	byte[rax + 106],'2'
      mov	byte[rax + 107],'q'
      mov	byte[rax + 108],'+'
      mov	byte[rax + 109],'c'
      mov	byte[rax + 110],'['
      mov	byte[rax + 111],'2'
      mov	byte[rax + 112],'6'
      mov	byte[rax + 113],']'
      mov	byte[rax + 114],')'
      mov	byte[rax + 115],';'
      mov	byte[rax + 116],0
      mov	[rbp - 3848],rax
      mov	r10,[rbp - 3848]
      mov	r11,[lcs]
      add	r11,[rbp - 3840]
      mov	[r11],r10
      mov	r10,12
      add	r10,1
      mov	[rbp - 3872],r10
      mov	r10,[rbp - 3872]
      imul	r10,256
      mov	[rbp - 3872],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],'r'
      mov	byte[rax + 2],'i'
      mov	byte[rax + 3],'n'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'n'
      mov	byte[rax + 7],'('
      mov	byte[rax + 8],'c'
      mov	byte[rax + 9],'['
      mov	byte[rax + 10],'9'
      mov	byte[rax + 11],'1'
      mov	byte[rax + 12],']'
      mov	byte[rax + 13],')'
      mov	byte[rax + 14],';'
      mov	byte[rax + 15],0
      mov	[rbp - 3880],rax
      mov	r10,[rbp - 3880]
      mov	r11,[lcs]
      add	r11,[rbp - 3872]
      mov	[r11],r10
      mov	r10,13
      add	r10,1
      mov	[rbp - 3904],r10
      mov	r10,[rbp - 3904]
      imul	r10,256
      mov	[rbp - 3904],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],'r'
      mov	byte[rax + 2],'i'
      mov	byte[rax + 3],'n'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'n'
      mov	byte[rax + 7],'('
      mov	byte[rax + 8],'c'
      mov	byte[rax + 9],'['
      mov	byte[rax + 10],'8'
      mov	byte[rax + 11],'1'
      mov	byte[rax + 12],']'
      mov	byte[rax + 13],'+'
      mov	byte[rax + 14],'c'
      mov	byte[rax + 15],'['
      mov	byte[rax + 16],'8'
      mov	byte[rax + 17],'2'
      mov	byte[rax + 18],']'
      mov	byte[rax + 19],'+'
      mov	byte[rax + 20],'c'
      mov	byte[rax + 21],'['
      mov	byte[rax + 22],'8'
      mov	byte[rax + 23],'0'
      mov	byte[rax + 24],']'
      mov	byte[rax + 25],'+'
      mov	byte[rax + 26],'c'
      mov	byte[rax + 27],'['
      mov	byte[rax + 28],'7'
      mov	byte[rax + 29],'1'
      mov	byte[rax + 30],']'
      mov	byte[rax + 31],'+'
      mov	byte[rax + 32],'c'
      mov	byte[rax + 33],'['
      mov	byte[rax + 34],'7'
      mov	byte[rax + 35],'6'
      mov	byte[rax + 36],']'
      mov	byte[rax + 37],'+'
      mov	byte[rax + 38],'c'
      mov	byte[rax + 39],'['
      mov	byte[rax + 40],'6'
      mov	byte[rax + 41],'9'
      mov	byte[rax + 42],']'
      mov	byte[rax + 43],'+'
      mov	byte[rax + 44],'c'
      mov	byte[rax + 45],'['
      mov	byte[rax + 46],'5'
      mov	byte[rax + 47],'8'
      mov	byte[rax + 48],']'
      mov	byte[rax + 49],'+'
      mov	byte[rax + 50],'c'
      mov	byte[rax + 51],'['
      mov	byte[rax + 52],'5'
      mov	byte[rax + 53],'9'
      mov	byte[rax + 54],']'
      mov	byte[rax + 55],'+'
      mov	byte[rax + 56],'c'
      mov	byte[rax + 57],'['
      mov	byte[rax + 58],'0'
      mov	byte[rax + 59],']'
      mov	byte[rax + 60],'+'
      mov	byte[rax + 61],'c'
      mov	byte[rax + 62],'['
      mov	byte[rax + 63],'8'
      mov	byte[rax + 64],'1'
      mov	byte[rax + 65],']'
      mov	byte[rax + 66],'+'
      mov	byte[rax + 67],'c'
      mov	byte[rax + 68],'['
      mov	byte[rax + 69],'2'
      mov	byte[rax + 70],'8'
      mov	byte[rax + 71],']'
      mov	byte[rax + 72],'+'
      mov	byte[rax + 73],'c'
      mov	byte[rax + 74],'['
      mov	byte[rax + 75],'7'
      mov	byte[rax + 76],'6'
      mov	byte[rax + 77],']'
      mov	byte[rax + 78],'+'
      mov	byte[rax + 79],'c'
      mov	byte[rax + 80],'['
      mov	byte[rax + 81],'6'
      mov	byte[rax + 82],'7'
      mov	byte[rax + 83],']'
      mov	byte[rax + 84],'+'
      mov	byte[rax + 85],'c'
      mov	byte[rax + 86],'['
      mov	byte[rax + 87],'8'
      mov	byte[rax + 88],'5'
      mov	byte[rax + 89],']'
      mov	byte[rax + 90],'+'
      mov	byte[rax + 91],'c'
      mov	byte[rax + 92],'['
      mov	byte[rax + 93],'0'
      mov	byte[rax + 94],']'
      mov	byte[rax + 95],'+'
      mov	byte[rax + 96],'c'
      mov	byte[rax + 97],'['
      mov	byte[rax + 98],'8'
      mov	byte[rax + 99],'1'
      mov	byte[rax + 100],']'
      mov	byte[rax + 101],'+'
      mov	byte[rax + 102],'c'
      mov	byte[rax + 103],'['
      mov	byte[rax + 104],'8'
      mov	byte[rax + 105],'2'
      mov	byte[rax + 106],']'
      mov	byte[rax + 107],'+'
      mov	byte[rax + 108],'c'
      mov	byte[rax + 109],'['
      mov	byte[rax + 110],'8'
      mov	byte[rax + 111],'0'
      mov	byte[rax + 112],']'
      mov	byte[rax + 113],'+'
      mov	byte[rax + 114],'c'
      mov	byte[rax + 115],'['
      mov	byte[rax + 116],'7'
      mov	byte[rax + 117],'1'
      mov	byte[rax + 118],']'
      mov	byte[rax + 119],'+'
      mov	byte[rax + 120],'c'
      mov	byte[rax + 121],'['
      mov	byte[rax + 122],'7'
      mov	byte[rax + 123],'6'
      mov	byte[rax + 124],']'
      mov	byte[rax + 125],'+'
      mov	byte[rax + 126],'c'
      mov	byte[rax + 127],'['
      mov	byte[rax + 128],'6'
      mov	byte[rax + 129],'9'
      mov	byte[rax + 130],']'
      mov	byte[rax + 131],'+'
      mov	byte[rax + 132],'c'
      mov	byte[rax + 133],'['
      mov	byte[rax + 134],'5'
      mov	byte[rax + 135],'8'
      mov	byte[rax + 136],']'
      mov	byte[rax + 137],'+'
      mov	byte[rax + 138],'c'
      mov	byte[rax + 139],'['
      mov	byte[rax + 140],'1'
      mov	byte[rax + 141],'7'
      mov	byte[rax + 142],']'
      mov	byte[rax + 143],'+'
      mov	byte[rax + 144],'c'
      mov	byte[rax + 145],'['
      mov	byte[rax + 146],'2'
      mov	byte[rax + 147],'0'
      mov	byte[rax + 148],']'
      mov	byte[rax + 149],'+'
      mov	byte[rax + 150],'c'
      mov	byte[rax + 151],'['
      mov	byte[rax + 152],'2'
      mov	byte[rax + 153],'1'
      mov	byte[rax + 154],']'
      mov	byte[rax + 155],'+'
      mov	byte[rax + 156],'c'
      mov	byte[rax + 157],'['
      mov	byte[rax + 158],'5'
      mov	byte[rax + 159],'9'
      mov	byte[rax + 160],']'
      mov	byte[rax + 161],'+'
      mov	byte[rax + 162],'c'
      mov	byte[rax + 163],'['
      mov	byte[rax + 164],'2'
      mov	byte[rax + 165],'6'
      mov	byte[rax + 166],']'
      mov	byte[rax + 167],')'
      mov	byte[rax + 168],';'
      mov	byte[rax + 169],0
      mov	[rbp - 3912],rax
      mov	r10,[rbp - 3912]
      mov	r11,[lcs]
      add	r11,[rbp - 3904]
      mov	[r11],r10
      mov	r10,14
      add	r10,1
      mov	[rbp - 3936],r10
      mov	r10,[rbp - 3936]
      imul	r10,256
      mov	[rbp - 3936],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],'r'
      mov	byte[rax + 2],'i'
      mov	byte[rax + 3],'n'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'n'
      mov	byte[rax + 7],'('
      mov	byte[rax + 8],'c'
      mov	byte[rax + 9],'['
      mov	byte[rax + 10],'8'
      mov	byte[rax + 11],'1'
      mov	byte[rax + 12],']'
      mov	byte[rax + 13],'+'
      mov	byte[rax + 14],'c'
      mov	byte[rax + 15],'['
      mov	byte[rax + 16],'8'
      mov	byte[rax + 17],'2'
      mov	byte[rax + 18],']'
      mov	byte[rax + 19],'+'
      mov	byte[rax + 20],'c'
      mov	byte[rax + 21],'['
      mov	byte[rax + 22],'8'
      mov	byte[rax + 23],'0'
      mov	byte[rax + 24],']'
      mov	byte[rax + 25],'+'
      mov	byte[rax + 26],'c'
      mov	byte[rax + 27],'['
      mov	byte[rax + 28],'7'
      mov	byte[rax + 29],'1'
      mov	byte[rax + 30],']'
      mov	byte[rax + 31],'+'
      mov	byte[rax + 32],'c'
      mov	byte[rax + 33],'['
      mov	byte[rax + 34],'7'
      mov	byte[rax + 35],'6'
      mov	byte[rax + 36],']'
      mov	byte[rax + 37],'+'
      mov	byte[rax + 38],'c'
      mov	byte[rax + 39],'['
      mov	byte[rax + 40],'6'
      mov	byte[rax + 41],'9'
      mov	byte[rax + 42],']'
      mov	byte[rax + 43],'+'
      mov	byte[rax + 44],'c'
      mov	byte[rax + 45],'['
      mov	byte[rax + 46],'5'
      mov	byte[rax + 47],'8'
      mov	byte[rax + 48],']'
      mov	byte[rax + 49],'+'
      mov	byte[rax + 50],'c'
      mov	byte[rax + 51],'['
      mov	byte[rax + 52],'5'
      mov	byte[rax + 53],'9'
      mov	byte[rax + 54],']'
      mov	byte[rax + 55],'+'
      mov	byte[rax + 56],'c'
      mov	byte[rax + 57],'['
      mov	byte[rax + 58],'0'
      mov	byte[rax + 59],']'
      mov	byte[rax + 60],'+'
      mov	byte[rax + 61],'c'
      mov	byte[rax + 62],'['
      mov	byte[rax + 63],'6'
      mov	byte[rax + 64],'5'
      mov	byte[rax + 65],']'
      mov	byte[rax + 66],'+'
      mov	byte[rax + 67],'c'
      mov	byte[rax + 68],'['
      mov	byte[rax + 69],'2'
      mov	byte[rax + 70],'8'
      mov	byte[rax + 71],']'
      mov	byte[rax + 72],'+'
      mov	byte[rax + 73],'c'
      mov	byte[rax + 74],'['
      mov	byte[rax + 75],'7'
      mov	byte[rax + 76],'6'
      mov	byte[rax + 77],']'
      mov	byte[rax + 78],'+'
      mov	byte[rax + 79],'c'
      mov	byte[rax + 80],'['
      mov	byte[rax + 81],'6'
      mov	byte[rax + 82],'7'
      mov	byte[rax + 83],']'
      mov	byte[rax + 84],'+'
      mov	byte[rax + 85],'c'
      mov	byte[rax + 86],'['
      mov	byte[rax + 87],'8'
      mov	byte[rax + 88],'5'
      mov	byte[rax + 89],']'
      mov	byte[rax + 90],'+'
      mov	byte[rax + 91],'c'
      mov	byte[rax + 92],'['
      mov	byte[rax + 93],'0'
      mov	byte[rax + 94],']'
      mov	byte[rax + 95],'+'
      mov	byte[rax + 96],'c'
      mov	byte[rax + 97],'['
      mov	byte[rax + 98],'8'
      mov	byte[rax + 99],'1'
      mov	byte[rax + 100],']'
      mov	byte[rax + 101],'+'
      mov	byte[rax + 102],'c'
      mov	byte[rax + 103],'['
      mov	byte[rax + 104],'8'
      mov	byte[rax + 105],'2'
      mov	byte[rax + 106],']'
      mov	byte[rax + 107],'+'
      mov	byte[rax + 108],'c'
      mov	byte[rax + 109],'['
      mov	byte[rax + 110],'8'
      mov	byte[rax + 111],'0'
      mov	byte[rax + 112],']'
      mov	byte[rax + 113],'+'
      mov	byte[rax + 114],'c'
      mov	byte[rax + 115],'['
      mov	byte[rax + 116],'7'
      mov	byte[rax + 117],'1'
      mov	byte[rax + 118],']'
      mov	byte[rax + 119],'+'
      mov	byte[rax + 120],'c'
      mov	byte[rax + 121],'['
      mov	byte[rax + 122],'7'
      mov	byte[rax + 123],'6'
      mov	byte[rax + 124],']'
      mov	byte[rax + 125],'+'
      mov	byte[rax + 126],'c'
      mov	byte[rax + 127],'['
      mov	byte[rax + 128],'6'
      mov	byte[rax + 129],'9'
      mov	byte[rax + 130],']'
      mov	byte[rax + 131],'+'
      mov	byte[rax + 132],'c'
      mov	byte[rax + 133],'['
      mov	byte[rax + 134],'5'
      mov	byte[rax + 135],'8'
      mov	byte[rax + 136],']'
      mov	byte[rax + 137],'+'
      mov	byte[rax + 138],'c'
      mov	byte[rax + 139],'['
      mov	byte[rax + 140],'1'
      mov	byte[rax + 141],'7'
      mov	byte[rax + 142],']'
      mov	byte[rax + 143],'+'
      mov	byte[rax + 144],'c'
      mov	byte[rax + 145],'['
      mov	byte[rax + 146],'2'
      mov	byte[rax + 147],'0'
      mov	byte[rax + 148],']'
      mov	byte[rax + 149],'+'
      mov	byte[rax + 150],'c'
      mov	byte[rax + 151],'['
      mov	byte[rax + 152],'2'
      mov	byte[rax + 153],'1'
      mov	byte[rax + 154],']'
      mov	byte[rax + 155],'+'
      mov	byte[rax + 156],'c'
      mov	byte[rax + 157],'['
      mov	byte[rax + 158],'5'
      mov	byte[rax + 159],'9'
      mov	byte[rax + 160],']'
      mov	byte[rax + 161],'+'
      mov	byte[rax + 162],'c'
      mov	byte[rax + 163],'['
      mov	byte[rax + 164],'2'
      mov	byte[rax + 165],'6'
      mov	byte[rax + 166],']'
      mov	byte[rax + 167],')'
      mov	byte[rax + 168],';'
      mov	byte[rax + 169],0
      mov	[rbp - 3944],rax
      mov	r10,[rbp - 3944]
      mov	r11,[lcs]
      add	r11,[rbp - 3936]
      mov	[r11],r10
      mov	r10,15
      add	r10,1
      mov	[rbp - 3968],r10
      mov	r10,[rbp - 3968]
      imul	r10,256
      mov	[rbp - 3968],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],'r'
      mov	byte[rax + 2],'i'
      mov	byte[rax + 3],'n'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'n'
      mov	byte[rax + 7],'('
      mov	byte[rax + 8],'c'
      mov	byte[rax + 9],'['
      mov	byte[rax + 10],'8'
      mov	byte[rax + 11],'1'
      mov	byte[rax + 12],']'
      mov	byte[rax + 13],'+'
      mov	byte[rax + 14],'c'
      mov	byte[rax + 15],'['
      mov	byte[rax + 16],'8'
      mov	byte[rax + 17],'2'
      mov	byte[rax + 18],']'
      mov	byte[rax + 19],'+'
      mov	byte[rax + 20],'c'
      mov	byte[rax + 21],'['
      mov	byte[rax + 22],'8'
      mov	byte[rax + 23],'0'
      mov	byte[rax + 24],']'
      mov	byte[rax + 25],'+'
      mov	byte[rax + 26],'c'
      mov	byte[rax + 27],'['
      mov	byte[rax + 28],'7'
      mov	byte[rax + 29],'1'
      mov	byte[rax + 30],']'
      mov	byte[rax + 31],'+'
      mov	byte[rax + 32],'c'
      mov	byte[rax + 33],'['
      mov	byte[rax + 34],'7'
      mov	byte[rax + 35],'6'
      mov	byte[rax + 36],']'
      mov	byte[rax + 37],'+'
      mov	byte[rax + 38],'c'
      mov	byte[rax + 39],'['
      mov	byte[rax + 40],'6'
      mov	byte[rax + 41],'9'
      mov	byte[rax + 42],']'
      mov	byte[rax + 43],'+'
      mov	byte[rax + 44],'c'
      mov	byte[rax + 45],'['
      mov	byte[rax + 46],'0'
      mov	byte[rax + 47],']'
      mov	byte[rax + 48],'+'
      mov	byte[rax + 49],'c'
      mov	byte[rax + 50],'['
      mov	byte[rax + 51],'8'
      mov	byte[rax + 52],'1'
      mov	byte[rax + 53],']'
      mov	byte[rax + 54],'+'
      mov	byte[rax + 55],'c'
      mov	byte[rax + 56],'['
      mov	byte[rax + 57],'1'
      mov	byte[rax + 58],'7'
      mov	byte[rax + 59],']'
      mov	byte[rax + 60],'+'
      mov	byte[rax + 61],'c'
      mov	byte[rax + 62],'['
      mov	byte[rax + 63],'7'
      mov	byte[rax + 64],']'
      mov	byte[rax + 65],'+'
      mov	byte[rax + 66],'c'
      mov	byte[rax + 67],'['
      mov	byte[rax + 68],'7'
      mov	byte[rax + 69],'1'
      mov	byte[rax + 70],']'
      mov	byte[rax + 71],'+'
      mov	byte[rax + 72],'c'
      mov	byte[rax + 73],'['
      mov	byte[rax + 74],'7'
      mov	byte[rax + 75],'6'
      mov	byte[rax + 76],']'
      mov	byte[rax + 77],'+'
      mov	byte[rax + 78],'c'
      mov	byte[rax + 79],'['
      mov	byte[rax + 80],'8'
      mov	byte[rax + 81],'2'
      mov	byte[rax + 82],']'
      mov	byte[rax + 83],'+'
      mov	byte[rax + 84],'c'
      mov	byte[rax + 85],'['
      mov	byte[rax + 86],'0'
      mov	byte[rax + 87],']'
      mov	byte[rax + 88],'+'
      mov	byte[rax + 89],'c'
      mov	byte[rax + 90],'['
      mov	byte[rax + 91],'8'
      mov	byte[rax + 92],'1'
      mov	byte[rax + 93],']'
      mov	byte[rax + 94],'+'
      mov	byte[rax + 95],'c'
      mov	byte[rax + 96],'['
      mov	byte[rax + 97],'8'
      mov	byte[rax + 98],'1'
      mov	byte[rax + 99],']'
      mov	byte[rax + 100],'+'
      mov	byte[rax + 101],'c'
      mov	byte[rax + 102],'['
      mov	byte[rax + 103],'8'
      mov	byte[rax + 104],']'
      mov	byte[rax + 105],'+'
      mov	byte[rax + 106],'c'
      mov	byte[rax + 107],'['
      mov	byte[rax + 108],'8'
      mov	byte[rax + 109],'9'
      mov	byte[rax + 110],']'
      mov	byte[rax + 111],')'
      mov	byte[rax + 112],';'
      mov	byte[rax + 113],0
      mov	[rbp - 3976],rax
      mov	r10,[rbp - 3976]
      mov	r11,[lcs]
      add	r11,[rbp - 3968]
      mov	[r11],r10
      mov	r10,16
      add	r10,1
      mov	[rbp - 4000],r10
      mov	r10,[rbp - 4000]
      imul	r10,256
      mov	[rbp - 4000],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],'r'
      mov	byte[rax + 2],'i'
      mov	byte[rax + 3],'n'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'n'
      mov	byte[rax + 7],'('
      mov	byte[rax + 8],'c'
      mov	byte[rax + 9],'['
      mov	byte[rax + 10],'7'
      mov	byte[rax + 11],'1'
      mov	byte[rax + 12],']'
      mov	byte[rax + 13],'+'
      mov	byte[rax + 14],'c'
      mov	byte[rax + 15],'['
      mov	byte[rax + 16],'6'
      mov	byte[rax + 17],'8'
      mov	byte[rax + 18],']'
      mov	byte[rax + 19],'+'
      mov	byte[rax + 20],'c'
      mov	byte[rax + 21],'['
      mov	byte[rax + 22],'7'
      mov	byte[rax + 23],']'
      mov	byte[rax + 24],'+'
      mov	byte[rax + 25],'c'
      mov	byte[rax + 26],'['
      mov	byte[rax + 27],'8'
      mov	byte[rax + 28],'1'
      mov	byte[rax + 29],']'
      mov	byte[rax + 30],'+'
      mov	byte[rax + 31],'c'
      mov	byte[rax + 32],'['
      mov	byte[rax + 33],'8'
      mov	byte[rax + 34],'1'
      mov	byte[rax + 35],']'
      mov	byte[rax + 36],'+'
      mov	byte[rax + 37],'c'
      mov	byte[rax + 38],'['
      mov	byte[rax + 39],'2'
      mov	byte[rax + 40],'7'
      mov	byte[rax + 41],']'
      mov	byte[rax + 42],'+'
      mov	byte[rax + 43],'c'
      mov	byte[rax + 44],'['
      mov	byte[rax + 45],'2'
      mov	byte[rax + 46],'8'
      mov	byte[rax + 47],']'
      mov	byte[rax + 48],'+'
      mov	byte[rax + 49],'c'
      mov	byte[rax + 50],'['
      mov	byte[rax + 51],'2'
      mov	byte[rax + 52],'4'
      mov	byte[rax + 53],']'
      mov	byte[rax + 54],'+'
      mov	byte[rax + 55],'c'
      mov	byte[rax + 56],'['
      mov	byte[rax + 57],'8'
      mov	byte[rax + 58],']'
      mov	byte[rax + 59],'+'
      mov	byte[rax + 60],'c'
      mov	byte[rax + 61],'['
      mov	byte[rax + 62],'8'
      mov	byte[rax + 63],'0'
      mov	byte[rax + 64],']'
      mov	byte[rax + 65],'+'
      mov	byte[rax + 66],'c'
      mov	byte[rax + 67],'['
      mov	byte[rax + 68],'6'
      mov	byte[rax + 69],'7'
      mov	byte[rax + 70],']'
      mov	byte[rax + 71],'+'
      mov	byte[rax + 72],'c'
      mov	byte[rax + 73],'['
      mov	byte[rax + 74],'8'
      mov	byte[rax + 75],'2'
      mov	byte[rax + 76],']'
      mov	byte[rax + 77],'+'
      mov	byte[rax + 78],'c'
      mov	byte[rax + 79],'['
      mov	byte[rax + 80],'8'
      mov	byte[rax + 81],'3'
      mov	byte[rax + 82],']'
      mov	byte[rax + 83],'+'
      mov	byte[rax + 84],'c'
      mov	byte[rax + 85],'['
      mov	byte[rax + 86],'8'
      mov	byte[rax + 87],'0'
      mov	byte[rax + 88],']'
      mov	byte[rax + 89],'+'
      mov	byte[rax + 90],'c'
      mov	byte[rax + 91],'['
      mov	byte[rax + 92],'7'
      mov	byte[rax + 93],'6'
      mov	byte[rax + 94],']'
      mov	byte[rax + 95],'+'
      mov	byte[rax + 96],'c'
      mov	byte[rax + 97],'['
      mov	byte[rax + 98],'0'
      mov	byte[rax + 99],']'
      mov	byte[rax + 100],'+'
      mov	byte[rax + 101],'a'
      mov	byte[rax + 102],'2'
      mov	byte[rax + 103],'q'
      mov	byte[rax + 104],'+'
      mov	byte[rax + 105],'c'
      mov	byte[rax + 106],'['
      mov	byte[rax + 107],'8'
      mov	byte[rax + 108],'1'
      mov	byte[rax + 109],']'
      mov	byte[rax + 110],'+'
      mov	byte[rax + 111],'c'
      mov	byte[rax + 112],'['
      mov	byte[rax + 113],'5'
      mov	byte[rax + 114],'8'
      mov	byte[rax + 115],']'
      mov	byte[rax + 116],'+'
      mov	byte[rax + 117],'a'
      mov	byte[rax + 118],'2'
      mov	byte[rax + 119],'q'
      mov	byte[rax + 120],'+'
      mov	byte[rax + 121],'c'
      mov	byte[rax + 122],'['
      mov	byte[rax + 123],'1'
      mov	byte[rax + 124],'0'
      mov	byte[rax + 125],']'
      mov	byte[rax + 126],'+'
      mov	byte[rax + 127],'c'
      mov	byte[rax + 128],'['
      mov	byte[rax + 129],'6'
      mov	byte[rax + 130],'6'
      mov	byte[rax + 131],']'
      mov	byte[rax + 132],'+'
      mov	byte[rax + 133],'c'
      mov	byte[rax + 134],'['
      mov	byte[rax + 135],'7'
      mov	byte[rax + 136],'1'
      mov	byte[rax + 137],']'
      mov	byte[rax + 138],'+'
      mov	byte[rax + 139],'c'
      mov	byte[rax + 140],'['
      mov	byte[rax + 141],'6'
      mov	byte[rax + 142],'9'
      mov	byte[rax + 143],']'
      mov	byte[rax + 144],'+'
      mov	byte[rax + 145],'c'
      mov	byte[rax + 146],'['
      mov	byte[rax + 147],'8'
      mov	byte[rax + 148],'2'
      mov	byte[rax + 149],']'
      mov	byte[rax + 150],'+'
      mov	byte[rax + 151],'c'
      mov	byte[rax + 152],'['
      mov	byte[rax + 153],'7'
      mov	byte[rax + 154],']'
      mov	byte[rax + 155],'+'
      mov	byte[rax + 156],'c'
      mov	byte[rax + 157],'['
      mov	byte[rax + 158],'8'
      mov	byte[rax + 159],'1'
      mov	byte[rax + 160],']'
      mov	byte[rax + 161],'+'
      mov	byte[rax + 162],'c'
      mov	byte[rax + 163],'['
      mov	byte[rax + 164],'8'
      mov	byte[rax + 165],'1'
      mov	byte[rax + 166],']'
      mov	byte[rax + 167],'+'
      mov	byte[rax + 168],'c'
      mov	byte[rax + 169],'['
      mov	byte[rax + 170],'8'
      mov	byte[rax + 171],']'
      mov	byte[rax + 172],'+'
      mov	byte[rax + 173],'c'
      mov	byte[rax + 174],'['
      mov	byte[rax + 175],'1'
      mov	byte[rax + 176],'0'
      mov	byte[rax + 177],']'
      mov	byte[rax + 178],'+'
      mov	byte[rax + 179],'a'
      mov	byte[rax + 180],'2'
      mov	byte[rax + 181],'q'
      mov	byte[rax + 182],'+'
      mov	byte[rax + 183],'c'
      mov	byte[rax + 184],'['
      mov	byte[rax + 185],'5'
      mov	byte[rax + 186],'9'
      mov	byte[rax + 187],']'
      mov	byte[rax + 188],'+'
      mov	byte[rax + 189],'c'
      mov	byte[rax + 190],'['
      mov	byte[rax + 191],'2'
      mov	byte[rax + 192],'8'
      mov	byte[rax + 193],']'
      mov	byte[rax + 194],'+'
      mov	byte[rax + 195],'a'
      mov	byte[rax + 196],'2'
      mov	byte[rax + 197],'q'
      mov	byte[rax + 198],'+'
      mov	byte[rax + 199],'c'
      mov	byte[rax + 200],'['
      mov	byte[rax + 201],'2'
      mov	byte[rax + 202],'6'
      mov	byte[rax + 203],']'
      mov	byte[rax + 204],')'
      mov	byte[rax + 205],';'
      mov	byte[rax + 206],0
      mov	[rbp - 4008],rax
      mov	r10,[rbp - 4008]
      mov	r11,[lcs]
      add	r11,[rbp - 4000]
      mov	[r11],r10
      mov	r10,17
      add	r10,1
      mov	[rbp - 4032],r10
      mov	r10,[rbp - 4032]
      imul	r10,256
      mov	[rbp - 4032],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],'r'
      mov	byte[rax + 2],'i'
      mov	byte[rax + 3],'n'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'n'
      mov	byte[rax + 7],'('
      mov	byte[rax + 8],'c'
      mov	byte[rax + 9],'['
      mov	byte[rax + 10],'8'
      mov	byte[rax + 11],'0'
      mov	byte[rax + 12],']'
      mov	byte[rax + 13],'+'
      mov	byte[rax + 14],'c'
      mov	byte[rax + 15],'['
      mov	byte[rax + 16],'6'
      mov	byte[rax + 17],'7'
      mov	byte[rax + 18],']'
      mov	byte[rax + 19],'+'
      mov	byte[rax + 20],'c'
      mov	byte[rax + 21],'['
      mov	byte[rax + 22],'8'
      mov	byte[rax + 23],'2'
      mov	byte[rax + 24],']'
      mov	byte[rax + 25],'+'
      mov	byte[rax + 26],'c'
      mov	byte[rax + 27],'['
      mov	byte[rax + 28],'8'
      mov	byte[rax + 29],'3'
      mov	byte[rax + 30],']'
      mov	byte[rax + 31],'+'
      mov	byte[rax + 32],'c'
      mov	byte[rax + 33],'['
      mov	byte[rax + 34],'8'
      mov	byte[rax + 35],'0'
      mov	byte[rax + 36],']'
      mov	byte[rax + 37],'+'
      mov	byte[rax + 38],'c'
      mov	byte[rax + 39],'['
      mov	byte[rax + 40],'7'
      mov	byte[rax + 41],'6'
      mov	byte[rax + 42],']'
      mov	byte[rax + 43],'+'
      mov	byte[rax + 44],'c'
      mov	byte[rax + 45],'['
      mov	byte[rax + 46],'0'
      mov	byte[rax + 47],']'
      mov	byte[rax + 48],'+'
      mov	byte[rax + 49],'a'
      mov	byte[rax + 50],'2'
      mov	byte[rax + 51],'q'
      mov	byte[rax + 52],'+'
      mov	byte[rax + 53],'c'
      mov	byte[rax + 54],'['
      mov	byte[rax + 55],'8'
      mov	byte[rax + 56],'1'
      mov	byte[rax + 57],']'
      mov	byte[rax + 58],'+'
      mov	byte[rax + 59],'c'
      mov	byte[rax + 60],'['
      mov	byte[rax + 61],'5'
      mov	byte[rax + 62],'8'
      mov	byte[rax + 63],']'
      mov	byte[rax + 64],'+'
      mov	byte[rax + 65],'a'
      mov	byte[rax + 66],'2'
      mov	byte[rax + 67],'q'
      mov	byte[rax + 68],'+'
      mov	byte[rax + 69],'c'
      mov	byte[rax + 70],'['
      mov	byte[rax + 71],'1'
      mov	byte[rax + 72],'0'
      mov	byte[rax + 73],']'
      mov	byte[rax + 74],'+'
      mov	byte[rax + 75],'c'
      mov	byte[rax + 76],'['
      mov	byte[rax + 77],'6'
      mov	byte[rax + 78],'6'
      mov	byte[rax + 79],']'
      mov	byte[rax + 80],'+'
      mov	byte[rax + 81],'c'
      mov	byte[rax + 82],'['
      mov	byte[rax + 83],'7'
      mov	byte[rax + 84],'1'
      mov	byte[rax + 85],']'
      mov	byte[rax + 86],'+'
      mov	byte[rax + 87],'c'
      mov	byte[rax + 88],'['
      mov	byte[rax + 89],'6'
      mov	byte[rax + 90],'9'
      mov	byte[rax + 91],']'
      mov	byte[rax + 92],'+'
      mov	byte[rax + 93],'c'
      mov	byte[rax + 94],'['
      mov	byte[rax + 95],'8'
      mov	byte[rax + 96],'2'
      mov	byte[rax + 97],']'
      mov	byte[rax + 98],'+'
      mov	byte[rax + 99],'c'
      mov	byte[rax + 100],'['
      mov	byte[rax + 101],'7'
      mov	byte[rax + 102],']'
      mov	byte[rax + 103],'+'
      mov	byte[rax + 104],'c'
      mov	byte[rax + 105],'['
      mov	byte[rax + 106],'8'
      mov	byte[rax + 107],'1'
      mov	byte[rax + 108],']'
      mov	byte[rax + 109],'+'
      mov	byte[rax + 110],'c'
      mov	byte[rax + 111],'['
      mov	byte[rax + 112],'8'
      mov	byte[rax + 113],'1'
      mov	byte[rax + 114],']'
      mov	byte[rax + 115],'+'
      mov	byte[rax + 116],'c'
      mov	byte[rax + 117],'['
      mov	byte[rax + 118],'1'
      mov	byte[rax + 119],'4'
      mov	byte[rax + 120],']'
      mov	byte[rax + 121],'+'
      mov	byte[rax + 122],'c'
      mov	byte[rax + 123],'['
      mov	byte[rax + 124],'1'
      mov	byte[rax + 125],'6'
      mov	byte[rax + 126],']'
      mov	byte[rax + 127],'+'
      mov	byte[rax + 128],'c'
      mov	byte[rax + 129],'['
      mov	byte[rax + 130],'1'
      mov	byte[rax + 131],'5'
      mov	byte[rax + 132],']'
      mov	byte[rax + 133],'+'
      mov	byte[rax + 134],'c'
      mov	byte[rax + 135],'['
      mov	byte[rax + 136],'8'
      mov	byte[rax + 137],']'
      mov	byte[rax + 138],'+'
      mov	byte[rax + 139],'c'
      mov	byte[rax + 140],'['
      mov	byte[rax + 141],'1'
      mov	byte[rax + 142],'0'
      mov	byte[rax + 143],']'
      mov	byte[rax + 144],'+'
      mov	byte[rax + 145],'c'
      mov	byte[rax + 146],'['
      mov	byte[rax + 147],'6'
      mov	byte[rax + 148],'6'
      mov	byte[rax + 149],']'
      mov	byte[rax + 150],'+'
      mov	byte[rax + 151],'c'
      mov	byte[rax + 152],'['
      mov	byte[rax + 153],'7'
      mov	byte[rax + 154],'1'
      mov	byte[rax + 155],']'
      mov	byte[rax + 156],'+'
      mov	byte[rax + 157],'c'
      mov	byte[rax + 158],'['
      mov	byte[rax + 159],'6'
      mov	byte[rax + 160],'9'
      mov	byte[rax + 161],']'
      mov	byte[rax + 162],'+'
      mov	byte[rax + 163],'c'
      mov	byte[rax + 164],'['
      mov	byte[rax + 165],'8'
      mov	byte[rax + 166],'2'
      mov	byte[rax + 167],']'
      mov	byte[rax + 168],'+'
      mov	byte[rax + 169],'c'
      mov	byte[rax + 170],'['
      mov	byte[rax + 171],'7'
      mov	byte[rax + 172],']'
      mov	byte[rax + 173],'+'
      mov	byte[rax + 174],'c'
      mov	byte[rax + 175],'['
      mov	byte[rax + 176],'8'
      mov	byte[rax + 177],'1'
      mov	byte[rax + 178],']'
      mov	byte[rax + 179],'+'
      mov	byte[rax + 180],'c'
      mov	byte[rax + 181],'['
      mov	byte[rax + 182],'8'
      mov	byte[rax + 183],'1'
      mov	byte[rax + 184],']'
      mov	byte[rax + 185],'+'
      mov	byte[rax + 186],'c'
      mov	byte[rax + 187],'['
      mov	byte[rax + 188],'4'
      mov	byte[rax + 189],']'
      mov	byte[rax + 190],'+'
      mov	byte[rax + 191],'c'
      mov	byte[rax + 192],'['
      mov	byte[rax + 193],'1'
      mov	byte[rax + 194],'6'
      mov	byte[rax + 195],']'
      mov	byte[rax + 196],'+'
      mov	byte[rax + 197],'c'
      mov	byte[rax + 198],'['
      mov	byte[rax + 199],'1'
      mov	byte[rax + 200],'5'
      mov	byte[rax + 201],']'
      mov	byte[rax + 202],'+'
      mov	byte[rax + 203],'c'
      mov	byte[rax + 204],'['
      mov	byte[rax + 205],'8'
      mov	byte[rax + 206],']'
      mov	byte[rax + 207],'+'
      mov	byte[rax + 208],'c'
      mov	byte[rax + 209],'['
      mov	byte[rax + 210],'1'
      mov	byte[rax + 211],'0'
      mov	byte[rax + 212],']'
      mov	byte[rax + 213],'+'
      mov	byte[rax + 214],'a'
      mov	byte[rax + 215],'2'
      mov	byte[rax + 216],'q'
      mov	byte[rax + 217],'+'
      mov	byte[rax + 218],'c'
      mov	byte[rax + 219],'['
      mov	byte[rax + 220],'5'
      mov	byte[rax + 221],'9'
      mov	byte[rax + 222],']'
      mov	byte[rax + 223],'+'
      mov	byte[rax + 224],'c'
      mov	byte[rax + 225],'['
      mov	byte[rax + 226],'2'
      mov	byte[rax + 227],'8'
      mov	byte[rax + 228],']'
      mov	byte[rax + 229],'+'
      mov	byte[rax + 230],'a'
      mov	byte[rax + 231],'2'
      mov	byte[rax + 232],'q'
      mov	byte[rax + 233],'+'
      mov	byte[rax + 234],'c'
      mov	byte[rax + 235],'['
      mov	byte[rax + 236],'2'
      mov	byte[rax + 237],'6'
      mov	byte[rax + 238],']'
      mov	byte[rax + 239],')'
      mov	byte[rax + 240],';'
      mov	byte[rax + 241],0
      mov	[rbp - 4040],rax
      mov	r10,[rbp - 4040]
      mov	r11,[lcs]
      add	r11,[rbp - 4032]
      mov	[r11],r10
      mov	r10,18
      add	r10,1
      mov	[rbp - 4064],r10
      mov	r10,[rbp - 4064]
      imul	r10,256
      mov	[rbp - 4064],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],'r'
      mov	byte[rax + 2],'i'
      mov	byte[rax + 3],'n'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'n'
      mov	byte[rax + 7],'('
      mov	byte[rax + 8],'c'
      mov	byte[rax + 9],'['
      mov	byte[rax + 10],'9'
      mov	byte[rax + 11],'1'
      mov	byte[rax + 12],']'
      mov	byte[rax + 13],')'
      mov	byte[rax + 14],';'
      mov	byte[rax + 15],0
      mov	[rbp - 4072],rax
      mov	r10,[rbp - 4072]
      mov	r11,[lcs]
      add	r11,[rbp - 4064]
      mov	[r11],r10
      mov	r10,19
      add	r10,1
      mov	[rbp - 4096],r10
      mov	r10,[rbp - 4096]
      imul	r10,256
      mov	[rbp - 4096],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],'r'
      mov	byte[rax + 2],'i'
      mov	byte[rax + 3],'n'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'n'
      mov	byte[rax + 7],'('
      mov	byte[rax + 8],'c'
      mov	byte[rax + 9],'['
      mov	byte[rax + 10],'8'
      mov	byte[rax + 11],'1'
      mov	byte[rax + 12],']'
      mov	byte[rax + 13],'+'
      mov	byte[rax + 14],'c'
      mov	byte[rax + 15],'['
      mov	byte[rax + 16],'8'
      mov	byte[rax + 17],'2'
      mov	byte[rax + 18],']'
      mov	byte[rax + 19],'+'
      mov	byte[rax + 20],'c'
      mov	byte[rax + 21],'['
      mov	byte[rax + 22],'8'
      mov	byte[rax + 23],'0'
      mov	byte[rax + 24],']'
      mov	byte[rax + 25],'+'
      mov	byte[rax + 26],'c'
      mov	byte[rax + 27],'['
      mov	byte[rax + 28],'7'
      mov	byte[rax + 29],'1'
      mov	byte[rax + 30],']'
      mov	byte[rax + 31],'+'
      mov	byte[rax + 32],'c'
      mov	byte[rax + 33],'['
      mov	byte[rax + 34],'7'
      mov	byte[rax + 35],'6'
      mov	byte[rax + 36],']'
      mov	byte[rax + 37],'+'
      mov	byte[rax + 38],'c'
      mov	byte[rax + 39],'['
      mov	byte[rax + 40],'6'
      mov	byte[rax + 41],'9'
      mov	byte[rax + 42],']'
      mov	byte[rax + 43],'+'
      mov	byte[rax + 44],'c'
      mov	byte[rax + 45],'['
      mov	byte[rax + 46],'0'
      mov	byte[rax + 47],']'
      mov	byte[rax + 48],'+'
      mov	byte[rax + 49],'c'
      mov	byte[rax + 50],'['
      mov	byte[rax + 51],'6'
      mov	byte[rax + 52],'5'
      mov	byte[rax + 53],']'
      mov	byte[rax + 54],'+'
      mov	byte[rax + 55],'c'
      mov	byte[rax + 56],'['
      mov	byte[rax + 57],'1'
      mov	byte[rax + 58],'7'
      mov	byte[rax + 59],']'
      mov	byte[rax + 60],'+'
      mov	byte[rax + 61],'c'
      mov	byte[rax + 62],'['
      mov	byte[rax + 63],'7'
      mov	byte[rax + 64],']'
      mov	byte[rax + 65],'+'
      mov	byte[rax + 66],'c'
      mov	byte[rax + 67],'['
      mov	byte[rax + 68],'7'
      mov	byte[rax + 69],'1'
      mov	byte[rax + 70],']'
      mov	byte[rax + 71],'+'
      mov	byte[rax + 72],'c'
      mov	byte[rax + 73],'['
      mov	byte[rax + 74],'7'
      mov	byte[rax + 75],'6'
      mov	byte[rax + 76],']'
      mov	byte[rax + 77],'+'
      mov	byte[rax + 78],'c'
      mov	byte[rax + 79],'['
      mov	byte[rax + 80],'8'
      mov	byte[rax + 81],'2'
      mov	byte[rax + 82],']'
      mov	byte[rax + 83],'+'
      mov	byte[rax + 84],'c'
      mov	byte[rax + 85],'['
      mov	byte[rax + 86],'0'
      mov	byte[rax + 87],']'
      mov	byte[rax + 88],'+'
      mov	byte[rax + 89],'c'
      mov	byte[rax + 90],'['
      mov	byte[rax + 91],'6'
      mov	byte[rax + 92],'5'
      mov	byte[rax + 93],']'
      mov	byte[rax + 94],'+'
      mov	byte[rax + 95],'c'
      mov	byte[rax + 96],'['
      mov	byte[rax + 97],'6'
      mov	byte[rax + 98],'5'
      mov	byte[rax + 99],']'
      mov	byte[rax + 100],'+'
      mov	byte[rax + 101],'c'
      mov	byte[rax + 102],'['
      mov	byte[rax + 103],'8'
      mov	byte[rax + 104],']'
      mov	byte[rax + 105],'+'
      mov	byte[rax + 106],'c'
      mov	byte[rax + 107],'['
      mov	byte[rax + 108],'8'
      mov	byte[rax + 109],'9'
      mov	byte[rax + 110],']'
      mov	byte[rax + 111],')'
      mov	byte[rax + 112],';'
      mov	byte[rax + 113],0
      mov	[rbp - 4104],rax
      mov	r10,[rbp - 4104]
      mov	r11,[lcs]
      add	r11,[rbp - 4096]
      mov	[r11],r10
      mov	r10,20
      add	r10,1
      mov	[rbp - 4128],r10
      mov	r10,[rbp - 4128]
      imul	r10,256
      mov	[rbp - 4128],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],'r'
      mov	byte[rax + 2],'i'
      mov	byte[rax + 3],'n'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'n'
      mov	byte[rax + 7],'('
      mov	byte[rax + 8],'c'
      mov	byte[rax + 9],'['
      mov	byte[rax + 10],'7'
      mov	byte[rax + 11],'1'
      mov	byte[rax + 12],']'
      mov	byte[rax + 13],'+'
      mov	byte[rax + 14],'c'
      mov	byte[rax + 15],'['
      mov	byte[rax + 16],'6'
      mov	byte[rax + 17],'8'
      mov	byte[rax + 18],']'
      mov	byte[rax + 19],'+'
      mov	byte[rax + 20],'c'
      mov	byte[rax + 21],'['
      mov	byte[rax + 22],'7'
      mov	byte[rax + 23],']'
      mov	byte[rax + 24],'+'
      mov	byte[rax + 25],'c'
      mov	byte[rax + 26],'['
      mov	byte[rax + 27],'6'
      mov	byte[rax + 28],'5'
      mov	byte[rax + 29],']'
      mov	byte[rax + 30],'+'
      mov	byte[rax + 31],'c'
      mov	byte[rax + 32],'['
      mov	byte[rax + 33],'6'
      mov	byte[rax + 34],'5'
      mov	byte[rax + 35],']'
      mov	byte[rax + 36],'+'
      mov	byte[rax + 37],'c'
      mov	byte[rax + 38],'['
      mov	byte[rax + 39],'2'
      mov	byte[rax + 40],'7'
      mov	byte[rax + 41],']'
      mov	byte[rax + 42],'+'
      mov	byte[rax + 43],'c'
      mov	byte[rax + 44],'['
      mov	byte[rax + 45],'2'
      mov	byte[rax + 46],'8'
      mov	byte[rax + 47],']'
      mov	byte[rax + 48],'+'
      mov	byte[rax + 49],'c'
      mov	byte[rax + 50],'['
      mov	byte[rax + 51],'2'
      mov	byte[rax + 52],'4'
      mov	byte[rax + 53],']'
      mov	byte[rax + 54],'+'
      mov	byte[rax + 55],'c'
      mov	byte[rax + 56],'['
      mov	byte[rax + 57],'8'
      mov	byte[rax + 58],']'
      mov	byte[rax + 59],'+'
      mov	byte[rax + 60],'c'
      mov	byte[rax + 61],'['
      mov	byte[rax + 62],'8'
      mov	byte[rax + 63],'0'
      mov	byte[rax + 64],']'
      mov	byte[rax + 65],'+'
      mov	byte[rax + 66],'c'
      mov	byte[rax + 67],'['
      mov	byte[rax + 68],'6'
      mov	byte[rax + 69],'7'
      mov	byte[rax + 70],']'
      mov	byte[rax + 71],'+'
      mov	byte[rax + 72],'c'
      mov	byte[rax + 73],'['
      mov	byte[rax + 74],'8'
      mov	byte[rax + 75],'2'
      mov	byte[rax + 76],']'
      mov	byte[rax + 77],'+'
      mov	byte[rax + 78],'c'
      mov	byte[rax + 79],'['
      mov	byte[rax + 80],'8'
      mov	byte[rax + 81],'3'
      mov	byte[rax + 82],']'
      mov	byte[rax + 83],'+'
      mov	byte[rax + 84],'c'
      mov	byte[rax + 85],'['
      mov	byte[rax + 86],'8'
      mov	byte[rax + 87],'0'
      mov	byte[rax + 88],']'
      mov	byte[rax + 89],'+'
      mov	byte[rax + 90],'c'
      mov	byte[rax + 91],'['
      mov	byte[rax + 92],'7'
      mov	byte[rax + 93],'6'
      mov	byte[rax + 94],']'
      mov	byte[rax + 95],'+'
      mov	byte[rax + 96],'c'
      mov	byte[rax + 97],'['
      mov	byte[rax + 98],'0'
      mov	byte[rax + 99],']'
      mov	byte[rax + 100],'+'
      mov	byte[rax + 101],'a'
      mov	byte[rax + 102],'2'
      mov	byte[rax + 103],'q'
      mov	byte[rax + 104],'+'
      mov	byte[rax + 105],'c'
      mov	byte[rax + 106],'['
      mov	byte[rax + 107],'6'
      mov	byte[rax + 108],'5'
      mov	byte[rax + 109],']'
      mov	byte[rax + 110],'+'
      mov	byte[rax + 111],'c'
      mov	byte[rax + 112],'['
      mov	byte[rax + 113],'5'
      mov	byte[rax + 114],'8'
      mov	byte[rax + 115],']'
      mov	byte[rax + 116],'+'
      mov	byte[rax + 117],'a'
      mov	byte[rax + 118],'2'
      mov	byte[rax + 119],'q'
      mov	byte[rax + 120],'+'
      mov	byte[rax + 121],'c'
      mov	byte[rax + 122],'['
      mov	byte[rax + 123],'1'
      mov	byte[rax + 124],'0'
      mov	byte[rax + 125],']'
      mov	byte[rax + 126],'+'
      mov	byte[rax + 127],'c'
      mov	byte[rax + 128],'['
      mov	byte[rax + 129],'6'
      mov	byte[rax + 130],'6'
      mov	byte[rax + 131],']'
      mov	byte[rax + 132],'+'
      mov	byte[rax + 133],'c'
      mov	byte[rax + 134],'['
      mov	byte[rax + 135],'7'
      mov	byte[rax + 136],'1'
      mov	byte[rax + 137],']'
      mov	byte[rax + 138],'+'
      mov	byte[rax + 139],'c'
      mov	byte[rax + 140],'['
      mov	byte[rax + 141],'6'
      mov	byte[rax + 142],'9'
      mov	byte[rax + 143],']'
      mov	byte[rax + 144],'+'
      mov	byte[rax + 145],'c'
      mov	byte[rax + 146],'['
      mov	byte[rax + 147],'8'
      mov	byte[rax + 148],'2'
      mov	byte[rax + 149],']'
      mov	byte[rax + 150],'+'
      mov	byte[rax + 151],'c'
      mov	byte[rax + 152],'['
      mov	byte[rax + 153],'7'
      mov	byte[rax + 154],']'
      mov	byte[rax + 155],'+'
      mov	byte[rax + 156],'c'
      mov	byte[rax + 157],'['
      mov	byte[rax + 158],'6'
      mov	byte[rax + 159],'5'
      mov	byte[rax + 160],']'
      mov	byte[rax + 161],'+'
      mov	byte[rax + 162],'c'
      mov	byte[rax + 163],'['
      mov	byte[rax + 164],'6'
      mov	byte[rax + 165],'5'
      mov	byte[rax + 166],']'
      mov	byte[rax + 167],'+'
      mov	byte[rax + 168],'c'
      mov	byte[rax + 169],'['
      mov	byte[rax + 170],'8'
      mov	byte[rax + 171],']'
      mov	byte[rax + 172],'+'
      mov	byte[rax + 173],'c'
      mov	byte[rax + 174],'['
      mov	byte[rax + 175],'1'
      mov	byte[rax + 176],'0'
      mov	byte[rax + 177],']'
      mov	byte[rax + 178],'+'
      mov	byte[rax + 179],'a'
      mov	byte[rax + 180],'2'
      mov	byte[rax + 181],'q'
      mov	byte[rax + 182],'+'
      mov	byte[rax + 183],'c'
      mov	byte[rax + 184],'['
      mov	byte[rax + 185],'5'
      mov	byte[rax + 186],'9'
      mov	byte[rax + 187],']'
      mov	byte[rax + 188],'+'
      mov	byte[rax + 189],'c'
      mov	byte[rax + 190],'['
      mov	byte[rax + 191],'2'
      mov	byte[rax + 192],'8'
      mov	byte[rax + 193],']'
      mov	byte[rax + 194],'+'
      mov	byte[rax + 195],'a'
      mov	byte[rax + 196],'2'
      mov	byte[rax + 197],'q'
      mov	byte[rax + 198],'+'
      mov	byte[rax + 199],'c'
      mov	byte[rax + 200],'['
      mov	byte[rax + 201],'2'
      mov	byte[rax + 202],'6'
      mov	byte[rax + 203],']'
      mov	byte[rax + 204],')'
      mov	byte[rax + 205],';'
      mov	byte[rax + 206],0
      mov	[rbp - 4136],rax
      mov	r10,[rbp - 4136]
      mov	r11,[lcs]
      add	r11,[rbp - 4128]
      mov	[r11],r10
      mov	r10,21
      add	r10,1
      mov	[rbp - 4160],r10
      mov	r10,[rbp - 4160]
      imul	r10,256
      mov	[rbp - 4160],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],'r'
      mov	byte[rax + 2],'i'
      mov	byte[rax + 3],'n'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'n'
      mov	byte[rax + 7],'('
      mov	byte[rax + 8],'c'
      mov	byte[rax + 9],'['
      mov	byte[rax + 10],'8'
      mov	byte[rax + 11],'0'
      mov	byte[rax + 12],']'
      mov	byte[rax + 13],'+'
      mov	byte[rax + 14],'c'
      mov	byte[rax + 15],'['
      mov	byte[rax + 16],'6'
      mov	byte[rax + 17],'7'
      mov	byte[rax + 18],']'
      mov	byte[rax + 19],'+'
      mov	byte[rax + 20],'c'
      mov	byte[rax + 21],'['
      mov	byte[rax + 22],'8'
      mov	byte[rax + 23],'2'
      mov	byte[rax + 24],']'
      mov	byte[rax + 25],'+'
      mov	byte[rax + 26],'c'
      mov	byte[rax + 27],'['
      mov	byte[rax + 28],'8'
      mov	byte[rax + 29],'3'
      mov	byte[rax + 30],']'
      mov	byte[rax + 31],'+'
      mov	byte[rax + 32],'c'
      mov	byte[rax + 33],'['
      mov	byte[rax + 34],'8'
      mov	byte[rax + 35],'0'
      mov	byte[rax + 36],']'
      mov	byte[rax + 37],'+'
      mov	byte[rax + 38],'c'
      mov	byte[rax + 39],'['
      mov	byte[rax + 40],'7'
      mov	byte[rax + 41],'6'
      mov	byte[rax + 42],']'
      mov	byte[rax + 43],'+'
      mov	byte[rax + 44],'c'
      mov	byte[rax + 45],'['
      mov	byte[rax + 46],'0'
      mov	byte[rax + 47],']'
      mov	byte[rax + 48],'+'
      mov	byte[rax + 49],'a'
      mov	byte[rax + 50],'2'
      mov	byte[rax + 51],'q'
      mov	byte[rax + 52],'+'
      mov	byte[rax + 53],'c'
      mov	byte[rax + 54],'['
      mov	byte[rax + 55],'6'
      mov	byte[rax + 56],'5'
      mov	byte[rax + 57],']'
      mov	byte[rax + 58],'+'
      mov	byte[rax + 59],'c'
      mov	byte[rax + 60],'['
      mov	byte[rax + 61],'5'
      mov	byte[rax + 62],'8'
      mov	byte[rax + 63],']'
      mov	byte[rax + 64],'+'
      mov	byte[rax + 65],'a'
      mov	byte[rax + 66],'2'
      mov	byte[rax + 67],'q'
      mov	byte[rax + 68],'+'
      mov	byte[rax + 69],'c'
      mov	byte[rax + 70],'['
      mov	byte[rax + 71],'1'
      mov	byte[rax + 72],'0'
      mov	byte[rax + 73],']'
      mov	byte[rax + 74],'+'
      mov	byte[rax + 75],'c'
      mov	byte[rax + 76],'['
      mov	byte[rax + 77],'6'
      mov	byte[rax + 78],'6'
      mov	byte[rax + 79],']'
      mov	byte[rax + 80],'+'
      mov	byte[rax + 81],'c'
      mov	byte[rax + 82],'['
      mov	byte[rax + 83],'7'
      mov	byte[rax + 84],'1'
      mov	byte[rax + 85],']'
      mov	byte[rax + 86],'+'
      mov	byte[rax + 87],'c'
      mov	byte[rax + 88],'['
      mov	byte[rax + 89],'6'
      mov	byte[rax + 90],'9'
      mov	byte[rax + 91],']'
      mov	byte[rax + 92],'+'
      mov	byte[rax + 93],'c'
      mov	byte[rax + 94],'['
      mov	byte[rax + 95],'8'
      mov	byte[rax + 96],'2'
      mov	byte[rax + 97],']'
      mov	byte[rax + 98],'+'
      mov	byte[rax + 99],'c'
      mov	byte[rax + 100],'['
      mov	byte[rax + 101],'7'
      mov	byte[rax + 102],']'
      mov	byte[rax + 103],'+'
      mov	byte[rax + 104],'c'
      mov	byte[rax + 105],'['
      mov	byte[rax + 106],'6'
      mov	byte[rax + 107],'5'
      mov	byte[rax + 108],']'
      mov	byte[rax + 109],'+'
      mov	byte[rax + 110],'c'
      mov	byte[rax + 111],'['
      mov	byte[rax + 112],'6'
      mov	byte[rax + 113],'5'
      mov	byte[rax + 114],']'
      mov	byte[rax + 115],'+'
      mov	byte[rax + 116],'c'
      mov	byte[rax + 117],'['
      mov	byte[rax + 118],'1'
      mov	byte[rax + 119],'4'
      mov	byte[rax + 120],']'
      mov	byte[rax + 121],'+'
      mov	byte[rax + 122],'c'
      mov	byte[rax + 123],'['
      mov	byte[rax + 124],'1'
      mov	byte[rax + 125],'6'
      mov	byte[rax + 126],']'
      mov	byte[rax + 127],'+'
      mov	byte[rax + 128],'c'
      mov	byte[rax + 129],'['
      mov	byte[rax + 130],'1'
      mov	byte[rax + 131],'5'
      mov	byte[rax + 132],']'
      mov	byte[rax + 133],'+'
      mov	byte[rax + 134],'c'
      mov	byte[rax + 135],'['
      mov	byte[rax + 136],'8'
      mov	byte[rax + 137],']'
      mov	byte[rax + 138],'+'
      mov	byte[rax + 139],'c'
      mov	byte[rax + 140],'['
      mov	byte[rax + 141],'1'
      mov	byte[rax + 142],'0'
      mov	byte[rax + 143],']'
      mov	byte[rax + 144],'+'
      mov	byte[rax + 145],'c'
      mov	byte[rax + 146],'['
      mov	byte[rax + 147],'6'
      mov	byte[rax + 148],'6'
      mov	byte[rax + 149],']'
      mov	byte[rax + 150],'+'
      mov	byte[rax + 151],'c'
      mov	byte[rax + 152],'['
      mov	byte[rax + 153],'7'
      mov	byte[rax + 154],'1'
      mov	byte[rax + 155],']'
      mov	byte[rax + 156],'+'
      mov	byte[rax + 157],'c'
      mov	byte[rax + 158],'['
      mov	byte[rax + 159],'6'
      mov	byte[rax + 160],'9'
      mov	byte[rax + 161],']'
      mov	byte[rax + 162],'+'
      mov	byte[rax + 163],'c'
      mov	byte[rax + 164],'['
      mov	byte[rax + 165],'8'
      mov	byte[rax + 166],'2'
      mov	byte[rax + 167],']'
      mov	byte[rax + 168],'+'
      mov	byte[rax + 169],'c'
      mov	byte[rax + 170],'['
      mov	byte[rax + 171],'7'
      mov	byte[rax + 172],']'
      mov	byte[rax + 173],'+'
      mov	byte[rax + 174],'c'
      mov	byte[rax + 175],'['
      mov	byte[rax + 176],'6'
      mov	byte[rax + 177],'5'
      mov	byte[rax + 178],']'
      mov	byte[rax + 179],'+'
      mov	byte[rax + 180],'c'
      mov	byte[rax + 181],'['
      mov	byte[rax + 182],'6'
      mov	byte[rax + 183],'5'
      mov	byte[rax + 184],']'
      mov	byte[rax + 185],'+'
      mov	byte[rax + 186],'c'
      mov	byte[rax + 187],'['
      mov	byte[rax + 188],'4'
      mov	byte[rax + 189],']'
      mov	byte[rax + 190],'+'
      mov	byte[rax + 191],'c'
      mov	byte[rax + 192],'['
      mov	byte[rax + 193],'1'
      mov	byte[rax + 194],'6'
      mov	byte[rax + 195],']'
      mov	byte[rax + 196],'+'
      mov	byte[rax + 197],'c'
      mov	byte[rax + 198],'['
      mov	byte[rax + 199],'1'
      mov	byte[rax + 200],'5'
      mov	byte[rax + 201],']'
      mov	byte[rax + 202],'+'
      mov	byte[rax + 203],'c'
      mov	byte[rax + 204],'['
      mov	byte[rax + 205],'8'
      mov	byte[rax + 206],']'
      mov	byte[rax + 207],'+'
      mov	byte[rax + 208],'c'
      mov	byte[rax + 209],'['
      mov	byte[rax + 210],'1'
      mov	byte[rax + 211],'0'
      mov	byte[rax + 212],']'
      mov	byte[rax + 213],'+'
      mov	byte[rax + 214],'a'
      mov	byte[rax + 215],'2'
      mov	byte[rax + 216],'q'
      mov	byte[rax + 217],'+'
      mov	byte[rax + 218],'c'
      mov	byte[rax + 219],'['
      mov	byte[rax + 220],'5'
      mov	byte[rax + 221],'9'
      mov	byte[rax + 222],']'
      mov	byte[rax + 223],'+'
      mov	byte[rax + 224],'c'
      mov	byte[rax + 225],'['
      mov	byte[rax + 226],'2'
      mov	byte[rax + 227],'8'
      mov	byte[rax + 228],']'
      mov	byte[rax + 229],'+'
      mov	byte[rax + 230],'a'
      mov	byte[rax + 231],'2'
      mov	byte[rax + 232],'q'
      mov	byte[rax + 233],'+'
      mov	byte[rax + 234],'c'
      mov	byte[rax + 235],'['
      mov	byte[rax + 236],'2'
      mov	byte[rax + 237],'6'
      mov	byte[rax + 238],']'
      mov	byte[rax + 239],')'
      mov	byte[rax + 240],';'
      mov	byte[rax + 241],0
      mov	[rbp - 4168],rax
      mov	r10,[rbp - 4168]
      mov	r11,[lcs]
      add	r11,[rbp - 4160]
      mov	[r11],r10
      mov	r10,22
      add	r10,1
      mov	[rbp - 4192],r10
      mov	r10,[rbp - 4192]
      imul	r10,256
      mov	[rbp - 4192],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],'r'
      mov	byte[rax + 2],'i'
      mov	byte[rax + 3],'n'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'n'
      mov	byte[rax + 7],'('
      mov	byte[rax + 8],'c'
      mov	byte[rax + 9],'['
      mov	byte[rax + 10],'9'
      mov	byte[rax + 11],'1'
      mov	byte[rax + 12],']'
      mov	byte[rax + 13],')'
      mov	byte[rax + 14],';'
      mov	byte[rax + 15],0
      mov	[rbp - 4200],rax
      mov	r10,[rbp - 4200]
      mov	r11,[lcs]
      add	r11,[rbp - 4192]
      mov	[r11],r10
      mov	r10,23
      add	r10,1
      mov	[rbp - 4224],r10
      mov	r10,[rbp - 4224]
      imul	r10,256
      mov	[rbp - 4224],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],'r'
      mov	byte[rax + 2],'i'
      mov	byte[rax + 3],'n'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'n'
      mov	byte[rax + 7],'('
      mov	byte[rax + 8],'c'
      mov	byte[rax + 9],'['
      mov	byte[rax + 10],'8'
      mov	byte[rax + 11],'1'
      mov	byte[rax + 12],']'
      mov	byte[rax + 13],'+'
      mov	byte[rax + 14],'c'
      mov	byte[rax + 15],'['
      mov	byte[rax + 16],'8'
      mov	byte[rax + 17],'2'
      mov	byte[rax + 18],']'
      mov	byte[rax + 19],'+'
      mov	byte[rax + 20],'c'
      mov	byte[rax + 21],'['
      mov	byte[rax + 22],'8'
      mov	byte[rax + 23],'0'
      mov	byte[rax + 24],']'
      mov	byte[rax + 25],'+'
      mov	byte[rax + 26],'c'
      mov	byte[rax + 27],'['
      mov	byte[rax + 28],'7'
      mov	byte[rax + 29],'1'
      mov	byte[rax + 30],']'
      mov	byte[rax + 31],'+'
      mov	byte[rax + 32],'c'
      mov	byte[rax + 33],'['
      mov	byte[rax + 34],'7'
      mov	byte[rax + 35],'6'
      mov	byte[rax + 36],']'
      mov	byte[rax + 37],'+'
      mov	byte[rax + 38],'c'
      mov	byte[rax + 39],'['
      mov	byte[rax + 40],'6'
      mov	byte[rax + 41],'9'
      mov	byte[rax + 42],']'
      mov	byte[rax + 43],'+'
      mov	byte[rax + 44],'c'
      mov	byte[rax + 45],'['
      mov	byte[rax + 46],'0'
      mov	byte[rax + 47],']'
      mov	byte[rax + 48],'+'
      mov	byte[rax + 49],'c'
      mov	byte[rax + 50],'['
      mov	byte[rax + 51],'6'
      mov	byte[rax + 52],'5'
      mov	byte[rax + 53],']'
      mov	byte[rax + 54],'+'
      mov	byte[rax + 55],'c'
      mov	byte[rax + 56],'['
      mov	byte[rax + 57],'7'
      mov	byte[rax + 58],'7'
      mov	byte[rax + 59],']'
      mov	byte[rax + 60],'+'
      mov	byte[rax + 61],'c'
      mov	byte[rax + 62],'['
      mov	byte[rax + 63],'2'
      mov	byte[rax + 64],'8'
      mov	byte[rax + 65],']'
      mov	byte[rax + 66],'+'
      mov	byte[rax + 67],'a'
      mov	byte[rax + 68],'2'
      mov	byte[rax + 69],'q'
      mov	byte[rax + 70],'+'
      mov	byte[rax + 71],'c'
      mov	byte[rax + 72],'['
      mov	byte[rax + 73],'2'
      mov	byte[rax + 74],'6'
      mov	byte[rax + 75],']'
      mov	byte[rax + 76],'+'
      mov	byte[rax + 77],'a'
      mov	byte[rax + 78],'2'
      mov	byte[rax + 79],'q'
      mov	byte[rax + 80],'+'
      mov	byte[rax + 81],'c'
      mov	byte[rax + 82],'['
      mov	byte[rax + 83],'2'
      mov	byte[rax + 84],'6'
      mov	byte[rax + 85],']'
      mov	byte[rax + 86],')'
      mov	byte[rax + 87],';'
      mov	byte[rax + 88],0
      mov	[rbp - 4232],rax
      mov	r10,[rbp - 4232]
      mov	r11,[lcs]
      add	r11,[rbp - 4224]
      mov	[r11],r10
      mov	r10,24
      add	r10,1
      mov	[rbp - 4256],r10
      mov	r10,[rbp - 4256]
      imul	r10,256
      mov	[rbp - 4256],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],'r'
      mov	byte[rax + 2],'i'
      mov	byte[rax + 3],'n'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'n'
      mov	byte[rax + 7],'('
      mov	byte[rax + 8],'c'
      mov	byte[rax + 9],'['
      mov	byte[rax + 10],'8'
      mov	byte[rax + 11],'1'
      mov	byte[rax + 12],']'
      mov	byte[rax + 13],'+'
      mov	byte[rax + 14],'c'
      mov	byte[rax + 15],'['
      mov	byte[rax + 16],'8'
      mov	byte[rax + 17],'2'
      mov	byte[rax + 18],']'
      mov	byte[rax + 19],'+'
      mov	byte[rax + 20],'c'
      mov	byte[rax + 21],'['
      mov	byte[rax + 22],'8'
      mov	byte[rax + 23],'0'
      mov	byte[rax + 24],']'
      mov	byte[rax + 25],'+'
      mov	byte[rax + 26],'c'
      mov	byte[rax + 27],'['
      mov	byte[rax + 28],'7'
      mov	byte[rax + 29],'1'
      mov	byte[rax + 30],']'
      mov	byte[rax + 31],'+'
      mov	byte[rax + 32],'c'
      mov	byte[rax + 33],'['
      mov	byte[rax + 34],'7'
      mov	byte[rax + 35],'6'
      mov	byte[rax + 36],']'
      mov	byte[rax + 37],'+'
      mov	byte[rax + 38],'c'
      mov	byte[rax + 39],'['
      mov	byte[rax + 40],'6'
      mov	byte[rax + 41],'9'
      mov	byte[rax + 42],']'
      mov	byte[rax + 43],'+'
      mov	byte[rax + 44],'c'
      mov	byte[rax + 45],'['
      mov	byte[rax + 46],'0'
      mov	byte[rax + 47],']'
      mov	byte[rax + 48],'+'
      mov	byte[rax + 49],'c'
      mov	byte[rax + 50],'['
      mov	byte[rax + 51],'6'
      mov	byte[rax + 52],'3'
      mov	byte[rax + 53],']'
      mov	byte[rax + 54],'+'
      mov	byte[rax + 55],'c'
      mov	byte[rax + 56],'['
      mov	byte[rax + 57],'1'
      mov	byte[rax + 58],'7'
      mov	byte[rax + 59],']'
      mov	byte[rax + 60],'+'
      mov	byte[rax + 61],'c'
      mov	byte[rax + 62],'['
      mov	byte[rax + 63],'7'
      mov	byte[rax + 64],'9'
      mov	byte[rax + 65],']'
      mov	byte[rax + 66],'+'
      mov	byte[rax + 67],'c'
      mov	byte[rax + 68],'['
      mov	byte[rax + 69],'2'
      mov	byte[rax + 70],'8'
      mov	byte[rax + 71],']'
      mov	byte[rax + 72],'+'
      mov	byte[rax + 73],'a'
      mov	byte[rax + 74],'2'
      mov	byte[rax + 75],'q'
      mov	byte[rax + 76],'+'
      mov	byte[rax + 77],'a'
      mov	byte[rax + 78],'2'
      mov	byte[rax + 79],'b'
      mov	byte[rax + 80],'+'
      mov	byte[rax + 81],'a'
      mov	byte[rax + 82],'2'
      mov	byte[rax + 83],'q'
      mov	byte[rax + 84],'+'
      mov	byte[rax + 85],'a'
      mov	byte[rax + 86],'2'
      mov	byte[rax + 87],'q'
      mov	byte[rax + 88],'+'
      mov	byte[rax + 89],'c'
      mov	byte[rax + 90],'['
      mov	byte[rax + 91],'2'
      mov	byte[rax + 92],'6'
      mov	byte[rax + 93],']'
      mov	byte[rax + 94],')'
      mov	byte[rax + 95],';'
      mov	byte[rax + 96],0
      mov	[rbp - 4264],rax
      mov	r10,[rbp - 4264]
      mov	r11,[lcs]
      add	r11,[rbp - 4256]
      mov	[r11],r10
      mov	r10,25
      add	r10,1
      mov	[rbp - 4288],r10
      mov	r10,[rbp - 4288]
      imul	r10,256
      mov	[rbp - 4288],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],'r'
      mov	byte[rax + 2],'i'
      mov	byte[rax + 3],'n'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'n'
      mov	byte[rax + 7],'('
      mov	byte[rax + 8],'c'
      mov	byte[rax + 9],'['
      mov	byte[rax + 10],'8'
      mov	byte[rax + 11],'1'
      mov	byte[rax + 12],']'
      mov	byte[rax + 13],'+'
      mov	byte[rax + 14],'c'
      mov	byte[rax + 15],'['
      mov	byte[rax + 16],'8'
      mov	byte[rax + 17],'2'
      mov	byte[rax + 18],']'
      mov	byte[rax + 19],'+'
      mov	byte[rax + 20],'c'
      mov	byte[rax + 21],'['
      mov	byte[rax + 22],'8'
      mov	byte[rax + 23],'0'
      mov	byte[rax + 24],']'
      mov	byte[rax + 25],'+'
      mov	byte[rax + 26],'c'
      mov	byte[rax + 27],'['
      mov	byte[rax + 28],'7'
      mov	byte[rax + 29],'1'
      mov	byte[rax + 30],']'
      mov	byte[rax + 31],'+'
      mov	byte[rax + 32],'c'
      mov	byte[rax + 33],'['
      mov	byte[rax + 34],'7'
      mov	byte[rax + 35],'6'
      mov	byte[rax + 36],']'
      mov	byte[rax + 37],'+'
      mov	byte[rax + 38],'c'
      mov	byte[rax + 39],'['
      mov	byte[rax + 40],'6'
      mov	byte[rax + 41],'9'
      mov	byte[rax + 42],']'
      mov	byte[rax + 43],'+'
      mov	byte[rax + 44],'c'
      mov	byte[rax + 45],'['
      mov	byte[rax + 46],'0'
      mov	byte[rax + 47],']'
      mov	byte[rax + 48],'+'
      mov	byte[rax + 49],'c'
      mov	byte[rax + 50],'['
      mov	byte[rax + 51],'6'
      mov	byte[rax + 52],'3'
      mov	byte[rax + 53],']'
      mov	byte[rax + 54],'+'
      mov	byte[rax + 55],'c'
      mov	byte[rax + 56],'['
      mov	byte[rax + 57],'1'
      mov	byte[rax + 58],'7'
      mov	byte[rax + 59],']'
      mov	byte[rax + 60],'+'
      mov	byte[rax + 61],'c'
      mov	byte[rax + 62],'['
      mov	byte[rax + 63],'6'
      mov	byte[rax + 64],'4'
      mov	byte[rax + 65],']'
      mov	byte[rax + 66],'+'
      mov	byte[rax + 67],'c'
      mov	byte[rax + 68],'['
      mov	byte[rax + 69],'2'
      mov	byte[rax + 70],'8'
      mov	byte[rax + 71],']'
      mov	byte[rax + 72],'+'
      mov	byte[rax + 73],'a'
      mov	byte[rax + 74],'2'
      mov	byte[rax + 75],'q'
      mov	byte[rax + 76],'+'
      mov	byte[rax + 77],'a'
      mov	byte[rax + 78],'2'
      mov	byte[rax + 79],'b'
      mov	byte[rax + 80],'+'
      mov	byte[rax + 81],'a'
      mov	byte[rax + 82],'2'
      mov	byte[rax + 83],'b'
      mov	byte[rax + 84],'+'
      mov	byte[rax + 85],'a'
      mov	byte[rax + 86],'2'
      mov	byte[rax + 87],'q'
      mov	byte[rax + 88],'+'
      mov	byte[rax + 89],'c'
      mov	byte[rax + 90],'['
      mov	byte[rax + 91],'2'
      mov	byte[rax + 92],'6'
      mov	byte[rax + 93],']'
      mov	byte[rax + 94],')'
      mov	byte[rax + 95],';'
      mov	byte[rax + 96],0
      mov	[rbp - 4296],rax
      mov	r10,[rbp - 4296]
      mov	r11,[lcs]
      add	r11,[rbp - 4288]
      mov	[r11],r10
      mov	r10,26
      add	r10,1
      mov	[rbp - 4320],r10
      mov	r10,[rbp - 4320]
      imul	r10,256
      mov	[rbp - 4320],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'p'
      mov	byte[rax + 1],'r'
      mov	byte[rax + 2],'i'
      mov	byte[rax + 3],'n'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'n'
      mov	byte[rax + 7],'('
      mov	byte[rax + 8],'s'
      mov	byte[rax + 9],'['
      mov	byte[rax + 10],'0'
      mov	byte[rax + 11],']'
      mov	byte[rax + 12],')'
      mov	byte[rax + 13],';'
      mov	byte[rax + 14],0
      mov	[rbp - 4328],rax
      mov	r10,[rbp - 4328]
      mov	r11,[lcs]
      add	r11,[rbp - 4320]
      mov	[r11],r10
      mov	r10,27
      add	r10,1
      mov	[rbp - 4352],r10
      mov	r10,[rbp - 4352]
      imul	r10,256
      mov	[rbp - 4352],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'f'
      mov	byte[rax + 1],'o'
      mov	byte[rax + 2],'r'
      mov	byte[rax + 3],'('
      mov	byte[rax + 4],'i'
      mov	byte[rax + 5],'='
      mov	byte[rax + 6],'0'
      mov	byte[rax + 7],';'
      mov	byte[rax + 8],'i'
      mov	byte[rax + 9],'<'
      mov	byte[rax + 10],'9'
      mov	byte[rax + 11],'3'
      mov	byte[rax + 12],';'
      mov	byte[rax + 13],'i'
      mov	byte[rax + 14],'+'
      mov	byte[rax + 15],'+'
      mov	byte[rax + 16],')'
      mov	byte[rax + 17],'p'
      mov	byte[rax + 18],'r'
      mov	byte[rax + 19],'i'
      mov	byte[rax + 20],'n'
      mov	byte[rax + 21],'t'
      mov	byte[rax + 22],'l'
      mov	byte[rax + 23],'n'
      mov	byte[rax + 24],'('
      mov	byte[rax + 25],'c'
      mov	byte[rax + 26],'2'
      mov	byte[rax + 27],'('
      mov	byte[rax + 28],'i'
      mov	byte[rax + 29],')'
      mov	byte[rax + 30],'+'
      mov	byte[rax + 31],'a'
      mov	byte[rax + 32],'2'
      mov	byte[rax + 33],'q'
      mov	byte[rax + 34],'+'
      mov	byte[rax + 35],'c'
      mov	byte[rax + 36],'['
      mov	byte[rax + 37],'i'
      mov	byte[rax + 38],']'
      mov	byte[rax + 39],'+'
      mov	byte[rax + 40],'a'
      mov	byte[rax + 41],'2'
      mov	byte[rax + 42],'q'
      mov	byte[rax + 43],'+'
      mov	byte[rax + 44],'c'
      mov	byte[rax + 45],'o'
      mov	byte[rax + 46],')'
      mov	byte[rax + 47],';'
      mov	byte[rax + 48],0
      mov	[rbp - 4360],rax
      mov	r10,[rbp - 4360]
      mov	r11,[lcs]
      add	r11,[rbp - 4352]
      mov	[r11],r10
      mov	r10,28
      add	r10,1
      mov	[rbp - 4384],r10
      mov	r10,[rbp - 4384]
      imul	r10,256
      mov	[rbp - 4384],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'f'
      mov	byte[rax + 1],'o'
      mov	byte[rax + 2],'r'
      mov	byte[rax + 3],'('
      mov	byte[rax + 4],'i'
      mov	byte[rax + 5],'='
      mov	byte[rax + 6],'0'
      mov	byte[rax + 7],';'
      mov	byte[rax + 8],'i'
      mov	byte[rax + 9],'<'
      mov	byte[rax + 10],'3'
      mov	byte[rax + 11],'2'
      mov	byte[rax + 12],';'
      mov	byte[rax + 13],'i'
      mov	byte[rax + 14],'+'
      mov	byte[rax + 15],'+'
      mov	byte[rax + 16],')'
      mov	byte[rax + 17],'p'
      mov	byte[rax + 18],'r'
      mov	byte[rax + 19],'i'
      mov	byte[rax + 20],'n'
      mov	byte[rax + 21],'t'
      mov	byte[rax + 22],'l'
      mov	byte[rax + 23],'n'
      mov	byte[rax + 24],'('
      mov	byte[rax + 25],'s'
      mov	byte[rax + 26],'2'
      mov	byte[rax + 27],'('
      mov	byte[rax + 28],'i'
      mov	byte[rax + 29],')'
      mov	byte[rax + 30],'+'
      mov	byte[rax + 31],'a'
      mov	byte[rax + 32],'2'
      mov	byte[rax + 33],'q'
      mov	byte[rax + 34],'+'
      mov	byte[rax + 35],'s'
      mov	byte[rax + 36],'['
      mov	byte[rax + 37],'i'
      mov	byte[rax + 38],']'
      mov	byte[rax + 39],'+'
      mov	byte[rax + 40],'a'
      mov	byte[rax + 41],'2'
      mov	byte[rax + 42],'q'
      mov	byte[rax + 43],'+'
      mov	byte[rax + 44],'c'
      mov	byte[rax + 45],'o'
      mov	byte[rax + 46],')'
      mov	byte[rax + 47],';'
      mov	byte[rax + 48],0
      mov	[rbp - 4392],rax
      mov	r10,[rbp - 4392]
      mov	r11,[lcs]
      add	r11,[rbp - 4384]
      mov	[r11],r10
      mov	r10,29
      add	r10,1
      mov	[rbp - 4416],r10
      mov	r10,[rbp - 4416]
      imul	r10,256
      mov	[rbp - 4416],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'f'
      mov	byte[rax + 1],'o'
      mov	byte[rax + 2],'r'
      mov	byte[rax + 3],'('
      mov	byte[rax + 4],'i'
      mov	byte[rax + 5],'='
      mov	byte[rax + 6],'1'
      mov	byte[rax + 7],';'
      mov	byte[rax + 8],'i'
      mov	byte[rax + 9],'<'
      mov	byte[rax + 10],'3'
      mov	byte[rax + 11],'2'
      mov	byte[rax + 12],';'
      mov	byte[rax + 13],'i'
      mov	byte[rax + 14],'+'
      mov	byte[rax + 15],'+'
      mov	byte[rax + 16],')'
      mov	byte[rax + 17],'p'
      mov	byte[rax + 18],'r'
      mov	byte[rax + 19],'i'
      mov	byte[rax + 20],'n'
      mov	byte[rax + 21],'t'
      mov	byte[rax + 22],'l'
      mov	byte[rax + 23],'n'
      mov	byte[rax + 24],'('
      mov	byte[rax + 25],'s'
      mov	byte[rax + 26],'['
      mov	byte[rax + 27],'i'
      mov	byte[rax + 28],']'
      mov	byte[rax + 29],')'
      mov	byte[rax + 30],';'
      mov	byte[rax + 31],0
      mov	[rbp - 4424],rax
      mov	r10,[rbp - 4424]
      mov	r11,[lcs]
      add	r11,[rbp - 4416]
      mov	[r11],r10
      mov	r10,30
      add	r10,1
      mov	[rbp - 4448],r10
      mov	r10,[rbp - 4448]
      imul	r10,256
      mov	[rbp - 4448],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'r'
      mov	byte[rax + 1],'e'
      mov	byte[rax + 2],'t'
      mov	byte[rax + 3],'u'
      mov	byte[rax + 4],'r'
      mov	byte[rax + 5],'n'
      mov	byte[rax + 6],' '
      mov	byte[rax + 7],'0'
      mov	byte[rax + 8],';'
      mov	byte[rax + 9],0
      mov	[rbp - 4456],rax
      mov	r10,[rbp - 4456]
      mov	r11,[lcs]
      add	r11,[rbp - 4448]
      mov	[r11],r10
      mov	r10,31
      add	r10,1
      mov	[rbp - 4480],r10
      mov	r10,[rbp - 4480]
      imul	r10,256
      mov	[rbp - 4480],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'}'
      mov	byte[rax + 1],0
      mov	[rbp - 4488],rax
      mov	r10,[rbp - 4488]
      mov	r11,[lcs]
      add	r11,[rbp - 4480]
      mov	[r11],r10
      mov	r10,81
      add	r10,1
      mov	[rbp - 4512],r10
      mov	r10,[rbp - 4512]
      imul	r10,256
      mov	[rbp - 4512],r10
      mov	r10,82
      add	r10,1
      mov	[rbp - 4536],r10
      mov	r10,[rbp - 4536]
      imul	r10,256
      mov	[rbp - 4536],r10
      mov	r10,[lcc]
      add	r10,[rbp - 4512]
      mov	rdi,[r10]
      mov	r10,[lcc]
      add	r10,[rbp - 4536]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  4544],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 4568],r10
      mov	r10,[rbp - 4568]
      imul	r10,256
      mov	[rbp - 4568],r10
      mov	rdi,[rbp-4544]
      mov	r10,[lcc]
      add	r10,[rbp - 4568]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  4576],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 4600],r10
      mov	r10,[rbp - 4600]
      imul	r10,256
      mov	[rbp - 4600],r10
      mov	rdi,[rbp-4576]
      mov	r10,[lcc]
      add	r10,[rbp - 4600]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  4608],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 4632],r10
      mov	r10,[rbp - 4632]
      imul	r10,256
      mov	[rbp - 4632],r10
      mov	rdi,[rbp-4608]
      mov	r10,[lcc]
      add	r10,[rbp - 4632]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  4640],rax
      mov	r10,69
      add	r10,1
      mov	[rbp - 4664],r10
      mov	r10,[rbp - 4664]
      imul	r10,256
      mov	[rbp - 4664],r10
      mov	rdi,[rbp-4640]
      mov	r10,[lcc]
      add	r10,[rbp - 4664]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  4672],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 4696],r10
      mov	r10,[rbp - 4696]
      imul	r10,256
      mov	[rbp - 4696],r10
      mov	rdi,[rbp-4672]
      mov	r10,[lcc]
      add	r10,[rbp - 4696]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  4704],rax
      mov	r10,66
      add	r10,1
      mov	[rbp - 4728],r10
      mov	r10,[rbp - 4728]
      imul	r10,256
      mov	[rbp - 4728],r10
      mov	rdi,[rbp-4704]
      mov	r10,[lcc]
      add	r10,[rbp - 4728]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  4736],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 4760],r10
      mov	r10,[rbp - 4760]
      imul	r10,256
      mov	[rbp - 4760],r10
      mov	rdi,[rbp-4736]
      mov	r10,[lcc]
      add	r10,[rbp - 4760]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  4768],rax
      mov	r10,69
      add	r10,1
      mov	[rbp - 4792],r10
      mov	r10,[rbp - 4792]
      imul	r10,256
      mov	[rbp - 4792],r10
      mov	rdi,[rbp-4768]
      mov	r10,[lcc]
      add	r10,[rbp - 4792]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  4800],rax
      mov	r10,82
      add	r10,1
      mov	[rbp - 4824],r10
      mov	r10,[rbp - 4824]
      imul	r10,256
      mov	[rbp - 4824],r10
      mov	rdi,[rbp-4800]
      mov	r10,[lcc]
      add	r10,[rbp - 4824]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  4832],rax
      mov	r10,7
      add	r10,1
      mov	[rbp - 4856],r10
      mov	r10,[rbp - 4856]
      imul	r10,256
      mov	[rbp - 4856],r10
      mov	rdi,[rbp-4832]
      mov	r10,[lcc]
      add	r10,[rbp - 4856]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  4864],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 4888],r10
      mov	r10,[rbp - 4888]
      imul	r10,256
      mov	[rbp - 4888],r10
      mov	rdi,[rbp-4864]
      mov	r10,[lcc]
      add	r10,[rbp - 4888]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  4896],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 4920],r10
      mov	r10,[rbp - 4920]
      imul	r10,256
      mov	[rbp - 4920],r10
      mov	rdi,[rbp-4896]
      mov	r10,[lcc]
      add	r10,[rbp - 4920]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  4928],rax
      mov	r10,82
      add	r10,1
      mov	[rbp - 4952],r10
      mov	r10,[rbp - 4952]
      imul	r10,256
      mov	[rbp - 4952],r10
      mov	rdi,[rbp-4928]
      mov	r10,[lcc]
      add	r10,[rbp - 4952]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  4960],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 4984],r10
      mov	r10,[rbp - 4984]
      imul	r10,256
      mov	[rbp - 4984],r10
      mov	rdi,[rbp-4960]
      mov	r10,[lcc]
      add	r10,[rbp - 4984]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  4992],rax
      mov	r10,86
      add	r10,1
      mov	[rbp - 5016],r10
      mov	r10,[rbp - 5016]
      imul	r10,256
      mov	[rbp - 5016],r10
      mov	rdi,[rbp-4992]
      mov	r10,[lcc]
      add	r10,[rbp - 5016]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5024],rax
      mov	r10,8
      add	r10,1
      mov	[rbp - 5048],r10
      mov	r10,[rbp - 5048]
      imul	r10,256
      mov	[rbp - 5048],r10
      mov	rdi,[rbp-5024]
      mov	r10,[lcc]
      add	r10,[rbp - 5048]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5056],rax
      mov	r10,89
      add	r10,1
      mov	[rbp - 5080],r10
      mov	r10,[rbp - 5080]
      imul	r10,256
      mov	[rbp - 5080],r10
      mov	rdi,[rbp-5056]
      mov	r10,[lcc]
      add	r10,[rbp - 5080]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5088],rax
      mov	rdi,[rbp-5088]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  5096],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 5120],r10
      mov	r10,[rbp - 5120]
      imul	r10,256
      mov	[rbp - 5120],r10
      mov	r10,68
      add	r10,1
      mov	[rbp - 5144],r10
      mov	r10,[rbp - 5144]
      imul	r10,256
      mov	[rbp - 5144],r10
      mov	r10,[lcc]
      add	r10,[rbp - 5120]
      mov	rdi,[r10]
      mov	r10,[lcc]
      add	r10,[rbp - 5144]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5152],rax
      mov	r10,7
      add	r10,1
      mov	[rbp - 5176],r10
      mov	r10,[rbp - 5176]
      imul	r10,256
      mov	[rbp - 5176],r10
      mov	rdi,[rbp-5152]
      mov	r10,[lcc]
      add	r10,[rbp - 5176]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5184],rax
      mov	r10,86
      add	r10,1
      mov	[rbp - 5208],r10
      mov	r10,[rbp - 5208]
      imul	r10,256
      mov	[rbp - 5208],r10
      mov	rdi,[rbp-5184]
      mov	r10,[lcc]
      add	r10,[rbp - 5208]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5216],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 5240],r10
      mov	r10,[rbp - 5240]
      imul	r10,256
      mov	[rbp - 5240],r10
      mov	rdi,[rbp-5216]
      mov	r10,[lcc]
      add	r10,[rbp - 5240]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5248],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 5272],r10
      mov	r10,[rbp - 5272]
      imul	r10,256
      mov	[rbp - 5272],r10
      mov	rdi,[rbp-5248]
      mov	r10,[lcc]
      add	r10,[rbp - 5272]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5280],rax
      mov	r10,15
      add	r10,1
      mov	[rbp - 5304],r10
      mov	r10,[rbp - 5304]
      imul	r10,256
      mov	[rbp - 5304],r10
      mov	rdi,[rbp-5280]
      mov	r10,[lcc]
      add	r10,[rbp - 5304]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5312],rax
      mov	r10,8
      add	r10,1
      mov	[rbp - 5336],r10
      mov	r10,[rbp - 5336]
      imul	r10,256
      mov	[rbp - 5336],r10
      mov	rdi,[rbp-5312]
      mov	r10,[lcc]
      add	r10,[rbp - 5336]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5344],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 5368],r10
      mov	r10,[rbp - 5368]
      imul	r10,256
      mov	[rbp - 5368],r10
      mov	rdi,[rbp-5344]
      mov	r10,[lcc]
      add	r10,[rbp - 5368]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5376],rax
      mov	r10,67
      add	r10,1
      mov	[rbp - 5400],r10
      mov	r10,[rbp - 5400]
      imul	r10,256
      mov	[rbp - 5400],r10
      mov	rdi,[rbp-5376]
      mov	r10,[lcc]
      add	r10,[rbp - 5400]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5408],rax
      mov	r10,82
      add	r10,1
      mov	[rbp - 5432],r10
      mov	r10,[rbp - 5432]
      imul	r10,256
      mov	[rbp - 5432],r10
      mov	rdi,[rbp-5408]
      mov	r10,[lcc]
      add	r10,[rbp - 5432]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5440],rax
      mov	r10,83
      add	r10,1
      mov	[rbp - 5464],r10
      mov	r10,[rbp - 5464]
      imul	r10,256
      mov	[rbp - 5464],r10
      mov	rdi,[rbp-5440]
      mov	r10,[lcc]
      add	r10,[rbp - 5464]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5472],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 5496],r10
      mov	r10,[rbp - 5496]
      imul	r10,256
      mov	[rbp - 5496],r10
      mov	rdi,[rbp-5472]
      mov	r10,[lcc]
      add	r10,[rbp - 5496]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5504],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 5528],r10
      mov	r10,[rbp - 5528]
      imul	r10,256
      mov	[rbp - 5528],r10
      mov	rdi,[rbp-5504]
      mov	r10,[lcc]
      add	r10,[rbp - 5528]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5536],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 5560],r10
      mov	r10,[rbp - 5560]
      imul	r10,256
      mov	[rbp - 5560],r10
      mov	rdi,[rbp-5536]
      mov	r10,[lcc]
      add	r10,[rbp - 5560]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5568],rax
      mov	rdi,[rbp-5568]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5576],rax
      mov	r10,15
      add	r10,1
      mov	[rbp - 5600],r10
      mov	r10,[rbp - 5600]
      imul	r10,256
      mov	[rbp - 5600],r10
      mov	rdi,[rbp-5576]
      mov	r10,[lcc]
      add	r10,[rbp - 5600]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5608],rax
      mov	rdi,[rbp-5608]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5616],rax
      mov	r10,26
      add	r10,1
      mov	[rbp - 5640],r10
      mov	r10,[rbp - 5640]
      imul	r10,256
      mov	[rbp - 5640],r10
      mov	rdi,[rbp-5616]
      mov	r10,[lcc]
      add	r10,[rbp - 5640]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5648],rax
      mov	rdi,[rbp-5648]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  5656],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 5680],r10
      mov	r10,[rbp - 5680]
      imul	r10,256
      mov	[rbp - 5680],r10
      mov	r10,68
      add	r10,1
      mov	[rbp - 5704],r10
      mov	r10,[rbp - 5704]
      imul	r10,256
      mov	[rbp - 5704],r10
      mov	r10,[lcc]
      add	r10,[rbp - 5680]
      mov	rdi,[r10]
      mov	r10,[lcc]
      add	r10,[rbp - 5704]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5712],rax
      mov	r10,7
      add	r10,1
      mov	[rbp - 5736],r10
      mov	r10,[rbp - 5736]
      imul	r10,256
      mov	[rbp - 5736],r10
      mov	rdi,[rbp-5712]
      mov	r10,[lcc]
      add	r10,[rbp - 5736]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5744],rax
      mov	r10,86
      add	r10,1
      mov	[rbp - 5768],r10
      mov	r10,[rbp - 5768]
      imul	r10,256
      mov	[rbp - 5768],r10
      mov	rdi,[rbp-5744]
      mov	r10,[lcc]
      add	r10,[rbp - 5768]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5776],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 5800],r10
      mov	r10,[rbp - 5800]
      imul	r10,256
      mov	[rbp - 5800],r10
      mov	rdi,[rbp-5776]
      mov	r10,[lcc]
      add	r10,[rbp - 5800]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5808],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 5832],r10
      mov	r10,[rbp - 5832]
      imul	r10,256
      mov	[rbp - 5832],r10
      mov	rdi,[rbp-5808]
      mov	r10,[lcc]
      add	r10,[rbp - 5832]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5840],rax
      mov	r10,16
      add	r10,1
      mov	[rbp - 5864],r10
      mov	r10,[rbp - 5864]
      imul	r10,256
      mov	[rbp - 5864],r10
      mov	rdi,[rbp-5840]
      mov	r10,[lcc]
      add	r10,[rbp - 5864]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5872],rax
      mov	r10,8
      add	r10,1
      mov	[rbp - 5896],r10
      mov	r10,[rbp - 5896]
      imul	r10,256
      mov	[rbp - 5896],r10
      mov	rdi,[rbp-5872]
      mov	r10,[lcc]
      add	r10,[rbp - 5896]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5904],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 5928],r10
      mov	r10,[rbp - 5928]
      imul	r10,256
      mov	[rbp - 5928],r10
      mov	rdi,[rbp-5904]
      mov	r10,[lcc]
      add	r10,[rbp - 5928]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5936],rax
      mov	r10,67
      add	r10,1
      mov	[rbp - 5960],r10
      mov	r10,[rbp - 5960]
      imul	r10,256
      mov	[rbp - 5960],r10
      mov	rdi,[rbp-5936]
      mov	r10,[lcc]
      add	r10,[rbp - 5960]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  5968],rax
      mov	r10,82
      add	r10,1
      mov	[rbp - 5992],r10
      mov	r10,[rbp - 5992]
      imul	r10,256
      mov	[rbp - 5992],r10
      mov	rdi,[rbp-5968]
      mov	r10,[lcc]
      add	r10,[rbp - 5992]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6000],rax
      mov	r10,83
      add	r10,1
      mov	[rbp - 6024],r10
      mov	r10,[rbp - 6024]
      imul	r10,256
      mov	[rbp - 6024],r10
      mov	rdi,[rbp-6000]
      mov	r10,[lcc]
      add	r10,[rbp - 6024]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6032],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 6056],r10
      mov	r10,[rbp - 6056]
      imul	r10,256
      mov	[rbp - 6056],r10
      mov	rdi,[rbp-6032]
      mov	r10,[lcc]
      add	r10,[rbp - 6056]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6064],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 6088],r10
      mov	r10,[rbp - 6088]
      imul	r10,256
      mov	[rbp - 6088],r10
      mov	rdi,[rbp-6064]
      mov	r10,[lcc]
      add	r10,[rbp - 6088]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6096],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 6120],r10
      mov	r10,[rbp - 6120]
      imul	r10,256
      mov	[rbp - 6120],r10
      mov	rdi,[rbp-6096]
      mov	r10,[lcc]
      add	r10,[rbp - 6120]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6128],rax
      mov	rdi,[rbp-6128]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6136],rax
      mov	r10,16
      add	r10,1
      mov	[rbp - 6160],r10
      mov	r10,[rbp - 6160]
      imul	r10,256
      mov	[rbp - 6160],r10
      mov	rdi,[rbp-6136]
      mov	r10,[lcc]
      add	r10,[rbp - 6160]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6168],rax
      mov	rdi,[rbp-6168]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6176],rax
      mov	r10,26
      add	r10,1
      mov	[rbp - 6200],r10
      mov	r10,[rbp - 6200]
      imul	r10,256
      mov	[rbp - 6200],r10
      mov	rdi,[rbp-6176]
      mov	r10,[lcc]
      add	r10,[rbp - 6200]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6208],rax
      mov	rdi,[rbp-6208]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  6216],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 6240],r10
      mov	r10,[rbp - 6240]
      imul	r10,256
      mov	[rbp - 6240],r10
      mov	r10,68
      add	r10,1
      mov	[rbp - 6264],r10
      mov	r10,[rbp - 6264]
      imul	r10,256
      mov	[rbp - 6264],r10
      mov	r10,[lcc]
      add	r10,[rbp - 6240]
      mov	rdi,[r10]
      mov	r10,[lcc]
      add	r10,[rbp - 6264]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6272],rax
      mov	r10,7
      add	r10,1
      mov	[rbp - 6296],r10
      mov	r10,[rbp - 6296]
      imul	r10,256
      mov	[rbp - 6296],r10
      mov	rdi,[rbp-6272]
      mov	r10,[lcc]
      add	r10,[rbp - 6296]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6304],rax
      mov	r10,86
      add	r10,1
      mov	[rbp - 6328],r10
      mov	r10,[rbp - 6328]
      imul	r10,256
      mov	[rbp - 6328],r10
      mov	rdi,[rbp-6304]
      mov	r10,[lcc]
      add	r10,[rbp - 6328]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6336],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 6360],r10
      mov	r10,[rbp - 6360]
      imul	r10,256
      mov	[rbp - 6360],r10
      mov	rdi,[rbp-6336]
      mov	r10,[lcc]
      add	r10,[rbp - 6360]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6368],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 6392],r10
      mov	r10,[rbp - 6392]
      imul	r10,256
      mov	[rbp - 6392],r10
      mov	rdi,[rbp-6368]
      mov	r10,[lcc]
      add	r10,[rbp - 6392]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6400],rax
      mov	r10,17
      add	r10,1
      mov	[rbp - 6424],r10
      mov	r10,[rbp - 6424]
      imul	r10,256
      mov	[rbp - 6424],r10
      mov	rdi,[rbp-6400]
      mov	r10,[lcc]
      add	r10,[rbp - 6424]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6432],rax
      mov	r10,8
      add	r10,1
      mov	[rbp - 6456],r10
      mov	r10,[rbp - 6456]
      imul	r10,256
      mov	[rbp - 6456],r10
      mov	rdi,[rbp-6432]
      mov	r10,[lcc]
      add	r10,[rbp - 6456]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6464],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 6488],r10
      mov	r10,[rbp - 6488]
      imul	r10,256
      mov	[rbp - 6488],r10
      mov	rdi,[rbp-6464]
      mov	r10,[lcc]
      add	r10,[rbp - 6488]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6496],rax
      mov	r10,67
      add	r10,1
      mov	[rbp - 6520],r10
      mov	r10,[rbp - 6520]
      imul	r10,256
      mov	[rbp - 6520],r10
      mov	rdi,[rbp-6496]
      mov	r10,[lcc]
      add	r10,[rbp - 6520]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6528],rax
      mov	r10,82
      add	r10,1
      mov	[rbp - 6552],r10
      mov	r10,[rbp - 6552]
      imul	r10,256
      mov	[rbp - 6552],r10
      mov	rdi,[rbp-6528]
      mov	r10,[lcc]
      add	r10,[rbp - 6552]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6560],rax
      mov	r10,83
      add	r10,1
      mov	[rbp - 6584],r10
      mov	r10,[rbp - 6584]
      imul	r10,256
      mov	[rbp - 6584],r10
      mov	rdi,[rbp-6560]
      mov	r10,[lcc]
      add	r10,[rbp - 6584]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6592],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 6616],r10
      mov	r10,[rbp - 6616]
      imul	r10,256
      mov	[rbp - 6616],r10
      mov	rdi,[rbp-6592]
      mov	r10,[lcc]
      add	r10,[rbp - 6616]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6624],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 6648],r10
      mov	r10,[rbp - 6648]
      imul	r10,256
      mov	[rbp - 6648],r10
      mov	rdi,[rbp-6624]
      mov	r10,[lcc]
      add	r10,[rbp - 6648]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6656],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 6680],r10
      mov	r10,[rbp - 6680]
      imul	r10,256
      mov	[rbp - 6680],r10
      mov	rdi,[rbp-6656]
      mov	r10,[lcc]
      add	r10,[rbp - 6680]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6688],rax
      mov	rdi,[rbp-6688]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6696],rax
      mov	r10,17
      add	r10,1
      mov	[rbp - 6720],r10
      mov	r10,[rbp - 6720]
      imul	r10,256
      mov	[rbp - 6720],r10
      mov	rdi,[rbp-6696]
      mov	r10,[lcc]
      add	r10,[rbp - 6720]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6728],rax
      mov	rdi,[rbp-6728]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6736],rax
      mov	r10,26
      add	r10,1
      mov	[rbp - 6760],r10
      mov	r10,[rbp - 6760]
      imul	r10,256
      mov	[rbp - 6760],r10
      mov	rdi,[rbp-6736]
      mov	r10,[lcc]
      add	r10,[rbp - 6760]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6768],rax
      mov	rdi,[rbp-6768]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  6776],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 6800],r10
      mov	r10,[rbp - 6800]
      imul	r10,256
      mov	[rbp - 6800],r10
      mov	r10,68
      add	r10,1
      mov	[rbp - 6824],r10
      mov	r10,[rbp - 6824]
      imul	r10,256
      mov	[rbp - 6824],r10
      mov	r10,[lcc]
      add	r10,[rbp - 6800]
      mov	rdi,[r10]
      mov	r10,[lcc]
      add	r10,[rbp - 6824]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6832],rax
      mov	r10,7
      add	r10,1
      mov	[rbp - 6856],r10
      mov	r10,[rbp - 6856]
      imul	r10,256
      mov	[rbp - 6856],r10
      mov	rdi,[rbp-6832]
      mov	r10,[lcc]
      add	r10,[rbp - 6856]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6864],rax
      mov	r10,86
      add	r10,1
      mov	[rbp - 6888],r10
      mov	r10,[rbp - 6888]
      imul	r10,256
      mov	[rbp - 6888],r10
      mov	rdi,[rbp-6864]
      mov	r10,[lcc]
      add	r10,[rbp - 6888]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6896],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 6920],r10
      mov	r10,[rbp - 6920]
      imul	r10,256
      mov	[rbp - 6920],r10
      mov	rdi,[rbp-6896]
      mov	r10,[lcc]
      add	r10,[rbp - 6920]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6928],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 6952],r10
      mov	r10,[rbp - 6952]
      imul	r10,256
      mov	[rbp - 6952],r10
      mov	rdi,[rbp-6928]
      mov	r10,[lcc]
      add	r10,[rbp - 6952]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6960],rax
      mov	r10,18
      add	r10,1
      mov	[rbp - 6984],r10
      mov	r10,[rbp - 6984]
      imul	r10,256
      mov	[rbp - 6984],r10
      mov	rdi,[rbp-6960]
      mov	r10,[lcc]
      add	r10,[rbp - 6984]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  6992],rax
      mov	r10,8
      add	r10,1
      mov	[rbp - 7016],r10
      mov	r10,[rbp - 7016]
      imul	r10,256
      mov	[rbp - 7016],r10
      mov	rdi,[rbp-6992]
      mov	r10,[lcc]
      add	r10,[rbp - 7016]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7024],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 7048],r10
      mov	r10,[rbp - 7048]
      imul	r10,256
      mov	[rbp - 7048],r10
      mov	rdi,[rbp-7024]
      mov	r10,[lcc]
      add	r10,[rbp - 7048]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7056],rax
      mov	r10,67
      add	r10,1
      mov	[rbp - 7080],r10
      mov	r10,[rbp - 7080]
      imul	r10,256
      mov	[rbp - 7080],r10
      mov	rdi,[rbp-7056]
      mov	r10,[lcc]
      add	r10,[rbp - 7080]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7088],rax
      mov	r10,82
      add	r10,1
      mov	[rbp - 7112],r10
      mov	r10,[rbp - 7112]
      imul	r10,256
      mov	[rbp - 7112],r10
      mov	rdi,[rbp-7088]
      mov	r10,[lcc]
      add	r10,[rbp - 7112]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7120],rax
      mov	r10,83
      add	r10,1
      mov	[rbp - 7144],r10
      mov	r10,[rbp - 7144]
      imul	r10,256
      mov	[rbp - 7144],r10
      mov	rdi,[rbp-7120]
      mov	r10,[lcc]
      add	r10,[rbp - 7144]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7152],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 7176],r10
      mov	r10,[rbp - 7176]
      imul	r10,256
      mov	[rbp - 7176],r10
      mov	rdi,[rbp-7152]
      mov	r10,[lcc]
      add	r10,[rbp - 7176]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7184],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 7208],r10
      mov	r10,[rbp - 7208]
      imul	r10,256
      mov	[rbp - 7208],r10
      mov	rdi,[rbp-7184]
      mov	r10,[lcc]
      add	r10,[rbp - 7208]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7216],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 7240],r10
      mov	r10,[rbp - 7240]
      imul	r10,256
      mov	[rbp - 7240],r10
      mov	rdi,[rbp-7216]
      mov	r10,[lcc]
      add	r10,[rbp - 7240]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7248],rax
      mov	rdi,[rbp-7248]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7256],rax
      mov	r10,18
      add	r10,1
      mov	[rbp - 7280],r10
      mov	r10,[rbp - 7280]
      imul	r10,256
      mov	[rbp - 7280],r10
      mov	rdi,[rbp-7256]
      mov	r10,[lcc]
      add	r10,[rbp - 7280]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7288],rax
      mov	rdi,[rbp-7288]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7296],rax
      mov	r10,26
      add	r10,1
      mov	[rbp - 7320],r10
      mov	r10,[rbp - 7320]
      imul	r10,256
      mov	[rbp - 7320],r10
      mov	rdi,[rbp-7296]
      mov	r10,[lcc]
      add	r10,[rbp - 7320]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7328],rax
      mov	rdi,[rbp-7328]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  7336],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 7360],r10
      mov	r10,[rbp - 7360]
      imul	r10,256
      mov	[rbp - 7360],r10
      mov	r10,68
      add	r10,1
      mov	[rbp - 7384],r10
      mov	r10,[rbp - 7384]
      imul	r10,256
      mov	[rbp - 7384],r10
      mov	r10,[lcc]
      add	r10,[rbp - 7360]
      mov	rdi,[r10]
      mov	r10,[lcc]
      add	r10,[rbp - 7384]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7392],rax
      mov	r10,7
      add	r10,1
      mov	[rbp - 7416],r10
      mov	r10,[rbp - 7416]
      imul	r10,256
      mov	[rbp - 7416],r10
      mov	rdi,[rbp-7392]
      mov	r10,[lcc]
      add	r10,[rbp - 7416]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7424],rax
      mov	r10,86
      add	r10,1
      mov	[rbp - 7448],r10
      mov	r10,[rbp - 7448]
      imul	r10,256
      mov	[rbp - 7448],r10
      mov	rdi,[rbp-7424]
      mov	r10,[lcc]
      add	r10,[rbp - 7448]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7456],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 7480],r10
      mov	r10,[rbp - 7480]
      imul	r10,256
      mov	[rbp - 7480],r10
      mov	rdi,[rbp-7456]
      mov	r10,[lcc]
      add	r10,[rbp - 7480]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7488],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 7512],r10
      mov	r10,[rbp - 7512]
      imul	r10,256
      mov	[rbp - 7512],r10
      mov	rdi,[rbp-7488]
      mov	r10,[lcc]
      add	r10,[rbp - 7512]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7520],rax
      mov	r10,19
      add	r10,1
      mov	[rbp - 7544],r10
      mov	r10,[rbp - 7544]
      imul	r10,256
      mov	[rbp - 7544],r10
      mov	rdi,[rbp-7520]
      mov	r10,[lcc]
      add	r10,[rbp - 7544]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7552],rax
      mov	r10,8
      add	r10,1
      mov	[rbp - 7576],r10
      mov	r10,[rbp - 7576]
      imul	r10,256
      mov	[rbp - 7576],r10
      mov	rdi,[rbp-7552]
      mov	r10,[lcc]
      add	r10,[rbp - 7576]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7584],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 7608],r10
      mov	r10,[rbp - 7608]
      imul	r10,256
      mov	[rbp - 7608],r10
      mov	rdi,[rbp-7584]
      mov	r10,[lcc]
      add	r10,[rbp - 7608]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7616],rax
      mov	r10,67
      add	r10,1
      mov	[rbp - 7640],r10
      mov	r10,[rbp - 7640]
      imul	r10,256
      mov	[rbp - 7640],r10
      mov	rdi,[rbp-7616]
      mov	r10,[lcc]
      add	r10,[rbp - 7640]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7648],rax
      mov	r10,82
      add	r10,1
      mov	[rbp - 7672],r10
      mov	r10,[rbp - 7672]
      imul	r10,256
      mov	[rbp - 7672],r10
      mov	rdi,[rbp-7648]
      mov	r10,[lcc]
      add	r10,[rbp - 7672]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7680],rax
      mov	r10,83
      add	r10,1
      mov	[rbp - 7704],r10
      mov	r10,[rbp - 7704]
      imul	r10,256
      mov	[rbp - 7704],r10
      mov	rdi,[rbp-7680]
      mov	r10,[lcc]
      add	r10,[rbp - 7704]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7712],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 7736],r10
      mov	r10,[rbp - 7736]
      imul	r10,256
      mov	[rbp - 7736],r10
      mov	rdi,[rbp-7712]
      mov	r10,[lcc]
      add	r10,[rbp - 7736]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7744],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 7768],r10
      mov	r10,[rbp - 7768]
      imul	r10,256
      mov	[rbp - 7768],r10
      mov	rdi,[rbp-7744]
      mov	r10,[lcc]
      add	r10,[rbp - 7768]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7776],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 7800],r10
      mov	r10,[rbp - 7800]
      imul	r10,256
      mov	[rbp - 7800],r10
      mov	rdi,[rbp-7776]
      mov	r10,[lcc]
      add	r10,[rbp - 7800]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7808],rax
      mov	rdi,[rbp-7808]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7816],rax
      mov	r10,19
      add	r10,1
      mov	[rbp - 7840],r10
      mov	r10,[rbp - 7840]
      imul	r10,256
      mov	[rbp - 7840],r10
      mov	rdi,[rbp-7816]
      mov	r10,[lcc]
      add	r10,[rbp - 7840]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7848],rax
      mov	rdi,[rbp-7848]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7856],rax
      mov	r10,26
      add	r10,1
      mov	[rbp - 7880],r10
      mov	r10,[rbp - 7880]
      imul	r10,256
      mov	[rbp - 7880],r10
      mov	rdi,[rbp-7856]
      mov	r10,[lcc]
      add	r10,[rbp - 7880]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7888],rax
      mov	rdi,[rbp-7888]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  7896],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 7920],r10
      mov	r10,[rbp - 7920]
      imul	r10,256
      mov	[rbp - 7920],r10
      mov	r10,68
      add	r10,1
      mov	[rbp - 7944],r10
      mov	r10,[rbp - 7944]
      imul	r10,256
      mov	[rbp - 7944],r10
      mov	r10,[lcc]
      add	r10,[rbp - 7920]
      mov	rdi,[r10]
      mov	r10,[lcc]
      add	r10,[rbp - 7944]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7952],rax
      mov	r10,7
      add	r10,1
      mov	[rbp - 7976],r10
      mov	r10,[rbp - 7976]
      imul	r10,256
      mov	[rbp - 7976],r10
      mov	rdi,[rbp-7952]
      mov	r10,[lcc]
      add	r10,[rbp - 7976]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  7984],rax
      mov	r10,86
      add	r10,1
      mov	[rbp - 8008],r10
      mov	r10,[rbp - 8008]
      imul	r10,256
      mov	[rbp - 8008],r10
      mov	rdi,[rbp-7984]
      mov	r10,[lcc]
      add	r10,[rbp - 8008]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8016],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 8040],r10
      mov	r10,[rbp - 8040]
      imul	r10,256
      mov	[rbp - 8040],r10
      mov	rdi,[rbp-8016]
      mov	r10,[lcc]
      add	r10,[rbp - 8040]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8048],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 8072],r10
      mov	r10,[rbp - 8072]
      imul	r10,256
      mov	[rbp - 8072],r10
      mov	rdi,[rbp-8048]
      mov	r10,[lcc]
      add	r10,[rbp - 8072]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8080],rax
      mov	r10,20
      add	r10,1
      mov	[rbp - 8104],r10
      mov	r10,[rbp - 8104]
      imul	r10,256
      mov	[rbp - 8104],r10
      mov	rdi,[rbp-8080]
      mov	r10,[lcc]
      add	r10,[rbp - 8104]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8112],rax
      mov	r10,8
      add	r10,1
      mov	[rbp - 8136],r10
      mov	r10,[rbp - 8136]
      imul	r10,256
      mov	[rbp - 8136],r10
      mov	rdi,[rbp-8112]
      mov	r10,[lcc]
      add	r10,[rbp - 8136]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8144],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 8168],r10
      mov	r10,[rbp - 8168]
      imul	r10,256
      mov	[rbp - 8168],r10
      mov	rdi,[rbp-8144]
      mov	r10,[lcc]
      add	r10,[rbp - 8168]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8176],rax
      mov	r10,67
      add	r10,1
      mov	[rbp - 8200],r10
      mov	r10,[rbp - 8200]
      imul	r10,256
      mov	[rbp - 8200],r10
      mov	rdi,[rbp-8176]
      mov	r10,[lcc]
      add	r10,[rbp - 8200]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8208],rax
      mov	r10,82
      add	r10,1
      mov	[rbp - 8232],r10
      mov	r10,[rbp - 8232]
      imul	r10,256
      mov	[rbp - 8232],r10
      mov	rdi,[rbp-8208]
      mov	r10,[lcc]
      add	r10,[rbp - 8232]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8240],rax
      mov	r10,83
      add	r10,1
      mov	[rbp - 8264],r10
      mov	r10,[rbp - 8264]
      imul	r10,256
      mov	[rbp - 8264],r10
      mov	rdi,[rbp-8240]
      mov	r10,[lcc]
      add	r10,[rbp - 8264]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8272],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 8296],r10
      mov	r10,[rbp - 8296]
      imul	r10,256
      mov	[rbp - 8296],r10
      mov	rdi,[rbp-8272]
      mov	r10,[lcc]
      add	r10,[rbp - 8296]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8304],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 8328],r10
      mov	r10,[rbp - 8328]
      imul	r10,256
      mov	[rbp - 8328],r10
      mov	rdi,[rbp-8304]
      mov	r10,[lcc]
      add	r10,[rbp - 8328]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8336],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 8360],r10
      mov	r10,[rbp - 8360]
      imul	r10,256
      mov	[rbp - 8360],r10
      mov	rdi,[rbp-8336]
      mov	r10,[lcc]
      add	r10,[rbp - 8360]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8368],rax
      mov	rdi,[rbp-8368]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8376],rax
      mov	r10,20
      add	r10,1
      mov	[rbp - 8400],r10
      mov	r10,[rbp - 8400]
      imul	r10,256
      mov	[rbp - 8400],r10
      mov	rdi,[rbp-8376]
      mov	r10,[lcc]
      add	r10,[rbp - 8400]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8408],rax
      mov	rdi,[rbp-8408]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8416],rax
      mov	r10,26
      add	r10,1
      mov	[rbp - 8440],r10
      mov	r10,[rbp - 8440]
      imul	r10,256
      mov	[rbp - 8440],r10
      mov	rdi,[rbp-8416]
      mov	r10,[lcc]
      add	r10,[rbp - 8440]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8448],rax
      mov	rdi,[rbp-8448]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  8456],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 8480],r10
      mov	r10,[rbp - 8480]
      imul	r10,256
      mov	[rbp - 8480],r10
      mov	r10,68
      add	r10,1
      mov	[rbp - 8504],r10
      mov	r10,[rbp - 8504]
      imul	r10,256
      mov	[rbp - 8504],r10
      mov	r10,[lcc]
      add	r10,[rbp - 8480]
      mov	rdi,[r10]
      mov	r10,[lcc]
      add	r10,[rbp - 8504]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8512],rax
      mov	r10,7
      add	r10,1
      mov	[rbp - 8536],r10
      mov	r10,[rbp - 8536]
      imul	r10,256
      mov	[rbp - 8536],r10
      mov	rdi,[rbp-8512]
      mov	r10,[lcc]
      add	r10,[rbp - 8536]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8544],rax
      mov	r10,86
      add	r10,1
      mov	[rbp - 8568],r10
      mov	r10,[rbp - 8568]
      imul	r10,256
      mov	[rbp - 8568],r10
      mov	rdi,[rbp-8544]
      mov	r10,[lcc]
      add	r10,[rbp - 8568]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8576],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 8600],r10
      mov	r10,[rbp - 8600]
      imul	r10,256
      mov	[rbp - 8600],r10
      mov	rdi,[rbp-8576]
      mov	r10,[lcc]
      add	r10,[rbp - 8600]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8608],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 8632],r10
      mov	r10,[rbp - 8632]
      imul	r10,256
      mov	[rbp - 8632],r10
      mov	rdi,[rbp-8608]
      mov	r10,[lcc]
      add	r10,[rbp - 8632]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8640],rax
      mov	r10,21
      add	r10,1
      mov	[rbp - 8664],r10
      mov	r10,[rbp - 8664]
      imul	r10,256
      mov	[rbp - 8664],r10
      mov	rdi,[rbp-8640]
      mov	r10,[lcc]
      add	r10,[rbp - 8664]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8672],rax
      mov	r10,8
      add	r10,1
      mov	[rbp - 8696],r10
      mov	r10,[rbp - 8696]
      imul	r10,256
      mov	[rbp - 8696],r10
      mov	rdi,[rbp-8672]
      mov	r10,[lcc]
      add	r10,[rbp - 8696]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8704],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 8728],r10
      mov	r10,[rbp - 8728]
      imul	r10,256
      mov	[rbp - 8728],r10
      mov	rdi,[rbp-8704]
      mov	r10,[lcc]
      add	r10,[rbp - 8728]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8736],rax
      mov	r10,67
      add	r10,1
      mov	[rbp - 8760],r10
      mov	r10,[rbp - 8760]
      imul	r10,256
      mov	[rbp - 8760],r10
      mov	rdi,[rbp-8736]
      mov	r10,[lcc]
      add	r10,[rbp - 8760]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8768],rax
      mov	r10,82
      add	r10,1
      mov	[rbp - 8792],r10
      mov	r10,[rbp - 8792]
      imul	r10,256
      mov	[rbp - 8792],r10
      mov	rdi,[rbp-8768]
      mov	r10,[lcc]
      add	r10,[rbp - 8792]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8800],rax
      mov	r10,83
      add	r10,1
      mov	[rbp - 8824],r10
      mov	r10,[rbp - 8824]
      imul	r10,256
      mov	[rbp - 8824],r10
      mov	rdi,[rbp-8800]
      mov	r10,[lcc]
      add	r10,[rbp - 8824]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8832],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 8856],r10
      mov	r10,[rbp - 8856]
      imul	r10,256
      mov	[rbp - 8856],r10
      mov	rdi,[rbp-8832]
      mov	r10,[lcc]
      add	r10,[rbp - 8856]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8864],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 8888],r10
      mov	r10,[rbp - 8888]
      imul	r10,256
      mov	[rbp - 8888],r10
      mov	rdi,[rbp-8864]
      mov	r10,[lcc]
      add	r10,[rbp - 8888]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8896],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 8920],r10
      mov	r10,[rbp - 8920]
      imul	r10,256
      mov	[rbp - 8920],r10
      mov	rdi,[rbp-8896]
      mov	r10,[lcc]
      add	r10,[rbp - 8920]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8928],rax
      mov	rdi,[rbp-8928]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8936],rax
      mov	r10,21
      add	r10,1
      mov	[rbp - 8960],r10
      mov	r10,[rbp - 8960]
      imul	r10,256
      mov	[rbp - 8960],r10
      mov	rdi,[rbp-8936]
      mov	r10,[lcc]
      add	r10,[rbp - 8960]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8968],rax
      mov	rdi,[rbp-8968]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  8976],rax
      mov	r10,26
      add	r10,1
      mov	[rbp - 9000],r10
      mov	r10,[rbp - 9000]
      imul	r10,256
      mov	[rbp - 9000],r10
      mov	rdi,[rbp-8976]
      mov	r10,[lcc]
      add	r10,[rbp - 9000]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9008],rax
      mov	rdi,[rbp-9008]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  9016],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 9040],r10
      mov	r10,[rbp - 9040]
      imul	r10,256
      mov	[rbp - 9040],r10
      mov	r10,68
      add	r10,1
      mov	[rbp - 9064],r10
      mov	r10,[rbp - 9064]
      imul	r10,256
      mov	[rbp - 9064],r10
      mov	r10,[lcc]
      add	r10,[rbp - 9040]
      mov	rdi,[r10]
      mov	r10,[lcc]
      add	r10,[rbp - 9064]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9072],rax
      mov	r10,7
      add	r10,1
      mov	[rbp - 9096],r10
      mov	r10,[rbp - 9096]
      imul	r10,256
      mov	[rbp - 9096],r10
      mov	rdi,[rbp-9072]
      mov	r10,[lcc]
      add	r10,[rbp - 9096]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9104],rax
      mov	r10,86
      add	r10,1
      mov	[rbp - 9128],r10
      mov	r10,[rbp - 9128]
      imul	r10,256
      mov	[rbp - 9128],r10
      mov	rdi,[rbp-9104]
      mov	r10,[lcc]
      add	r10,[rbp - 9128]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9136],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 9160],r10
      mov	r10,[rbp - 9160]
      imul	r10,256
      mov	[rbp - 9160],r10
      mov	rdi,[rbp-9136]
      mov	r10,[lcc]
      add	r10,[rbp - 9160]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9168],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 9192],r10
      mov	r10,[rbp - 9192]
      imul	r10,256
      mov	[rbp - 9192],r10
      mov	rdi,[rbp-9168]
      mov	r10,[lcc]
      add	r10,[rbp - 9192]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9200],rax
      mov	r10,22
      add	r10,1
      mov	[rbp - 9224],r10
      mov	r10,[rbp - 9224]
      imul	r10,256
      mov	[rbp - 9224],r10
      mov	rdi,[rbp-9200]
      mov	r10,[lcc]
      add	r10,[rbp - 9224]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9232],rax
      mov	r10,8
      add	r10,1
      mov	[rbp - 9256],r10
      mov	r10,[rbp - 9256]
      imul	r10,256
      mov	[rbp - 9256],r10
      mov	rdi,[rbp-9232]
      mov	r10,[lcc]
      add	r10,[rbp - 9256]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9264],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 9288],r10
      mov	r10,[rbp - 9288]
      imul	r10,256
      mov	[rbp - 9288],r10
      mov	rdi,[rbp-9264]
      mov	r10,[lcc]
      add	r10,[rbp - 9288]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9296],rax
      mov	r10,67
      add	r10,1
      mov	[rbp - 9320],r10
      mov	r10,[rbp - 9320]
      imul	r10,256
      mov	[rbp - 9320],r10
      mov	rdi,[rbp-9296]
      mov	r10,[lcc]
      add	r10,[rbp - 9320]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9328],rax
      mov	r10,82
      add	r10,1
      mov	[rbp - 9352],r10
      mov	r10,[rbp - 9352]
      imul	r10,256
      mov	[rbp - 9352],r10
      mov	rdi,[rbp-9328]
      mov	r10,[lcc]
      add	r10,[rbp - 9352]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9360],rax
      mov	r10,83
      add	r10,1
      mov	[rbp - 9384],r10
      mov	r10,[rbp - 9384]
      imul	r10,256
      mov	[rbp - 9384],r10
      mov	rdi,[rbp-9360]
      mov	r10,[lcc]
      add	r10,[rbp - 9384]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9392],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 9416],r10
      mov	r10,[rbp - 9416]
      imul	r10,256
      mov	[rbp - 9416],r10
      mov	rdi,[rbp-9392]
      mov	r10,[lcc]
      add	r10,[rbp - 9416]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9424],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 9448],r10
      mov	r10,[rbp - 9448]
      imul	r10,256
      mov	[rbp - 9448],r10
      mov	rdi,[rbp-9424]
      mov	r10,[lcc]
      add	r10,[rbp - 9448]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9456],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 9480],r10
      mov	r10,[rbp - 9480]
      imul	r10,256
      mov	[rbp - 9480],r10
      mov	rdi,[rbp-9456]
      mov	r10,[lcc]
      add	r10,[rbp - 9480]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9488],rax
      mov	rdi,[rbp-9488]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9496],rax
      mov	r10,22
      add	r10,1
      mov	[rbp - 9520],r10
      mov	r10,[rbp - 9520]
      imul	r10,256
      mov	[rbp - 9520],r10
      mov	rdi,[rbp-9496]
      mov	r10,[lcc]
      add	r10,[rbp - 9520]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9528],rax
      mov	rdi,[rbp-9528]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9536],rax
      mov	r10,26
      add	r10,1
      mov	[rbp - 9560],r10
      mov	r10,[rbp - 9560]
      imul	r10,256
      mov	[rbp - 9560],r10
      mov	rdi,[rbp-9536]
      mov	r10,[lcc]
      add	r10,[rbp - 9560]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9568],rax
      mov	rdi,[rbp-9568]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  9576],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 9600],r10
      mov	r10,[rbp - 9600]
      imul	r10,256
      mov	[rbp - 9600],r10
      mov	r10,68
      add	r10,1
      mov	[rbp - 9624],r10
      mov	r10,[rbp - 9624]
      imul	r10,256
      mov	[rbp - 9624],r10
      mov	r10,[lcc]
      add	r10,[rbp - 9600]
      mov	rdi,[r10]
      mov	r10,[lcc]
      add	r10,[rbp - 9624]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9632],rax
      mov	r10,7
      add	r10,1
      mov	[rbp - 9656],r10
      mov	r10,[rbp - 9656]
      imul	r10,256
      mov	[rbp - 9656],r10
      mov	rdi,[rbp-9632]
      mov	r10,[lcc]
      add	r10,[rbp - 9656]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9664],rax
      mov	r10,86
      add	r10,1
      mov	[rbp - 9688],r10
      mov	r10,[rbp - 9688]
      imul	r10,256
      mov	[rbp - 9688],r10
      mov	rdi,[rbp-9664]
      mov	r10,[lcc]
      add	r10,[rbp - 9688]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9696],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 9720],r10
      mov	r10,[rbp - 9720]
      imul	r10,256
      mov	[rbp - 9720],r10
      mov	rdi,[rbp-9696]
      mov	r10,[lcc]
      add	r10,[rbp - 9720]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9728],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 9752],r10
      mov	r10,[rbp - 9752]
      imul	r10,256
      mov	[rbp - 9752],r10
      mov	rdi,[rbp-9728]
      mov	r10,[lcc]
      add	r10,[rbp - 9752]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9760],rax
      mov	r10,23
      add	r10,1
      mov	[rbp - 9784],r10
      mov	r10,[rbp - 9784]
      imul	r10,256
      mov	[rbp - 9784],r10
      mov	rdi,[rbp-9760]
      mov	r10,[lcc]
      add	r10,[rbp - 9784]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9792],rax
      mov	r10,8
      add	r10,1
      mov	[rbp - 9816],r10
      mov	r10,[rbp - 9816]
      imul	r10,256
      mov	[rbp - 9816],r10
      mov	rdi,[rbp-9792]
      mov	r10,[lcc]
      add	r10,[rbp - 9816]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9824],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 9848],r10
      mov	r10,[rbp - 9848]
      imul	r10,256
      mov	[rbp - 9848],r10
      mov	rdi,[rbp-9824]
      mov	r10,[lcc]
      add	r10,[rbp - 9848]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9856],rax
      mov	r10,67
      add	r10,1
      mov	[rbp - 9880],r10
      mov	r10,[rbp - 9880]
      imul	r10,256
      mov	[rbp - 9880],r10
      mov	rdi,[rbp-9856]
      mov	r10,[lcc]
      add	r10,[rbp - 9880]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9888],rax
      mov	r10,82
      add	r10,1
      mov	[rbp - 9912],r10
      mov	r10,[rbp - 9912]
      imul	r10,256
      mov	[rbp - 9912],r10
      mov	rdi,[rbp-9888]
      mov	r10,[lcc]
      add	r10,[rbp - 9912]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9920],rax
      mov	r10,83
      add	r10,1
      mov	[rbp - 9944],r10
      mov	r10,[rbp - 9944]
      imul	r10,256
      mov	[rbp - 9944],r10
      mov	rdi,[rbp-9920]
      mov	r10,[lcc]
      add	r10,[rbp - 9944]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9952],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 9976],r10
      mov	r10,[rbp - 9976]
      imul	r10,256
      mov	[rbp - 9976],r10
      mov	rdi,[rbp-9952]
      mov	r10,[lcc]
      add	r10,[rbp - 9976]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  9984],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 10008],r10
      mov	r10,[rbp - 10008]
      imul	r10,256
      mov	[rbp - 10008],r10
      mov	rdi,[rbp-9984]
      mov	r10,[lcc]
      add	r10,[rbp - 10008]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10016],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 10040],r10
      mov	r10,[rbp - 10040]
      imul	r10,256
      mov	[rbp - 10040],r10
      mov	rdi,[rbp-10016]
      mov	r10,[lcc]
      add	r10,[rbp - 10040]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10048],rax
      mov	rdi,[rbp-10048]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10056],rax
      mov	r10,23
      add	r10,1
      mov	[rbp - 10080],r10
      mov	r10,[rbp - 10080]
      imul	r10,256
      mov	[rbp - 10080],r10
      mov	rdi,[rbp-10056]
      mov	r10,[lcc]
      add	r10,[rbp - 10080]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10088],rax
      mov	rdi,[rbp-10088]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10096],rax
      mov	r10,26
      add	r10,1
      mov	[rbp - 10120],r10
      mov	r10,[rbp - 10120]
      imul	r10,256
      mov	[rbp - 10120],r10
      mov	rdi,[rbp-10096]
      mov	r10,[lcc]
      add	r10,[rbp - 10120]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10128],rax
      mov	rdi,[rbp-10128]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  10136],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 10160],r10
      mov	r10,[rbp - 10160]
      imul	r10,256
      mov	[rbp - 10160],r10
      mov	r10,68
      add	r10,1
      mov	[rbp - 10184],r10
      mov	r10,[rbp - 10184]
      imul	r10,256
      mov	[rbp - 10184],r10
      mov	r10,[lcc]
      add	r10,[rbp - 10160]
      mov	rdi,[r10]
      mov	r10,[lcc]
      add	r10,[rbp - 10184]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10192],rax
      mov	r10,7
      add	r10,1
      mov	[rbp - 10216],r10
      mov	r10,[rbp - 10216]
      imul	r10,256
      mov	[rbp - 10216],r10
      mov	rdi,[rbp-10192]
      mov	r10,[lcc]
      add	r10,[rbp - 10216]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10224],rax
      mov	r10,86
      add	r10,1
      mov	[rbp - 10248],r10
      mov	r10,[rbp - 10248]
      imul	r10,256
      mov	[rbp - 10248],r10
      mov	rdi,[rbp-10224]
      mov	r10,[lcc]
      add	r10,[rbp - 10248]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10256],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 10280],r10
      mov	r10,[rbp - 10280]
      imul	r10,256
      mov	[rbp - 10280],r10
      mov	rdi,[rbp-10256]
      mov	r10,[lcc]
      add	r10,[rbp - 10280]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10288],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 10312],r10
      mov	r10,[rbp - 10312]
      imul	r10,256
      mov	[rbp - 10312],r10
      mov	rdi,[rbp-10288]
      mov	r10,[lcc]
      add	r10,[rbp - 10312]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10320],rax
      mov	r10,24
      add	r10,1
      mov	[rbp - 10344],r10
      mov	r10,[rbp - 10344]
      imul	r10,256
      mov	[rbp - 10344],r10
      mov	rdi,[rbp-10320]
      mov	r10,[lcc]
      add	r10,[rbp - 10344]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10352],rax
      mov	r10,8
      add	r10,1
      mov	[rbp - 10376],r10
      mov	r10,[rbp - 10376]
      imul	r10,256
      mov	[rbp - 10376],r10
      mov	rdi,[rbp-10352]
      mov	r10,[lcc]
      add	r10,[rbp - 10376]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10384],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 10408],r10
      mov	r10,[rbp - 10408]
      imul	r10,256
      mov	[rbp - 10408],r10
      mov	rdi,[rbp-10384]
      mov	r10,[lcc]
      add	r10,[rbp - 10408]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10416],rax
      mov	r10,67
      add	r10,1
      mov	[rbp - 10440],r10
      mov	r10,[rbp - 10440]
      imul	r10,256
      mov	[rbp - 10440],r10
      mov	rdi,[rbp-10416]
      mov	r10,[lcc]
      add	r10,[rbp - 10440]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10448],rax
      mov	r10,82
      add	r10,1
      mov	[rbp - 10472],r10
      mov	r10,[rbp - 10472]
      imul	r10,256
      mov	[rbp - 10472],r10
      mov	rdi,[rbp-10448]
      mov	r10,[lcc]
      add	r10,[rbp - 10472]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10480],rax
      mov	r10,83
      add	r10,1
      mov	[rbp - 10504],r10
      mov	r10,[rbp - 10504]
      imul	r10,256
      mov	[rbp - 10504],r10
      mov	rdi,[rbp-10480]
      mov	r10,[lcc]
      add	r10,[rbp - 10504]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10512],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 10536],r10
      mov	r10,[rbp - 10536]
      imul	r10,256
      mov	[rbp - 10536],r10
      mov	rdi,[rbp-10512]
      mov	r10,[lcc]
      add	r10,[rbp - 10536]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10544],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 10568],r10
      mov	r10,[rbp - 10568]
      imul	r10,256
      mov	[rbp - 10568],r10
      mov	rdi,[rbp-10544]
      mov	r10,[lcc]
      add	r10,[rbp - 10568]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10576],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 10600],r10
      mov	r10,[rbp - 10600]
      imul	r10,256
      mov	[rbp - 10600],r10
      mov	rdi,[rbp-10576]
      mov	r10,[lcc]
      add	r10,[rbp - 10600]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10608],rax
      mov	rdi,[rbp-10608]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10616],rax
      mov	r10,24
      add	r10,1
      mov	[rbp - 10640],r10
      mov	r10,[rbp - 10640]
      imul	r10,256
      mov	[rbp - 10640],r10
      mov	rdi,[rbp-10616]
      mov	r10,[lcc]
      add	r10,[rbp - 10640]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10648],rax
      mov	rdi,[rbp-10648]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10656],rax
      mov	r10,26
      add	r10,1
      mov	[rbp - 10680],r10
      mov	r10,[rbp - 10680]
      imul	r10,256
      mov	[rbp - 10680],r10
      mov	rdi,[rbp-10656]
      mov	r10,[lcc]
      add	r10,[rbp - 10680]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10688],rax
      mov	rdi,[rbp-10688]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  10696],rax
      mov	r10,91
      add	r10,1
      mov	[rbp - 10720],r10
      mov	r10,[rbp - 10720]
      imul	r10,256
      mov	[rbp - 10720],r10
      mov	r10,[lcc]
      add	r10,[rbp - 10720]
      mov	rdi,[r10]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  10728],rax
      mov	r10,81
      add	r10,1
      mov	[rbp - 10752],r10
      mov	r10,[rbp - 10752]
      imul	r10,256
      mov	[rbp - 10752],r10
      mov	r10,82
      add	r10,1
      mov	[rbp - 10776],r10
      mov	r10,[rbp - 10776]
      imul	r10,256
      mov	[rbp - 10776],r10
      mov	r10,[lcc]
      add	r10,[rbp - 10752]
      mov	rdi,[r10]
      mov	r10,[lcc]
      add	r10,[rbp - 10776]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10784],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 10808],r10
      mov	r10,[rbp - 10808]
      imul	r10,256
      mov	[rbp - 10808],r10
      mov	rdi,[rbp-10784]
      mov	r10,[lcc]
      add	r10,[rbp - 10808]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10816],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 10840],r10
      mov	r10,[rbp - 10840]
      imul	r10,256
      mov	[rbp - 10840],r10
      mov	rdi,[rbp-10816]
      mov	r10,[lcc]
      add	r10,[rbp - 10840]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10848],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 10872],r10
      mov	r10,[rbp - 10872]
      imul	r10,256
      mov	[rbp - 10872],r10
      mov	rdi,[rbp-10848]
      mov	r10,[lcc]
      add	r10,[rbp - 10872]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10880],rax
      mov	r10,69
      add	r10,1
      mov	[rbp - 10904],r10
      mov	r10,[rbp - 10904]
      imul	r10,256
      mov	[rbp - 10904],r10
      mov	rdi,[rbp-10880]
      mov	r10,[lcc]
      add	r10,[rbp - 10904]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10912],rax
      mov	r10,58
      add	r10,1
      mov	[rbp - 10936],r10
      mov	r10,[rbp - 10936]
      imul	r10,256
      mov	[rbp - 10936],r10
      mov	rdi,[rbp-10912]
      mov	r10,[lcc]
      add	r10,[rbp - 10936]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10944],rax
      mov	r10,59
      add	r10,1
      mov	[rbp - 10968],r10
      mov	r10,[rbp - 10968]
      imul	r10,256
      mov	[rbp - 10968],r10
      mov	rdi,[rbp-10944]
      mov	r10,[lcc]
      add	r10,[rbp - 10968]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  10976],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 11000],r10
      mov	r10,[rbp - 11000]
      imul	r10,256
      mov	[rbp - 11000],r10
      mov	rdi,[rbp-10976]
      mov	r10,[lcc]
      add	r10,[rbp - 11000]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11008],rax
      mov	r10,81
      add	r10,1
      mov	[rbp - 11032],r10
      mov	r10,[rbp - 11032]
      imul	r10,256
      mov	[rbp - 11032],r10
      mov	rdi,[rbp-11008]
      mov	r10,[lcc]
      add	r10,[rbp - 11032]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11040],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 11064],r10
      mov	r10,[rbp - 11064]
      imul	r10,256
      mov	[rbp - 11064],r10
      mov	rdi,[rbp-11040]
      mov	r10,[lcc]
      add	r10,[rbp - 11064]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11072],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 11096],r10
      mov	r10,[rbp - 11096]
      imul	r10,256
      mov	[rbp - 11096],r10
      mov	rdi,[rbp-11072]
      mov	r10,[lcc]
      add	r10,[rbp - 11096]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11104],rax
      mov	r10,67
      add	r10,1
      mov	[rbp - 11128],r10
      mov	r10,[rbp - 11128]
      imul	r10,256
      mov	[rbp - 11128],r10
      mov	rdi,[rbp-11104]
      mov	r10,[lcc]
      add	r10,[rbp - 11128]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11136],rax
      mov	r10,85
      add	r10,1
      mov	[rbp - 11160],r10
      mov	r10,[rbp - 11160]
      imul	r10,256
      mov	[rbp - 11160],r10
      mov	rdi,[rbp-11136]
      mov	r10,[lcc]
      add	r10,[rbp - 11160]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11168],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 11192],r10
      mov	r10,[rbp - 11192]
      imul	r10,256
      mov	[rbp - 11192],r10
      mov	rdi,[rbp-11168]
      mov	r10,[lcc]
      add	r10,[rbp - 11192]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11200],rax
      mov	r10,81
      add	r10,1
      mov	[rbp - 11224],r10
      mov	r10,[rbp - 11224]
      imul	r10,256
      mov	[rbp - 11224],r10
      mov	rdi,[rbp-11200]
      mov	r10,[lcc]
      add	r10,[rbp - 11224]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11232],rax
      mov	r10,82
      add	r10,1
      mov	[rbp - 11256],r10
      mov	r10,[rbp - 11256]
      imul	r10,256
      mov	[rbp - 11256],r10
      mov	rdi,[rbp-11232]
      mov	r10,[lcc]
      add	r10,[rbp - 11256]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11264],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 11288],r10
      mov	r10,[rbp - 11288]
      imul	r10,256
      mov	[rbp - 11288],r10
      mov	rdi,[rbp-11264]
      mov	r10,[lcc]
      add	r10,[rbp - 11288]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11296],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 11320],r10
      mov	r10,[rbp - 11320]
      imul	r10,256
      mov	[rbp - 11320],r10
      mov	rdi,[rbp-11296]
      mov	r10,[lcc]
      add	r10,[rbp - 11320]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11328],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 11352],r10
      mov	r10,[rbp - 11352]
      imul	r10,256
      mov	[rbp - 11352],r10
      mov	rdi,[rbp-11328]
      mov	r10,[lcc]
      add	r10,[rbp - 11352]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11360],rax
      mov	r10,69
      add	r10,1
      mov	[rbp - 11384],r10
      mov	r10,[rbp - 11384]
      imul	r10,256
      mov	[rbp - 11384],r10
      mov	rdi,[rbp-11360]
      mov	r10,[lcc]
      add	r10,[rbp - 11384]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11392],rax
      mov	r10,58
      add	r10,1
      mov	[rbp - 11416],r10
      mov	r10,[rbp - 11416]
      imul	r10,256
      mov	[rbp - 11416],r10
      mov	rdi,[rbp-11392]
      mov	r10,[lcc]
      add	r10,[rbp - 11416]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11424],rax
      mov	r10,17
      add	r10,1
      mov	[rbp - 11448],r10
      mov	r10,[rbp - 11448]
      imul	r10,256
      mov	[rbp - 11448],r10
      mov	rdi,[rbp-11424]
      mov	r10,[lcc]
      add	r10,[rbp - 11448]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11456],rax
      mov	r10,20
      add	r10,1
      mov	[rbp - 11480],r10
      mov	r10,[rbp - 11480]
      imul	r10,256
      mov	[rbp - 11480],r10
      mov	rdi,[rbp-11456]
      mov	r10,[lcc]
      add	r10,[rbp - 11480]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11488],rax
      mov	r10,21
      add	r10,1
      mov	[rbp - 11512],r10
      mov	r10,[rbp - 11512]
      imul	r10,256
      mov	[rbp - 11512],r10
      mov	rdi,[rbp-11488]
      mov	r10,[lcc]
      add	r10,[rbp - 11512]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11520],rax
      mov	r10,59
      add	r10,1
      mov	[rbp - 11544],r10
      mov	r10,[rbp - 11544]
      imul	r10,256
      mov	[rbp - 11544],r10
      mov	rdi,[rbp-11520]
      mov	r10,[lcc]
      add	r10,[rbp - 11544]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11552],rax
      mov	r10,26
      add	r10,1
      mov	[rbp - 11576],r10
      mov	r10,[rbp - 11576]
      imul	r10,256
      mov	[rbp - 11576],r10
      mov	rdi,[rbp-11552]
      mov	r10,[lcc]
      add	r10,[rbp - 11576]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11584],rax
      mov	rdi,[rbp-11584]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  11592],rax
      mov	r10,81
      add	r10,1
      mov	[rbp - 11616],r10
      mov	r10,[rbp - 11616]
      imul	r10,256
      mov	[rbp - 11616],r10
      mov	r10,82
      add	r10,1
      mov	[rbp - 11640],r10
      mov	r10,[rbp - 11640]
      imul	r10,256
      mov	[rbp - 11640],r10
      mov	r10,[lcc]
      add	r10,[rbp - 11616]
      mov	rdi,[r10]
      mov	r10,[lcc]
      add	r10,[rbp - 11640]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11648],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 11672],r10
      mov	r10,[rbp - 11672]
      imul	r10,256
      mov	[rbp - 11672],r10
      mov	rdi,[rbp-11648]
      mov	r10,[lcc]
      add	r10,[rbp - 11672]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11680],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 11704],r10
      mov	r10,[rbp - 11704]
      imul	r10,256
      mov	[rbp - 11704],r10
      mov	rdi,[rbp-11680]
      mov	r10,[lcc]
      add	r10,[rbp - 11704]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11712],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 11736],r10
      mov	r10,[rbp - 11736]
      imul	r10,256
      mov	[rbp - 11736],r10
      mov	rdi,[rbp-11712]
      mov	r10,[lcc]
      add	r10,[rbp - 11736]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11744],rax
      mov	r10,69
      add	r10,1
      mov	[rbp - 11768],r10
      mov	r10,[rbp - 11768]
      imul	r10,256
      mov	[rbp - 11768],r10
      mov	rdi,[rbp-11744]
      mov	r10,[lcc]
      add	r10,[rbp - 11768]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11776],rax
      mov	r10,58
      add	r10,1
      mov	[rbp - 11800],r10
      mov	r10,[rbp - 11800]
      imul	r10,256
      mov	[rbp - 11800],r10
      mov	rdi,[rbp-11776]
      mov	r10,[lcc]
      add	r10,[rbp - 11800]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11808],rax
      mov	r10,59
      add	r10,1
      mov	[rbp - 11832],r10
      mov	r10,[rbp - 11832]
      imul	r10,256
      mov	[rbp - 11832],r10
      mov	rdi,[rbp-11808]
      mov	r10,[lcc]
      add	r10,[rbp - 11832]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11840],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 11864],r10
      mov	r10,[rbp - 11864]
      imul	r10,256
      mov	[rbp - 11864],r10
      mov	rdi,[rbp-11840]
      mov	r10,[lcc]
      add	r10,[rbp - 11864]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11872],rax
      mov	r10,65
      add	r10,1
      mov	[rbp - 11896],r10
      mov	r10,[rbp - 11896]
      imul	r10,256
      mov	[rbp - 11896],r10
      mov	rdi,[rbp-11872]
      mov	r10,[lcc]
      add	r10,[rbp - 11896]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11904],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 11928],r10
      mov	r10,[rbp - 11928]
      imul	r10,256
      mov	[rbp - 11928],r10
      mov	rdi,[rbp-11904]
      mov	r10,[lcc]
      add	r10,[rbp - 11928]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11936],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 11960],r10
      mov	r10,[rbp - 11960]
      imul	r10,256
      mov	[rbp - 11960],r10
      mov	rdi,[rbp-11936]
      mov	r10,[lcc]
      add	r10,[rbp - 11960]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  11968],rax
      mov	r10,67
      add	r10,1
      mov	[rbp - 11992],r10
      mov	r10,[rbp - 11992]
      imul	r10,256
      mov	[rbp - 11992],r10
      mov	rdi,[rbp-11968]
      mov	r10,[lcc]
      add	r10,[rbp - 11992]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12000],rax
      mov	r10,85
      add	r10,1
      mov	[rbp - 12024],r10
      mov	r10,[rbp - 12024]
      imul	r10,256
      mov	[rbp - 12024],r10
      mov	rdi,[rbp-12000]
      mov	r10,[lcc]
      add	r10,[rbp - 12024]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12032],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 12056],r10
      mov	r10,[rbp - 12056]
      imul	r10,256
      mov	[rbp - 12056],r10
      mov	rdi,[rbp-12032]
      mov	r10,[lcc]
      add	r10,[rbp - 12056]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12064],rax
      mov	r10,81
      add	r10,1
      mov	[rbp - 12088],r10
      mov	r10,[rbp - 12088]
      imul	r10,256
      mov	[rbp - 12088],r10
      mov	rdi,[rbp-12064]
      mov	r10,[lcc]
      add	r10,[rbp - 12088]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12096],rax
      mov	r10,82
      add	r10,1
      mov	[rbp - 12120],r10
      mov	r10,[rbp - 12120]
      imul	r10,256
      mov	[rbp - 12120],r10
      mov	rdi,[rbp-12096]
      mov	r10,[lcc]
      add	r10,[rbp - 12120]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12128],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 12152],r10
      mov	r10,[rbp - 12152]
      imul	r10,256
      mov	[rbp - 12152],r10
      mov	rdi,[rbp-12128]
      mov	r10,[lcc]
      add	r10,[rbp - 12152]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12160],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 12184],r10
      mov	r10,[rbp - 12184]
      imul	r10,256
      mov	[rbp - 12184],r10
      mov	rdi,[rbp-12160]
      mov	r10,[lcc]
      add	r10,[rbp - 12184]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12192],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 12216],r10
      mov	r10,[rbp - 12216]
      imul	r10,256
      mov	[rbp - 12216],r10
      mov	rdi,[rbp-12192]
      mov	r10,[lcc]
      add	r10,[rbp - 12216]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12224],rax
      mov	r10,69
      add	r10,1
      mov	[rbp - 12248],r10
      mov	r10,[rbp - 12248]
      imul	r10,256
      mov	[rbp - 12248],r10
      mov	rdi,[rbp-12224]
      mov	r10,[lcc]
      add	r10,[rbp - 12248]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12256],rax
      mov	r10,58
      add	r10,1
      mov	[rbp - 12280],r10
      mov	r10,[rbp - 12280]
      imul	r10,256
      mov	[rbp - 12280],r10
      mov	rdi,[rbp-12256]
      mov	r10,[lcc]
      add	r10,[rbp - 12280]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12288],rax
      mov	r10,17
      add	r10,1
      mov	[rbp - 12312],r10
      mov	r10,[rbp - 12312]
      imul	r10,256
      mov	[rbp - 12312],r10
      mov	rdi,[rbp-12288]
      mov	r10,[lcc]
      add	r10,[rbp - 12312]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12320],rax
      mov	r10,20
      add	r10,1
      mov	[rbp - 12344],r10
      mov	r10,[rbp - 12344]
      imul	r10,256
      mov	[rbp - 12344],r10
      mov	rdi,[rbp-12320]
      mov	r10,[lcc]
      add	r10,[rbp - 12344]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12352],rax
      mov	r10,21
      add	r10,1
      mov	[rbp - 12376],r10
      mov	r10,[rbp - 12376]
      imul	r10,256
      mov	[rbp - 12376],r10
      mov	rdi,[rbp-12352]
      mov	r10,[lcc]
      add	r10,[rbp - 12376]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12384],rax
      mov	r10,59
      add	r10,1
      mov	[rbp - 12408],r10
      mov	r10,[rbp - 12408]
      imul	r10,256
      mov	[rbp - 12408],r10
      mov	rdi,[rbp-12384]
      mov	r10,[lcc]
      add	r10,[rbp - 12408]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12416],rax
      mov	r10,26
      add	r10,1
      mov	[rbp - 12440],r10
      mov	r10,[rbp - 12440]
      imul	r10,256
      mov	[rbp - 12440],r10
      mov	rdi,[rbp-12416]
      mov	r10,[lcc]
      add	r10,[rbp - 12440]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12448],rax
      mov	rdi,[rbp-12448]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  12456],rax
      mov	r10,81
      add	r10,1
      mov	[rbp - 12480],r10
      mov	r10,[rbp - 12480]
      imul	r10,256
      mov	[rbp - 12480],r10
      mov	r10,82
      add	r10,1
      mov	[rbp - 12504],r10
      mov	r10,[rbp - 12504]
      imul	r10,256
      mov	[rbp - 12504],r10
      mov	r10,[lcc]
      add	r10,[rbp - 12480]
      mov	rdi,[r10]
      mov	r10,[lcc]
      add	r10,[rbp - 12504]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12512],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 12536],r10
      mov	r10,[rbp - 12536]
      imul	r10,256
      mov	[rbp - 12536],r10
      mov	rdi,[rbp-12512]
      mov	r10,[lcc]
      add	r10,[rbp - 12536]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12544],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 12568],r10
      mov	r10,[rbp - 12568]
      imul	r10,256
      mov	[rbp - 12568],r10
      mov	rdi,[rbp-12544]
      mov	r10,[lcc]
      add	r10,[rbp - 12568]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12576],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 12600],r10
      mov	r10,[rbp - 12600]
      imul	r10,256
      mov	[rbp - 12600],r10
      mov	rdi,[rbp-12576]
      mov	r10,[lcc]
      add	r10,[rbp - 12600]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12608],rax
      mov	r10,69
      add	r10,1
      mov	[rbp - 12632],r10
      mov	r10,[rbp - 12632]
      imul	r10,256
      mov	[rbp - 12632],r10
      mov	rdi,[rbp-12608]
      mov	r10,[lcc]
      add	r10,[rbp - 12632]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12640],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 12664],r10
      mov	r10,[rbp - 12664]
      imul	r10,256
      mov	[rbp - 12664],r10
      mov	rdi,[rbp-12640]
      mov	r10,[lcc]
      add	r10,[rbp - 12664]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12672],rax
      mov	r10,81
      add	r10,1
      mov	[rbp - 12696],r10
      mov	r10,[rbp - 12696]
      imul	r10,256
      mov	[rbp - 12696],r10
      mov	rdi,[rbp-12672]
      mov	r10,[lcc]
      add	r10,[rbp - 12696]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12704],rax
      mov	r10,17
      add	r10,1
      mov	[rbp - 12728],r10
      mov	r10,[rbp - 12728]
      imul	r10,256
      mov	[rbp - 12728],r10
      mov	rdi,[rbp-12704]
      mov	r10,[lcc]
      add	r10,[rbp - 12728]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12736],rax
      mov	r10,7
      add	r10,1
      mov	[rbp - 12760],r10
      mov	r10,[rbp - 12760]
      imul	r10,256
      mov	[rbp - 12760],r10
      mov	rdi,[rbp-12736]
      mov	r10,[lcc]
      add	r10,[rbp - 12760]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12768],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 12792],r10
      mov	r10,[rbp - 12792]
      imul	r10,256
      mov	[rbp - 12792],r10
      mov	rdi,[rbp-12768]
      mov	r10,[lcc]
      add	r10,[rbp - 12792]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12800],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 12824],r10
      mov	r10,[rbp - 12824]
      imul	r10,256
      mov	[rbp - 12824],r10
      mov	rdi,[rbp-12800]
      mov	r10,[lcc]
      add	r10,[rbp - 12824]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12832],rax
      mov	r10,82
      add	r10,1
      mov	[rbp - 12856],r10
      mov	r10,[rbp - 12856]
      imul	r10,256
      mov	[rbp - 12856],r10
      mov	rdi,[rbp-12832]
      mov	r10,[lcc]
      add	r10,[rbp - 12856]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12864],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 12888],r10
      mov	r10,[rbp - 12888]
      imul	r10,256
      mov	[rbp - 12888],r10
      mov	rdi,[rbp-12864]
      mov	r10,[lcc]
      add	r10,[rbp - 12888]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12896],rax
      mov	r10,81
      add	r10,1
      mov	[rbp - 12920],r10
      mov	r10,[rbp - 12920]
      imul	r10,256
      mov	[rbp - 12920],r10
      mov	rdi,[rbp-12896]
      mov	r10,[lcc]
      add	r10,[rbp - 12920]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12928],rax
      mov	r10,81
      add	r10,1
      mov	[rbp - 12952],r10
      mov	r10,[rbp - 12952]
      imul	r10,256
      mov	[rbp - 12952],r10
      mov	rdi,[rbp-12928]
      mov	r10,[lcc]
      add	r10,[rbp - 12952]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12960],rax
      mov	r10,8
      add	r10,1
      mov	[rbp - 12984],r10
      mov	r10,[rbp - 12984]
      imul	r10,256
      mov	[rbp - 12984],r10
      mov	rdi,[rbp-12960]
      mov	r10,[lcc]
      add	r10,[rbp - 12984]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  12992],rax
      mov	r10,89
      add	r10,1
      mov	[rbp - 13016],r10
      mov	r10,[rbp - 13016]
      imul	r10,256
      mov	[rbp - 13016],r10
      mov	rdi,[rbp-12992]
      mov	r10,[lcc]
      add	r10,[rbp - 13016]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13024],rax
      mov	rdi,[rbp-13024]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  13032],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 13056],r10
      mov	r10,[rbp - 13056]
      imul	r10,256
      mov	[rbp - 13056],r10
      mov	r10,68
      add	r10,1
      mov	[rbp - 13080],r10
      mov	r10,[rbp - 13080]
      imul	r10,256
      mov	[rbp - 13080],r10
      mov	r10,[lcc]
      add	r10,[rbp - 13056]
      mov	rdi,[r10]
      mov	r10,[lcc]
      add	r10,[rbp - 13080]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13088],rax
      mov	r10,7
      add	r10,1
      mov	[rbp - 13112],r10
      mov	r10,[rbp - 13112]
      imul	r10,256
      mov	[rbp - 13112],r10
      mov	rdi,[rbp-13088]
      mov	r10,[lcc]
      add	r10,[rbp - 13112]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13120],rax
      mov	r10,81
      add	r10,1
      mov	[rbp - 13144],r10
      mov	r10,[rbp - 13144]
      imul	r10,256
      mov	[rbp - 13144],r10
      mov	rdi,[rbp-13120]
      mov	r10,[lcc]
      add	r10,[rbp - 13144]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13152],rax
      mov	r10,81
      add	r10,1
      mov	[rbp - 13176],r10
      mov	r10,[rbp - 13176]
      imul	r10,256
      mov	[rbp - 13176],r10
      mov	rdi,[rbp-13152]
      mov	r10,[lcc]
      add	r10,[rbp - 13176]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13184],rax
      mov	r10,27
      add	r10,1
      mov	[rbp - 13208],r10
      mov	r10,[rbp - 13208]
      imul	r10,256
      mov	[rbp - 13208],r10
      mov	rdi,[rbp-13184]
      mov	r10,[lcc]
      add	r10,[rbp - 13208]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13216],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 13240],r10
      mov	r10,[rbp - 13240]
      imul	r10,256
      mov	[rbp - 13240],r10
      mov	rdi,[rbp-13216]
      mov	r10,[lcc]
      add	r10,[rbp - 13240]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13248],rax
      mov	r10,24
      add	r10,1
      mov	[rbp - 13272],r10
      mov	r10,[rbp - 13272]
      imul	r10,256
      mov	[rbp - 13272],r10
      mov	rdi,[rbp-13248]
      mov	r10,[lcc]
      add	r10,[rbp - 13272]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13280],rax
      mov	r10,8
      add	r10,1
      mov	[rbp - 13304],r10
      mov	r10,[rbp - 13304]
      imul	r10,256
      mov	[rbp - 13304],r10
      mov	rdi,[rbp-13280]
      mov	r10,[lcc]
      add	r10,[rbp - 13304]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13312],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 13336],r10
      mov	r10,[rbp - 13336]
      imul	r10,256
      mov	[rbp - 13336],r10
      mov	rdi,[rbp-13312]
      mov	r10,[lcc]
      add	r10,[rbp - 13336]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13344],rax
      mov	r10,67
      add	r10,1
      mov	[rbp - 13368],r10
      mov	r10,[rbp - 13368]
      imul	r10,256
      mov	[rbp - 13368],r10
      mov	rdi,[rbp-13344]
      mov	r10,[lcc]
      add	r10,[rbp - 13368]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13376],rax
      mov	r10,82
      add	r10,1
      mov	[rbp - 13400],r10
      mov	r10,[rbp - 13400]
      imul	r10,256
      mov	[rbp - 13400],r10
      mov	rdi,[rbp-13376]
      mov	r10,[lcc]
      add	r10,[rbp - 13400]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13408],rax
      mov	r10,83
      add	r10,1
      mov	[rbp - 13432],r10
      mov	r10,[rbp - 13432]
      imul	r10,256
      mov	[rbp - 13432],r10
      mov	rdi,[rbp-13408]
      mov	r10,[lcc]
      add	r10,[rbp - 13432]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13440],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 13464],r10
      mov	r10,[rbp - 13464]
      imul	r10,256
      mov	[rbp - 13464],r10
      mov	rdi,[rbp-13440]
      mov	r10,[lcc]
      add	r10,[rbp - 13464]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13472],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 13496],r10
      mov	r10,[rbp - 13496]
      imul	r10,256
      mov	[rbp - 13496],r10
      mov	rdi,[rbp-13472]
      mov	r10,[lcc]
      add	r10,[rbp - 13496]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13504],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 13528],r10
      mov	r10,[rbp - 13528]
      imul	r10,256
      mov	[rbp - 13528],r10
      mov	rdi,[rbp-13504]
      mov	r10,[lcc]
      add	r10,[rbp - 13528]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13536],rax
      mov	rdi,[rbp-13536]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13544],rax
      mov	r10,81
      add	r10,1
      mov	[rbp - 13568],r10
      mov	r10,[rbp - 13568]
      imul	r10,256
      mov	[rbp - 13568],r10
      mov	rdi,[rbp-13544]
      mov	r10,[lcc]
      add	r10,[rbp - 13568]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13576],rax
      mov	r10,58
      add	r10,1
      mov	[rbp - 13600],r10
      mov	r10,[rbp - 13600]
      imul	r10,256
      mov	[rbp - 13600],r10
      mov	rdi,[rbp-13576]
      mov	r10,[lcc]
      add	r10,[rbp - 13600]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13608],rax
      mov	rdi,[rbp-13608]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13616],rax
      mov	r10,10
      add	r10,1
      mov	[rbp - 13640],r10
      mov	r10,[rbp - 13640]
      imul	r10,256
      mov	[rbp - 13640],r10
      mov	rdi,[rbp-13616]
      mov	r10,[lcc]
      add	r10,[rbp - 13640]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13648],rax
      mov	r10,66
      add	r10,1
      mov	[rbp - 13672],r10
      mov	r10,[rbp - 13672]
      imul	r10,256
      mov	[rbp - 13672],r10
      mov	rdi,[rbp-13648]
      mov	r10,[lcc]
      add	r10,[rbp - 13672]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13680],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 13704],r10
      mov	r10,[rbp - 13704]
      imul	r10,256
      mov	[rbp - 13704],r10
      mov	rdi,[rbp-13680]
      mov	r10,[lcc]
      add	r10,[rbp - 13704]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13712],rax
      mov	r10,69
      add	r10,1
      mov	[rbp - 13736],r10
      mov	r10,[rbp - 13736]
      imul	r10,256
      mov	[rbp - 13736],r10
      mov	rdi,[rbp-13712]
      mov	r10,[lcc]
      add	r10,[rbp - 13736]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13744],rax
      mov	r10,82
      add	r10,1
      mov	[rbp - 13768],r10
      mov	r10,[rbp - 13768]
      imul	r10,256
      mov	[rbp - 13768],r10
      mov	rdi,[rbp-13744]
      mov	r10,[lcc]
      add	r10,[rbp - 13768]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13776],rax
      mov	r10,7
      add	r10,1
      mov	[rbp - 13800],r10
      mov	r10,[rbp - 13800]
      imul	r10,256
      mov	[rbp - 13800],r10
      mov	rdi,[rbp-13776]
      mov	r10,[lcc]
      add	r10,[rbp - 13800]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13808],rax
      mov	r10,81
      add	r10,1
      mov	[rbp - 13832],r10
      mov	r10,[rbp - 13832]
      imul	r10,256
      mov	[rbp - 13832],r10
      mov	rdi,[rbp-13808]
      mov	r10,[lcc]
      add	r10,[rbp - 13832]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13840],rax
      mov	r10,81
      add	r10,1
      mov	[rbp - 13864],r10
      mov	r10,[rbp - 13864]
      imul	r10,256
      mov	[rbp - 13864],r10
      mov	rdi,[rbp-13840]
      mov	r10,[lcc]
      add	r10,[rbp - 13864]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13872],rax
      mov	r10,8
      add	r10,1
      mov	[rbp - 13896],r10
      mov	r10,[rbp - 13896]
      imul	r10,256
      mov	[rbp - 13896],r10
      mov	rdi,[rbp-13872]
      mov	r10,[lcc]
      add	r10,[rbp - 13896]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13904],rax
      mov	r10,10
      add	r10,1
      mov	[rbp - 13928],r10
      mov	r10,[rbp - 13928]
      imul	r10,256
      mov	[rbp - 13928],r10
      mov	rdi,[rbp-13904]
      mov	r10,[lcc]
      add	r10,[rbp - 13928]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13936],rax
      mov	rdi,[rbp-13936]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13944],rax
      mov	r10,59
      add	r10,1
      mov	[rbp - 13968],r10
      mov	r10,[rbp - 13968]
      imul	r10,256
      mov	[rbp - 13968],r10
      mov	rdi,[rbp-13944]
      mov	r10,[lcc]
      add	r10,[rbp - 13968]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  13976],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 14000],r10
      mov	r10,[rbp - 14000]
      imul	r10,256
      mov	[rbp - 14000],r10
      mov	rdi,[rbp-13976]
      mov	r10,[lcc]
      add	r10,[rbp - 14000]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14008],rax
      mov	rdi,[rbp-14008]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14016],rax
      mov	r10,26
      add	r10,1
      mov	[rbp - 14040],r10
      mov	r10,[rbp - 14040]
      imul	r10,256
      mov	[rbp - 14040],r10
      mov	rdi,[rbp-14016]
      mov	r10,[lcc]
      add	r10,[rbp - 14040]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14048],rax
      mov	rdi,[rbp-14048]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  14056],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 14080],r10
      mov	r10,[rbp - 14080]
      imul	r10,256
      mov	[rbp - 14080],r10
      mov	r10,67
      add	r10,1
      mov	[rbp - 14104],r10
      mov	r10,[rbp - 14104]
      imul	r10,256
      mov	[rbp - 14104],r10
      mov	r10,[lcc]
      add	r10,[rbp - 14080]
      mov	rdi,[r10]
      mov	r10,[lcc]
      add	r10,[rbp - 14104]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14112],rax
      mov	r10,82
      add	r10,1
      mov	[rbp - 14136],r10
      mov	r10,[rbp - 14136]
      imul	r10,256
      mov	[rbp - 14136],r10
      mov	rdi,[rbp-14112]
      mov	r10,[lcc]
      add	r10,[rbp - 14136]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14144],rax
      mov	r10,83
      add	r10,1
      mov	[rbp - 14168],r10
      mov	r10,[rbp - 14168]
      imul	r10,256
      mov	[rbp - 14168],r10
      mov	rdi,[rbp-14144]
      mov	r10,[lcc]
      add	r10,[rbp - 14168]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14176],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 14200],r10
      mov	r10,[rbp - 14200]
      imul	r10,256
      mov	[rbp - 14200],r10
      mov	rdi,[rbp-14176]
      mov	r10,[lcc]
      add	r10,[rbp - 14200]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14208],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 14232],r10
      mov	r10,[rbp - 14232]
      imul	r10,256
      mov	[rbp - 14232],r10
      mov	rdi,[rbp-14208]
      mov	r10,[lcc]
      add	r10,[rbp - 14232]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14240],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 14264],r10
      mov	r10,[rbp - 14264]
      imul	r10,256
      mov	[rbp - 14264],r10
      mov	rdi,[rbp-14240]
      mov	r10,[lcc]
      add	r10,[rbp - 14264]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14272],rax
      mov	rdi,[rbp-14272]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14280],rax
      mov	r10,81
      add	r10,1
      mov	[rbp - 14304],r10
      mov	r10,[rbp - 14304]
      imul	r10,256
      mov	[rbp - 14304],r10
      mov	rdi,[rbp-14280]
      mov	r10,[lcc]
      add	r10,[rbp - 14304]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14312],rax
      mov	r10,58
      add	r10,1
      mov	[rbp - 14336],r10
      mov	r10,[rbp - 14336]
      imul	r10,256
      mov	[rbp - 14336],r10
      mov	rdi,[rbp-14312]
      mov	r10,[lcc]
      add	r10,[rbp - 14336]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14344],rax
      mov	rdi,[rbp-14344]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14352],rax
      mov	r10,10
      add	r10,1
      mov	[rbp - 14376],r10
      mov	r10,[rbp - 14376]
      imul	r10,256
      mov	[rbp - 14376],r10
      mov	rdi,[rbp-14352]
      mov	r10,[lcc]
      add	r10,[rbp - 14376]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14384],rax
      mov	r10,66
      add	r10,1
      mov	[rbp - 14408],r10
      mov	r10,[rbp - 14408]
      imul	r10,256
      mov	[rbp - 14408],r10
      mov	rdi,[rbp-14384]
      mov	r10,[lcc]
      add	r10,[rbp - 14408]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14416],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 14440],r10
      mov	r10,[rbp - 14440]
      imul	r10,256
      mov	[rbp - 14440],r10
      mov	rdi,[rbp-14416]
      mov	r10,[lcc]
      add	r10,[rbp - 14440]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14448],rax
      mov	r10,69
      add	r10,1
      mov	[rbp - 14472],r10
      mov	r10,[rbp - 14472]
      imul	r10,256
      mov	[rbp - 14472],r10
      mov	rdi,[rbp-14448]
      mov	r10,[lcc]
      add	r10,[rbp - 14472]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14480],rax
      mov	r10,82
      add	r10,1
      mov	[rbp - 14504],r10
      mov	r10,[rbp - 14504]
      imul	r10,256
      mov	[rbp - 14504],r10
      mov	rdi,[rbp-14480]
      mov	r10,[lcc]
      add	r10,[rbp - 14504]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14512],rax
      mov	r10,7
      add	r10,1
      mov	[rbp - 14536],r10
      mov	r10,[rbp - 14536]
      imul	r10,256
      mov	[rbp - 14536],r10
      mov	rdi,[rbp-14512]
      mov	r10,[lcc]
      add	r10,[rbp - 14536]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14544],rax
      mov	r10,81
      add	r10,1
      mov	[rbp - 14568],r10
      mov	r10,[rbp - 14568]
      imul	r10,256
      mov	[rbp - 14568],r10
      mov	rdi,[rbp-14544]
      mov	r10,[lcc]
      add	r10,[rbp - 14568]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14576],rax
      mov	r10,81
      add	r10,1
      mov	[rbp - 14600],r10
      mov	r10,[rbp - 14600]
      imul	r10,256
      mov	[rbp - 14600],r10
      mov	rdi,[rbp-14576]
      mov	r10,[lcc]
      add	r10,[rbp - 14600]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14608],rax
      mov	r10,14
      add	r10,1
      mov	[rbp - 14632],r10
      mov	r10,[rbp - 14632]
      imul	r10,256
      mov	[rbp - 14632],r10
      mov	rdi,[rbp-14608]
      mov	r10,[lcc]
      add	r10,[rbp - 14632]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14640],rax
      mov	r10,16
      add	r10,1
      mov	[rbp - 14664],r10
      mov	r10,[rbp - 14664]
      imul	r10,256
      mov	[rbp - 14664],r10
      mov	rdi,[rbp-14640]
      mov	r10,[lcc]
      add	r10,[rbp - 14664]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14672],rax
      mov	r10,15
      add	r10,1
      mov	[rbp - 14696],r10
      mov	r10,[rbp - 14696]
      imul	r10,256
      mov	[rbp - 14696],r10
      mov	rdi,[rbp-14672]
      mov	r10,[lcc]
      add	r10,[rbp - 14696]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14704],rax
      mov	r10,8
      add	r10,1
      mov	[rbp - 14728],r10
      mov	r10,[rbp - 14728]
      imul	r10,256
      mov	[rbp - 14728],r10
      mov	rdi,[rbp-14704]
      mov	r10,[lcc]
      add	r10,[rbp - 14728]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14736],rax
      mov	r10,10
      add	r10,1
      mov	[rbp - 14760],r10
      mov	r10,[rbp - 14760]
      imul	r10,256
      mov	[rbp - 14760],r10
      mov	rdi,[rbp-14736]
      mov	r10,[lcc]
      add	r10,[rbp - 14760]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14768],rax
      mov	r10,66
      add	r10,1
      mov	[rbp - 14792],r10
      mov	r10,[rbp - 14792]
      imul	r10,256
      mov	[rbp - 14792],r10
      mov	rdi,[rbp-14768]
      mov	r10,[lcc]
      add	r10,[rbp - 14792]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14800],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 14824],r10
      mov	r10,[rbp - 14824]
      imul	r10,256
      mov	[rbp - 14824],r10
      mov	rdi,[rbp-14800]
      mov	r10,[lcc]
      add	r10,[rbp - 14824]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14832],rax
      mov	r10,69
      add	r10,1
      mov	[rbp - 14856],r10
      mov	r10,[rbp - 14856]
      imul	r10,256
      mov	[rbp - 14856],r10
      mov	rdi,[rbp-14832]
      mov	r10,[lcc]
      add	r10,[rbp - 14856]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14864],rax
      mov	r10,82
      add	r10,1
      mov	[rbp - 14888],r10
      mov	r10,[rbp - 14888]
      imul	r10,256
      mov	[rbp - 14888],r10
      mov	rdi,[rbp-14864]
      mov	r10,[lcc]
      add	r10,[rbp - 14888]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14896],rax
      mov	r10,7
      add	r10,1
      mov	[rbp - 14920],r10
      mov	r10,[rbp - 14920]
      imul	r10,256
      mov	[rbp - 14920],r10
      mov	rdi,[rbp-14896]
      mov	r10,[lcc]
      add	r10,[rbp - 14920]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14928],rax
      mov	r10,81
      add	r10,1
      mov	[rbp - 14952],r10
      mov	r10,[rbp - 14952]
      imul	r10,256
      mov	[rbp - 14952],r10
      mov	rdi,[rbp-14928]
      mov	r10,[lcc]
      add	r10,[rbp - 14952]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14960],rax
      mov	r10,81
      add	r10,1
      mov	[rbp - 14984],r10
      mov	r10,[rbp - 14984]
      imul	r10,256
      mov	[rbp - 14984],r10
      mov	rdi,[rbp-14960]
      mov	r10,[lcc]
      add	r10,[rbp - 14984]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  14992],rax
      mov	r10,4
      add	r10,1
      mov	[rbp - 15016],r10
      mov	r10,[rbp - 15016]
      imul	r10,256
      mov	[rbp - 15016],r10
      mov	rdi,[rbp-14992]
      mov	r10,[lcc]
      add	r10,[rbp - 15016]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15024],rax
      mov	r10,16
      add	r10,1
      mov	[rbp - 15048],r10
      mov	r10,[rbp - 15048]
      imul	r10,256
      mov	[rbp - 15048],r10
      mov	rdi,[rbp-15024]
      mov	r10,[lcc]
      add	r10,[rbp - 15048]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15056],rax
      mov	r10,15
      add	r10,1
      mov	[rbp - 15080],r10
      mov	r10,[rbp - 15080]
      imul	r10,256
      mov	[rbp - 15080],r10
      mov	rdi,[rbp-15056]
      mov	r10,[lcc]
      add	r10,[rbp - 15080]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15088],rax
      mov	r10,8
      add	r10,1
      mov	[rbp - 15112],r10
      mov	r10,[rbp - 15112]
      imul	r10,256
      mov	[rbp - 15112],r10
      mov	rdi,[rbp-15088]
      mov	r10,[lcc]
      add	r10,[rbp - 15112]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15120],rax
      mov	r10,10
      add	r10,1
      mov	[rbp - 15144],r10
      mov	r10,[rbp - 15144]
      imul	r10,256
      mov	[rbp - 15144],r10
      mov	rdi,[rbp-15120]
      mov	r10,[lcc]
      add	r10,[rbp - 15144]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15152],rax
      mov	rdi,[rbp-15152]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15160],rax
      mov	r10,59
      add	r10,1
      mov	[rbp - 15184],r10
      mov	r10,[rbp - 15184]
      imul	r10,256
      mov	[rbp - 15184],r10
      mov	rdi,[rbp-15160]
      mov	r10,[lcc]
      add	r10,[rbp - 15184]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15192],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 15216],r10
      mov	r10,[rbp - 15216]
      imul	r10,256
      mov	[rbp - 15216],r10
      mov	rdi,[rbp-15192]
      mov	r10,[lcc]
      add	r10,[rbp - 15216]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15224],rax
      mov	rdi,[rbp-15224]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15232],rax
      mov	r10,26
      add	r10,1
      mov	[rbp - 15256],r10
      mov	r10,[rbp - 15256]
      imul	r10,256
      mov	[rbp - 15256],r10
      mov	rdi,[rbp-15232]
      mov	r10,[lcc]
      add	r10,[rbp - 15256]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15264],rax
      mov	rdi,[rbp-15264]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  15272],rax
      mov	r10,91
      add	r10,1
      mov	[rbp - 15296],r10
      mov	r10,[rbp - 15296]
      imul	r10,256
      mov	[rbp - 15296],r10
      mov	r10,[lcc]
      add	r10,[rbp - 15296]
      mov	rdi,[r10]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  15304],rax
      mov	r10,81
      add	r10,1
      mov	[rbp - 15328],r10
      mov	r10,[rbp - 15328]
      imul	r10,256
      mov	[rbp - 15328],r10
      mov	r10,82
      add	r10,1
      mov	[rbp - 15352],r10
      mov	r10,[rbp - 15352]
      imul	r10,256
      mov	[rbp - 15352],r10
      mov	r10,[lcc]
      add	r10,[rbp - 15328]
      mov	rdi,[r10]
      mov	r10,[lcc]
      add	r10,[rbp - 15352]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15360],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 15384],r10
      mov	r10,[rbp - 15384]
      imul	r10,256
      mov	[rbp - 15384],r10
      mov	rdi,[rbp-15360]
      mov	r10,[lcc]
      add	r10,[rbp - 15384]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15392],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 15416],r10
      mov	r10,[rbp - 15416]
      imul	r10,256
      mov	[rbp - 15416],r10
      mov	rdi,[rbp-15392]
      mov	r10,[lcc]
      add	r10,[rbp - 15416]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15424],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 15448],r10
      mov	r10,[rbp - 15448]
      imul	r10,256
      mov	[rbp - 15448],r10
      mov	rdi,[rbp-15424]
      mov	r10,[lcc]
      add	r10,[rbp - 15448]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15456],rax
      mov	r10,69
      add	r10,1
      mov	[rbp - 15480],r10
      mov	r10,[rbp - 15480]
      imul	r10,256
      mov	[rbp - 15480],r10
      mov	rdi,[rbp-15456]
      mov	r10,[lcc]
      add	r10,[rbp - 15480]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15488],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 15512],r10
      mov	r10,[rbp - 15512]
      imul	r10,256
      mov	[rbp - 15512],r10
      mov	rdi,[rbp-15488]
      mov	r10,[lcc]
      add	r10,[rbp - 15512]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15520],rax
      mov	r10,65
      add	r10,1
      mov	[rbp - 15544],r10
      mov	r10,[rbp - 15544]
      imul	r10,256
      mov	[rbp - 15544],r10
      mov	rdi,[rbp-15520]
      mov	r10,[lcc]
      add	r10,[rbp - 15544]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15552],rax
      mov	r10,17
      add	r10,1
      mov	[rbp - 15576],r10
      mov	r10,[rbp - 15576]
      imul	r10,256
      mov	[rbp - 15576],r10
      mov	rdi,[rbp-15552]
      mov	r10,[lcc]
      add	r10,[rbp - 15576]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15584],rax
      mov	r10,7
      add	r10,1
      mov	[rbp - 15608],r10
      mov	r10,[rbp - 15608]
      imul	r10,256
      mov	[rbp - 15608],r10
      mov	rdi,[rbp-15584]
      mov	r10,[lcc]
      add	r10,[rbp - 15608]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15616],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 15640],r10
      mov	r10,[rbp - 15640]
      imul	r10,256
      mov	[rbp - 15640],r10
      mov	rdi,[rbp-15616]
      mov	r10,[lcc]
      add	r10,[rbp - 15640]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15648],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 15672],r10
      mov	r10,[rbp - 15672]
      imul	r10,256
      mov	[rbp - 15672],r10
      mov	rdi,[rbp-15648]
      mov	r10,[lcc]
      add	r10,[rbp - 15672]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15680],rax
      mov	r10,82
      add	r10,1
      mov	[rbp - 15704],r10
      mov	r10,[rbp - 15704]
      imul	r10,256
      mov	[rbp - 15704],r10
      mov	rdi,[rbp-15680]
      mov	r10,[lcc]
      add	r10,[rbp - 15704]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15712],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 15736],r10
      mov	r10,[rbp - 15736]
      imul	r10,256
      mov	[rbp - 15736],r10
      mov	rdi,[rbp-15712]
      mov	r10,[lcc]
      add	r10,[rbp - 15736]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15744],rax
      mov	r10,65
      add	r10,1
      mov	[rbp - 15768],r10
      mov	r10,[rbp - 15768]
      imul	r10,256
      mov	[rbp - 15768],r10
      mov	rdi,[rbp-15744]
      mov	r10,[lcc]
      add	r10,[rbp - 15768]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15776],rax
      mov	r10,65
      add	r10,1
      mov	[rbp - 15800],r10
      mov	r10,[rbp - 15800]
      imul	r10,256
      mov	[rbp - 15800],r10
      mov	rdi,[rbp-15776]
      mov	r10,[lcc]
      add	r10,[rbp - 15800]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15808],rax
      mov	r10,8
      add	r10,1
      mov	[rbp - 15832],r10
      mov	r10,[rbp - 15832]
      imul	r10,256
      mov	[rbp - 15832],r10
      mov	rdi,[rbp-15808]
      mov	r10,[lcc]
      add	r10,[rbp - 15832]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15840],rax
      mov	r10,89
      add	r10,1
      mov	[rbp - 15864],r10
      mov	r10,[rbp - 15864]
      imul	r10,256
      mov	[rbp - 15864],r10
      mov	rdi,[rbp-15840]
      mov	r10,[lcc]
      add	r10,[rbp - 15864]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15872],rax
      mov	rdi,[rbp-15872]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  15880],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 15904],r10
      mov	r10,[rbp - 15904]
      imul	r10,256
      mov	[rbp - 15904],r10
      mov	r10,68
      add	r10,1
      mov	[rbp - 15928],r10
      mov	r10,[rbp - 15928]
      imul	r10,256
      mov	[rbp - 15928],r10
      mov	r10,[lcc]
      add	r10,[rbp - 15904]
      mov	rdi,[r10]
      mov	r10,[lcc]
      add	r10,[rbp - 15928]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15936],rax
      mov	r10,7
      add	r10,1
      mov	[rbp - 15960],r10
      mov	r10,[rbp - 15960]
      imul	r10,256
      mov	[rbp - 15960],r10
      mov	rdi,[rbp-15936]
      mov	r10,[lcc]
      add	r10,[rbp - 15960]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  15968],rax
      mov	r10,65
      add	r10,1
      mov	[rbp - 15992],r10
      mov	r10,[rbp - 15992]
      imul	r10,256
      mov	[rbp - 15992],r10
      mov	rdi,[rbp-15968]
      mov	r10,[lcc]
      add	r10,[rbp - 15992]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16000],rax
      mov	r10,65
      add	r10,1
      mov	[rbp - 16024],r10
      mov	r10,[rbp - 16024]
      imul	r10,256
      mov	[rbp - 16024],r10
      mov	rdi,[rbp-16000]
      mov	r10,[lcc]
      add	r10,[rbp - 16024]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16032],rax
      mov	r10,27
      add	r10,1
      mov	[rbp - 16056],r10
      mov	r10,[rbp - 16056]
      imul	r10,256
      mov	[rbp - 16056],r10
      mov	rdi,[rbp-16032]
      mov	r10,[lcc]
      add	r10,[rbp - 16056]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16064],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 16088],r10
      mov	r10,[rbp - 16088]
      imul	r10,256
      mov	[rbp - 16088],r10
      mov	rdi,[rbp-16064]
      mov	r10,[lcc]
      add	r10,[rbp - 16088]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16096],rax
      mov	r10,24
      add	r10,1
      mov	[rbp - 16120],r10
      mov	r10,[rbp - 16120]
      imul	r10,256
      mov	[rbp - 16120],r10
      mov	rdi,[rbp-16096]
      mov	r10,[lcc]
      add	r10,[rbp - 16120]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16128],rax
      mov	r10,8
      add	r10,1
      mov	[rbp - 16152],r10
      mov	r10,[rbp - 16152]
      imul	r10,256
      mov	[rbp - 16152],r10
      mov	rdi,[rbp-16128]
      mov	r10,[lcc]
      add	r10,[rbp - 16152]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16160],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 16184],r10
      mov	r10,[rbp - 16184]
      imul	r10,256
      mov	[rbp - 16184],r10
      mov	rdi,[rbp-16160]
      mov	r10,[lcc]
      add	r10,[rbp - 16184]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16192],rax
      mov	r10,67
      add	r10,1
      mov	[rbp - 16216],r10
      mov	r10,[rbp - 16216]
      imul	r10,256
      mov	[rbp - 16216],r10
      mov	rdi,[rbp-16192]
      mov	r10,[lcc]
      add	r10,[rbp - 16216]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16224],rax
      mov	r10,82
      add	r10,1
      mov	[rbp - 16248],r10
      mov	r10,[rbp - 16248]
      imul	r10,256
      mov	[rbp - 16248],r10
      mov	rdi,[rbp-16224]
      mov	r10,[lcc]
      add	r10,[rbp - 16248]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16256],rax
      mov	r10,83
      add	r10,1
      mov	[rbp - 16280],r10
      mov	r10,[rbp - 16280]
      imul	r10,256
      mov	[rbp - 16280],r10
      mov	rdi,[rbp-16256]
      mov	r10,[lcc]
      add	r10,[rbp - 16280]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16288],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 16312],r10
      mov	r10,[rbp - 16312]
      imul	r10,256
      mov	[rbp - 16312],r10
      mov	rdi,[rbp-16288]
      mov	r10,[lcc]
      add	r10,[rbp - 16312]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16320],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 16344],r10
      mov	r10,[rbp - 16344]
      imul	r10,256
      mov	[rbp - 16344],r10
      mov	rdi,[rbp-16320]
      mov	r10,[lcc]
      add	r10,[rbp - 16344]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16352],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 16376],r10
      mov	r10,[rbp - 16376]
      imul	r10,256
      mov	[rbp - 16376],r10
      mov	rdi,[rbp-16352]
      mov	r10,[lcc]
      add	r10,[rbp - 16376]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16384],rax
      mov	rdi,[rbp-16384]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16392],rax
      mov	r10,65
      add	r10,1
      mov	[rbp - 16416],r10
      mov	r10,[rbp - 16416]
      imul	r10,256
      mov	[rbp - 16416],r10
      mov	rdi,[rbp-16392]
      mov	r10,[lcc]
      add	r10,[rbp - 16416]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16424],rax
      mov	r10,58
      add	r10,1
      mov	[rbp - 16448],r10
      mov	r10,[rbp - 16448]
      imul	r10,256
      mov	[rbp - 16448],r10
      mov	rdi,[rbp-16424]
      mov	r10,[lcc]
      add	r10,[rbp - 16448]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16456],rax
      mov	rdi,[rbp-16456]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16464],rax
      mov	r10,10
      add	r10,1
      mov	[rbp - 16488],r10
      mov	r10,[rbp - 16488]
      imul	r10,256
      mov	[rbp - 16488],r10
      mov	rdi,[rbp-16464]
      mov	r10,[lcc]
      add	r10,[rbp - 16488]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16496],rax
      mov	r10,66
      add	r10,1
      mov	[rbp - 16520],r10
      mov	r10,[rbp - 16520]
      imul	r10,256
      mov	[rbp - 16520],r10
      mov	rdi,[rbp-16496]
      mov	r10,[lcc]
      add	r10,[rbp - 16520]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16528],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 16552],r10
      mov	r10,[rbp - 16552]
      imul	r10,256
      mov	[rbp - 16552],r10
      mov	rdi,[rbp-16528]
      mov	r10,[lcc]
      add	r10,[rbp - 16552]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16560],rax
      mov	r10,69
      add	r10,1
      mov	[rbp - 16584],r10
      mov	r10,[rbp - 16584]
      imul	r10,256
      mov	[rbp - 16584],r10
      mov	rdi,[rbp-16560]
      mov	r10,[lcc]
      add	r10,[rbp - 16584]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16592],rax
      mov	r10,82
      add	r10,1
      mov	[rbp - 16616],r10
      mov	r10,[rbp - 16616]
      imul	r10,256
      mov	[rbp - 16616],r10
      mov	rdi,[rbp-16592]
      mov	r10,[lcc]
      add	r10,[rbp - 16616]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16624],rax
      mov	r10,7
      add	r10,1
      mov	[rbp - 16648],r10
      mov	r10,[rbp - 16648]
      imul	r10,256
      mov	[rbp - 16648],r10
      mov	rdi,[rbp-16624]
      mov	r10,[lcc]
      add	r10,[rbp - 16648]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16656],rax
      mov	r10,65
      add	r10,1
      mov	[rbp - 16680],r10
      mov	r10,[rbp - 16680]
      imul	r10,256
      mov	[rbp - 16680],r10
      mov	rdi,[rbp-16656]
      mov	r10,[lcc]
      add	r10,[rbp - 16680]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16688],rax
      mov	r10,65
      add	r10,1
      mov	[rbp - 16712],r10
      mov	r10,[rbp - 16712]
      imul	r10,256
      mov	[rbp - 16712],r10
      mov	rdi,[rbp-16688]
      mov	r10,[lcc]
      add	r10,[rbp - 16712]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16720],rax
      mov	r10,8
      add	r10,1
      mov	[rbp - 16744],r10
      mov	r10,[rbp - 16744]
      imul	r10,256
      mov	[rbp - 16744],r10
      mov	rdi,[rbp-16720]
      mov	r10,[lcc]
      add	r10,[rbp - 16744]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16752],rax
      mov	r10,10
      add	r10,1
      mov	[rbp - 16776],r10
      mov	r10,[rbp - 16776]
      imul	r10,256
      mov	[rbp - 16776],r10
      mov	rdi,[rbp-16752]
      mov	r10,[lcc]
      add	r10,[rbp - 16776]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16784],rax
      mov	rdi,[rbp-16784]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16792],rax
      mov	r10,59
      add	r10,1
      mov	[rbp - 16816],r10
      mov	r10,[rbp - 16816]
      imul	r10,256
      mov	[rbp - 16816],r10
      mov	rdi,[rbp-16792]
      mov	r10,[lcc]
      add	r10,[rbp - 16816]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16824],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 16848],r10
      mov	r10,[rbp - 16848]
      imul	r10,256
      mov	[rbp - 16848],r10
      mov	rdi,[rbp-16824]
      mov	r10,[lcc]
      add	r10,[rbp - 16848]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16856],rax
      mov	rdi,[rbp-16856]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16864],rax
      mov	r10,26
      add	r10,1
      mov	[rbp - 16888],r10
      mov	r10,[rbp - 16888]
      imul	r10,256
      mov	[rbp - 16888],r10
      mov	rdi,[rbp-16864]
      mov	r10,[lcc]
      add	r10,[rbp - 16888]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16896],rax
      mov	rdi,[rbp-16896]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  16904],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 16928],r10
      mov	r10,[rbp - 16928]
      imul	r10,256
      mov	[rbp - 16928],r10
      mov	r10,67
      add	r10,1
      mov	[rbp - 16952],r10
      mov	r10,[rbp - 16952]
      imul	r10,256
      mov	[rbp - 16952],r10
      mov	r10,[lcc]
      add	r10,[rbp - 16928]
      mov	rdi,[r10]
      mov	r10,[lcc]
      add	r10,[rbp - 16952]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16960],rax
      mov	r10,82
      add	r10,1
      mov	[rbp - 16984],r10
      mov	r10,[rbp - 16984]
      imul	r10,256
      mov	[rbp - 16984],r10
      mov	rdi,[rbp-16960]
      mov	r10,[lcc]
      add	r10,[rbp - 16984]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16992],rax
      mov	r10,83
      add	r10,1
      mov	[rbp - 17016],r10
      mov	r10,[rbp - 17016]
      imul	r10,256
      mov	[rbp - 17016],r10
      mov	rdi,[rbp-16992]
      mov	r10,[lcc]
      add	r10,[rbp - 17016]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17024],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 17048],r10
      mov	r10,[rbp - 17048]
      imul	r10,256
      mov	[rbp - 17048],r10
      mov	rdi,[rbp-17024]
      mov	r10,[lcc]
      add	r10,[rbp - 17048]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17056],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 17080],r10
      mov	r10,[rbp - 17080]
      imul	r10,256
      mov	[rbp - 17080],r10
      mov	rdi,[rbp-17056]
      mov	r10,[lcc]
      add	r10,[rbp - 17080]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17088],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 17112],r10
      mov	r10,[rbp - 17112]
      imul	r10,256
      mov	[rbp - 17112],r10
      mov	rdi,[rbp-17088]
      mov	r10,[lcc]
      add	r10,[rbp - 17112]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17120],rax
      mov	rdi,[rbp-17120]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17128],rax
      mov	r10,65
      add	r10,1
      mov	[rbp - 17152],r10
      mov	r10,[rbp - 17152]
      imul	r10,256
      mov	[rbp - 17152],r10
      mov	rdi,[rbp-17128]
      mov	r10,[lcc]
      add	r10,[rbp - 17152]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17160],rax
      mov	r10,58
      add	r10,1
      mov	[rbp - 17184],r10
      mov	r10,[rbp - 17184]
      imul	r10,256
      mov	[rbp - 17184],r10
      mov	rdi,[rbp-17160]
      mov	r10,[lcc]
      add	r10,[rbp - 17184]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17192],rax
      mov	rdi,[rbp-17192]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17200],rax
      mov	r10,10
      add	r10,1
      mov	[rbp - 17224],r10
      mov	r10,[rbp - 17224]
      imul	r10,256
      mov	[rbp - 17224],r10
      mov	rdi,[rbp-17200]
      mov	r10,[lcc]
      add	r10,[rbp - 17224]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17232],rax
      mov	r10,66
      add	r10,1
      mov	[rbp - 17256],r10
      mov	r10,[rbp - 17256]
      imul	r10,256
      mov	[rbp - 17256],r10
      mov	rdi,[rbp-17232]
      mov	r10,[lcc]
      add	r10,[rbp - 17256]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17264],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 17288],r10
      mov	r10,[rbp - 17288]
      imul	r10,256
      mov	[rbp - 17288],r10
      mov	rdi,[rbp-17264]
      mov	r10,[lcc]
      add	r10,[rbp - 17288]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17296],rax
      mov	r10,69
      add	r10,1
      mov	[rbp - 17320],r10
      mov	r10,[rbp - 17320]
      imul	r10,256
      mov	[rbp - 17320],r10
      mov	rdi,[rbp-17296]
      mov	r10,[lcc]
      add	r10,[rbp - 17320]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17328],rax
      mov	r10,82
      add	r10,1
      mov	[rbp - 17352],r10
      mov	r10,[rbp - 17352]
      imul	r10,256
      mov	[rbp - 17352],r10
      mov	rdi,[rbp-17328]
      mov	r10,[lcc]
      add	r10,[rbp - 17352]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17360],rax
      mov	r10,7
      add	r10,1
      mov	[rbp - 17384],r10
      mov	r10,[rbp - 17384]
      imul	r10,256
      mov	[rbp - 17384],r10
      mov	rdi,[rbp-17360]
      mov	r10,[lcc]
      add	r10,[rbp - 17384]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17392],rax
      mov	r10,65
      add	r10,1
      mov	[rbp - 17416],r10
      mov	r10,[rbp - 17416]
      imul	r10,256
      mov	[rbp - 17416],r10
      mov	rdi,[rbp-17392]
      mov	r10,[lcc]
      add	r10,[rbp - 17416]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17424],rax
      mov	r10,65
      add	r10,1
      mov	[rbp - 17448],r10
      mov	r10,[rbp - 17448]
      imul	r10,256
      mov	[rbp - 17448],r10
      mov	rdi,[rbp-17424]
      mov	r10,[lcc]
      add	r10,[rbp - 17448]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17456],rax
      mov	r10,14
      add	r10,1
      mov	[rbp - 17480],r10
      mov	r10,[rbp - 17480]
      imul	r10,256
      mov	[rbp - 17480],r10
      mov	rdi,[rbp-17456]
      mov	r10,[lcc]
      add	r10,[rbp - 17480]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17488],rax
      mov	r10,16
      add	r10,1
      mov	[rbp - 17512],r10
      mov	r10,[rbp - 17512]
      imul	r10,256
      mov	[rbp - 17512],r10
      mov	rdi,[rbp-17488]
      mov	r10,[lcc]
      add	r10,[rbp - 17512]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17520],rax
      mov	r10,15
      add	r10,1
      mov	[rbp - 17544],r10
      mov	r10,[rbp - 17544]
      imul	r10,256
      mov	[rbp - 17544],r10
      mov	rdi,[rbp-17520]
      mov	r10,[lcc]
      add	r10,[rbp - 17544]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17552],rax
      mov	r10,8
      add	r10,1
      mov	[rbp - 17576],r10
      mov	r10,[rbp - 17576]
      imul	r10,256
      mov	[rbp - 17576],r10
      mov	rdi,[rbp-17552]
      mov	r10,[lcc]
      add	r10,[rbp - 17576]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17584],rax
      mov	r10,10
      add	r10,1
      mov	[rbp - 17608],r10
      mov	r10,[rbp - 17608]
      imul	r10,256
      mov	[rbp - 17608],r10
      mov	rdi,[rbp-17584]
      mov	r10,[lcc]
      add	r10,[rbp - 17608]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17616],rax
      mov	r10,66
      add	r10,1
      mov	[rbp - 17640],r10
      mov	r10,[rbp - 17640]
      imul	r10,256
      mov	[rbp - 17640],r10
      mov	rdi,[rbp-17616]
      mov	r10,[lcc]
      add	r10,[rbp - 17640]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17648],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 17672],r10
      mov	r10,[rbp - 17672]
      imul	r10,256
      mov	[rbp - 17672],r10
      mov	rdi,[rbp-17648]
      mov	r10,[lcc]
      add	r10,[rbp - 17672]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17680],rax
      mov	r10,69
      add	r10,1
      mov	[rbp - 17704],r10
      mov	r10,[rbp - 17704]
      imul	r10,256
      mov	[rbp - 17704],r10
      mov	rdi,[rbp-17680]
      mov	r10,[lcc]
      add	r10,[rbp - 17704]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17712],rax
      mov	r10,82
      add	r10,1
      mov	[rbp - 17736],r10
      mov	r10,[rbp - 17736]
      imul	r10,256
      mov	[rbp - 17736],r10
      mov	rdi,[rbp-17712]
      mov	r10,[lcc]
      add	r10,[rbp - 17736]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17744],rax
      mov	r10,7
      add	r10,1
      mov	[rbp - 17768],r10
      mov	r10,[rbp - 17768]
      imul	r10,256
      mov	[rbp - 17768],r10
      mov	rdi,[rbp-17744]
      mov	r10,[lcc]
      add	r10,[rbp - 17768]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17776],rax
      mov	r10,65
      add	r10,1
      mov	[rbp - 17800],r10
      mov	r10,[rbp - 17800]
      imul	r10,256
      mov	[rbp - 17800],r10
      mov	rdi,[rbp-17776]
      mov	r10,[lcc]
      add	r10,[rbp - 17800]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17808],rax
      mov	r10,65
      add	r10,1
      mov	[rbp - 17832],r10
      mov	r10,[rbp - 17832]
      imul	r10,256
      mov	[rbp - 17832],r10
      mov	rdi,[rbp-17808]
      mov	r10,[lcc]
      add	r10,[rbp - 17832]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17840],rax
      mov	r10,4
      add	r10,1
      mov	[rbp - 17864],r10
      mov	r10,[rbp - 17864]
      imul	r10,256
      mov	[rbp - 17864],r10
      mov	rdi,[rbp-17840]
      mov	r10,[lcc]
      add	r10,[rbp - 17864]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17872],rax
      mov	r10,16
      add	r10,1
      mov	[rbp - 17896],r10
      mov	r10,[rbp - 17896]
      imul	r10,256
      mov	[rbp - 17896],r10
      mov	rdi,[rbp-17872]
      mov	r10,[lcc]
      add	r10,[rbp - 17896]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17904],rax
      mov	r10,15
      add	r10,1
      mov	[rbp - 17928],r10
      mov	r10,[rbp - 17928]
      imul	r10,256
      mov	[rbp - 17928],r10
      mov	rdi,[rbp-17904]
      mov	r10,[lcc]
      add	r10,[rbp - 17928]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17936],rax
      mov	r10,8
      add	r10,1
      mov	[rbp - 17960],r10
      mov	r10,[rbp - 17960]
      imul	r10,256
      mov	[rbp - 17960],r10
      mov	rdi,[rbp-17936]
      mov	r10,[lcc]
      add	r10,[rbp - 17960]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  17968],rax
      mov	r10,10
      add	r10,1
      mov	[rbp - 17992],r10
      mov	r10,[rbp - 17992]
      imul	r10,256
      mov	[rbp - 17992],r10
      mov	rdi,[rbp-17968]
      mov	r10,[lcc]
      add	r10,[rbp - 17992]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18000],rax
      mov	rdi,[rbp-18000]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18008],rax
      mov	r10,59
      add	r10,1
      mov	[rbp - 18032],r10
      mov	r10,[rbp - 18032]
      imul	r10,256
      mov	[rbp - 18032],r10
      mov	rdi,[rbp-18008]
      mov	r10,[lcc]
      add	r10,[rbp - 18032]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18040],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 18064],r10
      mov	r10,[rbp - 18064]
      imul	r10,256
      mov	[rbp - 18064],r10
      mov	rdi,[rbp-18040]
      mov	r10,[lcc]
      add	r10,[rbp - 18064]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18072],rax
      mov	rdi,[rbp-18072]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18080],rax
      mov	r10,26
      add	r10,1
      mov	[rbp - 18104],r10
      mov	r10,[rbp - 18104]
      imul	r10,256
      mov	[rbp - 18104],r10
      mov	rdi,[rbp-18080]
      mov	r10,[lcc]
      add	r10,[rbp - 18104]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18112],rax
      mov	rdi,[rbp-18112]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  18120],rax
      mov	r10,91
      add	r10,1
      mov	[rbp - 18144],r10
      mov	r10,[rbp - 18144]
      imul	r10,256
      mov	[rbp - 18144],r10
      mov	r10,[lcc]
      add	r10,[rbp - 18144]
      mov	rdi,[r10]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  18152],rax
      mov	r10,81
      add	r10,1
      mov	[rbp - 18176],r10
      mov	r10,[rbp - 18176]
      imul	r10,256
      mov	[rbp - 18176],r10
      mov	r10,82
      add	r10,1
      mov	[rbp - 18200],r10
      mov	r10,[rbp - 18200]
      imul	r10,256
      mov	[rbp - 18200],r10
      mov	r10,[lcc]
      add	r10,[rbp - 18176]
      mov	rdi,[r10]
      mov	r10,[lcc]
      add	r10,[rbp - 18200]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18208],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 18232],r10
      mov	r10,[rbp - 18232]
      imul	r10,256
      mov	[rbp - 18232],r10
      mov	rdi,[rbp-18208]
      mov	r10,[lcc]
      add	r10,[rbp - 18232]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18240],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 18264],r10
      mov	r10,[rbp - 18264]
      imul	r10,256
      mov	[rbp - 18264],r10
      mov	rdi,[rbp-18240]
      mov	r10,[lcc]
      add	r10,[rbp - 18264]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18272],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 18296],r10
      mov	r10,[rbp - 18296]
      imul	r10,256
      mov	[rbp - 18296],r10
      mov	rdi,[rbp-18272]
      mov	r10,[lcc]
      add	r10,[rbp - 18296]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18304],rax
      mov	r10,69
      add	r10,1
      mov	[rbp - 18328],r10
      mov	r10,[rbp - 18328]
      imul	r10,256
      mov	[rbp - 18328],r10
      mov	rdi,[rbp-18304]
      mov	r10,[lcc]
      add	r10,[rbp - 18328]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18336],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 18360],r10
      mov	r10,[rbp - 18360]
      imul	r10,256
      mov	[rbp - 18360],r10
      mov	rdi,[rbp-18336]
      mov	r10,[lcc]
      add	r10,[rbp - 18360]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18368],rax
      mov	r10,65
      add	r10,1
      mov	[rbp - 18392],r10
      mov	r10,[rbp - 18392]
      imul	r10,256
      mov	[rbp - 18392],r10
      mov	rdi,[rbp-18368]
      mov	r10,[lcc]
      add	r10,[rbp - 18392]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18400],rax
      mov	r10,77
      add	r10,1
      mov	[rbp - 18424],r10
      mov	r10,[rbp - 18424]
      imul	r10,256
      mov	[rbp - 18424],r10
      mov	rdi,[rbp-18400]
      mov	r10,[lcc]
      add	r10,[rbp - 18424]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18432],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 18456],r10
      mov	r10,[rbp - 18456]
      imul	r10,256
      mov	[rbp - 18456],r10
      mov	rdi,[rbp-18432]
      mov	r10,[lcc]
      add	r10,[rbp - 18456]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18464],rax
      mov	rdi,[rbp-18464]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18472],rax
      mov	r10,26
      add	r10,1
      mov	[rbp - 18496],r10
      mov	r10,[rbp - 18496]
      imul	r10,256
      mov	[rbp - 18496],r10
      mov	rdi,[rbp-18472]
      mov	r10,[lcc]
      add	r10,[rbp - 18496]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18504],rax
      mov	rdi,[rbp-18504]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18512],rax
      mov	r10,26
      add	r10,1
      mov	[rbp - 18536],r10
      mov	r10,[rbp - 18536]
      imul	r10,256
      mov	[rbp - 18536],r10
      mov	rdi,[rbp-18512]
      mov	r10,[lcc]
      add	r10,[rbp - 18536]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18544],rax
      mov	rdi,[rbp-18544]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  18552],rax
      mov	r10,81
      add	r10,1
      mov	[rbp - 18576],r10
      mov	r10,[rbp - 18576]
      imul	r10,256
      mov	[rbp - 18576],r10
      mov	r10,82
      add	r10,1
      mov	[rbp - 18600],r10
      mov	r10,[rbp - 18600]
      imul	r10,256
      mov	[rbp - 18600],r10
      mov	r10,[lcc]
      add	r10,[rbp - 18576]
      mov	rdi,[r10]
      mov	r10,[lcc]
      add	r10,[rbp - 18600]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18608],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 18632],r10
      mov	r10,[rbp - 18632]
      imul	r10,256
      mov	[rbp - 18632],r10
      mov	rdi,[rbp-18608]
      mov	r10,[lcc]
      add	r10,[rbp - 18632]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18640],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 18664],r10
      mov	r10,[rbp - 18664]
      imul	r10,256
      mov	[rbp - 18664],r10
      mov	rdi,[rbp-18640]
      mov	r10,[lcc]
      add	r10,[rbp - 18664]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18672],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 18696],r10
      mov	r10,[rbp - 18696]
      imul	r10,256
      mov	[rbp - 18696],r10
      mov	rdi,[rbp-18672]
      mov	r10,[lcc]
      add	r10,[rbp - 18696]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18704],rax
      mov	r10,69
      add	r10,1
      mov	[rbp - 18728],r10
      mov	r10,[rbp - 18728]
      imul	r10,256
      mov	[rbp - 18728],r10
      mov	rdi,[rbp-18704]
      mov	r10,[lcc]
      add	r10,[rbp - 18728]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18736],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 18760],r10
      mov	r10,[rbp - 18760]
      imul	r10,256
      mov	[rbp - 18760],r10
      mov	rdi,[rbp-18736]
      mov	r10,[lcc]
      add	r10,[rbp - 18760]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18768],rax
      mov	r10,63
      add	r10,1
      mov	[rbp - 18792],r10
      mov	r10,[rbp - 18792]
      imul	r10,256
      mov	[rbp - 18792],r10
      mov	rdi,[rbp-18768]
      mov	r10,[lcc]
      add	r10,[rbp - 18792]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18800],rax
      mov	r10,17
      add	r10,1
      mov	[rbp - 18824],r10
      mov	r10,[rbp - 18824]
      imul	r10,256
      mov	[rbp - 18824],r10
      mov	rdi,[rbp-18800]
      mov	r10,[lcc]
      add	r10,[rbp - 18824]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18832],rax
      mov	r10,79
      add	r10,1
      mov	[rbp - 18856],r10
      mov	r10,[rbp - 18856]
      imul	r10,256
      mov	[rbp - 18856],r10
      mov	rdi,[rbp-18832]
      mov	r10,[lcc]
      add	r10,[rbp - 18856]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18864],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 18888],r10
      mov	r10,[rbp - 18888]
      imul	r10,256
      mov	[rbp - 18888],r10
      mov	rdi,[rbp-18864]
      mov	r10,[lcc]
      add	r10,[rbp - 18888]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18896],rax
      mov	rdi,[rbp-18896]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18904],rax
      mov	rdi,[rbp-18904]
      mov	rsi,[lca2b]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18912],rax
      mov	rdi,[rbp-18912]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18920],rax
      mov	rdi,[rbp-18920]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18928],rax
      mov	r10,26
      add	r10,1
      mov	[rbp - 18952],r10
      mov	r10,[rbp - 18952]
      imul	r10,256
      mov	[rbp - 18952],r10
      mov	rdi,[rbp-18928]
      mov	r10,[lcc]
      add	r10,[rbp - 18952]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  18960],rax
      mov	rdi,[rbp-18960]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  18968],rax
      mov	r10,81
      add	r10,1
      mov	[rbp - 18992],r10
      mov	r10,[rbp - 18992]
      imul	r10,256
      mov	[rbp - 18992],r10
      mov	r10,82
      add	r10,1
      mov	[rbp - 19016],r10
      mov	r10,[rbp - 19016]
      imul	r10,256
      mov	[rbp - 19016],r10
      mov	r10,[lcc]
      add	r10,[rbp - 18992]
      mov	rdi,[r10]
      mov	r10,[lcc]
      add	r10,[rbp - 19016]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  19024],rax
      mov	r10,80
      add	r10,1
      mov	[rbp - 19048],r10
      mov	r10,[rbp - 19048]
      imul	r10,256
      mov	[rbp - 19048],r10
      mov	rdi,[rbp-19024]
      mov	r10,[lcc]
      add	r10,[rbp - 19048]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  19056],rax
      mov	r10,71
      add	r10,1
      mov	[rbp - 19080],r10
      mov	r10,[rbp - 19080]
      imul	r10,256
      mov	[rbp - 19080],r10
      mov	rdi,[rbp-19056]
      mov	r10,[lcc]
      add	r10,[rbp - 19080]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  19088],rax
      mov	r10,76
      add	r10,1
      mov	[rbp - 19112],r10
      mov	r10,[rbp - 19112]
      imul	r10,256
      mov	[rbp - 19112],r10
      mov	rdi,[rbp-19088]
      mov	r10,[lcc]
      add	r10,[rbp - 19112]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  19120],rax
      mov	r10,69
      add	r10,1
      mov	[rbp - 19144],r10
      mov	r10,[rbp - 19144]
      imul	r10,256
      mov	[rbp - 19144],r10
      mov	rdi,[rbp-19120]
      mov	r10,[lcc]
      add	r10,[rbp - 19144]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  19152],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 19176],r10
      mov	r10,[rbp - 19176]
      imul	r10,256
      mov	[rbp - 19176],r10
      mov	rdi,[rbp-19152]
      mov	r10,[lcc]
      add	r10,[rbp - 19176]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  19184],rax
      mov	r10,63
      add	r10,1
      mov	[rbp - 19208],r10
      mov	r10,[rbp - 19208]
      imul	r10,256
      mov	[rbp - 19208],r10
      mov	rdi,[rbp-19184]
      mov	r10,[lcc]
      add	r10,[rbp - 19208]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  19216],rax
      mov	r10,17
      add	r10,1
      mov	[rbp - 19240],r10
      mov	r10,[rbp - 19240]
      imul	r10,256
      mov	[rbp - 19240],r10
      mov	rdi,[rbp-19216]
      mov	r10,[lcc]
      add	r10,[rbp - 19240]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  19248],rax
      mov	r10,64
      add	r10,1
      mov	[rbp - 19272],r10
      mov	r10,[rbp - 19272]
      imul	r10,256
      mov	[rbp - 19272],r10
      mov	rdi,[rbp-19248]
      mov	r10,[lcc]
      add	r10,[rbp - 19272]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  19280],rax
      mov	r10,28
      add	r10,1
      mov	[rbp - 19304],r10
      mov	r10,[rbp - 19304]
      imul	r10,256
      mov	[rbp - 19304],r10
      mov	rdi,[rbp-19280]
      mov	r10,[lcc]
      add	r10,[rbp - 19304]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  19312],rax
      mov	rdi,[rbp-19312]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  19320],rax
      mov	rdi,[rbp-19320]
      mov	rsi,[lca2b]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  19328],rax
      mov	rdi,[rbp-19328]
      mov	rsi,[lca2b]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  19336],rax
      mov	rdi,[rbp-19336]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  19344],rax
      mov	r10,26
      add	r10,1
      mov	[rbp - 19368],r10
      mov	r10,[rbp - 19368]
      imul	r10,256
      mov	[rbp - 19368],r10
      mov	rdi,[rbp-19344]
      mov	r10,[lcc]
      add	r10,[rbp - 19368]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  19376],rax
      mov	rdi,[rbp-19376]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  19384],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 19408],r10
      mov	r10,[rbp - 19408]
      imul	r10,256
      mov	[rbp - 19408],r10
      mov	r10,[lcs]
      add	r10,[rbp - 19408]
      mov	rdi,[r10]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  19416],rax
      mov	qword[rbp - 488],0
_0for:
      mov	rdi,[rbp-488]
      push	r10
      push	r11
      call	c2
      pop	r11
      pop	r10
      mov	[rbp -  19424],rax
      mov	rdi,[rbp-19424]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  19432],rax
      mov	r10,[rbp - 488]
      add	r10,1
      mov	[rbp - 19456],r10
      mov	r10,[rbp - 19456]
      imul	r10,256
      mov	[rbp - 19456],r10
      mov	rdi,[rbp-19432]
      mov	r10,[lcc]
      add	r10,[rbp - 19456]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  19464],rax
      mov	rdi,[rbp-19464]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  19472],rax
      mov	rdi,[rbp-19472]
      mov	rsi,[lcco]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  19480],rax
      mov	rdi,[rbp-19480]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  19488],rax
_0while:
      mov	r10,[rbp - 488]
      mov	[rbp - 19496],r10
      mov	r10,[rbp - 488]
      add	r10,1
      mov	[rbp - 488],r10
      mov	r10,[rbp - 488]
      cmp	r10,93
      setl r10b
      movzx r10,r10b
      mov	[rbp - 19504],r10
      mov	r10,[rbp -  19504]
      cmp	r10,1
      je	_0for
_0forback:
      mov	qword[rbp - 488],0
_1for:
      mov	rdi,[rbp-488]
      push	r10
      push	r11
      call	s2
      pop	r11
      pop	r10
      mov	[rbp -  19512],rax
      mov	rdi,[rbp-19512]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  19520],rax
      mov	r10,[rbp - 488]
      add	r10,1
      mov	[rbp - 19544],r10
      mov	r10,[rbp - 19544]
      imul	r10,256
      mov	[rbp - 19544],r10
      mov	rdi,[rbp-19520]
      mov	r10,[lcs]
      add	r10,[rbp - 19544]
      mov	rsi,[r10]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  19552],rax
      mov	rdi,[rbp-19552]
      mov	rsi,[lca2q]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  19560],rax
      mov	rdi,[rbp-19560]
      mov	rsi,[lcco]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  19568],rax
      mov	rdi,[rbp-19568]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  19576],rax
_1while:
      mov	r10,[rbp - 488]
      mov	[rbp - 19584],r10
      mov	r10,[rbp - 488]
      add	r10,1
      mov	[rbp - 488],r10
      mov	r10,[rbp - 488]
      cmp	r10,32
      setl r10b
      movzx r10,r10b
      mov	[rbp - 19592],r10
      mov	r10,[rbp -  19592]
      cmp	r10,1
      je	_1for
_1forback:
      mov	qword[rbp - 488],1
_2for:
      mov	r10,[rbp - 488]
      add	r10,1
      mov	[rbp - 19616],r10
      mov	r10,[rbp - 19616]
      imul	r10,256
      mov	[rbp - 19616],r10
      mov	r10,[lcs]
      add	r10,[rbp - 19616]
      mov	rdi,[r10]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  19624],rax
_2while:
      mov	r10,[rbp - 488]
      mov	[rbp - 19632],r10
      mov	r10,[rbp - 488]
      add	r10,1
      mov	[rbp - 488],r10
      mov	r10,[rbp - 488]
      cmp	r10,32
      setl r10b
      movzx r10,r10b
      mov	[rbp - 19640],r10
      mov	r10,[rbp -  19640]
      cmp	r10,1
      je	_2for
_2forback:
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

lcs:
	dq 0
lcc:
	dq 0
lcco:
	dq 0
lca2q:
	dq 0
lca2b:
	dq 0
section .bss
stringbuffer:
	resb 256

