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
random:
      push	rbp
      mov	rbp,rsp
      sub	rsp,72
      mov	eax,[lcseed]
      mov	r10d,[lcQ]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 16],rdx
      mov	r10,[lcA]
      imul	r10,[rbp - 16]
      mov	[rbp - 24],r10
      mov	eax,[lcseed]
      mov	r10d,[lcQ]
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 32],rax
      mov	r10,[lcR]
      imul	r10,[rbp - 32]
      mov	[rbp - 40],r10
      mov	r10,[rbp - 24]
      sub	r10,[rbp - 40]
      mov	[rbp - 48],r10
      mov	r10,[rbp - 48]
      mov	[rbp - 8],r10
      mov	r10,[rbp - 8]
      cmp	r10,0
      setge r10b
      movzx r10,r10b
      mov	[rbp - 64],r10
      mov	 r10,[rbp-64]
      cmp	 r10,0
      je	_0else
_0if:
      mov	r10,[rbp - 8]
      mov	[lcseed],r10
      jmp	_0ifback
_0else:
      mov	r10,[rbp - 8]
      add	r10,[lcM]
      mov	[rbp - 56],r10
      mov	r10,[rbp - 56]
      mov	[lcseed],r10
_0ifback:
      mov	rax,[lcseed]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
initialize:
      push	rbp
      mov	rbp,rsp
      sub	rsp,72
      mov	[rbp - 72],rdi
      mov	r10,[rbp - 72]
      mov	[lcseed],r10
      mov	rsp,rbp
      pop rbp
      ret
swap:
      push	rbp
      mov	rbp,rsp
      sub	rsp,200
      mov	[rbp - 80],rdi
      mov	[rbp - 88],rsi
      mov	r10,[rbp - 80]
      add	r10,1
      mov	[rbp - 120],r10
      mov	r10,[rbp - 120]
      imul	r10,8
      mov	[rbp - 120],r10
      mov	r10,[lca]
      add	r10,[rbp - 120]
      mov	r10,[r10]
      mov	[rbp - 96],r10
      mov	r10,[rbp - 80]
      add	r10,1
      mov	[rbp - 144],r10
      mov	r10,[rbp - 144]
      imul	r10,8
      mov	[rbp - 144],r10
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 168],r10
      mov	r10,[rbp - 168]
      imul	r10,8
      mov	[rbp - 168],r10
      mov	r10,[lca]
      add	r10,[rbp - 168]
      mov	r10,[r10]
      mov	r11,[lca]
      add	r11,[rbp - 144]
      mov	[r11],r10
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 192],r10
      mov	r10,[rbp - 192]
      imul	r10,8
      mov	[rbp - 192],r10
      mov	r10,[rbp - 96]
      mov	r11,[lca]
      add	r11,[rbp - 192]
      mov	[r11],r10
      mov	rsp,rbp
      pop rbp
      ret
pd:
      push	rbp
      mov	rbp,rsp
      sub	rsp,248
      mov	[rbp - 200],rdi
_0for:
      mov	r10,[lch]
      add	r10,1
      mov	[rbp - 208],r10
      mov	r10,[lch]
      imul	r10,[rbp - 208]
      mov	[rbp - 216],r10
      mov	eax,[rbp - 216]
      mov	r10d,2
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 224],rax
      mov	r10,[rbp - 200]
      cmp	r10,[rbp - 224]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 232],r10
      mov	 r10,[rbp-232]
      cmp	 r10,0
      je	_1else
_1if:
      mov	rax,1
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_1ifback
_1else:
_1ifback:
_0while:
      mov	r10,[lch]
      add	r10,1
      mov	[lch],r10
      mov	r10,[lch]
      cmp	r10,[rbp - 200]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 240],r10
      mov	r10,[rbp -  240]
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
show:
      push	rbp
      mov	rbp,rsp
      sub	rsp,336
      mov	qword[rbp - 248],0
