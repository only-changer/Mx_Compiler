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
origin:
      push	rbp
      mov	rbp,rsp
      sub	rsp,200
      mov	[rbp - 72],rdi
      mov	r10,[rbp - 72]
      add	r10,1
      mov	[rbp - 80],r10
      mov	r10,[rbp - 80]
      imul	r10,8
      mov	[rbp - 80],r10
      mov	rdi,[rbp-80]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  88],rax
      mov	r10,[rbp - 72]
      mov	r11,[rbp - 88]
      add	r11,0
      mov	[r11],r10
      mov	r10,[rbp - 88]
      mov	[lcresult],r10
      mov	qword[lci],0
_0for:
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 112],r10
      mov	r10,[rbp - 112]
      imul	r10,8
      mov	[rbp - 112],r10
      mov	r10,[rbp - 72]
      add	r10,1
      mov	[rbp - 120],r10
      mov	r10,[rbp - 120]
      imul	r10,8
      mov	[rbp - 120],r10
      mov	rdi,[rbp-120]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  128],rax
      mov	r10,[rbp - 72]
      mov	r11,[rbp - 128]
      add	r11,0
      mov	[r11],r10
      mov	r10,[rbp - 128]
      mov	r11,[lcresult]
      add	r11,[rbp - 112]
      mov	[r11],r10
      mov	qword[lcj],0
_1for:
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 152],r10
      mov	r10,[rbp - 152]
      imul	r10,8
      mov	[rbp - 152],r10
      mov	r10,[lcj]
      add	r10,1
      mov	[rbp - 160],r10
      mov	r10,[rbp - 160]
      imul	r10,8
      mov	[rbp - 160],r10
      mov	r11,[lcresult]
      add	r11,[rbp - 152]
      mov	r11,[r11]
      add	r11,[rbp - 160]
      mov	qword[r11],0
_1while:
      mov	r10,[lcj]
      mov	[rbp-168],r10
      mov	r10,[lcj]
      add	r10,1
      mov	[lcj],r10
      mov	r10,[lcj]
      cmp	r10,[rbp - 72]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 176],r10
      mov	r10,[rbp -  176]
      cmp	r10,1
      je	_1for
_1forback:
_0while:
      mov	r10,[lci]
      mov	[rbp-184],r10
      mov	r10,[lci]
      add	r10,1
      mov	[lci],r10
      mov	r10,[lci]
      cmp	r10,[rbp - 72]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 192],r10
      mov	r10,[rbp -  192]
      cmp	r10,1
      je	_0for
_0forback:
      mov	rsp,rbp
      pop rbp
      ret
getPrime:
      push	rbp
      mov	rbp,rsp
      sub	rsp,480
      mov	[rbp - 200],rdi
      mov	qword[rbp - 208],2
      mov	qword[rbp - 216],2
_2for:
      mov	r10,[rbp - 216]
      add	r10,1
      mov	[rbp - 392],r10
      mov	r10,[rbp - 392]
      imul	r10,8
      mov	[rbp - 392],r10
      mov	r11,[lcb]
      add	r11,[rbp - 392]
      mov	r10,[r11]
      cmp	r10,1
      sete r10b
      movzx r10,r10b
      mov	[rbp - 400],r10
      mov	 r10,[rbp-400]
      cmp	 r10,0
      je	_0else
_0if:
      mov	r10,0
      add	r10,1
      mov	[rbp - 240],r10
      mov	r10,[rbp - 240]
      imul	r10,8
      mov	[rbp - 240],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 264],r10
      mov	r10,[rbp - 264]
      imul	r10,8
      mov	[rbp - 264],r10
      mov	r10,[lctmp]
      add	r10,[rbp - 264]
      mov	r10,[r10]
      add	r10,1
      mov	[rbp - 272],r10
      mov	r10,[rbp - 272]
      mov	r11,[lctmp]
      add	r11,[rbp - 240]
      mov	[r11],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 312],r10
      mov	r10,[rbp - 312]
      imul	r10,8
      mov	[rbp - 312],r10
      mov	r10,[lctmp]
      add	r10,[rbp - 312]
      mov	r10,[r10]
      add	r10,1
      mov	[rbp - 320],r10
      mov	r10,[rbp - 320]
      imul	r10,8
      mov	[rbp - 320],r10
      mov	r10,[rbp - 216]
      mov	r11,[lcprime]
      add	r11,[rbp - 320]
      mov	[r11],r10
      mov	r10,[rbp - 216]
      add	r10,1
      mov	[rbp - 344],r10
      mov	r10,[rbp - 344]
      imul	r10,8
      mov	[rbp - 344],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 368],r10
      mov	r10,[rbp - 368]
      imul	r10,8
      mov	[rbp - 368],r10
      mov	r10,[lctmp]
      add	r10,[rbp - 368]
      mov	r10,[r10]
      mov	r11,[lcgps]
      add	r11,[rbp - 344]
      mov	[r11],r10
      jmp	_0ifback
