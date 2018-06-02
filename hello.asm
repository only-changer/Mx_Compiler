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
pointset:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 56],rdi
      mov	[rbp - 32],rsi
      mov	[rbp - 40],rdx
      mov	[rbp - 48],rcx
      mov	r10,[rbp - 32]
      mov	r11,[rbp - 56]
      add	r11,0
      mov	[r11],r10
      mov	r10,[rbp - 40]
      mov	r11,[rbp - 56]
      add	r11,8
      mov	[r11],r10
      mov	r10,[rbp - 48]
      mov	r11,[rbp - 56]
      add	r11,16
      mov	[r11],r10
      mov	rsp,rbp
      pop rbp
      ret
pointsqrLen:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 64],rdi
      mov	r10,[rbp - 64]
      add	r10,0
      mov	r10,[r10]
      mov	r11,[rbp - 64]
      add	r11,0
      imul	r10,[r11]
      mov	[rbp - 72],r10
      mov	r10,[rbp - 64]
      add	r10,8
      mov	r10,[r10]
      mov	r11,[rbp - 64]
      add	r11,8
      imul	r10,[r11]
      mov	[rbp - 80],r10
      mov	r10,[rbp - 72]
      add	r10,[rbp - 80]
      mov	[rbp - 88],r10
      mov	r10,[rbp - 64]
      add	r10,16
      mov	r10,[r10]
      mov	r11,[rbp - 64]
      add	r11,16
      imul	r10,[r11]
      mov	[rbp - 96],r10
      mov	r10,[rbp - 88]
      add	r10,[rbp - 96]
      mov	[rbp - 104],r10
      mov	rax,[rbp -  104]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
pointsqrDis:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 120],rdi
      mov	[rbp - 112],rsi
      mov	r10,[rbp - 120]
      add	r10,0
      mov	r10,[r10]
      mov	r11,[rbp - 112]
      add	r11,0
      sub	r10,[r11]
      mov	[rbp - 128],r10
      mov	r10,[rbp - 120]
      add	r10,0
      mov	r10,[r10]
      mov	r11,[rbp - 112]
      add	r11,0
      sub	r10,[r11]
      mov	[rbp - 136],r10
      mov	r10,[rbp - 128]
      imul	r10,[rbp - 136]
      mov	[rbp - 144],r10
      mov	r10,[rbp - 120]
      add	r10,8
      mov	r10,[r10]
      mov	r11,[rbp - 112]
      add	r11,8
      sub	r10,[r11]
      mov	[rbp - 152],r10
      mov	r10,[rbp - 120]
      add	r10,8
      mov	r10,[r10]
      mov	r11,[rbp - 112]
      add	r11,8
      sub	r10,[r11]
      mov	[rbp - 160],r10
      mov	r10,[rbp - 152]
      imul	r10,[rbp - 160]
      mov	[rbp - 168],r10
      mov	r10,[rbp - 144]
      add	r10,[rbp - 168]
      mov	[rbp - 176],r10
      mov	r10,[rbp - 120]
      add	r10,16
      mov	r10,[r10]
      mov	r11,[rbp - 112]
      add	r11,16
      sub	r10,[r11]
      mov	[rbp - 184],r10
      mov	r10,[rbp - 120]
      add	r10,16
      mov	r10,[r10]
      mov	r11,[rbp - 112]
      add	r11,16
      sub	r10,[r11]
      mov	[rbp - 192],r10
      mov	r10,[rbp - 184]
      imul	r10,[rbp - 192]
      mov	[rbp - 200],r10
      mov	r10,[rbp - 176]
      add	r10,[rbp - 200]
      mov	[rbp - 208],r10
      mov	rax,[rbp -  208]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
pointdot:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 224],rdi
      mov	[rbp - 216],rsi
      mov	r10,[rbp - 224]
      add	r10,0
      mov	r10,[r10]
      mov	r11,[rbp - 216]
      add	r11,0
      imul	r10,[r11]
      mov	[rbp - 232],r10
      mov	r10,[rbp - 224]
      add	r10,8
      mov	r10,[r10]
      mov	r11,[rbp - 216]
      add	r11,8
      imul	r10,[r11]
      mov	[rbp - 240],r10
      mov	r10,[rbp - 232]
      add	r10,[rbp - 240]
      mov	[rbp - 248],r10
      mov	r10,[rbp - 224]
      add	r10,16
      mov	r10,[r10]
      mov	r11,[rbp - 216]
      add	r11,16
      imul	r10,[r11]
      mov	[rbp - 256],r10
      mov	r10,[rbp - 248]
      add	r10,[rbp - 256]
      mov	[rbp - 264],r10
      mov	rax,[rbp -  264]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
