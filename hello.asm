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
exchange:
      push	rbp
      mov	rbp,rsp
      sub	rsp,128
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	r10,[rbp - 8]
      add	r10,1
      mov	[rbp - 48],r10
      mov	r10,[rbp - 48]
      imul	r10,8
      mov	[rbp - 48],r10
      mov	r10,[lca]
      add	r10,[rbp - 48]
      mov	r10,[r10]
      mov	[rbp - 24],r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov	[rbp - 72],r10
      mov	r10,[rbp - 72]
      imul	r10,8
      mov	[rbp - 72],r10
      mov	r10,[rbp - 16]
      add	r10,1
      mov	[rbp - 96],r10
      mov	r10,[rbp - 96]
      imul	r10,8
      mov	[rbp - 96],r10
      mov	r10,[lca]
      add	r10,[rbp - 96]
      mov	r10,[r10]
      mov	r11,[lca]
      add	r11,[rbp - 72]
      mov	[r11],r10
      mov	r10,[rbp - 16]
      add	r10,1
      mov	[rbp - 120],r10
      mov	r10,[rbp - 120]
      imul	r10,8
      mov	[rbp - 120],r10
      mov	r10,[rbp - 24]
      mov	r11,[lca]
      add	r11,[rbp - 120]
      mov	[r11],r10
      mov	rsp,rbp
      pop rbp
      ret
makeHeap:
      push	rbp
      mov	rbp,rsp
      sub	rsp,384
      mov	r10,[lcn]
      sub	r10,1
      mov	[rbp - 152],r10
      mov	eax,[rbp - 152]
      mov	r10,2
      mov	r10d,2
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 160],rax
      mov	r10,[rbp - 160]
      mov	[rbp - 128],r10
      mov	qword[rbp - 136],0
      mov	qword[rbp - 144],0
      jmp	_0while
_0for:
      mov	r10,[rbp - 128]
      imul	r10,2
      mov	[rbp - 168],r10
      mov	r10,[rbp - 168]
      mov	[rbp - 144],r10
      mov	r10,[rbp - 128]
      imul	r10,2
      mov	[rbp - 192],r10
      mov	r10,[rbp - 192]
      add	r10,1
      mov	[rbp - 200],r10
      mov	r10,[rbp - 200]
      cmp	r10,[lcn]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 208],r10
      mov	r10,[rbp - 208]
      cmp	r10,0
      je	_0check
      mov	r10,[rbp - 128]
      imul	r10,2
      mov	[rbp - 232],r10
      mov	r10,[rbp - 232]
      add	r10,1
      mov	[rbp - 240],r10
      mov	r10,[rbp - 240]
      add	r10,1
      mov	[rbp - 248],r10
      mov	r10,[rbp - 248]
      imul	r10,8
      mov	[rbp - 248],r10
      mov	r10,[rbp - 128]
      imul	r10,2
      mov	[rbp - 272],r10
      mov	r10,[rbp - 272]
      add	r10,1
      mov	[rbp - 280],r10
      mov	r10,[rbp - 280]
      imul	r10,8
      mov	[rbp - 280],r10
      mov	r11,[lca]
      add	r11,[rbp - 248]
      mov	r10,[r11]
      mov	r11,[lca]
      add	r11,[rbp - 280]
      cmp	r10,[r11]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 288],r10
      mov	r10,[rbp - 208]
      and	r10,[rbp - 288]
_0check:
      mov	[rbp - 296],r10
      mov	 r10,[rbp-296]
      cmp	 r10,0
      je	_0else
_0if:
      mov	r10,[rbp - 128]
      imul	r10,2
      mov	[rbp - 176],r10
      mov	r10,[rbp - 176]
      add	r10,1
      mov	[rbp - 184],r10
      mov	r10,[rbp - 184]
      mov	[rbp - 144],r10
      jmp	_0ifback