_0else:
_0ifback:
      jmp	_3while
_3for:
      mov	r10,[rbp - 216]
      imul	r10,[rbp - 208]
      mov	[rbp - 424],r10
      mov	r10,[rbp - 424]
      add	r10,1
      mov	[rbp - 432],r10
      mov	r10,[rbp - 432]
      imul	r10,8
      mov	[rbp - 432],r10
      mov	r11,[lcb]
      add	r11,[rbp - 432]
      mov	qword[r11],0
      mov	r10,[rbp - 208]
      add	r10,1
      mov	[rbp - 440],r10
      mov	r10,[rbp - 440]
      mov	[rbp - 208],r10
_3while:
      mov	r10,[rbp - 216]
      imul	r10,[rbp - 208]
      mov	[rbp - 448],r10
      mov	r10,[rbp - 448]
      cmp	r10,[rbp - 200]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 456],r10
      mov	r10,[rbp -  456]
      cmp	r10,1
      je	_3for
_3forback:
      mov	qword[rbp - 208],2
_2while:
      mov	r10,[rbp - 216]
      add	r10,1
      mov	[rbp - 464],r10
      mov	r10,[rbp - 464]
      mov	[rbp - 216],r10
      mov	r10,[rbp - 216]
      cmp	r10,[rbp - 200]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 472],r10
      mov	r10,[rbp -  472]
      cmp	r10,1
      je	_2for
_2forback:
      mov	rsp,rbp
      pop rbp
      ret
getResult:
      push	rbp
      mov	rbp,rsp
      sub	rsp,968
      mov	[rbp - 480],rdi
      mov	[rbp - 488],rsi
      mov	[rbp - 496],rdx
      mov	r10,[rbp - 488]
      add	r10,1
      mov	[rbp - 824],r10
      mov	r10,[rbp - 824]
      imul	r10,8
      mov	[rbp - 824],r10
      mov	r10,[rbp - 496]
      add	r10,1
      mov	[rbp - 832],r10
      mov	r10,[rbp - 832]
      imul	r10,8
      mov	[rbp - 832],r10
      mov	r10,1
      not	r10
      add	r10,1
      mov	[rbp - 840],r10
      mov	r11,[lcresult]
      add	r11,[rbp - 824]
      mov	r11,[r11]
      add	r11,[rbp - 832]
      mov	r10,[r11]
      cmp	r10,[rbp - 840]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 848],r10
      mov	 r10,[rbp-848]
      cmp	 r10,0
      je	_3else
_3if:
      mov	r10,[rbp - 496]
      add	r10,1
      mov	[rbp - 752],r10
      mov	r10,[rbp - 752]
      imul	r10,8
      mov	[rbp - 752],r10
      mov	r10,[lcprime]
      add	r10,[rbp - 752]
      mov	r10,[r10]
      imul	r10,2
      mov	[rbp - 760],r10
      mov	r10,[rbp - 488]
      add	r10,1
      mov	[rbp - 784],r10
      mov	r10,[rbp - 784]
      imul	r10,8
      mov	[rbp - 784],r10
      mov	r10,[rbp - 760]
      mov	r11,[lcprime]
      add	r11,[rbp - 784]
      sub	r10,[r11]
      mov	[rbp - 792],r10
      mov	r10,[rbp - 792]
      cmp	r10,[rbp - 480]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 800],r10
      mov	 r10,[rbp-800]
      cmp	 r10,0
      je	_2else