_1for:
      mov	r10,[rbp - 248]
      add	r10,1
      mov	[rbp - 272],r10
      mov	r10,[rbp - 272]
      imul	r10,8
      mov	[rbp - 272],r10
      mov	r10,[lca]
      add	r10,[rbp - 272]
      mov	rdi,[r10]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  280],rax
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],' '
      mov	byte[rax + 1],0
      mov	[rbp - 288],rax
      mov	rdi,[rbp-280]
      mov	rsi,[rbp-288]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  296],rax
      mov	rdi,[rbp-296]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  304],rax
_1while:
      mov	r10,[rbp - 248]
      add	r10,1
      mov	[rbp - 248],r10
      mov	r10,[rbp - 248]
      cmp	r10,[lcnow]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 312],r10
      mov	r10,[rbp -  312]
      cmp	r10,1
      je	_1for
_1forback:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],0
      mov	[rbp - 320],rax
      mov	rdi,[rbp-320]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  328],rax
      mov	rsp,rbp
      pop rbp
      ret
win:
      push	rbp
      mov	rbp,rsp
      sub	rsp,680
      mov	r10,100
      add	r10,1
      mov	[rbp - 360],r10
      mov	r10,[rbp - 360]
      imul	r10,8
      mov	[rbp - 360],r10
      mov	rdi,[rbp-360]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  368],rax
      mov	r11,[rbp - 368]
      add	r11,0
      mov	qword[r11],100
      mov	r10,[rbp - 368]
      mov	[rbp - 352],r10
      mov	r10,[lcnow]
      cmp	r10,[lch]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 384],r10
      mov	 r10,[rbp-384]
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
      mov	qword[rbp - 344],0
_2for:
      mov	r10,[rbp - 344]
      add	r10,1
      mov	[rbp - 408],r10
      mov	r10,[rbp - 408]
      imul	r10,8
      mov	[rbp - 408],r10
      mov	r10,[rbp - 344]
      add	r10,1
      mov	[rbp - 432],r10
      mov	r10,[rbp - 432]
      imul	r10,8
      mov	[rbp - 432],r10
      mov	r10,[lca]
      add	r10,[rbp - 432]
      mov	r10,[r10]
      mov	r11,[rbp - 352]
      add	r11,[rbp - 408]
      mov	[r11],r10
_2while:
      mov	r10,[rbp - 344]
      add	r10,1
      mov	[rbp - 344],r10
      mov	r10,[rbp - 344]
      cmp	r10,[lcnow]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 440],r10
      mov	r10,[rbp -  440]
      cmp	r10,1
      je	_2for
_2forback:
      mov	qword[rbp - 336],0
_3for:
      mov	r10,[rbp - 336]
      add	r10,1
      mov	[rbp - 600],r10
      mov	r10,[rbp - 600]
      mov	[rbp - 344],r10
_4for:
      mov	r10,[rbp - 336]
      add	r10,1
      mov	[rbp - 560],r10
      mov	r10,[rbp - 560]
      imul	r10,8
      mov	[rbp - 560],r10
      mov	r10,[rbp - 344]
      add	r10,1
      mov	[rbp - 584],r10
      mov	r10,[rbp - 584]
      imul	r10,8
      mov	[rbp - 584],r10
      mov	r11,[rbp - 352]
      add	r11,[rbp - 560]
      mov	r10,[r11]
      mov	r11,[rbp - 352]
      add	r11,[rbp - 584]
      cmp	r10,[r11]
      setg r10b
      movzx r10,r10b
      mov	[rbp - 592],r10
      mov	 r10,[rbp-592]
      cmp	 r10,0
      je	_3else