pointcross:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 280],rdi
      mov	[rbp - 272],rsi
      mov	rdi,24
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  296],rax
      mov	r10,[rbp - 296]
      mov	[rbp - 288],r10
      mov	r10,[rbp - 280]
      add	r10,8
      mov	r10,[r10]
      mov	r11,[rbp - 272]
      add	r11,16
      imul	r10,[r11]
      mov	[rbp - 304],r10
      mov	r10,[rbp - 280]
      add	r10,16
      mov	r10,[r10]
      mov	r11,[rbp - 272]
      add	r11,8
      imul	r10,[r11]
      mov	[rbp - 312],r10
      mov	r10,[rbp - 304]
      sub	r10,[rbp - 312]
      mov	[rbp - 320],r10
      mov	r10,[rbp - 280]
      add	r10,16
      mov	r10,[r10]
      mov	r11,[rbp - 272]
      add	r11,0
      imul	r10,[r11]
      mov	[rbp - 328],r10
      mov	r10,[rbp - 280]
      add	r10,0
      mov	r10,[r10]
      mov	r11,[rbp - 272]
      add	r11,16
      imul	r10,[r11]
      mov	[rbp - 336],r10
      mov	r10,[rbp - 328]
      sub	r10,[rbp - 336]
      mov	[rbp - 344],r10
      mov	r10,[rbp - 280]
      add	r10,0
      mov	r10,[r10]
      mov	r11,[rbp - 272]
      add	r11,8
      imul	r10,[r11]
      mov	[rbp - 352],r10
      mov	r10,[rbp - 280]
      add	r10,8
      mov	r10,[r10]
      mov	r11,[rbp - 272]
      add	r11,0
      imul	r10,[r11]
      mov	[rbp - 360],r10
      mov	r10,[rbp - 352]
      sub	r10,[rbp - 360]
      mov	[rbp - 368],r10
      mov	rdi,[rbp-288]
      mov	rsi,[rbp-280]
      mov	rdx,[rbp-320]
      mov	rcx,[rbp-344]
      mov	r8,[rbp-368]
      push	r10
      push	r11
      call	pointset
      pop	r11
      pop	r10
      mov	[rbp -  392],rax
      mov	rax,[rbp -  288]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
pointadd:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 408],rdi
      mov	[rbp - 400],rsi
      mov	r10,[rbp - 408]
      add	r10,0
      mov	r10,[r10]
      mov	r11,[rbp - 400]
      add	r11,0
      add	r10,[r11]
      mov	[rbp - 416],r10
      mov	r10,[rbp - 416]
      mov	r11,[rbp - 408]
      add	r11,0
      mov	[r11],r10
      mov	r10,[rbp - 408]
      add	r10,8
      mov	r10,[r10]
      mov	r11,[rbp - 400]
      add	r11,8
      add	r10,[r11]
      mov	[rbp - 424],r10
      mov	r10,[rbp - 424]
      mov	r11,[rbp - 408]
      add	r11,8
      mov	[r11],r10
      mov	r10,[rbp - 408]
      add	r10,16
      mov	r10,[r10]
      mov	r11,[rbp - 400]
      add	r11,16
      add	r10,[r11]
      mov	[rbp - 432],r10
      mov	r10,[rbp - 432]
      mov	r11,[rbp - 408]
      add	r11,16
      mov	[r11],r10
      mov	rax,[rbp -  408]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
pointsub:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 448],rdi
      mov	[rbp - 440],rsi
      mov	r10,[rbp - 448]
      add	r10,0
      mov	r10,[r10]
      mov	r11,[rbp - 440]
      add	r11,0
      sub	r10,[r11]
      mov	[rbp - 456],r10
      mov	r10,[rbp - 456]
      mov	r11,[rbp - 448]
      add	r11,0
      mov	[r11],r10
      mov	r10,[rbp - 448]
      add	r10,8
      mov	r10,[r10]
      mov	r11,[rbp - 440]
      add	r11,8
      sub	r10,[r11]
      mov	[rbp - 464],r10
      mov	r10,[rbp - 464]
      mov	r11,[rbp - 448]
      add	r11,8
      mov	[r11],r10
      mov	r10,[rbp - 448]
      add	r10,16
      mov	r10,[r10]
      mov	r11,[rbp - 440]
      add	r11,16
      sub	r10,[r11]
      mov	[rbp - 472],r10
      mov	r10,[rbp - 472]
      mov	r11,[rbp - 448]
      add	r11,16
      mov	[r11],r10
      mov	rax,[rbp -  448]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