_2if:
      mov	r10,[rbp - 496]
      add	r10,1
      mov	[rbp - 672],r10
      mov	r10,[rbp - 672]
      imul	r10,8
      mov	[rbp - 672],r10
      mov	r10,[lcprime]
      add	r10,[rbp - 672]
      mov	r10,[r10]
      imul	r10,2
      mov	[rbp - 680],r10
      mov	r10,[rbp - 488]
      add	r10,1
      mov	[rbp - 704],r10
      mov	r10,[rbp - 704]
      imul	r10,8
      mov	[rbp - 704],r10
      mov	r10,[rbp - 680]
      mov	r11,[lcprime]
      add	r11,[rbp - 704]
      sub	r10,[r11]
      mov	[rbp - 712],r10
      mov	r10,[rbp - 712]
      add	r10,1
      mov	[rbp - 720],r10
      mov	r10,[rbp - 720]
      imul	r10,8
      mov	[rbp - 720],r10
      mov	r11,[lcb]
      add	r11,[rbp - 720]
      mov	r10,[r11]
      cmp	r10,0
      setne r10b
      movzx r10,r10b
      mov	[rbp - 728],r10
      mov	 r10,[rbp-728]
      cmp	 r10,0
      je	_1else
_1if:
      mov	r10,[rbp - 488]
      add	r10,1
      mov	[rbp - 520],r10
      mov	r10,[rbp - 520]
      imul	r10,8
      mov	[rbp - 520],r10
      mov	r10,[rbp - 496]
      add	r10,1
      mov	[rbp - 528],r10
      mov	r10,[rbp - 528]
      imul	r10,8
      mov	[rbp - 528],r10
      mov	r10,[rbp - 496]
      add	r10,1
      mov	[rbp - 568],r10
      mov	r10,[rbp - 568]
      imul	r10,8
      mov	[rbp - 568],r10
      mov	r10,[lcprime]
      add	r10,[rbp - 568]
      mov	r10,[r10]
      imul	r10,2
      mov	[rbp - 576],r10
      mov	r10,[rbp - 488]
      add	r10,1
      mov	[rbp - 600],r10
      mov	r10,[rbp - 600]
      imul	r10,8
      mov	[rbp - 600],r10
      mov	r10,[rbp - 576]
      mov	r11,[lcprime]
      add	r11,[rbp - 600]
      sub	r10,[r11]
      mov	[rbp - 608],r10
      mov	r10,[rbp - 608]
      add	r10,1
      mov	[rbp - 616],r10
      mov	r10,[rbp - 616]
      imul	r10,8
      mov	[rbp - 616],r10
      mov	rdi,[rbp-480]
      mov	rsi,[rbp-496]
      mov	r10,[lcgps]
      add	r10,[rbp - 616]
      mov	rdx,[r10]
      push	r10
      push	r11
      call	getResult
      pop	r11
      pop	r10
      mov	[rbp -  624],rax
      mov	r10,[rbp - 624]
      add	r10,1
      mov	[rbp - 632],r10
      mov	r10,[rbp - 632]
      mov	r11,[lcresult]
      add	r11,[rbp - 520]
      mov	r11,[r11]
      add	r11,[rbp - 528]
      mov	[r11],r10
      jmp	_1ifback
_1else:
_1ifback:
      jmp	_2ifback
_2else:
_2ifback:
      jmp	_3ifback
_3else:
_3ifback:
      mov	r10,[rbp - 488]
      add	r10,1
      mov	[rbp - 904],r10
      mov	r10,[rbp - 904]
      imul	r10,8
      mov	[rbp - 904],r10
      mov	r10,[rbp - 496]
      add	r10,1
      mov	[rbp - 912],r10
      mov	r10,[rbp - 912]
      imul	r10,8
      mov	[rbp - 912],r10
      mov	r10,1
      not	r10
      add	r10,1
      mov	[rbp - 920],r10
      mov	r11,[lcresult]
      add	r11,[rbp - 904]
      mov	r11,[r11]
      add	r11,[rbp - 912]
      mov	r10,[r11]
      cmp	r10,[rbp - 920]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 928],r10
      mov	 r10,[rbp-928]
      cmp	 r10,0
      je	_4else
_4if:
      mov	r10,[rbp - 488]
      add	r10,1
      mov	[rbp - 872],r10
      mov	r10,[rbp - 872]
      imul	r10,8
      mov	[rbp - 872],r10
      mov	r10,[rbp - 496]
      add	r10,1
      mov	[rbp - 880],r10
      mov	r10,[rbp - 880]
      imul	r10,8
      mov	[rbp - 880],r10
      mov	r11,[lcresult]
      add	r11,[rbp - 872]
      mov	r11,[r11]
      add	r11,[rbp - 880]
      mov	qword[r11],1
      jmp	_4ifback
