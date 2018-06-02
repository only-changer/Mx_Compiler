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
vectorinit:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 24],rdi
      mov	[rbp - 16],rsi
      mov	r10,[rbp - 16]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov	[rbp - 32],r10
      mov	 r10,[rbp-32]
      cmp	 r10,0
      je	_0else
_0if:
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_0ifback
_0else:
_0ifback:
      mov	r10,[rbp - 16]
      add	r10,0
      mov	r10,[r10]
      add	r10,0
      mov	[rbp - 40],r10
      mov	r10,[rbp - 40]
      add	r10,1
      mov	[rbp - 48],r10
      mov	r10,[rbp - 48]
      imul	r10,8
      mov	[rbp - 48],r10
      mov	rdi,[rbp-48]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  56],rax
      mov	r10,[rbp - 40]
      mov	r11,[rbp - 56]
      add	r11,0
      mov	[r11],r10
      mov	r10,[rbp - 56]
      mov	r11,[rbp - 24]
      add	r11,0
      mov	[r11],r10
      mov	qword[rbp - 64],0
_0for:
      mov	r10,[rbp - 64]
      add	r10,1
      mov	[rbp - 88],r10
      mov	r10,[rbp - 88]
      imul	r10,8
      mov	[rbp - 88],r10
      mov	r10,[rbp - 64]
      add	r10,1
      mov	[rbp - 112],r10
      mov	r10,[rbp - 112]
      imul	r10,8
      mov	[rbp - 112],r10
      mov	r10,[rbp - 16]
      add	r10,[rbp - 112]
      mov	r10,[r10]
      mov	r11,[rbp - 24]
      add	r11,0
      mov	r11,[r11]
      add	r11,[rbp - 88]
      mov	[r11],r10
_0while:
      mov	r10,[rbp - 64]
      add	r10,1
      mov	[rbp - 64],r10
      mov	r10,[rbp - 16]
      add	r10,0
      mov	r10,[r10]
      add	r10,0
      mov	[rbp - 120],r10
      mov	r10,[rbp - 64]
      cmp	r10,[rbp - 120]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 128],r10
      mov	r10,[rbp -  128]
      cmp	r10,1
      je	_0for
_0forback:
      mov	rsp,rbp
      pop rbp
      ret
vectorgetDim:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 136],rdi
      mov	r11,[rbp - 136]
      add	r11,0
      mov	r10,[r11]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov	[rbp - 144],r10
      mov	 r10,[rbp-144]
      cmp	 r10,0
      je	_1else
_1if:
      mov	rax,0
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_1ifback
_1else:
_1ifback:
      mov	r10,[rbp - 136]
      add	r10,0
      mov	r10,[r10]
      add	r10,0
      mov	r10,[r10]
      add	r10,0
      mov	[rbp - 152],r10
      mov	rax,[rbp -  152]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
vectordot:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 168],rdi
      mov	[rbp - 160],rsi
      mov	qword[rbp - 176],0
      mov	qword[rbp - 184],0
      jmp	_1while
_1for:
      mov	r10,[rbp - 176]
      add	r10,1
      mov	[rbp - 208],r10
      mov	r10,[rbp - 208]
      imul	r10,8
      mov	[rbp - 208],r10
      mov	r10,[rbp - 176]
      add	r10,1
      mov	[rbp - 232],r10
      mov	r10,[rbp - 232]
      imul	r10,8
      mov	[rbp - 232],r10
      mov	r10,[rbp - 168]
      add	r10,0
      mov	r10,[r10]
      add	r10,[rbp - 208]
      mov	r10,[r10]
      mov	r11,[rbp - 160]
      add	r11,0
      mov	r11,[r11]
      add	r11,[rbp - 232]
      imul	r10,[r11]
      mov	[rbp - 240],r10
      mov	r10,[rbp - 240]
      mov	[rbp - 184],r10
      mov	r10,[rbp - 176]
      add	r10,1
      mov	[rbp - 176],r10