_0else:
_0ifback:
      mov	r10,[rbp - 128]
      add	r10,1
      mov	[rbp - 328],r10
      mov	r10,[rbp - 328]
      imul	r10,8
      mov	[rbp - 328],r10
      mov	r10,[rbp - 144]
      add	r10,1
      mov	[rbp - 352],r10
      mov	r10,[rbp - 352]
      imul	r10,8
      mov	[rbp - 352],r10
      mov	r11,[lca]
      add	r11,[rbp - 328]
      mov	r10,[r11]
      mov	r11,[lca]
      add	r11,[rbp - 352]
      cmp	r10,[r11]
      setg r10b
      movzx r10,r10b
      mov	[rbp - 360],r10
      mov	 r10,[rbp-360]
      cmp	 r10,0
      je	_1else
_1if:
      mov	rdi,[rbp-128]
      mov	rsi,[rbp-144]
      push	r10
      push	r11
      call	exchange
      pop	r11
      pop	r10
      mov	[rbp -  304],rax
      jmp	_1ifback
_1else:
_1ifback:
      mov	r10,[rbp - 128]
      sub	r10,1
      mov	[rbp - 368],r10
      mov	r10,[rbp - 368]
      mov	[rbp - 128],r10
_0while:
      mov	r10,[rbp - 128]
      cmp	r10,0
      setge r10b
      movzx r10,r10b
      mov	[rbp - 376],r10
      mov	r10,[rbp -  376]
      cmp	r10,1
      je	_0for
_0forback:
      mov	rax,0
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
adjustHeap:
      push	rbp
      mov	rbp,rsp
      sub	rsp,728
      mov	[rbp - 384],rdi
      mov	qword[rbp - 392],0
      mov	qword[rbp - 400],0
      mov	qword[rbp - 408],0
      jmp	_1while
_1for:
      mov	r10,[rbp - 392]
      imul	r10,2
      mov	[rbp - 416],r10
      mov	r10,[rbp - 416]
      mov	[rbp - 400],r10
      mov	r10,[rbp - 392]
      imul	r10,2
      mov	[rbp - 440],r10
      mov	r10,[rbp - 440]
      add	r10,1
      mov	[rbp - 448],r10
      mov	r10,[rbp - 448]
      cmp	r10,[rbp - 384]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 456],r10
      mov	r10,[rbp - 456]
      cmp	r10,0
      je	_1check
      mov	r10,[rbp - 392]
      imul	r10,2
      mov	[rbp - 480],r10
      mov	r10,[rbp - 480]
      add	r10,1
      mov	[rbp - 488],r10
      mov	r10,[rbp - 488]
      add	r10,1
      mov	[rbp - 496],r10
      mov	r10,[rbp - 496]
      imul	r10,8
      mov	[rbp - 496],r10
      mov	r10,[rbp - 392]
      imul	r10,2
      mov	[rbp - 520],r10
      mov	r10,[rbp - 520]
      add	r10,1
      mov	[rbp - 528],r10
      mov	r10,[rbp - 528]
      imul	r10,8
      mov	[rbp - 528],r10
      mov	r11,[lca]
      add	r11,[rbp - 496]
      mov	r10,[r11]
      mov	r11,[lca]
      add	r11,[rbp - 528]
      cmp	r10,[r11]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 536],r10
      mov	r10,[rbp - 456]
      and	r10,[rbp - 536]
_1check:
      mov	[rbp - 544],r10
      mov	 r10,[rbp-544]
      cmp	 r10,0
      je	_2else
_2if:
      mov	r10,[rbp - 392]
      imul	r10,2
      mov	[rbp - 424],r10
      mov	r10,[rbp - 424]
      add	r10,1
      mov	[rbp - 432],r10
      mov	r10,[rbp - 432]
      mov	[rbp - 400],r10
      jmp	_2ifback
