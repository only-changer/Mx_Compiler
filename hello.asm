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
      sub	rsp,2024
      mov	qword[A],1
      mov	qword[B],1
      mov	qword[C],1
_0for:
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 8],r10
      mov	r10,[rbp - 8]
      add	r10,[B]
      mov	[rbp - 16],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 24],r10
      mov	r10,[rbp - 16]
      sub	r10,[rbp - 24]
      mov	[rbp - 32],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 40],r10
      mov	r10,[rbp - 40]
      add	r10,[B]
      mov	[rbp - 48],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 56],r10
      mov	r10,[rbp - 48]
      sub	r10,[rbp - 56]
      mov	[rbp - 64],r10
      mov	r10,[rbp - 32]
      add	r10,[rbp - 64]
      mov	[rbp - 72],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 80],r10
      mov	r10,[rbp - 80]
      add	r10,[B]
      mov	[rbp - 88],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 96],r10
      mov	r10,[rbp - 88]
      sub	r10,[rbp - 96]
      mov	[rbp - 104],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 112],r10
      mov	r10,[rbp - 112]
      add	r10,[B]
      mov	[rbp - 120],r10
      mov	r10,[rbp - 104]
      add	r10,[rbp - 120]
      mov	[rbp - 128],r10
      mov	r10,[rbp - 72]
      add	r10,[rbp - 128]
      mov	[rbp - 136],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 144],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 152],r10
      mov	r10,[rbp - 152]
      add	r10,[B]
      mov	[rbp - 160],r10
      mov	r10,[rbp - 144]
      add	r10,[rbp - 160]
      mov	[rbp - 168],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 176],r10
      mov	r10,[rbp - 168]
      sub	r10,[rbp - 176]
      mov	[rbp - 184],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 192],r10
      mov	r10,[rbp - 192]
      add	r10,[B]
      mov	[rbp - 200],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 208],r10
      mov	r10,[rbp - 200]
      sub	r10,[rbp - 208]
      mov	[rbp - 216],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 224],r10
      mov	r10,[rbp - 224]
      add	r10,[B]
      mov	[rbp - 232],r10
      mov	r10,[rbp - 216]
      add	r10,[rbp - 232]
      mov	[rbp - 240],r10
      mov	r10,[rbp - 184]
      add	r10,[rbp - 240]
      mov	[rbp - 248],r10
      mov	r10,[rbp - 136]
      sub	r10,[rbp - 248]
      mov	[rbp - 256],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 264],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 272],r10
      mov	r10,[rbp - 272]
      add	r10,[B]
      mov	[rbp - 280],r10
      mov	r10,[rbp - 264]
      add	r10,[rbp - 280]
      mov	[rbp - 288],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 296],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 304],r10
      mov	r10,[rbp - 304]
      add	r10,[B]
      mov	[rbp - 312],r10
      mov	r10,[rbp - 296]
      add	r10,[rbp - 312]
      mov	[rbp - 320],r10
      mov	r10,[rbp - 288]
      sub	r10,[rbp - 320]
      mov	[rbp - 328],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 336],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 344],r10
      mov	r10,[rbp - 344]
      add	r10,[B]
      mov	[rbp - 352],r10
      mov	r10,[rbp - 336]
      add	r10,[rbp - 352]
      mov	[rbp - 360],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 368],r10
      mov	r10,[rbp - 360]
      sub	r10,[rbp - 368]
      mov	[rbp - 376],r10
      mov	r10,[rbp - 328]
      sub	r10,[rbp - 376]
      mov	[rbp - 384],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 392],r10
      mov	r10,[rbp - 392]
      add	r10,[B]
      mov	[rbp - 400],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 408],r10
      mov	r10,[rbp - 400]
      sub	r10,[rbp - 408]
      mov	[rbp - 416],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 424],r10
      mov	r10,[rbp - 424]
      add	r10,[B]
      mov	[rbp - 432],r10
      mov	r10,[rbp - 416]
      add	r10,[rbp - 432]
      mov	[rbp - 440],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 448],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 456],r10
      mov	r10,[rbp - 456]
      add	r10,[B]
      mov	[rbp - 464],r10
      mov	r10,[rbp - 448]
      add	r10,[rbp - 464]
      mov	[rbp - 472],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 480],r10
      mov	r10,[rbp - 472]
      sub	r10,[rbp - 480]
      mov	[rbp - 488],r10
      mov	r10,[rbp - 440]
      sub	r10,[rbp - 488]
      mov	[rbp - 496],r10
      mov	r10,[rbp - 384]
      add	r10,[rbp - 496]
      mov	[rbp - 504],r10
      mov	r10,[rbp - 256]
      sub	r10,[rbp - 504]
      mov	[rbp - 512],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 520],r10
      mov	r10,[rbp - 520]
      add	r10,[B]
      mov	[rbp - 528],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 536],r10
      mov	r10,[rbp - 528]
      sub	r10,[rbp - 536]
      mov	[rbp - 544],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 552],r10
      mov	r10,[rbp - 552]
      add	r10,[B]
      mov	[rbp - 560],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 568],r10
      mov	r10,[rbp - 560]
      sub	r10,[rbp - 568]
      mov	[rbp - 576],r10
      mov	r10,[rbp - 544]
      add	r10,[rbp - 576]
      mov	[rbp - 584],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 592],r10
      mov	r10,[rbp - 592]
      add	r10,[B]
      mov	[rbp - 600],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 608],r10
      mov	r10,[rbp - 600]
      sub	r10,[rbp - 608]
      mov	[rbp - 616],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 624],r10
      mov	r10,[rbp - 624]
      add	r10,[B]
      mov	[rbp - 632],r10
      mov	r10,[rbp - 616]
      add	r10,[rbp - 632]
      mov	[rbp - 640],r10
      mov	r10,[rbp - 584]
      add	r10,[rbp - 640]
      mov	[rbp - 648],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 656],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 664],r10
      mov	r10,[rbp - 664]
      add	r10,[B]
      mov	[rbp - 672],r10
      mov	r10,[rbp - 656]
      add	r10,[rbp - 672]
      mov	[rbp - 680],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 688],r10
      mov	r10,[rbp - 680]
      sub	r10,[rbp - 688]
      mov	[rbp - 696],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 704],r10
      mov	r10,[rbp - 704]
      add	r10,[B]
      mov	[rbp - 712],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 720],r10
      mov	r10,[rbp - 712]
      sub	r10,[rbp - 720]
      mov	[rbp - 728],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 736],r10
      mov	r10,[rbp - 736]
      add	r10,[B]
      mov	[rbp - 744],r10
      mov	r10,[rbp - 728]
      add	r10,[rbp - 744]
      mov	[rbp - 752],r10
      mov	r10,[rbp - 696]
      add	r10,[rbp - 752]
      mov	[rbp - 760],r10
      mov	r10,[rbp - 648]
      sub	r10,[rbp - 760]
      mov	[rbp - 768],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 776],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 784],r10
      mov	r10,[rbp - 784]
      add	r10,[B]
      mov	[rbp - 792],r10
      mov	r10,[rbp - 776]
      add	r10,[rbp - 792]
      mov	[rbp - 800],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 808],r10
      mov	r10,[rbp - 800]
      sub	r10,[rbp - 808]
      mov	[rbp - 816],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 824],r10
      mov	r10,[rbp - 824]
      add	r10,[B]
      mov	[rbp - 832],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 840],r10
      mov	r10,[rbp - 832]
      sub	r10,[rbp - 840]
      mov	[rbp - 848],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 856],r10
      mov	r10,[rbp - 856]
      add	r10,[B]
      mov	[rbp - 864],r10
      mov	r10,[rbp - 848]
      add	r10,[rbp - 864]
      mov	[rbp - 872],r10
      mov	r10,[rbp - 816]
      add	r10,[rbp - 872]
      mov	[rbp - 880],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 888],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 896],r10
      mov	r10,[rbp - 896]
      add	r10,[B]
      mov	[rbp - 904],r10
      mov	r10,[rbp - 888]
      add	r10,[rbp - 904]
      mov	[rbp - 912],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 920],r10
      mov	r10,[rbp - 912]
      sub	r10,[rbp - 920]
      mov	[rbp - 928],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 936],r10
      mov	r10,[rbp - 936]
      add	r10,[B]
      mov	[rbp - 944],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 952],r10
      mov	r10,[rbp - 944]
      sub	r10,[rbp - 952]
      mov	[rbp - 960],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 968],r10
      mov	r10,[rbp - 968]
      add	r10,[B]
      mov	[rbp - 976],r10
      mov	r10,[rbp - 960]
      add	r10,[rbp - 976]
      mov	[rbp - 984],r10
      mov	r10,[rbp - 928]
      add	r10,[rbp - 984]
      mov	[rbp - 992],r10
      mov	r10,[rbp - 880]
      sub	r10,[rbp - 992]
      mov	[rbp - 1000],r10
      mov	r10,[rbp - 768]
      sub	r10,[rbp - 1000]
      mov	[rbp - 1008],r10
      mov	r10,[rbp - 512]
      add	r10,[rbp - 1008]
      mov	[rbp - 1016],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1024],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1032],r10
      mov	r10,[rbp - 1032]
      add	r10,[B]
      mov	[rbp - 1040],r10
      mov	r10,[rbp - 1024]
      add	r10,[rbp - 1040]
      mov	[rbp - 1048],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1056],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1064],r10
      mov	r10,[rbp - 1064]
      add	r10,[B]
      mov	[rbp - 1072],r10
      mov	r10,[rbp - 1056]
      add	r10,[rbp - 1072]
      mov	[rbp - 1080],r10
      mov	r10,[rbp - 1048]
      sub	r10,[rbp - 1080]
      mov	[rbp - 1088],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1096],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1104],r10
      mov	r10,[rbp - 1104]
      add	r10,[B]
      mov	[rbp - 1112],r10
      mov	r10,[rbp - 1096]
      add	r10,[rbp - 1112]
      mov	[rbp - 1120],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1128],r10
      mov	r10,[rbp - 1120]
      sub	r10,[rbp - 1128]
      mov	[rbp - 1136],r10
      mov	r10,[rbp - 1088]
      sub	r10,[rbp - 1136]
      mov	[rbp - 1144],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1152],r10
      mov	r10,[rbp - 1152]
      add	r10,[B]
      mov	[rbp - 1160],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1168],r10
      mov	r10,[rbp - 1160]
      sub	r10,[rbp - 1168]
      mov	[rbp - 1176],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1184],r10
      mov	r10,[rbp - 1184]
      add	r10,[B]
      mov	[rbp - 1192],r10
      mov	r10,[rbp - 1176]
      add	r10,[rbp - 1192]
      mov	[rbp - 1200],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1208],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1216],r10
      mov	r10,[rbp - 1216]
      add	r10,[B]
      mov	[rbp - 1224],r10
      mov	r10,[rbp - 1208]
      add	r10,[rbp - 1224]
      mov	[rbp - 1232],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1240],r10
      mov	r10,[rbp - 1232]
      sub	r10,[rbp - 1240]
      mov	[rbp - 1248],r10
      mov	r10,[rbp - 1200]
      sub	r10,[rbp - 1248]
      mov	[rbp - 1256],r10
      mov	r10,[rbp - 1144]
      add	r10,[rbp - 1256]
      mov	[rbp - 1264],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1272],r10
      mov	r10,[rbp - 1272]
      add	r10,[B]
      mov	[rbp - 1280],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1288],r10
      mov	r10,[rbp - 1280]
      sub	r10,[rbp - 1288]
      mov	[rbp - 1296],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1304],r10
      mov	r10,[rbp - 1304]
      add	r10,[B]
      mov	[rbp - 1312],r10
      mov	r10,[rbp - 1296]
      add	r10,[rbp - 1312]
      mov	[rbp - 1320],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1328],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1336],r10
      mov	r10,[rbp - 1336]
      add	r10,[B]
      mov	[rbp - 1344],r10
      mov	r10,[rbp - 1328]
      add	r10,[rbp - 1344]
      mov	[rbp - 1352],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1360],r10
      mov	r10,[rbp - 1352]
      sub	r10,[rbp - 1360]
      mov	[rbp - 1368],r10
      mov	r10,[rbp - 1320]
      sub	r10,[rbp - 1368]
      mov	[rbp - 1376],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1384],r10
      mov	r10,[rbp - 1384]
      add	r10,[B]
      mov	[rbp - 1392],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1400],r10
      mov	r10,[rbp - 1392]
      sub	r10,[rbp - 1400]
      mov	[rbp - 1408],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1416],r10
      mov	r10,[rbp - 1416]
      add	r10,[B]
      mov	[rbp - 1424],r10
      mov	r10,[rbp - 1408]
      add	r10,[rbp - 1424]
      mov	[rbp - 1432],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1440],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1448],r10
      mov	r10,[rbp - 1448]
      add	r10,[B]
      mov	[rbp - 1456],r10
      mov	r10,[rbp - 1440]
      add	r10,[rbp - 1456]
      mov	[rbp - 1464],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1472],r10
      mov	r10,[rbp - 1464]
      sub	r10,[rbp - 1472]
      mov	[rbp - 1480],r10
      mov	r10,[rbp - 1432]
      sub	r10,[rbp - 1480]
      mov	[rbp - 1488],r10
      mov	r10,[rbp - 1376]
      add	r10,[rbp - 1488]
      mov	[rbp - 1496],r10
      mov	r10,[rbp - 1264]
      add	r10,[rbp - 1496]
      mov	[rbp - 1504],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1512],r10
      mov	r10,[rbp - 1512]
      add	r10,[B]
      mov	[rbp - 1520],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1528],r10
      mov	r10,[rbp - 1520]
      sub	r10,[rbp - 1528]
      mov	[rbp - 1536],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1544],r10
      mov	r10,[rbp - 1544]
      add	r10,[B]
      mov	[rbp - 1552],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1560],r10
      mov	r10,[rbp - 1552]
      sub	r10,[rbp - 1560]
      mov	[rbp - 1568],r10
      mov	r10,[rbp - 1536]
      add	r10,[rbp - 1568]
      mov	[rbp - 1576],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1584],r10
      mov	r10,[rbp - 1584]
      add	r10,[B]
      mov	[rbp - 1592],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1600],r10
      mov	r10,[rbp - 1592]
      sub	r10,[rbp - 1600]
      mov	[rbp - 1608],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1616],r10
      mov	r10,[rbp - 1616]
      add	r10,[B]
      mov	[rbp - 1624],r10
      mov	r10,[rbp - 1608]
      add	r10,[rbp - 1624]
      mov	[rbp - 1632],r10
      mov	r10,[rbp - 1576]
      add	r10,[rbp - 1632]
      mov	[rbp - 1640],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1648],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1656],r10
      mov	r10,[rbp - 1656]
      add	r10,[B]
      mov	[rbp - 1664],r10
      mov	r10,[rbp - 1648]
      add	r10,[rbp - 1664]
      mov	[rbp - 1672],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1680],r10
      mov	r10,[rbp - 1672]
      sub	r10,[rbp - 1680]
      mov	[rbp - 1688],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1696],r10
      mov	r10,[rbp - 1696]
      add	r10,[B]
      mov	[rbp - 1704],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1712],r10
      mov	r10,[rbp - 1704]
      sub	r10,[rbp - 1712]
      mov	[rbp - 1720],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1728],r10
      mov	r10,[rbp - 1728]
      add	r10,[B]
      mov	[rbp - 1736],r10
      mov	r10,[rbp - 1720]
      add	r10,[rbp - 1736]
      mov	[rbp - 1744],r10
      mov	r10,[rbp - 1688]
      add	r10,[rbp - 1744]
      mov	[rbp - 1752],r10
      mov	r10,[rbp - 1640]
      sub	r10,[rbp - 1752]
      mov	[rbp - 1760],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1768],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1776],r10
      mov	r10,[rbp - 1776]
      add	r10,[B]
      mov	[rbp - 1784],r10
      mov	r10,[rbp - 1768]
      add	r10,[rbp - 1784]
      mov	[rbp - 1792],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1800],r10
      mov	r10,[rbp - 1792]
      sub	r10,[rbp - 1800]
      mov	[rbp - 1808],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1816],r10
      mov	r10,[rbp - 1816]
      add	r10,[B]
      mov	[rbp - 1824],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1832],r10
      mov	r10,[rbp - 1824]
      sub	r10,[rbp - 1832]
      mov	[rbp - 1840],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1848],r10
      mov	r10,[rbp - 1848]
      add	r10,[B]
      mov	[rbp - 1856],r10
      mov	r10,[rbp - 1840]
      add	r10,[rbp - 1856]
      mov	[rbp - 1864],r10
      mov	r10,[rbp - 1808]
      add	r10,[rbp - 1864]
      mov	[rbp - 1872],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1880],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1888],r10
      mov	r10,[rbp - 1888]
      add	r10,[B]
      mov	[rbp - 1896],r10
      mov	r10,[rbp - 1880]
      add	r10,[rbp - 1896]
      mov	[rbp - 1904],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1912],r10
      mov	r10,[rbp - 1904]
      sub	r10,[rbp - 1912]
      mov	[rbp - 1920],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1928],r10
      mov	r10,[rbp - 1928]
      add	r10,[B]
      mov	[rbp - 1936],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1944],r10
      mov	r10,[rbp - 1936]
      sub	r10,[rbp - 1944]
      mov	[rbp - 1952],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1960],r10
      mov	r10,[rbp - 1960]
      add	r10,[B]
      mov	[rbp - 1968],r10
      mov	r10,[rbp - 1952]
      add	r10,[rbp - 1968]
      mov	[rbp - 1976],r10
      mov	r10,[rbp - 1920]
      add	r10,[rbp - 1976]
      mov	[rbp - 1984],r10
      mov	r10,[rbp - 1872]
      sub	r10,[rbp - 1984]
      mov	[rbp - 1992],r10
      mov	r10,[rbp - 1760]
      sub	r10,[rbp - 1992]
      mov	[rbp - 2000],r10
      mov	r10,[rbp - 1504]
      add	r10,[rbp - 2000]
      mov	[rbp - 2008],r10
      mov	r10,[rbp - 1016]
      sub	r10,[rbp - 2008]
      mov	[rbp - 2016],r10
      mov	r10,[rbp - 2016]
      mov	[A],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 8],r10
      mov	r10,[rbp - 8]
      add	r10,[B]
      mov	[rbp - 16],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 24],r10
      mov	r10,[rbp - 16]
      sub	r10,[rbp - 24]
      mov	[rbp - 32],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 40],r10
      mov	r10,[rbp - 40]
      add	r10,[B]
      mov	[rbp - 48],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 56],r10
      mov	r10,[rbp - 48]
      sub	r10,[rbp - 56]
      mov	[rbp - 64],r10
      mov	r10,[rbp - 32]
      add	r10,[rbp - 64]
      mov	[rbp - 72],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 80],r10
      mov	r10,[rbp - 80]
      add	r10,[B]
      mov	[rbp - 88],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 96],r10
      mov	r10,[rbp - 88]
      sub	r10,[rbp - 96]
      mov	[rbp - 104],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 112],r10
      mov	r10,[rbp - 112]
      add	r10,[B]
      mov	[rbp - 120],r10
      mov	r10,[rbp - 104]
      add	r10,[rbp - 120]
      mov	[rbp - 128],r10
      mov	r10,[rbp - 72]
      add	r10,[rbp - 128]
      mov	[rbp - 136],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 144],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 152],r10
      mov	r10,[rbp - 152]
      add	r10,[B]
      mov	[rbp - 160],r10
      mov	r10,[rbp - 144]
      add	r10,[rbp - 160]
      mov	[rbp - 168],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 176],r10
      mov	r10,[rbp - 168]
      sub	r10,[rbp - 176]
      mov	[rbp - 184],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 192],r10
      mov	r10,[rbp - 192]
      add	r10,[B]
      mov	[rbp - 200],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 208],r10
      mov	r10,[rbp - 200]
      sub	r10,[rbp - 208]
      mov	[rbp - 216],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 224],r10
      mov	r10,[rbp - 224]
      add	r10,[B]
      mov	[rbp - 232],r10
      mov	r10,[rbp - 216]
      add	r10,[rbp - 232]
      mov	[rbp - 240],r10
      mov	r10,[rbp - 184]
      add	r10,[rbp - 240]
      mov	[rbp - 248],r10
      mov	r10,[rbp - 136]
      sub	r10,[rbp - 248]
      mov	[rbp - 256],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 264],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 272],r10
      mov	r10,[rbp - 272]
      add	r10,[B]
      mov	[rbp - 280],r10
      mov	r10,[rbp - 264]
      add	r10,[rbp - 280]
      mov	[rbp - 288],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 296],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 304],r10
      mov	r10,[rbp - 304]
      add	r10,[B]
      mov	[rbp - 312],r10
      mov	r10,[rbp - 296]
      add	r10,[rbp - 312]
      mov	[rbp - 320],r10
      mov	r10,[rbp - 288]
      sub	r10,[rbp - 320]
      mov	[rbp - 328],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 336],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 344],r10
      mov	r10,[rbp - 344]
      add	r10,[B]
      mov	[rbp - 352],r10
      mov	r10,[rbp - 336]
      add	r10,[rbp - 352]
      mov	[rbp - 360],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 368],r10
      mov	r10,[rbp - 360]
      sub	r10,[rbp - 368]
      mov	[rbp - 376],r10
      mov	r10,[rbp - 328]
      sub	r10,[rbp - 376]
      mov	[rbp - 384],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 392],r10
      mov	r10,[rbp - 392]
      add	r10,[B]
      mov	[rbp - 400],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 408],r10
      mov	r10,[rbp - 400]
      sub	r10,[rbp - 408]
      mov	[rbp - 416],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 424],r10
      mov	r10,[rbp - 424]
      add	r10,[B]
      mov	[rbp - 432],r10
      mov	r10,[rbp - 416]
      add	r10,[rbp - 432]
      mov	[rbp - 440],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 448],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 456],r10
      mov	r10,[rbp - 456]
      add	r10,[B]
      mov	[rbp - 464],r10
      mov	r10,[rbp - 448]
      add	r10,[rbp - 464]
      mov	[rbp - 472],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 480],r10
      mov	r10,[rbp - 472]
      sub	r10,[rbp - 480]
      mov	[rbp - 488],r10
      mov	r10,[rbp - 440]
      sub	r10,[rbp - 488]
      mov	[rbp - 496],r10
      mov	r10,[rbp - 384]
      add	r10,[rbp - 496]
      mov	[rbp - 504],r10
      mov	r10,[rbp - 256]
      sub	r10,[rbp - 504]
      mov	[rbp - 512],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 520],r10
      mov	r10,[rbp - 520]
      add	r10,[B]
      mov	[rbp - 528],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 536],r10
      mov	r10,[rbp - 528]
      sub	r10,[rbp - 536]
      mov	[rbp - 544],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 552],r10
      mov	r10,[rbp - 552]
      add	r10,[B]
      mov	[rbp - 560],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 568],r10
      mov	r10,[rbp - 560]
      sub	r10,[rbp - 568]
      mov	[rbp - 576],r10
      mov	r10,[rbp - 544]
      add	r10,[rbp - 576]
      mov	[rbp - 584],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 592],r10
      mov	r10,[rbp - 592]
      add	r10,[B]
      mov	[rbp - 600],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 608],r10
      mov	r10,[rbp - 600]
      sub	r10,[rbp - 608]
      mov	[rbp - 616],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 624],r10
      mov	r10,[rbp - 624]
      add	r10,[B]
      mov	[rbp - 632],r10
      mov	r10,[rbp - 616]
      add	r10,[rbp - 632]
      mov	[rbp - 640],r10
      mov	r10,[rbp - 584]
      add	r10,[rbp - 640]
      mov	[rbp - 648],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 656],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 664],r10
      mov	r10,[rbp - 664]
      add	r10,[B]
      mov	[rbp - 672],r10
      mov	r10,[rbp - 656]
      add	r10,[rbp - 672]
      mov	[rbp - 680],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 688],r10
      mov	r10,[rbp - 680]
      sub	r10,[rbp - 688]
      mov	[rbp - 696],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 704],r10
      mov	r10,[rbp - 704]
      add	r10,[B]
      mov	[rbp - 712],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 720],r10
      mov	r10,[rbp - 712]
      sub	r10,[rbp - 720]
      mov	[rbp - 728],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 736],r10
      mov	r10,[rbp - 736]
      add	r10,[B]
      mov	[rbp - 744],r10
      mov	r10,[rbp - 728]
      add	r10,[rbp - 744]
      mov	[rbp - 752],r10
      mov	r10,[rbp - 696]
      add	r10,[rbp - 752]
      mov	[rbp - 760],r10
      mov	r10,[rbp - 648]
      sub	r10,[rbp - 760]
      mov	[rbp - 768],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 776],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 784],r10
      mov	r10,[rbp - 784]
      add	r10,[B]
      mov	[rbp - 792],r10
      mov	r10,[rbp - 776]
      add	r10,[rbp - 792]
      mov	[rbp - 800],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 808],r10
      mov	r10,[rbp - 800]
      sub	r10,[rbp - 808]
      mov	[rbp - 816],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 824],r10
      mov	r10,[rbp - 824]
      add	r10,[B]
      mov	[rbp - 832],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 840],r10
      mov	r10,[rbp - 832]
      sub	r10,[rbp - 840]
      mov	[rbp - 848],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 856],r10
      mov	r10,[rbp - 856]
      add	r10,[B]
      mov	[rbp - 864],r10
      mov	r10,[rbp - 848]
      add	r10,[rbp - 864]
      mov	[rbp - 872],r10
      mov	r10,[rbp - 816]
      add	r10,[rbp - 872]
      mov	[rbp - 880],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 888],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 896],r10
      mov	r10,[rbp - 896]
      add	r10,[B]
      mov	[rbp - 904],r10
      mov	r10,[rbp - 888]
      add	r10,[rbp - 904]
      mov	[rbp - 912],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 920],r10
      mov	r10,[rbp - 912]
      sub	r10,[rbp - 920]
      mov	[rbp - 928],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 936],r10
      mov	r10,[rbp - 936]
      add	r10,[B]
      mov	[rbp - 944],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 952],r10
      mov	r10,[rbp - 944]
      sub	r10,[rbp - 952]
      mov	[rbp - 960],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 968],r10
      mov	r10,[rbp - 968]
      add	r10,[B]
      mov	[rbp - 976],r10
      mov	r10,[rbp - 960]
      add	r10,[rbp - 976]
      mov	[rbp - 984],r10
      mov	r10,[rbp - 928]
      add	r10,[rbp - 984]
      mov	[rbp - 992],r10
      mov	r10,[rbp - 880]
      sub	r10,[rbp - 992]
      mov	[rbp - 1000],r10
      mov	r10,[rbp - 768]
      sub	r10,[rbp - 1000]
      mov	[rbp - 1008],r10
      mov	r10,[rbp - 512]
      add	r10,[rbp - 1008]
      mov	[rbp - 1016],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1024],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1032],r10
      mov	r10,[rbp - 1032]
      add	r10,[B]
      mov	[rbp - 1040],r10
      mov	r10,[rbp - 1024]
      add	r10,[rbp - 1040]
      mov	[rbp - 1048],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1056],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1064],r10
      mov	r10,[rbp - 1064]
      add	r10,[B]
      mov	[rbp - 1072],r10
      mov	r10,[rbp - 1056]
      add	r10,[rbp - 1072]
      mov	[rbp - 1080],r10
      mov	r10,[rbp - 1048]
      sub	r10,[rbp - 1080]
      mov	[rbp - 1088],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1096],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1104],r10
      mov	r10,[rbp - 1104]
      add	r10,[B]
      mov	[rbp - 1112],r10
      mov	r10,[rbp - 1096]
      add	r10,[rbp - 1112]
      mov	[rbp - 1120],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1128],r10
      mov	r10,[rbp - 1120]
      sub	r10,[rbp - 1128]
      mov	[rbp - 1136],r10
      mov	r10,[rbp - 1088]
      sub	r10,[rbp - 1136]
      mov	[rbp - 1144],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1152],r10
      mov	r10,[rbp - 1152]
      add	r10,[B]
      mov	[rbp - 1160],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1168],r10
      mov	r10,[rbp - 1160]
      sub	r10,[rbp - 1168]
      mov	[rbp - 1176],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1184],r10
      mov	r10,[rbp - 1184]
      add	r10,[B]
      mov	[rbp - 1192],r10
      mov	r10,[rbp - 1176]
      add	r10,[rbp - 1192]
      mov	[rbp - 1200],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1208],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1216],r10
      mov	r10,[rbp - 1216]
      add	r10,[B]
      mov	[rbp - 1224],r10
      mov	r10,[rbp - 1208]
      add	r10,[rbp - 1224]
      mov	[rbp - 1232],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1240],r10
      mov	r10,[rbp - 1232]
      sub	r10,[rbp - 1240]
      mov	[rbp - 1248],r10
      mov	r10,[rbp - 1200]
      sub	r10,[rbp - 1248]
      mov	[rbp - 1256],r10
      mov	r10,[rbp - 1144]
      add	r10,[rbp - 1256]
      mov	[rbp - 1264],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1272],r10
      mov	r10,[rbp - 1272]
      add	r10,[B]
      mov	[rbp - 1280],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1288],r10
      mov	r10,[rbp - 1280]
      sub	r10,[rbp - 1288]
      mov	[rbp - 1296],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1304],r10
      mov	r10,[rbp - 1304]
      add	r10,[B]
      mov	[rbp - 1312],r10
      mov	r10,[rbp - 1296]
      add	r10,[rbp - 1312]
      mov	[rbp - 1320],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1328],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1336],r10
      mov	r10,[rbp - 1336]
      add	r10,[B]
      mov	[rbp - 1344],r10
      mov	r10,[rbp - 1328]
      add	r10,[rbp - 1344]
      mov	[rbp - 1352],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1360],r10
      mov	r10,[rbp - 1352]
      sub	r10,[rbp - 1360]
      mov	[rbp - 1368],r10
      mov	r10,[rbp - 1320]
      sub	r10,[rbp - 1368]
      mov	[rbp - 1376],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1384],r10
      mov	r10,[rbp - 1384]
      add	r10,[B]
      mov	[rbp - 1392],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1400],r10
      mov	r10,[rbp - 1392]
      sub	r10,[rbp - 1400]
      mov	[rbp - 1408],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1416],r10
      mov	r10,[rbp - 1416]
      add	r10,[B]
      mov	[rbp - 1424],r10
      mov	r10,[rbp - 1408]
      add	r10,[rbp - 1424]
      mov	[rbp - 1432],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1440],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1448],r10
      mov	r10,[rbp - 1448]
      add	r10,[B]
      mov	[rbp - 1456],r10
      mov	r10,[rbp - 1440]
      add	r10,[rbp - 1456]
      mov	[rbp - 1464],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1472],r10
      mov	r10,[rbp - 1464]
      sub	r10,[rbp - 1472]
      mov	[rbp - 1480],r10
      mov	r10,[rbp - 1432]
      sub	r10,[rbp - 1480]
      mov	[rbp - 1488],r10
      mov	r10,[rbp - 1376]
      add	r10,[rbp - 1488]
      mov	[rbp - 1496],r10
      mov	r10,[rbp - 1264]
      add	r10,[rbp - 1496]
      mov	[rbp - 1504],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1512],r10
      mov	r10,[rbp - 1512]
      add	r10,[B]
      mov	[rbp - 1520],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1528],r10
      mov	r10,[rbp - 1520]
      sub	r10,[rbp - 1528]
      mov	[rbp - 1536],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1544],r10
      mov	r10,[rbp - 1544]
      add	r10,[B]
      mov	[rbp - 1552],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1560],r10
      mov	r10,[rbp - 1552]
      sub	r10,[rbp - 1560]
      mov	[rbp - 1568],r10
      mov	r10,[rbp - 1536]
      add	r10,[rbp - 1568]
      mov	[rbp - 1576],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1584],r10
      mov	r10,[rbp - 1584]
      add	r10,[B]
      mov	[rbp - 1592],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1600],r10
      mov	r10,[rbp - 1592]
      sub	r10,[rbp - 1600]
      mov	[rbp - 1608],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1616],r10
      mov	r10,[rbp - 1616]
      add	r10,[B]
      mov	[rbp - 1624],r10
      mov	r10,[rbp - 1608]
      add	r10,[rbp - 1624]
      mov	[rbp - 1632],r10
      mov	r10,[rbp - 1576]
      add	r10,[rbp - 1632]
      mov	[rbp - 1640],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1648],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1656],r10
      mov	r10,[rbp - 1656]
      add	r10,[B]
      mov	[rbp - 1664],r10
      mov	r10,[rbp - 1648]
      add	r10,[rbp - 1664]
      mov	[rbp - 1672],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1680],r10
      mov	r10,[rbp - 1672]
      sub	r10,[rbp - 1680]
      mov	[rbp - 1688],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1696],r10
      mov	r10,[rbp - 1696]
      add	r10,[B]
      mov	[rbp - 1704],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1712],r10
      mov	r10,[rbp - 1704]
      sub	r10,[rbp - 1712]
      mov	[rbp - 1720],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1728],r10
      mov	r10,[rbp - 1728]
      add	r10,[B]
      mov	[rbp - 1736],r10
      mov	r10,[rbp - 1720]
      add	r10,[rbp - 1736]
      mov	[rbp - 1744],r10
      mov	r10,[rbp - 1688]
      add	r10,[rbp - 1744]
      mov	[rbp - 1752],r10
      mov	r10,[rbp - 1640]
      sub	r10,[rbp - 1752]
      mov	[rbp - 1760],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1768],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1776],r10
      mov	r10,[rbp - 1776]
      add	r10,[B]
      mov	[rbp - 1784],r10
      mov	r10,[rbp - 1768]
      add	r10,[rbp - 1784]
      mov	[rbp - 1792],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1800],r10
      mov	r10,[rbp - 1792]
      sub	r10,[rbp - 1800]
      mov	[rbp - 1808],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1816],r10
      mov	r10,[rbp - 1816]
      add	r10,[B]
      mov	[rbp - 1824],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1832],r10
      mov	r10,[rbp - 1824]
      sub	r10,[rbp - 1832]
      mov	[rbp - 1840],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1848],r10
      mov	r10,[rbp - 1848]
      add	r10,[B]
      mov	[rbp - 1856],r10
      mov	r10,[rbp - 1840]
      add	r10,[rbp - 1856]
      mov	[rbp - 1864],r10
      mov	r10,[rbp - 1808]
      add	r10,[rbp - 1864]
      mov	[rbp - 1872],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1880],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1888],r10
      mov	r10,[rbp - 1888]
      add	r10,[B]
      mov	[rbp - 1896],r10
      mov	r10,[rbp - 1880]
      add	r10,[rbp - 1896]
      mov	[rbp - 1904],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1912],r10
      mov	r10,[rbp - 1904]
      sub	r10,[rbp - 1912]
      mov	[rbp - 1920],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1928],r10
      mov	r10,[rbp - 1928]
      add	r10,[B]
      mov	[rbp - 1936],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1944],r10
      mov	r10,[rbp - 1936]
      sub	r10,[rbp - 1944]
      mov	[rbp - 1952],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1960],r10
      mov	r10,[rbp - 1960]
      add	r10,[B]
      mov	[rbp - 1968],r10
      mov	r10,[rbp - 1952]
      add	r10,[rbp - 1968]
      mov	[rbp - 1976],r10
      mov	r10,[rbp - 1920]
      add	r10,[rbp - 1976]
      mov	[rbp - 1984],r10
      mov	r10,[rbp - 1872]
      sub	r10,[rbp - 1984]
      mov	[rbp - 1992],r10
      mov	r10,[rbp - 1760]
      sub	r10,[rbp - 1992]
      mov	[rbp - 2000],r10
      mov	r10,[rbp - 1504]
      add	r10,[rbp - 2000]
      mov	[rbp - 2008],r10
      mov	r10,[rbp - 1016]
      sub	r10,[rbp - 2008]
      mov	[rbp - 2016],r10
      mov	r10,[rbp - 2016]
      mov	[B],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 8],r10
      mov	r10,[rbp - 8]
      add	r10,[B]
      mov	[rbp - 16],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 24],r10
      mov	r10,[rbp - 16]
      sub	r10,[rbp - 24]
      mov	[rbp - 32],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 40],r10
      mov	r10,[rbp - 40]
      add	r10,[B]
      mov	[rbp - 48],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 56],r10
      mov	r10,[rbp - 48]
      sub	r10,[rbp - 56]
      mov	[rbp - 64],r10
      mov	r10,[rbp - 32]
      add	r10,[rbp - 64]
      mov	[rbp - 72],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 80],r10
      mov	r10,[rbp - 80]
      add	r10,[B]
      mov	[rbp - 88],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 96],r10
      mov	r10,[rbp - 88]
      sub	r10,[rbp - 96]
      mov	[rbp - 104],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 112],r10
      mov	r10,[rbp - 112]
      add	r10,[B]
      mov	[rbp - 120],r10
      mov	r10,[rbp - 104]
      add	r10,[rbp - 120]
      mov	[rbp - 128],r10
      mov	r10,[rbp - 72]
      add	r10,[rbp - 128]
      mov	[rbp - 136],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 144],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 152],r10
      mov	r10,[rbp - 152]
      add	r10,[B]
      mov	[rbp - 160],r10
      mov	r10,[rbp - 144]
      add	r10,[rbp - 160]
      mov	[rbp - 168],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 176],r10
      mov	r10,[rbp - 168]
      sub	r10,[rbp - 176]
      mov	[rbp - 184],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 192],r10
      mov	r10,[rbp - 192]
      add	r10,[B]
      mov	[rbp - 200],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 208],r10
      mov	r10,[rbp - 200]
      sub	r10,[rbp - 208]
      mov	[rbp - 216],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 224],r10
      mov	r10,[rbp - 224]
      add	r10,[B]
      mov	[rbp - 232],r10
      mov	r10,[rbp - 216]
      add	r10,[rbp - 232]
      mov	[rbp - 240],r10
      mov	r10,[rbp - 184]
      add	r10,[rbp - 240]
      mov	[rbp - 248],r10
      mov	r10,[rbp - 136]
      sub	r10,[rbp - 248]
      mov	[rbp - 256],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 264],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 272],r10
      mov	r10,[rbp - 272]
      add	r10,[B]
      mov	[rbp - 280],r10
      mov	r10,[rbp - 264]
      add	r10,[rbp - 280]
      mov	[rbp - 288],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 296],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 304],r10
      mov	r10,[rbp - 304]
      add	r10,[B]
      mov	[rbp - 312],r10
      mov	r10,[rbp - 296]
      add	r10,[rbp - 312]
      mov	[rbp - 320],r10
      mov	r10,[rbp - 288]
      sub	r10,[rbp - 320]
      mov	[rbp - 328],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 336],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 344],r10
      mov	r10,[rbp - 344]
      add	r10,[B]
      mov	[rbp - 352],r10
      mov	r10,[rbp - 336]
      add	r10,[rbp - 352]
      mov	[rbp - 360],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 368],r10
      mov	r10,[rbp - 360]
      sub	r10,[rbp - 368]
      mov	[rbp - 376],r10
      mov	r10,[rbp - 328]
      sub	r10,[rbp - 376]
      mov	[rbp - 384],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 392],r10
      mov	r10,[rbp - 392]
      add	r10,[B]
      mov	[rbp - 400],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 408],r10
      mov	r10,[rbp - 400]
      sub	r10,[rbp - 408]
      mov	[rbp - 416],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 424],r10
      mov	r10,[rbp - 424]
      add	r10,[B]
      mov	[rbp - 432],r10
      mov	r10,[rbp - 416]
      add	r10,[rbp - 432]
      mov	[rbp - 440],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 448],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 456],r10
      mov	r10,[rbp - 456]
      add	r10,[B]
      mov	[rbp - 464],r10
      mov	r10,[rbp - 448]
      add	r10,[rbp - 464]
      mov	[rbp - 472],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 480],r10
      mov	r10,[rbp - 472]
      sub	r10,[rbp - 480]
      mov	[rbp - 488],r10
      mov	r10,[rbp - 440]
      sub	r10,[rbp - 488]
      mov	[rbp - 496],r10
      mov	r10,[rbp - 384]
      add	r10,[rbp - 496]
      mov	[rbp - 504],r10
      mov	r10,[rbp - 256]
      sub	r10,[rbp - 504]
      mov	[rbp - 512],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 520],r10
      mov	r10,[rbp - 520]
      add	r10,[B]
      mov	[rbp - 528],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 536],r10
      mov	r10,[rbp - 528]
      sub	r10,[rbp - 536]
      mov	[rbp - 544],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 552],r10
      mov	r10,[rbp - 552]
      add	r10,[B]
      mov	[rbp - 560],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 568],r10
      mov	r10,[rbp - 560]
      sub	r10,[rbp - 568]
      mov	[rbp - 576],r10
      mov	r10,[rbp - 544]
      add	r10,[rbp - 576]
      mov	[rbp - 584],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 592],r10
      mov	r10,[rbp - 592]
      add	r10,[B]
      mov	[rbp - 600],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 608],r10
      mov	r10,[rbp - 600]
      sub	r10,[rbp - 608]
      mov	[rbp - 616],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 624],r10
      mov	r10,[rbp - 624]
      add	r10,[B]
      mov	[rbp - 632],r10
      mov	r10,[rbp - 616]
      add	r10,[rbp - 632]
      mov	[rbp - 640],r10
      mov	r10,[rbp - 584]
      add	r10,[rbp - 640]
      mov	[rbp - 648],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 656],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 664],r10
      mov	r10,[rbp - 664]
      add	r10,[B]
      mov	[rbp - 672],r10
      mov	r10,[rbp - 656]
      add	r10,[rbp - 672]
      mov	[rbp - 680],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 688],r10
      mov	r10,[rbp - 680]
      sub	r10,[rbp - 688]
      mov	[rbp - 696],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 704],r10
      mov	r10,[rbp - 704]
      add	r10,[B]
      mov	[rbp - 712],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 720],r10
      mov	r10,[rbp - 712]
      sub	r10,[rbp - 720]
      mov	[rbp - 728],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 736],r10
      mov	r10,[rbp - 736]
      add	r10,[B]
      mov	[rbp - 744],r10
      mov	r10,[rbp - 728]
      add	r10,[rbp - 744]
      mov	[rbp - 752],r10
      mov	r10,[rbp - 696]
      add	r10,[rbp - 752]
      mov	[rbp - 760],r10
      mov	r10,[rbp - 648]
      sub	r10,[rbp - 760]
      mov	[rbp - 768],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 776],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 784],r10
      mov	r10,[rbp - 784]
      add	r10,[B]
      mov	[rbp - 792],r10
      mov	r10,[rbp - 776]
      add	r10,[rbp - 792]
      mov	[rbp - 800],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 808],r10
      mov	r10,[rbp - 800]
      sub	r10,[rbp - 808]
      mov	[rbp - 816],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 824],r10
      mov	r10,[rbp - 824]
      add	r10,[B]
      mov	[rbp - 832],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 840],r10
      mov	r10,[rbp - 832]
      sub	r10,[rbp - 840]
      mov	[rbp - 848],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 856],r10
      mov	r10,[rbp - 856]
      add	r10,[B]
      mov	[rbp - 864],r10
      mov	r10,[rbp - 848]
      add	r10,[rbp - 864]
      mov	[rbp - 872],r10
      mov	r10,[rbp - 816]
      add	r10,[rbp - 872]
      mov	[rbp - 880],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 888],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 896],r10
      mov	r10,[rbp - 896]
      add	r10,[B]
      mov	[rbp - 904],r10
      mov	r10,[rbp - 888]
      add	r10,[rbp - 904]
      mov	[rbp - 912],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 920],r10
      mov	r10,[rbp - 912]
      sub	r10,[rbp - 920]
      mov	[rbp - 928],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 936],r10
      mov	r10,[rbp - 936]
      add	r10,[B]
      mov	[rbp - 944],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 952],r10
      mov	r10,[rbp - 944]
      sub	r10,[rbp - 952]
      mov	[rbp - 960],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 968],r10
      mov	r10,[rbp - 968]
      add	r10,[B]
      mov	[rbp - 976],r10
      mov	r10,[rbp - 960]
      add	r10,[rbp - 976]
      mov	[rbp - 984],r10
      mov	r10,[rbp - 928]
      add	r10,[rbp - 984]
      mov	[rbp - 992],r10
      mov	r10,[rbp - 880]
      sub	r10,[rbp - 992]
      mov	[rbp - 1000],r10
      mov	r10,[rbp - 768]
      sub	r10,[rbp - 1000]
      mov	[rbp - 1008],r10
      mov	r10,[rbp - 512]
      add	r10,[rbp - 1008]
      mov	[rbp - 1016],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1024],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1032],r10
      mov	r10,[rbp - 1032]
      add	r10,[B]
      mov	[rbp - 1040],r10
      mov	r10,[rbp - 1024]
      add	r10,[rbp - 1040]
      mov	[rbp - 1048],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1056],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1064],r10
      mov	r10,[rbp - 1064]
      add	r10,[B]
      mov	[rbp - 1072],r10
      mov	r10,[rbp - 1056]
      add	r10,[rbp - 1072]
      mov	[rbp - 1080],r10
      mov	r10,[rbp - 1048]
      sub	r10,[rbp - 1080]
      mov	[rbp - 1088],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1096],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1104],r10
      mov	r10,[rbp - 1104]
      add	r10,[B]
      mov	[rbp - 1112],r10
      mov	r10,[rbp - 1096]
      add	r10,[rbp - 1112]
      mov	[rbp - 1120],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1128],r10
      mov	r10,[rbp - 1120]
      sub	r10,[rbp - 1128]
      mov	[rbp - 1136],r10
      mov	r10,[rbp - 1088]
      sub	r10,[rbp - 1136]
      mov	[rbp - 1144],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1152],r10
      mov	r10,[rbp - 1152]
      add	r10,[B]
      mov	[rbp - 1160],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1168],r10
      mov	r10,[rbp - 1160]
      sub	r10,[rbp - 1168]
      mov	[rbp - 1176],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1184],r10
      mov	r10,[rbp - 1184]
      add	r10,[B]
      mov	[rbp - 1192],r10
      mov	r10,[rbp - 1176]
      add	r10,[rbp - 1192]
      mov	[rbp - 1200],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1208],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1216],r10
      mov	r10,[rbp - 1216]
      add	r10,[B]
      mov	[rbp - 1224],r10
      mov	r10,[rbp - 1208]
      add	r10,[rbp - 1224]
      mov	[rbp - 1232],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1240],r10
      mov	r10,[rbp - 1232]
      sub	r10,[rbp - 1240]
      mov	[rbp - 1248],r10
      mov	r10,[rbp - 1200]
      sub	r10,[rbp - 1248]
      mov	[rbp - 1256],r10
      mov	r10,[rbp - 1144]
      add	r10,[rbp - 1256]
      mov	[rbp - 1264],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1272],r10
      mov	r10,[rbp - 1272]
      add	r10,[B]
      mov	[rbp - 1280],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1288],r10
      mov	r10,[rbp - 1280]
      sub	r10,[rbp - 1288]
      mov	[rbp - 1296],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1304],r10
      mov	r10,[rbp - 1304]
      add	r10,[B]
      mov	[rbp - 1312],r10
      mov	r10,[rbp - 1296]
      add	r10,[rbp - 1312]
      mov	[rbp - 1320],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1328],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1336],r10
      mov	r10,[rbp - 1336]
      add	r10,[B]
      mov	[rbp - 1344],r10
      mov	r10,[rbp - 1328]
      add	r10,[rbp - 1344]
      mov	[rbp - 1352],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1360],r10
      mov	r10,[rbp - 1352]
      sub	r10,[rbp - 1360]
      mov	[rbp - 1368],r10
      mov	r10,[rbp - 1320]
      sub	r10,[rbp - 1368]
      mov	[rbp - 1376],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1384],r10
      mov	r10,[rbp - 1384]
      add	r10,[B]
      mov	[rbp - 1392],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1400],r10
      mov	r10,[rbp - 1392]
      sub	r10,[rbp - 1400]
      mov	[rbp - 1408],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1416],r10
      mov	r10,[rbp - 1416]
      add	r10,[B]
      mov	[rbp - 1424],r10
      mov	r10,[rbp - 1408]
      add	r10,[rbp - 1424]
      mov	[rbp - 1432],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1440],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1448],r10
      mov	r10,[rbp - 1448]
      add	r10,[B]
      mov	[rbp - 1456],r10
      mov	r10,[rbp - 1440]
      add	r10,[rbp - 1456]
      mov	[rbp - 1464],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1472],r10
      mov	r10,[rbp - 1464]
      sub	r10,[rbp - 1472]
      mov	[rbp - 1480],r10
      mov	r10,[rbp - 1432]
      sub	r10,[rbp - 1480]
      mov	[rbp - 1488],r10
      mov	r10,[rbp - 1376]
      add	r10,[rbp - 1488]
      mov	[rbp - 1496],r10
      mov	r10,[rbp - 1264]
      add	r10,[rbp - 1496]
      mov	[rbp - 1504],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1512],r10
      mov	r10,[rbp - 1512]
      add	r10,[B]
      mov	[rbp - 1520],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1528],r10
      mov	r10,[rbp - 1520]
      sub	r10,[rbp - 1528]
      mov	[rbp - 1536],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1544],r10
      mov	r10,[rbp - 1544]
      add	r10,[B]
      mov	[rbp - 1552],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1560],r10
      mov	r10,[rbp - 1552]
      sub	r10,[rbp - 1560]
      mov	[rbp - 1568],r10
      mov	r10,[rbp - 1536]
      add	r10,[rbp - 1568]
      mov	[rbp - 1576],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1584],r10
      mov	r10,[rbp - 1584]
      add	r10,[B]
      mov	[rbp - 1592],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1600],r10
      mov	r10,[rbp - 1592]
      sub	r10,[rbp - 1600]
      mov	[rbp - 1608],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1616],r10
      mov	r10,[rbp - 1616]
      add	r10,[B]
      mov	[rbp - 1624],r10
      mov	r10,[rbp - 1608]
      add	r10,[rbp - 1624]
      mov	[rbp - 1632],r10
      mov	r10,[rbp - 1576]
      add	r10,[rbp - 1632]
      mov	[rbp - 1640],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1648],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1656],r10
      mov	r10,[rbp - 1656]
      add	r10,[B]
      mov	[rbp - 1664],r10
      mov	r10,[rbp - 1648]
      add	r10,[rbp - 1664]
      mov	[rbp - 1672],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1680],r10
      mov	r10,[rbp - 1672]
      sub	r10,[rbp - 1680]
      mov	[rbp - 1688],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1696],r10
      mov	r10,[rbp - 1696]
      add	r10,[B]
      mov	[rbp - 1704],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1712],r10
      mov	r10,[rbp - 1704]
      sub	r10,[rbp - 1712]
      mov	[rbp - 1720],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1728],r10
      mov	r10,[rbp - 1728]
      add	r10,[B]
      mov	[rbp - 1736],r10
      mov	r10,[rbp - 1720]
      add	r10,[rbp - 1736]
      mov	[rbp - 1744],r10
      mov	r10,[rbp - 1688]
      add	r10,[rbp - 1744]
      mov	[rbp - 1752],r10
      mov	r10,[rbp - 1640]
      sub	r10,[rbp - 1752]
      mov	[rbp - 1760],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1768],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1776],r10
      mov	r10,[rbp - 1776]
      add	r10,[B]
      mov	[rbp - 1784],r10
      mov	r10,[rbp - 1768]
      add	r10,[rbp - 1784]
      mov	[rbp - 1792],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1800],r10
      mov	r10,[rbp - 1792]
      sub	r10,[rbp - 1800]
      mov	[rbp - 1808],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1816],r10
      mov	r10,[rbp - 1816]
      add	r10,[B]
      mov	[rbp - 1824],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1832],r10
      mov	r10,[rbp - 1824]
      sub	r10,[rbp - 1832]
      mov	[rbp - 1840],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1848],r10
      mov	r10,[rbp - 1848]
      add	r10,[B]
      mov	[rbp - 1856],r10
      mov	r10,[rbp - 1840]
      add	r10,[rbp - 1856]
      mov	[rbp - 1864],r10
      mov	r10,[rbp - 1808]
      add	r10,[rbp - 1864]
      mov	[rbp - 1872],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1880],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1888],r10
      mov	r10,[rbp - 1888]
      add	r10,[B]
      mov	[rbp - 1896],r10
      mov	r10,[rbp - 1880]
      add	r10,[rbp - 1896]
      mov	[rbp - 1904],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1912],r10
      mov	r10,[rbp - 1904]
      sub	r10,[rbp - 1912]
      mov	[rbp - 1920],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1928],r10
      mov	r10,[rbp - 1928]
      add	r10,[B]
      mov	[rbp - 1936],r10
      mov	r10,[A]
      add	r10,[B]
      mov	[rbp - 1944],r10
      mov	r10,[rbp - 1936]
      sub	r10,[rbp - 1944]
      mov	[rbp - 1952],r10
      mov	r10,[C]
      sub	r10,[A]
      mov	[rbp - 1960],r10
      mov	r10,[rbp - 1960]
      add	r10,[B]
      mov	[rbp - 1968],r10
      mov	r10,[rbp - 1952]
      add	r10,[rbp - 1968]
      mov	[rbp - 1976],r10
      mov	r10,[rbp - 1920]
      add	r10,[rbp - 1976]
      mov	[rbp - 1984],r10
      mov	r10,[rbp - 1872]
      sub	r10,[rbp - 1984]
      mov	[rbp - 1992],r10
      mov	r10,[rbp - 1760]
      sub	r10,[rbp - 1992]
      mov	[rbp - 2000],r10
      mov	r10,[rbp - 1504]
      add	r10,[rbp - 2000]
      mov	[rbp - 2008],r10
      mov	r10,[rbp - 1016]
      sub	r10,[rbp - 2008]
      mov	[rbp - 2016],r10
      mov	r10,[rbp - 2016]
      mov	[C],r10
      mov	r10,1
      shl	r10,29
      mov	[rbp - 8],r10
      mov	r10,[C]
      cmp	r10,[rbp - 8]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 16],r10
      mov	r10,1
      shl	r10,29
      mov	[rbp - 24],r10
      mov	r10,[rbp - 24]
      not	r10
      add	r10,1
      mov	[rbp - 32],r10
      mov	r10,[C]
      cmp	r10,[rbp - 32]
      setg r10b
      movzx r10,r10b
      mov	[rbp - 40],r10
      mov	r10,[rbp - 16]
      and	r10,[rbp - 40]
      mov	[rbp - 48],r10
      mov	r10,[rbp -  48]
      cmp	r10,1
      je	_0for
_0forback:
      mov	rdi,[A]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  8],rax
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],' '
      mov	byte[rax + 1],0
      mov	[rbp - 16],rax
      mov	rdi,[rbp-8]
      mov	rsi,[rbp-16]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  16],rax
      mov	rdi,[B]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  24],rax
      mov	rdi,[rbp-16]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  32],rax
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],' '
      mov	byte[rax + 1],0
      mov	[rbp - 40],rax
      mov	rdi,[rbp-32]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  40],rax
      mov	rdi,[C]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  48],rax
      mov	rdi,[rbp-40]
      mov	rsi,[rbp-48]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  56],rax
      mov	rdi,[rbp-56]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  64],rax
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

A:
	dq 0
B:
	dq 0
C:
	dq 0
section .bss
stringbuffer:
	resb 256