_3if:
      mov	r10,[rbp - 336]
      add	r10,1
      mov	[rbp - 464],r10
      mov	r10,[rbp - 464]
      imul	r10,8
      mov	[rbp - 464],r10
      mov	r10,[rbp - 352]
      add	r10,[rbp - 464]
      mov	r10,[r10]
      mov	[rbp - 376],r10
      mov	r10,[rbp - 336]
      add	r10,1
      mov	[rbp - 488],r10
      mov	r10,[rbp - 488]
      imul	r10,8
      mov	[rbp - 488],r10
      mov	r10,[rbp - 344]
      add	r10,1
      mov	[rbp - 512],r10
      mov	r10,[rbp - 512]
      imul	r10,8
      mov	[rbp - 512],r10
      mov	r10,[rbp - 352]
      add	r10,[rbp - 512]
      mov	r10,[r10]
      mov	r11,[rbp - 352]
      add	r11,[rbp - 488]
      mov	[r11],r10
      mov	r10,[rbp - 344]
      add	r10,1
      mov	[rbp - 536],r10
      mov	r10,[rbp - 536]
      imul	r10,8
      mov	[rbp - 536],r10
      mov	r10,[rbp - 376]
      mov	r11,[rbp - 352]
      add	r11,[rbp - 536]
      mov	[r11],r10
      jmp	_3ifback
_3else:
_3ifback:
_4while:
      mov	r10,[rbp - 344]
      add	r10,1
      mov	[rbp - 344],r10
      mov	r10,[rbp - 344]
      cmp	r10,[lcnow]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 608],r10
      mov	r10,[rbp -  608]
      cmp	r10,1
      je	_4for
_4forback:
_3while:
      mov	r10,[rbp - 336]
      add	r10,1
      mov	[rbp - 336],r10
      mov	r10,[lcnow]
      sub	r10,1
      mov	[rbp - 616],r10
      mov	r10,[rbp - 336]
      cmp	r10,[rbp - 616]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 624],r10
      mov	r10,[rbp -  624]
      cmp	r10,1
      je	_3for
_3forback:
      mov	qword[rbp - 336],0
_5for:
      mov	r10,[rbp - 336]
      add	r10,1
      mov	[rbp - 648],r10
      mov	r10,[rbp - 648]
      imul	r10,8
      mov	[rbp - 648],r10
      mov	r10,[rbp - 336]
      add	r10,1
      mov	[rbp - 656],r10
      mov	r11,[rbp - 352]
      add	r11,[rbp - 648]
      mov	r10,[r11]
      cmp	r10,[rbp - 656]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 664],r10
      mov	 r10,[rbp-664]
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
_5while:
      mov	r10,[rbp - 336]
      add	r10,1
      mov	[rbp - 336],r10
      mov	r10,[rbp - 336]
      cmp	r10,[lcnow]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 672],r10
      mov	r10,[rbp -  672]
      cmp	r10,1
      je	_5for
_5forback:
      mov	rax,1
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
merge:
      push	rbp
      mov	rbp,rsp
      sub	rsp,832
      mov	qword[rbp - 680],0
_6for:
      mov	r10,[rbp - 680]
      add	r10,1
      mov	[rbp - 768],r10
      mov	r10,[rbp - 768]
      imul	r10,8
      mov	[rbp - 768],r10
      mov	r11,[lca]
      add	r11,[rbp - 768]
      mov	r10,[r11]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov	[rbp - 776],r10
      mov	 r10,[rbp-776]
      cmp	 r10,0
      je	_6else
_6if:
      mov	r10,[rbp - 680]
      add	r10,1
      mov	[rbp - 736],r10
      mov	r10,[rbp - 736]
      mov	[rbp - 688],r10
_7for:
      mov	r10,[rbp - 688]
      add	r10,1
      mov	[rbp - 720],r10
      mov	r10,[rbp - 720]
      imul	r10,8
      mov	[rbp - 720],r10
      mov	r11,[lca]
      add	r11,[rbp - 720]
      mov	r10,[r11]
      cmp	r10,0
      setne r10b
      movzx r10,r10b
      mov	[rbp - 728],r10
      mov	 r10,[rbp-728]
      cmp	 r10,0
      je	_5else
_5if:
      mov	rdi,[rbp-680]
      mov	rsi,[rbp-688]
      push	r10
      push	r11
      call	swap
      pop	r11
      pop	r10
      mov	[rbp -  696],rax
      jmp	_7forback
      jmp	_5ifback