_4else:
_4ifback:
      mov	r10,[rbp - 488]
      add	r10,1
      mov	[rbp - 952],r10
      mov	r10,[rbp - 952]
      imul	r10,8
      mov	[rbp - 952],r10
      mov	r10,[rbp - 496]
      add	r10,1
      mov	[rbp - 960],r10
      mov	r10,[rbp - 960]
      imul	r10,8
      mov	[rbp - 960],r10
      mov	r10,[lcresult]
      add	r10,[rbp - 952]
      mov	r10,[r10]
      add	r10,[rbp - 960]
      mov	rax,[r10]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
printF:
      push	rbp
      mov	rbp,rsp
      sub	rsp,1104
      mov	[rbp - 968],rdi
      mov	[rbp - 976],rsi
      mov	[rbp - 984],rdx
      mov	rdi,[rbp-968]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  992],rax
      mov	rdi,[rbp-992]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  1000],rax
      jmp	_4while
_4for:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],' '
      mov	byte[rax + 1],0
      mov	[rbp - 1008],rax
      mov	rdi,[rbp-1008]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  1016],rax
      mov	rdi,[rbp-976]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  1024],rax
      mov	rdi,[rbp-1024]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  1032],rax
      mov	r10,[rbp - 976]
      imul	r10,2
      mov	[rbp - 1040],r10
      mov	r10,[rbp - 1040]
      sub	r10,[rbp - 968]
      mov	[rbp - 1048],r10
      mov	r10,[rbp - 1048]
      mov	[rbp - 976],r10
      mov	r10,[rbp - 968]
      add	r10,[rbp - 976]
      mov	[rbp - 1056],r10
      mov	eax,[rbp - 1056]
      mov	r10d,2
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 1064],rax
      mov	r10,[rbp - 1064]
      mov	[rbp - 968],r10
      mov	r10,[rbp - 984]
      sub	r10,1
      mov	[rbp - 1072],r10
      mov	r10,[rbp - 1072]
      mov	[rbp - 984],r10
_4while:
      mov	r10,[rbp - 984]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov	[rbp - 1080],r10
      mov	r10,[rbp -  1080]
      cmp	r10,1
      je	_4for
_4forback:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],10
      mov	byte[rax + 1],0
      mov	[rbp - 1088],rax
      mov	rdi,[rbp-1088]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  1096],rax
      mov	rsp,rbp
      pop rbp
      ret
main:
      push	rbp
      mov	rbp,rsp
      sub	rsp,1664
      mov	r10,1001
      add	r10,1
      mov	[rbp - 8],r10
      mov	r10,[rbp - 8]
      imul	r10,8
      mov	[rbp - 8],r10
      mov	rdi,[rbp-8]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  16],rax
      mov	r11,[rbp - 16]
      add	r11,0
      mov	qword[r11],1001
      mov	r10,[rbp - 16]
      mov	[lcb],r10
      mov	r10,170
      add	r10,1
      mov	[rbp - 24],r10
      mov	r10,[rbp - 24]
      imul	r10,8
      mov	[rbp - 24],r10
      mov	rdi,[rbp-24]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  32],rax
      mov	r11,[rbp - 32]
      add	r11,0
      mov	qword[r11],170
      mov	r10,[rbp - 32]
      mov	[lcprime],r10
      mov	r10,1001
      add	r10,1
      mov	[rbp - 40],r10
      mov	r10,[rbp - 40]
      imul	r10,8
      mov	[rbp - 40],r10
      mov	rdi,[rbp-40]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  48],rax
      mov	r11,[rbp - 48]
      add	r11,0
      mov	qword[r11],1001
      mov	r10,[rbp - 48]
      mov	[lcgps],r10
      mov	r10,1
      add	r10,1
      mov	[rbp - 56],r10
      mov	r10,[rbp - 56]
      imul	r10,8
      mov	[rbp - 56],r10
      mov	rdi,[rbp-56]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  64],rax
      mov	r11,[rbp - 64]
      add	r11,0
      mov	qword[r11],1
      mov	r10,[rbp - 64]
      mov	[lctmp],r10
      mov	rdi,170
      push	r10
      push	r11
      call	origin
      pop	r11
      pop	r10
      mov	[rbp -  1104],rax
      mov	qword[lcN],1000
      push	r10
      push	r11
      call	getInt
      pop	r11
      pop	r10
      mov	[rbp -  1112],rax
      mov	r10,[rbp - 1112]
      mov	[lcM],r10
      mov	qword[lcprimeCount],0
      mov	qword[lcresultCount],0
      mov	r10,0
      add	r10,1
      mov	[rbp - 1136],r10
      mov	r10,[rbp - 1136]
      imul	r10,8
      mov	[rbp - 1136],r10
      mov	r11,[lctmp]
      add	r11,[rbp - 1136]
      mov	qword[r11],0
      mov	qword[lci],0