_1while:
      mov	rdi,[rbp-168]
      push	r10
      push	r11
      call	vectorgetDim
      pop	r11
      pop	r10
      mov	[rbp -  256],rax
      mov	r10,[rbp - 176]
      cmp	r10,[rbp - 256]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 264],r10
      mov	r10,[rbp -  264]
      cmp	r10,1
      je	_1for
_1forback:
      mov	rax,[rbp -  184]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
vectorscalarInPlaceMultiply:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 280],rdi
      mov	[rbp - 272],rsi
      mov	r11,[rbp - 280]
      add	r11,0
      mov	r10,[r11]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov	[rbp - 288],r10
      mov	 r10,[rbp-288]
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
      mov	qword[rbp - 296],0
_2for:
      mov	r10,[rbp - 296]
      add	r10,1
      mov	[rbp - 320],r10
      mov	r10,[rbp - 320]
      imul	r10,8
      mov	[rbp - 320],r10
      mov	r10,[rbp - 296]
      add	r10,1
      mov	[rbp - 344],r10
      mov	r10,[rbp - 344]
      imul	r10,8
      mov	[rbp - 344],r10
      mov	r10,[rbp - 272]
      mov	r11,[rbp - 280]
      add	r11,0
      mov	r11,[r11]
      add	r11,[rbp - 344]
      imul	r10,[r11]
      mov	[rbp - 352],r10
      mov	r10,[rbp - 352]
      mov	r11,[rbp - 280]
      add	r11,0
      mov	r11,[r11]
      add	r11,[rbp - 320]
      mov	[r11],r10
_2while:
      mov	r10,[rbp - 296]
      add	r10,1
      mov	[rbp - 296],r10
      mov	rdi,[rbp-280]
      push	r10
      push	r11
      call	vectorgetDim
      pop	r11
      pop	r10
      mov	[rbp -  368],rax
      mov	r10,[rbp - 296]
      cmp	r10,[rbp - 368]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 376],r10
      mov	r10,[rbp -  376]
      cmp	r10,1
      je	_2for
_2forback:
      mov	rax,[rbp -  280]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
vectoradd:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 392],rdi
      mov	[rbp - 384],rsi
      mov	rdi,[rbp-392]
      push	r10
      push	r11
      call	vectorgetDim
      pop	r11
      pop	r10
      mov	[rbp -  408],rax
      mov	rdi,[rbp-384]
      push	r10
      push	r11
      call	vectorgetDim
      pop	r11
      pop	r10
      mov	[rbp -  424],rax
      mov	r10,[rbp - 408]
      cmp	r10,[rbp - 424]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 432],r10
      mov	r10,[rbp - 432]
      cmp	r10,1
      je	_0check
      mov	rdi,[rbp-392]
      push	r10
      push	r11
      call	vectorgetDim
      pop	r11
      pop	r10
      mov	[rbp -  448],rax
      mov	r10,[rbp - 448]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov	[rbp - 456],r10
      mov	r10,[rbp - 432]
      or	r10,[rbp - 456]
_0check:
      mov	[rbp - 464],r10
      mov	 r10,[rbp-464]
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
      mov	rdi,8
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  480],rax
      mov	r10,[rbp - 480]
      mov	[rbp - 472],r10
      mov	rdi,[rbp-392]
      push	r10
      push	r11
      call	vectorgetDim
      pop	r11
      pop	r10
      mov	[rbp -  504],rax
      mov	r10,[rbp - 504]
      add	r10,1
      mov	[rbp - 512],r10
      mov	r10,[rbp - 512]
      imul	r10,8
      mov	[rbp - 512],r10
      mov	rdi,[rbp-512]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  520],rax
      mov	r10,[rbp - 504]
      mov	r11,[rbp - 520]
      add	r11,0
      mov	[r11],r10
      mov	r10,[rbp - 520]
      mov	r11,[rbp - 472]
      add	r11,0
      mov	[r11],r10
      mov	qword[rbp - 488],0