_5else:
_5ifback:
_7while:
      mov	r10,[rbp - 688]
      add	r10,1
      mov	[rbp - 688],r10
      mov	r10,[rbp - 688]
      cmp	r10,[lcnow]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 744],r10
      mov	r10,[rbp -  744]
      cmp	r10,1
      je	_7for
_7forback:
      jmp	_6ifback
_6else:
_6ifback:
_6while:
      mov	r10,[rbp - 680]
      add	r10,1
      mov	[rbp - 680],r10
      mov	r10,[rbp - 680]
      cmp	r10,[lcnow]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 784],r10
      mov	r10,[rbp -  784]
      cmp	r10,1
      je	_6for
_6forback:
      mov	qword[rbp - 680],0
_8for:
      mov	r10,[rbp - 680]
      add	r10,1
      mov	[rbp - 808],r10
      mov	r10,[rbp - 808]
      imul	r10,8
      mov	[rbp - 808],r10
      mov	r11,[lca]
      add	r11,[rbp - 808]
      mov	r10,[r11]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov	[rbp - 816],r10
      mov	 r10,[rbp-816]
      cmp	 r10,0
      je	_7else
_7if:
      mov	r10,[rbp - 680]
      mov	[lcnow],r10
      jmp	_8forback
      jmp	_7ifback
_7else:
_7ifback:
_8while:
      mov	r10,[rbp - 680]
      add	r10,1
      mov	[rbp - 680],r10
      mov	r10,[rbp - 680]
      cmp	r10,[lcnow]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 824],r10
      mov	r10,[rbp -  824]
      cmp	r10,1
      je	_8for
_8forback:
      mov	rsp,rbp
      pop rbp
      ret
move:
      push	rbp
      mov	rbp,rsp
      sub	rsp,912
      mov	qword[rbp - 832],0
_9for:
      mov	r10,[rbp - 832]
      add	r10,1
      mov	[rbp - 856],r10
      mov	r10,[rbp - 856]
      imul	r10,8
      mov	[rbp - 856],r10
      mov	r10,[lca]
      add	r10,[rbp - 856]
      mov	r10,[r10]
      sub	r10,1
      mov	r11,[lca]
      add	r11,[rbp - 856]
      mov	[r11],r10
      mov	r10,[rbp - 832]
      add	r10,1
      mov	[rbp - 864],r10
      mov	r10,[rbp - 864]
      mov	[rbp - 832],r10
_9while:
      mov	r10,[rbp - 832]
      cmp	r10,[lcnow]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 872],r10
      mov	r10,[rbp -  872]
      cmp	r10,1
      je	_9for
_9forback:
      mov	r10,[lcnow]
      add	r10,1
      mov	[rbp - 896],r10
      mov	r10,[rbp - 896]
      imul	r10,8
      mov	[rbp - 896],r10
      mov	r11,[lca]
      add	r11,[rbp - 896]
      mov	r10,[lcnow]
      mov	qword[r11],r10
      mov	r10,[lcnow]
      mov	[rbp-904],r10
      mov	r10,[lcnow]
      add	r10,1
      mov	[lcnow],r10
      mov	rsp,rbp
      pop rbp
      ret