_2else:
_2ifback:
      mov	r10,[rbp - 392]
      add	r10,1
      mov	[rbp - 672],r10
      mov	r10,[rbp - 672]
      imul	r10,8
      mov	[rbp - 672],r10
      mov	r10,[rbp - 400]
      add	r10,1
      mov	[rbp - 696],r10
      mov	r10,[rbp - 696]
      imul	r10,8
      mov	[rbp - 696],r10
      mov	r11,[lca]
      add	r11,[rbp - 672]
      mov	r10,[r11]
      mov	r11,[lca]
      add	r11,[rbp - 696]
      cmp	r10,[r11]
      setg r10b
      movzx r10,r10b
      mov	[rbp - 704],r10
      mov	 r10,[rbp-704]
      cmp	 r10,0
      je	_3else
_3if:
      mov	r10,[rbp - 392]
      add	r10,1
      mov	[rbp - 576],r10
      mov	r10,[rbp - 576]
      imul	r10,8
      mov	[rbp - 576],r10
      mov	r10,[lca]
      add	r10,[rbp - 576]
      mov	r10,[r10]
      mov	[rbp - 552],r10
      mov	r10,[rbp - 392]
      add	r10,1
      mov	[rbp - 600],r10
      mov	r10,[rbp - 600]
      imul	r10,8
      mov	[rbp - 600],r10
      mov	r10,[rbp - 400]
      add	r10,1
      mov	[rbp - 624],r10
      mov	r10,[rbp - 624]
      imul	r10,8
      mov	[rbp - 624],r10
      mov	r10,[lca]
      add	r10,[rbp - 624]
      mov	r10,[r10]
      mov	r11,[lca]
      add	r11,[rbp - 600]
      mov	[r11],r10
      mov	r10,[rbp - 400]
      add	r10,1
      mov	[rbp - 648],r10
      mov	r10,[rbp - 648]
      imul	r10,8
      mov	[rbp - 648],r10
      mov	r10,[rbp - 552]
      mov	r11,[lca]
      add	r11,[rbp - 648]
      mov	[r11],r10
      mov	r10,[rbp - 400]
      mov	[rbp - 392],r10
      jmp	_3ifback
_3else:
      jmp	_1forback
_3ifback:
_1while:
      mov	r10,[rbp - 392]
      imul	r10,2
      mov	[rbp - 712],r10
      mov	r10,[rbp - 712]
      cmp	r10,[rbp - 384]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 720],r10
      mov	r10,[rbp -  720]
      cmp	r10,1
      je	_1for
_1forback:
      mov	rax,0
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
heapSort:
      push	rbp
      mov	rbp,rsp
      sub	rsp,920
      mov	qword[rbp - 728],0
      mov	qword[rbp - 736],0
_2for:
      mov	r10,0
      add	r10,1
      mov	[rbp - 760],r10
      mov	r10,[rbp - 760]
      imul	r10,8
      mov	[rbp - 760],r10
      mov	r10,[lca]
      add	r10,[rbp - 760]
      mov	r10,[r10]
      mov	[rbp - 728],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 784],r10
      mov	r10,[rbp - 784]
      imul	r10,8
      mov	[rbp - 784],r10
      mov	r10,[lcn]
      sub	r10,[rbp - 736]
      mov	[rbp - 808],r10
      mov	r10,[rbp - 808]
      sub	r10,1
      mov	[rbp - 816],r10
      mov	r10,[rbp - 816]
      add	r10,1
      mov	[rbp - 824],r10
      mov	r10,[rbp - 824]
      imul	r10,8
      mov	[rbp - 824],r10
      mov	r10,[lca]
      add	r10,[rbp - 824]
      mov	r10,[r10]
      mov	r11,[lca]
      add	r11,[rbp - 784]
      mov	[r11],r10
      mov	r10,[lcn]
      sub	r10,[rbp - 736]
      mov	[rbp - 848],r10
      mov	r10,[rbp - 848]
      sub	r10,1
      mov	[rbp - 856],r10
      mov	r10,[rbp - 856]
      add	r10,1
      mov	[rbp - 864],r10
      mov	r10,[rbp - 864]
      imul	r10,8
      mov	[rbp - 864],r10
      mov	r10,[rbp - 728]
      mov	r11,[lca]
      add	r11,[rbp - 864]
      mov	[r11],r10
      mov	r10,[lcn]
      sub	r10,[rbp - 736]
      mov	[rbp - 872],r10
      mov	r10,[rbp - 872]
      sub	r10,1
      mov	[rbp - 880],r10
      mov	rdi,[rbp-880]
      push	r10
      push	r11
      call	adjustHeap
      pop	r11
      pop	r10
      mov	[rbp -  888],rax
      mov	r10,[rbp - 736]
      add	r10,1
      mov	[rbp - 896],r10
      mov	r10,[rbp - 896]
      mov	[rbp - 736],r10
      mov	r10,[rbp - 736]
      cmp	r10,[lcn]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 904],r10
      mov	r10,[rbp -  904]
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
main:
      push	rbp
      mov	rbp,rsp
      sub	rsp,1136
      push	r10
      push	r11
      call	getString
      pop	r11
      pop	r10
      mov	[rbp -  928],rax
      mov	rdi,rax
      push	r10
      push	r11
      call	string.parseInt
      pop	r11
      pop	r10
      mov	[rbp -  936],rax
      mov	r10,[rbp - 936]
      mov	[lcn],r10
      mov	r10,[lcn]
      add	r10,1
      mov	[rbp - 944],r10
      mov	r10,[rbp - 944]
      imul	r10,8
      mov	[rbp - 944],r10
      mov	rdi,[rbp-944]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  952],rax
      mov	r11,[rbp - 952]
      add	r11,0
      mov	r10,[lcn]
      mov	qword[r11],r10
      mov	r10,[rbp - 952]
      mov	[lca],r10
      mov	qword[rbp - 920],0