_3for:
      mov	r10,[rbp - 488]
      add	r10,1
      mov	[rbp - 544],r10
      mov	r10,[rbp - 544]
      imul	r10,8
      mov	[rbp - 544],r10
      mov	r10,[rbp - 488]
      add	r10,1
      mov	[rbp - 568],r10
      mov	r10,[rbp - 568]
      imul	r10,8
      mov	[rbp - 568],r10
      mov	r10,[rbp - 488]
      add	r10,1
      mov	[rbp - 592],r10
      mov	r10,[rbp - 592]
      imul	r10,8
      mov	[rbp - 592],r10
      mov	r10,[rbp - 392]
      add	r10,0
      mov	r10,[r10]
      add	r10,[rbp - 568]
      mov	r10,[r10]
      mov	r11,[rbp - 384]
      add	r11,0
      mov	r11,[r11]
      add	r11,[rbp - 592]
      add	r10,[r11]
      mov	[rbp - 600],r10
      mov	r10,[rbp - 600]
      mov	r11,[rbp - 472]
      add	r11,0
      mov	r11,[r11]
      add	r11,[rbp - 544]
      mov	[r11],r10
_3while:
      mov	r10,[rbp - 488]
      add	r10,1
      mov	[rbp - 488],r10
      mov	rdi,[rbp-392]
      push	r10
      push	r11
      call	vectorgetDim
      pop	r11
      pop	r10
      mov	[rbp -  616],rax
      mov	r10,[rbp - 488]
      cmp	r10,[rbp - 616]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 624],r10
      mov	r10,[rbp -  624]
      cmp	r10,1
      je	_3for
_3forback:
      mov	rax,[rbp -  472]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
vectorset:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 648],rdi
      mov	[rbp - 632],rsi
      mov	[rbp - 640],rdx
      mov	rdi,[rbp-648]
      push	r10
      push	r11
      call	vectorgetDim
      pop	r11
      pop	r10
      mov	[rbp -  664],rax
      mov	r10,[rbp - 664]
      cmp	r10,[rbp - 632]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 672],r10
      mov	 r10,[rbp-672]
      cmp	 r10,0
      je	_4else
_4if:
      mov	rax,0
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_4ifback
_4else:
_4ifback:
      mov	r10,[rbp - 632]
      add	r10,1
      mov	[rbp - 696],r10
      mov	r10,[rbp - 696]
      imul	r10,8
      mov	[rbp - 696],r10
      mov	r10,[rbp - 640]
      mov	r11,[rbp - 648]
      add	r11,0
      mov	r11,[r11]
      add	r11,[rbp - 696]
      mov	[r11],r10
      mov	rax,1
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
vectortostring:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 704],rdi
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'('
      mov	byte[rax + 1],' '
      mov	byte[rax + 2],0
      mov	[rbp - 720],rax
      mov	r10,[rbp - 720]
      mov	[rbp - 712],r10
      mov	rdi,[rbp-704]
      push	r10
      push	r11
      call	vectorgetDim
      pop	r11
      pop	r10
      mov	[rbp -  776],rax
      mov	r10,[rbp - 776]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov	[rbp - 784],r10
      mov	 r10,[rbp-784]
      cmp	 r10,0
      je	_5else
_5if:
      mov	r10,0
      add	r10,1
      mov	[rbp - 744],r10
      mov	r10,[rbp - 744]
      imul	r10,8
      mov	[rbp - 744],r10
      mov	r10,[rbp - 704]
      add	r10,0
      mov	r10,[r10]
      add	r10,[rbp - 744]
      mov	rdi,[r10]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  752],rax
      mov	rdi,[rbp-712]
      mov	rsi,[rbp-752]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  760],rax
      mov	r10,[rbp - 760]
      mov	[rbp - 712],r10
      jmp	_5ifback