main:
      push	rbp
      mov	rbp,rsp
      sub	rsp,1456
      mov	qword[lcA],48271
      mov	qword[lcM],2147483647
      mov	qword[lcseed],1
      mov	qword[rbp - 912],0
      mov	qword[rbp - 920],0
      mov	qword[rbp - 928],0
      mov	r10,3
      imul	r10,7
      mov	[rbp - 936],r10
      mov	r10,[rbp - 936]
      imul	r10,10
      mov	[rbp - 944],r10
      mov	r10,[rbp - 944]
      mov	[lcn],r10
      mov	qword[lch],0
      mov	r10,100
      add	r10,1
      mov	[rbp - 952],r10
      mov	r10,[rbp - 952]
      imul	r10,8
      mov	[rbp - 952],r10
      mov	rdi,[rbp-952]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  960],rax
      mov	r11,[rbp - 960]
      add	r11,0
      mov	qword[r11],100
      mov	r10,[rbp - 960]
      mov	[lca],r10
      mov	eax,[lcM]
      mov	r10d,[lcA]
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 968],rax
      mov	r10,[rbp - 968]
      mov	[lcQ],r10
      mov	eax,[lcM]
      mov	r10d,[lcA]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 976],rdx
      mov	r10,[rbp - 976]
      mov	[lcR],r10
      mov	rdi,[lcn]
      push	r10
      push	r11
      call	pd
      pop	r11
      pop	r10
      mov	[rbp -  1000],rax
      mov	r10,[rbp -  1000]
      xor	r10,1
      mov	[rbp - 1008],r10
      mov	 r10,[rbp-1008]
      cmp	 r10,0
      je	_8else
_8if:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'S'
      mov	byte[rax + 1],'o'
      mov	byte[rax + 2],'r'
      mov	byte[rax + 3],'r'
      mov	byte[rax + 4],'y'
      mov	byte[rax + 5],','
      mov	byte[rax + 6],' '
      mov	byte[rax + 7],'t'
      mov	byte[rax + 8],'h'
      mov	byte[rax + 9],'e'
      mov	byte[rax + 10],' '
      mov	byte[rax + 11],'n'
      mov	byte[rax + 12],'u'
      mov	byte[rax + 13],'m'
      mov	byte[rax + 14],'b'
      mov	byte[rax + 15],'e'
      mov	byte[rax + 16],'r'
      mov	byte[rax + 17],' '
      mov	byte[rax + 18],'n'
      mov	byte[rax + 19],' '
      mov	byte[rax + 20],'m'
      mov	byte[rax + 21],'u'
      mov	byte[rax + 22],'s'
      mov	byte[rax + 23],'t'
      mov	byte[rax + 24],' '
      mov	byte[rax + 25],'b'
      mov	byte[rax + 26],'e'
      mov	byte[rax + 27],' '
      mov	byte[rax + 28],'a'
      mov	byte[rax + 29],' '
      mov	byte[rax + 30],'n'
      mov	byte[rax + 31],'u'
      mov	byte[rax + 32],'m'
      mov	byte[rax + 33],'b'
      mov	byte[rax + 34],'e'
      mov	byte[rax + 35],'r'
      mov	byte[rax + 36],' '
      mov	byte[rax + 37],'s'
      mov	byte[rax + 38],'.'
      mov	byte[rax + 39],'t'
      mov	byte[rax + 40],'.'
      mov	byte[rax + 41],' '
      mov	byte[rax + 42],'t'
      mov	byte[rax + 43],'h'
      mov	byte[rax + 44],'e'
      mov	byte[rax + 45],'r'
      mov	byte[rax + 46],'e'
      mov	byte[rax + 47],' '
      mov	byte[rax + 48],'e'
      mov	byte[rax + 49],'x'
      mov	byte[rax + 50],'i'
      mov	byte[rax + 51],'s'
      mov	byte[rax + 52],'t'
      mov	byte[rax + 53],'s'
      mov	byte[rax + 54],' '
      mov	byte[rax + 55],'i'
      mov	byte[rax + 56],' '
      mov	byte[rax + 57],'s'
      mov	byte[rax + 58],'a'
      mov	byte[rax + 59],'t'
      mov	byte[rax + 60],'i'
      mov	byte[rax + 61],'s'
      mov	byte[rax + 62],'f'
      mov	byte[rax + 63],'y'
      mov	byte[rax + 64],'i'
      mov	byte[rax + 65],'n'
      mov	byte[rax + 66],'g'
      mov	byte[rax + 67],' '
      mov	byte[rax + 68],'n'
      mov	byte[rax + 69],'='
      mov	byte[rax + 70],'1'
      mov	byte[rax + 71],'+'
      mov	byte[rax + 72],'2'
      mov	byte[rax + 73],'+'
      mov	byte[rax + 74],'.'
      mov	byte[rax + 75],'.'
      mov	byte[rax + 76],'.'
      mov	byte[rax + 77],'+'
      mov	byte[rax + 78],'i'
      mov	byte[rax + 79],0
      mov	[rbp - 984],rax
      mov	rdi,[rbp-984]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  992],rax
      mov	rax,1
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_8ifback
_8else:
_8ifback:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'L'
      mov	byte[rax + 1],'e'
      mov	byte[rax + 2],'t'
      mov	byte[rax + 3],39
      mov	byte[rax + 4],'s'
      mov	byte[rax + 5],' '
      mov	byte[rax + 6],'s'
      mov	byte[rax + 7],'t'
      mov	byte[rax + 8],'a'
      mov	byte[rax + 9],'r'
      mov	byte[rax + 10],'t'
      mov	byte[rax + 11],'!'
      mov	byte[rax + 12],0
      mov	[rbp - 1016],rax
      mov	rdi,[rbp-1016]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  1024],rax
      mov	rdi,3654898
      push	r10
      push	r11
      call	initialize
      pop	r11
      pop	r10
      mov	[rbp -  1032],rax
      push	r10
      push	r11
      call	random
      pop	r11
      pop	r10
      mov	[rbp -  1040],rax
      mov	eax,[rbp - 1040]
      mov	r10d,10
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 1048],rdx
      mov	r10,[rbp - 1048]
      add	r10,1
      mov	[rbp - 1056],r10
      mov	r10,[rbp - 1056]
      mov	[lcnow],r10
      mov	rdi,[lcnow]
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
_10for:
      mov	r10,[rbp - 912]
      add	r10,1
      mov	[rbp - 1096],r10
      mov	r10,[rbp - 1096]
      imul	r10,8
      mov	[rbp - 1096],r10
      push	r10
      push	r11
      call	random
      pop	r11
      pop	r10
      mov	[rbp -  1104],rax
      mov	eax,[rbp - 1104]
      mov	r10d,10
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 1112],rdx
      mov	r10,[rbp - 1112]
      add	r10,1
      mov	[rbp - 1120],r10
      mov	r10,[rbp - 1120]
      mov	r11,[lca]
      add	r11,[rbp - 1096]
      mov	[r11],r10
      jmp	_11while