_5for:
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 1160],r10
      mov	r10,[rbp - 1160]
      imul	r10,8
      mov	[rbp - 1160],r10
      mov	r11,[lcb]
      add	r11,[rbp - 1160]
      mov	qword[r11],1
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 1184],r10
      mov	r10,[rbp - 1184]
      imul	r10,8
      mov	[rbp - 1184],r10
      mov	r11,[lcgps]
      add	r11,[rbp - 1184]
      mov	qword[r11],0
_5while:
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 1192],r10
      mov	r10,[rbp - 1192]
      mov	[lci],r10
      mov	r10,[lcN]
      add	r10,1
      mov	[rbp - 1200],r10
      mov	r10,[lci]
      cmp	r10,[rbp - 1200]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 1208],r10
      mov	r10,[rbp -  1208]
      cmp	r10,1
      je	_5for
_5forback:
      mov	qword[lci],0
_6for:
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 1232],r10
      mov	r10,[rbp - 1232]
      imul	r10,8
      mov	[rbp - 1232],r10
      mov	r11,[lcprime]
      add	r11,[rbp - 1232]
      mov	qword[r11],0
_6while:
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 1240],r10
      mov	r10,[rbp - 1240]
      mov	[lci],r10
      mov	r10,[lcM]
      add	r10,1
      mov	[rbp - 1248],r10
      mov	r10,[lci]
      cmp	r10,[rbp - 1248]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 1256],r10
      mov	r10,[rbp -  1256]
      cmp	r10,1
      je	_6for
_6forback:
      mov	qword[lci],0
_7for:
      mov	qword[lcj],0
_8for:
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 1280],r10
      mov	r10,[rbp - 1280]
      imul	r10,8
      mov	[rbp - 1280],r10
      mov	r10,[lcj]
      add	r10,1
      mov	[rbp - 1288],r10
      mov	r10,[rbp - 1288]
      imul	r10,8
      mov	[rbp - 1288],r10
      mov	r10,1
      not	r10
      add	r10,1
      mov	[rbp - 1296],r10
      mov	r10,[rbp - 1296]
      mov	r11,[lcresult]
      add	r11,[rbp - 1280]
      mov	r11,[r11]
      add	r11,[rbp - 1288]
      mov	[r11],r10
_8while:
      mov	r10,[lcj]
      add	r10,1
      mov	[rbp - 1304],r10
      mov	r10,[rbp - 1304]
      mov	[lcj],r10
      mov	r10,[lcj]
      cmp	r10,[lcM]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 1312],r10
      mov	r10,[rbp -  1312]
      cmp	r10,1
      je	_8for
_8forback:
_7while:
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 1320],r10
      mov	r10,[rbp - 1320]
      mov	[lci],r10
      mov	r10,[lci]
      cmp	r10,[lcM]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 1328],r10
      mov	r10,[rbp -  1328]
      cmp	r10,1
      je	_7for
_7forback:
      mov	rdi,[lcN]
      push	r10
      push	r11
      call	getPrime
      pop	r11
      pop	r10
      mov	[rbp -  1336],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 1360],r10
      mov	r10,[rbp - 1360]
      imul	r10,8
      mov	[rbp - 1360],r10
      mov	r10,[lctmp]
      add	r10,[rbp - 1360]
      mov	r10,[r10]
      mov	[lcprimeCount],r10
      mov	qword[lci],1
_9for:
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 1600],r10
      mov	r10,[rbp - 1600]
      mov	[lcj],r10
_10for:
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 1560],r10
      mov	r10,[rbp - 1560]
      imul	r10,8
      mov	[rbp - 1560],r10
      mov	r10,[lcj]
      add	r10,1
      mov	[rbp - 1568],r10
      mov	r10,[rbp - 1568]
      imul	r10,8
      mov	[rbp - 1568],r10
      mov	r10,1
      not	r10
      add	r10,1
      mov	[rbp - 1576],r10
      mov	r11,[lcresult]
      add	r11,[rbp - 1560]
      mov	r11,[r11]
      add	r11,[rbp - 1568]
      mov	r10,[r11]
      cmp	r10,[rbp - 1576]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 1584],r10
      mov	 r10,[rbp-1584]
      cmp	 r10,0
      je	_6else