_5else:
_5ifback:
      mov	qword[rbp - 792],1
_4for:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],','
      mov	byte[rax + 1],' '
      mov	byte[rax + 2],0
      mov	[rbp - 800],rax
      mov	rdi,[rbp-712]
      mov	rsi,[rbp-800]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  808],rax
      mov	r10,[rbp - 792]
      add	r10,1
      mov	[rbp - 832],r10
      mov	r10,[rbp - 832]
      imul	r10,8
      mov	[rbp - 832],r10
      mov	r10,[rbp - 704]
      add	r10,0
      mov	r10,[r10]
      add	r10,[rbp - 832]
      mov	rdi,[r10]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  840],rax
      mov	rdi,[rbp-808]
      mov	rsi,[rbp-840]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  848],rax
      mov	r10,[rbp - 848]
      mov	[rbp - 712],r10
_4while:
      mov	r10,[rbp - 792]
      add	r10,1
      mov	[rbp - 792],r10
      mov	rdi,[rbp-704]
      push	r10
      push	r11
      call	vectorgetDim
      pop	r11
      pop	r10
      mov	[rbp -  864],rax
      mov	r10,[rbp - 792]
      cmp	r10,[rbp - 864]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 872],r10
      mov	r10,[rbp -  872]
      cmp	r10,1
      je	_4for
_4forback:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],' '
      mov	byte[rax + 1],')'
      mov	byte[rax + 2],0
      mov	[rbp - 880],rax
      mov	rdi,[rbp-712]
      mov	rsi,[rbp-880]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  888],rax
      mov	r10,[rbp - 888]
      mov	[rbp - 712],r10
      mov	rax,[rbp -  712]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
vectorcopy:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 904],rdi
      mov	[rbp - 896],rsi
      mov	r10,[rbp - 896]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov	[rbp - 912],r10
      mov	 r10,[rbp-912]
      cmp	 r10,0
      je	_6else
_6if:
      mov	rax,0
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_6ifback
_6else:
_6ifback:
      mov	rdi,[rbp-896]
      push	r10
      push	r11
      call	vectorgetDim
      pop	r11
      pop	r10
      mov	[rbp -  1040],rax
      mov	r10,[rbp - 1040]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov	[rbp - 1048],r10
      mov	 r10,[rbp-1048]
      cmp	 r10,0
      je	_7else
_7if:
      mov	r11,[rbp - 904]
      add	r11,0
      mov	qword[r11],0
      jmp	_7ifback
_7else:
      mov	rdi,[rbp-896]
      push	r10
      push	r11
      call	vectorgetDim
      pop	r11
      pop	r10
      mov	[rbp -  928],rax
      mov	r10,[rbp - 928]
      add	r10,1
      mov	[rbp - 936],r10
      mov	r10,[rbp - 936]
      imul	r10,8
      mov	[rbp - 936],r10
      mov	rdi,[rbp-936]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  944],rax
      mov	r10,[rbp - 928]
      mov	r11,[rbp - 944]
      add	r11,0
      mov	[r11],r10
      mov	r10,[rbp - 944]
      mov	r11,[rbp - 904]
      add	r11,0
      mov	[r11],r10
      mov	qword[rbp - 952],0
_5for:
      mov	r10,[rbp - 952]
      add	r10,1
      mov	[rbp - 976],r10
      mov	r10,[rbp - 976]
      imul	r10,8
      mov	[rbp - 976],r10
      mov	r10,[rbp - 952]
      add	r10,1
      mov	[rbp - 1000],r10
      mov	r10,[rbp - 1000]
      imul	r10,8
      mov	[rbp - 1000],r10
      mov	r10,[rbp - 896]
      add	r10,0
      mov	r10,[r10]
      add	r10,[rbp - 1000]
      mov	r10,[r10]
      mov	r11,[rbp - 904]
      add	r11,0
      mov	r11,[r11]
      add	r11,[rbp - 976]
      mov	[r11],r10