pointprintPoint:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 480],rdi
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'('
      mov	byte[rax + 1],0
      mov	[rbp - 488],rax
      mov	r10,[rbp - 480]
      add	r10,0
      mov	rdi,[r10]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  496],rax
      mov	rdi,[rbp-488]
      mov	rsi,[rbp-496]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  504],rax
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],','
      mov	byte[rax + 1],' '
      mov	byte[rax + 2],0
      mov	[rbp - 512],rax
      mov	rdi,[rbp-504]
      mov	rsi,[rbp-512]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  520],rax
      mov	r10,[rbp - 480]
      add	r10,8
      mov	rdi,[r10]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  528],rax
      mov	rdi,[rbp-520]
      mov	rsi,[rbp-528]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  536],rax
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],','
      mov	byte[rax + 1],' '
      mov	byte[rax + 2],0
      mov	[rbp - 544],rax
      mov	rdi,[rbp-536]
      mov	rsi,[rbp-544]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  552],rax
      mov	r10,[rbp - 480]
      add	r10,16
      mov	rdi,[r10]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  560],rax
      mov	rdi,[rbp-552]
      mov	rsi,[rbp-560]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  568],rax
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],')'
      mov	byte[rax + 1],0
      mov	[rbp - 576],rax
      mov	rdi,[rbp-568]
      mov	rsi,[rbp-576]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  584],rax
      mov	rdi,[rbp-584]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  592],rax
      mov	rsp,rbp
      pop rbp
      ret
main:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	rdi,24
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  608],rax
      mov	r10,[rbp - 608]
      mov	[rbp - 600],r10
      mov	rdi,24
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  624],rax
      mov	r10,[rbp - 624]
      mov	[rbp - 616],r10
      mov	rdi,24
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  640],rax
      mov	r10,[rbp - 640]
      mov	[rbp - 632],r10
      mov	rdi,24
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  656],rax
      mov	r10,[rbp - 656]
      mov	[rbp - 648],r10
      mov	rdi,[rbp-600]
      push	r10
      push	r11
      mov	rax,0
      call	pointprintPoint
      pop	r11
      pop	r10
      mov	[rbp -  672],rax
      mov	r10,463
      not	r10
      add	r10,1
      mov	[rbp - 680],r10
      mov	rdi,[rbp-600]
      mov	rsi,849
      mov	rdx,[rbp-680]
      mov	rcx,480
      push	r10
      push	r11
      call	pointset
      pop	r11
      pop	r10
      mov	[rbp -  696],rax
      mov	r10,208
      not	r10
      add	r10,1
      mov	[rbp - 704],r10
      mov	r10,150
      not	r10
      add	r10,1
      mov	[rbp - 712],r10
      mov	rdi,[rbp-616]
      mov	rsi,[rbp-704]
      mov	rdx,585
      mov	rcx,[rbp-712]
      push	r10
      push	r11
      call	pointset
      pop	r11
      pop	r10
      mov	[rbp -  728],rax
      mov	r10,670
      not	r10
      add	r10,1
      mov	[rbp - 736],r10
      mov	r10,742
      not	r10
      add	r10,1
      mov	[rbp - 744],r10
      mov	rdi,[rbp-632]
      mov	rsi,360
      mov	rdx,[rbp-736]
      mov	rcx,[rbp-744]
      push	r10
      push	r11
      call	pointset
      pop	r11
      pop	r10
      mov	[rbp -  760],rax
      mov	r10,29
      not	r10
      add	r10,1
      mov	[rbp - 768],r10
      mov	r10,591
      not	r10
      add	r10,1
      mov	[rbp - 776],r10
      mov	r10,960
      not	r10
      add	r10,1
      mov	[rbp - 784],r10
      mov	rdi,[rbp-648]
      mov	rsi,[rbp-768]
      mov	rdx,[rbp-776]
      mov	rcx,[rbp-784]
      push	r10
      push	r11
      call	pointset
      pop	r11
      pop	r10
      mov	[rbp -  800],rax
      mov	rdi,[rbp-600]
      mov	rsi,[rbp-616]
      push	r10
      push	r11
      call	pointadd
      pop	r11
      pop	r10
      mov	[rbp -  816],rax
      mov	rdi,[rbp-616]
      mov	rsi,[rbp-632]
      push	r10
      push	r11
      call	pointadd
      pop	r11
      pop	r10
      mov	[rbp -  832],rax
      mov	rdi,[rbp-648]
      mov	rsi,[rbp-632]
      push	r10
      push	r11
      call	pointadd
      pop	r11
      pop	r10
      mov	[rbp -  848],rax
      mov	rdi,[rbp-632]
      mov	rsi,[rbp-600]
      push	r10
      push	r11
      call	pointsub
      pop	r11
      pop	r10
      mov	[rbp -  864],rax
      mov	rdi,[rbp-616]
      mov	rsi,[rbp-648]
      push	r10
      push	r11
      call	pointsub
      pop	r11
      pop	r10
      mov	[rbp -  880],rax
      mov	rdi,[rbp-648]
      mov	rsi,[rbp-632]
      push	r10
      push	r11
      call	pointsub
      pop	r11
      pop	r10
      mov	[rbp -  896],rax
      mov	rdi,[rbp-632]
      mov	rsi,[rbp-616]
      push	r10
      push	r11
      call	pointadd
      pop	r11
      pop	r10
      mov	[rbp -  912],rax
      mov	rdi,[rbp-600]
      mov	rsi,[rbp-616]
      push	r10
      push	r11
      call	pointadd
      pop	r11
      pop	r10
      mov	[rbp -  928],rax
      mov	rdi,[rbp-616]
      mov	rsi,[rbp-616]
      push	r10
      push	r11
      call	pointadd
      pop	r11
      pop	r10
      mov	[rbp -  944],rax
      mov	rdi,[rbp-632]
      mov	rsi,[rbp-632]
      push	r10
      push	r11
      call	pointadd
      pop	r11
      pop	r10
      mov	[rbp -  960],rax
      mov	rdi,[rbp-600]
      mov	rsi,[rbp-648]
      push	r10
      push	r11
      call	pointsub
      pop	r11
      pop	r10
      mov	[rbp -  976],rax
      mov	rdi,[rbp-600]
      mov	rsi,[rbp-616]
      push	r10
      push	r11
      call	pointadd
      pop	r11
      pop	r10
      mov	[rbp -  992],rax
      mov	rdi,[rbp-616]
      mov	rsi,[rbp-632]
      push	r10
      push	r11
      call	pointsub
      pop	r11
      pop	r10
      mov	[rbp -  1008],rax
      mov	rdi,[rbp-600]
      push	r10
      push	r11
      call	pointsqrLen
      pop	r11
      pop	r10
      mov	[rbp -  1024],rax
      mov	rdi,[rbp-1024]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  1032],rax
      mov	rdi,[rbp-1032]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  1040],rax
      mov	rdi,[rbp-616]
      push	r10
      push	r11
      call	pointsqrLen
      pop	r11
      pop	r10
      mov	[rbp -  1056],rax
      mov	rdi,[rbp-1056]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  1064],rax
      mov	rdi,[rbp-1064]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  1072],rax
      mov	rdi,[rbp-616]
      mov	rsi,[rbp-632]
      push	r10
      push	r11
      call	pointsqrDis
      pop	r11
      pop	r10
      mov	[rbp -  1088],rax
      mov	rdi,[rbp-1088]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  1096],rax
      mov	rdi,[rbp-1096]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  1104],rax
      mov	rdi,[rbp-648]
      mov	rsi,[rbp-600]
      push	r10
      push	r11
      call	pointsqrDis
      pop	r11
      pop	r10
      mov	[rbp -  1120],rax
      mov	rdi,[rbp-1120]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  1128],rax
      mov	rdi,[rbp-1128]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  1136],rax
      mov	rdi,[rbp-632]
      mov	rsi,[rbp-600]
      push	r10
      push	r11
      call	pointdot
      pop	r11
      pop	r10
      mov	[rbp -  1152],rax
      mov	rdi,[rbp-1152]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  1160],rax
      mov	rdi,[rbp-1160]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  1168],rax
      mov	rdi,[rbp-616]
      mov	rsi,[rbp-648]
      push	r10
      push	r11
      call	pointcross
      pop	r11
      pop	r10
      mov	[rbp -  1184],rax
      mov	rdi,rax
      push	r10
      push	r11
      mov	rax,0
      call	pointprintPoint
      pop	r11
      pop	r10
      mov	[rbp -  1192],rax
      mov	rdi,[rbp-600]
      push	r10
      push	r11
      mov	rax,0
      call	pointprintPoint
      pop	r11
      pop	r10
      mov	[rbp -  1208],rax
      mov	rdi,[rbp-616]
      push	r10
      push	r11
      mov	rax,0
      call	pointprintPoint
      pop	r11
      pop	r10
      mov	[rbp -  1224],rax
      mov	rdi,[rbp-632]
      push	r10
      push	r11
      mov	rax,0
      call	pointprintPoint
      pop	r11
      pop	r10
      mov	[rbp -  1240],rax
      mov	rdi,[rbp-648]
      push	r10
      push	r11
      mov	rax,0
      call	pointprintPoint
      pop	r11
      pop	r10
      mov	[rbp -  1256],rax
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