_6if:
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 1384],r10
      mov	r10,[rbp - 1384]
      imul	r10,8
      mov	[rbp - 1384],r10
      mov	r10,[lcj]
      add	r10,1
      mov	[rbp - 1392],r10
      mov	r10,[rbp - 1392]
      imul	r10,8
      mov	[rbp - 1392],r10
      mov	rdi,[lcN]
      mov	rsi,[lci]
      mov	rdx,[lcj]
      push	r10
      push	r11
      call	getResult
      pop	r11
      pop	r10
      mov	[rbp -  1400],rax
      mov	r10,[rbp - 1400]
      mov	r11,[lcresult]
      add	r11,[rbp - 1384]
      mov	r11,[r11]
      add	r11,[rbp - 1392]
      mov	[r11],r10
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 1520],r10
      mov	r10,[rbp - 1520]
      imul	r10,8
      mov	[rbp - 1520],r10
      mov	r10,[lcj]
      add	r10,1
      mov	[rbp - 1528],r10
      mov	r10,[rbp - 1528]
      imul	r10,8
      mov	[rbp - 1528],r10
      mov	r11,[lcresult]
      add	r11,[rbp - 1520]
      mov	r11,[r11]
      add	r11,[rbp - 1528]
      mov	r10,[r11]
      cmp	r10,1
      setg r10b
      movzx r10,r10b
      mov	[rbp - 1536],r10
      mov	 r10,[rbp-1536]
      cmp	 r10,0
      je	_5else
_5if:
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 1424],r10
      mov	r10,[rbp - 1424]
      imul	r10,8
      mov	[rbp - 1424],r10
      mov	r10,[lcj]
      add	r10,1
      mov	[rbp - 1448],r10
      mov	r10,[rbp - 1448]
      imul	r10,8
      mov	[rbp - 1448],r10
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 1472],r10
      mov	r10,[rbp - 1472]
      imul	r10,8
      mov	[rbp - 1472],r10
      mov	r10,[lcj]
      add	r10,1
      mov	[rbp - 1480],r10
      mov	r10,[rbp - 1480]
      imul	r10,8
      mov	[rbp - 1480],r10
      mov	r10,[lcprime]
      add	r10,[rbp - 1424]
      mov	rdi,[r10]
      mov	r10,[lcprime]
      add	r10,[rbp - 1448]
      mov	rsi,[r10]
      mov	r10,[lcresult]
      add	r10,[rbp - 1472]
      mov	r10,[r10]
      add	r10,[rbp - 1480]
      mov	rdx,[r10]
      push	r10
      push	r11
      mov	rax,0
      call	printF
      pop	r11
      pop	r10
      mov	[rbp -  1488],rax
      mov	r10,[lcresultCount]
      add	r10,1
      mov	[rbp - 1496],r10
      mov	r10,[rbp - 1496]
      mov	[lcresultCount],r10
      jmp	_5ifback
_5else:
_5ifback:
      jmp	_6ifback
_6else:
_6ifback:
_10while:
      mov	r10,[lcj]
      add	r10,1
      mov	[rbp - 1592],r10
      mov	r10,[rbp - 1592]
      mov	[lcj],r10
      mov	r10,[lcj]
      cmp	r10,[lcprimeCount]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 1608],r10
      mov	r10,[rbp -  1608]
      cmp	r10,1
      je	_10for
_10forback:
_9while:
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 1616],r10
      mov	r10,[rbp - 1616]
      mov	[lci],r10
      mov	r10,[lci]
      cmp	r10,[lcprimeCount]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 1624],r10
      mov	r10,[rbp -  1624]
      cmp	r10,1
      je	_9for
_9forback:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'T'
      mov	byte[rax + 1],'o'
      mov	byte[rax + 2],'t'
      mov	byte[rax + 3],'a'
      mov	byte[rax + 4],'l'
      mov	byte[rax + 5],':'
      mov	byte[rax + 6],' '
      mov	byte[rax + 7],0
      mov	[rbp - 1632],rax
      mov	rdi,[rbp-1632]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  1640],rax
      mov	rdi,[lcresultCount]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  1648],rax
      mov	rdi,[rbp-1648]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  1656],rax
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

lcN:
	dq 0
lcM:
	dq 0
lci:
	dq 0
lcj:
	dq 0
lcprimeCount:
	dq 0
lcresultCount:
	dq 0
lcb:
	dq 0
lcprime:
	dq 0
lcgps:
	dq 0
lctmp:
	dq 0
lcresult:
	dq 0
section .bss
stringbuffer:
	resb 256