_5while:
      mov	r10,[rbp - 952]
      add	r10,1
      mov	[rbp - 952],r10
      mov	rdi,[rbp-904]
      push	r10
      push	r11
      call	vectorgetDim
      pop	r11
      pop	r10
      mov	[rbp -  1016],rax
      mov	r10,[rbp - 952]
      cmp	r10,[rbp - 1016]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 1024],r10
      mov	r10,[rbp -  1024]
      cmp	r10,1
      je	_5for
_5forback:
_7ifback:
      mov	rax,1
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
      mov	rdi,8
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  1064],rax
      mov	r10,[rbp - 1064]
      mov	[rbp - 1056],r10
      mov	r10,10
      add	r10,1
      mov	[rbp - 1080],r10
      mov	r10,[rbp - 1080]
      imul	r10,8
      mov	[rbp - 1080],r10
      mov	rdi,[rbp-1080]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  1088],rax
      mov	r11,[rbp - 1088]
      add	r11,0
      mov	qword[r11],10
      mov	r10,[rbp - 1088]
      mov	[rbp - 1072],r10
      mov	qword[rbp - 1096],0
_6for:
      mov	r10,[rbp - 1096]
      add	r10,1
      mov	[rbp - 1120],r10
      mov	r10,[rbp - 1120]
      imul	r10,8
      mov	[rbp - 1120],r10
      mov	r10,9
      sub	r10,[rbp - 1096]
      mov	[rbp - 1128],r10
      mov	r10,[rbp - 1128]
      mov	r11,[rbp - 1072]
      add	r11,[rbp - 1120]
      mov	[r11],r10
_6while:
      mov	r10,[rbp - 1096]
      add	r10,1
      mov	[rbp - 1096],r10
      mov	r10,[rbp - 1096]
      cmp	r10,10
      setl r10b
      movzx r10,r10b
      mov	[rbp - 1136],r10
      mov	r10,[rbp -  1136]
      cmp	r10,1
      je	_6for
_6forback:
      mov	rdi,[rbp-1056]
      mov	rsi,[rbp-1072]
      push	r10
      push	r11
      call	vectorinit
      pop	r11
      pop	r10
      mov	[rbp -  1152],rax
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'v'
      mov	byte[rax + 1],'e'
      mov	byte[rax + 2],'c'
      mov	byte[rax + 3],'t'
      mov	byte[rax + 4],'o'
      mov	byte[rax + 5],'r'
      mov	byte[rax + 6],' '
      mov	byte[rax + 7],'x'
      mov	byte[rax + 8],':'
      mov	byte[rax + 9],' '
      mov	byte[rax + 10],0
      mov	[rbp - 1160],rax
      mov	rdi,[rbp-1160]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  1168],rax
      mov	rdi,[rbp-1056]
      push	r10
      push	r11
      call	vectortostring
      pop	r11
      pop	r10
      mov	[rbp -  1184],rax
      mov	rdi,[rbp-1184]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  1192],rax
      mov	rdi,8
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  1208],rax
      mov	r10,[rbp - 1208]
      mov	[rbp - 1200],r10
      mov	rdi,[rbp-1200]
      mov	rsi,[rbp-1056]
      push	r10
      push	r11
      call	vectorcopy
      pop	r11
      pop	r10
      mov	[rbp -  1224],rax
      mov	rdi,[rbp-1200]
      mov	rsi,3
      mov	rdx,817
      push	r10
      push	r11
      call	vectorset
      pop	r11
      pop	r10
      mov	[rbp -  1256],rax
      mov	 r10,[rbp-1256]
      cmp	 r10,0
      je	_8else