_3for:
      mov	r10,[rbp - 920]
      add	r10,1
      mov	[rbp - 976],r10
      mov	r10,[rbp - 976]
      imul	r10,8
      mov	[rbp - 976],r10
      mov	r10,[rbp - 920]
      mov	r11,[lca]
      add	r11,[rbp - 976]
      mov	[r11],r10
      mov	r10,[rbp - 920]
      add	r10,1
      mov	[rbp - 984],r10
      mov	r10,[rbp - 984]
      mov	[rbp - 920],r10
      mov	r10,[lca]
      add	r10,0
      mov	r10,[r10]
      add	r10,0
      mov	[rbp - 992],r10
      mov	r10,[rbp - 920]
      cmp	r10,[rbp - 992]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 1000],r10
      mov	r10,[rbp -  1000]
      cmp	r10,1
      je	_3for
_3forback:
      push	r10
      push	r11
      call	makeHeap
      pop	r11
      pop	r10
      mov	[rbp -  1016],rax
      push	r10
      push	r11
      call	heapSort
      pop	r11
      pop	r10
      mov	[rbp -  1024],rax
      mov	qword[rbp - 920],0
_4for:
      mov	r10,[rbp - 920]
      add	r10,1
      mov	[rbp - 1048],r10
      mov	r10,[rbp - 1048]
      imul	r10,8
      mov	[rbp - 1048],r10
      mov	r10,[lca]
      add	r10,[rbp - 1048]
      mov	rdi,[r10]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  1056],rax
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],' '
      mov	byte[rax + 1],0
      mov	[rbp - 1064],rax
      mov	rdi,[rbp-1056]
      mov	rsi,[rbp-1064]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  1072],rax
      mov	rdi,[rbp-1072]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  1080],rax
      mov	r10,[rbp - 920]
      add	r10,1
      mov	[rbp - 1088],r10
      mov	r10,[rbp - 1088]
      mov	[rbp - 920],r10
      mov	r10,[lca]
      add	r10,0
      mov	r10,[r10]
      add	r10,0
      mov	[rbp - 1096],r10
      mov	r10,[rbp - 920]
      cmp	r10,[rbp - 1096]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 1104],r10
      mov	r10,[rbp -  1104]
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
      mov	[rbp - 1120],rax
      mov	rdi,[rbp-1120]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  1128],rax
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

lcn:
	dq 0
lca:
	dq 0
section .bss
stringbuffer:
	resb 256