_11for:
      mov	r10,[rbp - 912]
      add	r10,1
      mov	[rbp - 1144],r10
      mov	r10,[rbp - 1144]
      imul	r10,8
      mov	[rbp - 1144],r10
      push	r10
      push	r11
      call	random
      pop	r11
      pop	r10
      mov	[rbp -  1152],rax
      mov	eax,[rbp - 1152]
      mov	r10d,10
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 1160],rdx
      mov	r10,[rbp - 1160]
      add	r10,1
      mov	[rbp - 1168],r10
      mov	r10,[rbp - 1168]
      mov	r11,[lca]
      add	r11,[rbp - 1144]
      mov	[r11],r10
_11while:
      mov	r10,[rbp - 912]
      add	r10,1
      mov	[rbp - 1192],r10
      mov	r10,[rbp - 1192]
      imul	r10,8
      mov	[rbp - 1192],r10
      mov	r10,[lca]
      add	r10,[rbp - 1192]
      mov	r10,[r10]
      add	r10,[rbp - 920]
      mov	[rbp - 1200],r10
      mov	r10,[rbp - 1200]
      cmp	r10,[lcn]
      setg r10b
      movzx r10,r10b
      mov	[rbp - 1208],r10
      mov	r10,[rbp -  1208]
      cmp	r10,1
      je	_11for
_11forback:
      mov	r10,[rbp - 912]
      add	r10,1
      mov	[rbp - 1232],r10
      mov	r10,[rbp - 1232]
      imul	r10,8
      mov	[rbp - 1232],r10
      mov	r10,[rbp - 920]
      mov	r11,[lca]
      add	r11,[rbp - 1232]
      add	r10,[r11]
      mov	[rbp - 1240],r10
      mov	r10,[rbp - 1240]
      mov	[rbp - 920],r10