_8if:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'e'
      mov	byte[rax + 1],'x'
      mov	byte[rax + 2],'c'
      mov	byte[rax + 3],'i'
      mov	byte[rax + 4],'t'
      mov	byte[rax + 5],'e'
      mov	byte[rax + 6],'d'
      mov	byte[rax + 7],'!'
      mov	byte[rax + 8],0
      mov	[rbp - 1232],rax
      mov	rdi,[rbp-1232]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  1240],rax
      jmp	_8ifback
_8else:
_8ifback:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'v'
      mov	byte[rax + 1],'e'
      mov	byte[rax + 2],'c'
      mov	byte[rax + 3],'t'
      mov	byte[rax + 4],'o'
      mov	byte[rax + 5],'r'
      mov	byte[rax + 6],' '
      mov	byte[rax + 7],'y'
      mov	byte[rax + 8],':'
      mov	byte[rax + 9],' '
      mov	byte[rax + 10],0
      mov	[rbp - 1264],rax
      mov	rdi,[rbp-1264]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  1272],rax
      mov	rdi,[rbp-1200]
      push	r10
      push	r11
      call	vectortostring
      pop	r11
      pop	r10
      mov	[rbp -  1288],rax
      mov	rdi,[rbp-1288]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  1296],rax
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'x'
      mov	byte[rax + 1],' '
      mov	byte[rax + 2],'+'
      mov	byte[rax + 3],' '
      mov	byte[rax + 4],'y'
      mov	byte[rax + 5],':'
      mov	byte[rax + 6],' '
      mov	byte[rax + 7],0
      mov	[rbp - 1304],rax
      mov	rdi,[rbp-1304]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  1312],rax
      mov	rdi,[rbp-1056]
      mov	rsi,[rbp-1200]
      push	r10
      push	r11
      call	vectoradd
      pop	r11
      pop	r10
      mov	[rbp -  1328],rax
      mov	rdi,rax
      push	r10
      push	r11
      call	vectortostring
      pop	r11
      pop	r10
      mov	[rbp -  1336],rax
      mov	rdi,[rbp-1336]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  1344],rax
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'x'
      mov	byte[rax + 1],' '
      mov	byte[rax + 2],'*'
      mov	byte[rax + 3],' '
      mov	byte[rax + 4],'y'
      mov	byte[rax + 5],':'
      mov	byte[rax + 6],' '
      mov	byte[rax + 7],0
      mov	[rbp - 1352],rax
      mov	rdi,[rbp-1352]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  1360],rax
      mov	rdi,[rbp-1056]
      mov	rsi,[rbp-1200]
      push	r10
      push	r11
      call	vectordot
      pop	r11
      pop	r10
      mov	[rbp -  1376],rax
      mov	rdi,[rbp-1376]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  1384],rax
      mov	rdi,[rbp-1384]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  1392],rax
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'('
      mov	byte[rax + 1],'1'
      mov	byte[rax + 2],' '
      mov	byte[rax + 3],'<'
      mov	byte[rax + 4],'<'
      mov	byte[rax + 5],' '
      mov	byte[rax + 6],'3'
      mov	byte[rax + 7],')'
      mov	byte[rax + 8],' '
      mov	byte[rax + 9],'*'
      mov	byte[rax + 10],' '
      mov	byte[rax + 11],'y'
      mov	byte[rax + 12],':'
      mov	byte[rax + 13],' '
      mov	byte[rax + 14],0
      mov	[rbp - 1400],rax
      mov	rdi,[rbp-1400]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  1408],rax
      mov	r10,1
      shl	r10,3
      mov	[rbp - 1416],r10
      mov	rdi,[rbp-1200]
      mov	rsi,[rbp-1416]
      push	r10
      push	r11
      call	vectorscalarInPlaceMultiply
      pop	r11
      pop	r10
      mov	[rbp -  1432],rax
      mov	rdi,rax
      push	r10
      push	r11
      call	vectortostring
      pop	r11
      pop	r10
      mov	[rbp -  1440],rax
      mov	rdi,[rbp-1440]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  1448],rax
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

section .bss
stringbuffer:
	resb 256