_10while:
      mov	r10,[rbp - 912]
      add	r10,1
      mov	[rbp - 912],r10
      mov	r10,[lcnow]
      sub	r10,1
      mov	[rbp - 1248],r10
      mov	r10,[rbp - 912]
      cmp	r10,[rbp - 1248]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 1256],r10
      mov	r10,[rbp -  1256]
      cmp	r10,1
      je	_10for
_10forback:
      mov	r10,[lcnow]
      sub	r10,1
      mov	[rbp - 1280],r10
      mov	r10,[rbp - 1280]
      add	r10,1
      mov	[rbp - 1288],r10
      mov	r10,[rbp - 1288]
      imul	r10,8
      mov	[rbp - 1288],r10
      mov	r10,[lcn]
      sub	r10,[rbp - 920]
      mov	[rbp - 1296],r10
      mov	r10,[rbp - 1296]
      mov	r11,[lca]
      add	r11,[rbp - 1288]
      mov	[r11],r10
      push	r10
      push	r11
      call	show
      pop	r11
      pop	r10
      mov	[rbp -  1304],rax
      push	r10
      push	r11
      call	merge
      pop	r11
      pop	r10
      mov	[rbp -  1312],rax
      jmp	_12while
_12for:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'s'
      mov	byte[rax + 1],'t'
      mov	byte[rax + 2],'e'
      mov	byte[rax + 3],'p'
      mov	byte[rax + 4],' '
      mov	byte[rax + 5],0
      mov	[rbp - 1320],rax
      mov	r10,[rbp - 928]
      add	r10,1
      mov	[rbp - 928],r10
      mov	rdi,[rbp-928]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  1328],rax
      mov	rdi,[rbp-1320]
      mov	rsi,[rbp-1328]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  1336],rax
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],':'
      mov	byte[rax + 1],0
      mov	[rbp - 1344],rax
      mov	rdi,[rbp-1336]
      mov	rsi,[rbp-1344]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  1352],rax
      mov	rdi,[rbp-1352]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  1360],rax
      push	r10
      push	r11
      call	move
      pop	r11
      pop	r10
      mov	[rbp -  1368],rax
      push	r10
      push	r11
      call	merge
      pop	r11
      pop	r10
      mov	[rbp -  1376],rax
      push	r10
      push	r11
      call	show
      pop	r11
      pop	r10
      mov	[rbp -  1384],rax
_12while:
      push	r10
      push	r11
      call	win
      pop	r11
      pop	r10
      mov	[rbp -  1392],rax
      mov	r10,[rbp -  1392]
      xor	r10,1
      mov	[rbp - 1400],r10
      mov	r10,[rbp -  1400]
      cmp	r10,1
      je	_12for
_12forback:
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
      mov	[rbp - 1408],rax
      mov	rdi,[rbp-928]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  1416],rax
      mov	rdi,[rbp-1408]
      mov	rsi,[rbp-1416]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  1424],rax
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],' '
      mov	byte[rax + 1],'s'
      mov	byte[rax + 2],'t'
      mov	byte[rax + 3],'e'
      mov	byte[rax + 4],'p'
      mov	byte[rax + 5],'('
      mov	byte[rax + 6],'s'
      mov	byte[rax + 7],')'
      mov	byte[rax + 8],0
      mov	[rbp - 1432],rax
      mov	rdi,[rbp-1424]
      mov	rsi,[rbp-1432]
      push	r10
      push	r11
      call	string.add
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

lcn:
	dq 0
lch:
	dq 0
lcnow:
	dq 0
lca:
	dq 0
lcA:
	dq 0
lcM:
	dq 0
lcQ:
	dq 0
lcR:
	dq 0
lcseed:
	dq 0
section .bss
stringbuffer:
	resb 256

