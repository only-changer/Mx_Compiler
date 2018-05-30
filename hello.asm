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
      sub	rsp,216
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
      mov	[result],r10
      mov	qword[i],0
_1for:
      mov	r10,[i]
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
      mov	r11,[result]
      add	r11,[rbp - 112]
      mov	[r11],r10
      mov	qword[j],0
_0for:
      mov	r10,[i]
      add	r10,1
      mov	[rbp - 152],r10
      mov	r10,[rbp - 152]
      imul	r10,8
      mov	[rbp - 152],r10
      mov	r10,[j]
      add	r10,1
      mov	[rbp - 160],r10
      mov	r10,[rbp - 160]
      imul	r10,8
      mov	[rbp - 160],r10
      mov	r11,[result]
      add	r11,[rbp - 152]
      mov	r11,[r11]
      add	r11,[rbp - 160]
      mov	qword[r11],0
      mov	r10,[j]
      mov	[rbp-168],r10
      mov	r10,[j]
      add	r10,1
      mov	[ j],r10
      mov	r10,[j]
      cmp	r10,[rbp - 72]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 176],r10
      mov	r10,[rbp -  176]
      cmp	r10,1
      je	_0for
_0forback:
      mov	r10,[i]
      mov	[rbp-192],r10
      mov	r10,[i]
      add	r10,1
      mov	[ i],r10
      mov	r10,[i]
      cmp	r10,[rbp - 72]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 200],r10
      mov	r10,[rbp -  200]
      cmp	r10,1
      je	_1for
_1forback:
      mov	rsp,rbp
      pop rbp
      ret
getPrime:
      push	rbp
      mov	rbp,rsp
      sub	rsp,360
      mov	[rbp - 72],rdi
      mov	qword[rbp - 80],2
      mov	qword[rbp - 88],2
_3for:
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 264],r10
      mov	r10,[rbp - 264]
      imul	r10,8
      mov	[rbp - 264],r10
      mov	r10,[b]
      cmp	r10,1
      sete r10b
      movzx r10,r10b
      mov	[rbp - 272],r10
      mov	 r10,[rbp-272]
      cmp	 r10,0
      je	_0else
_0if:
      mov	r10,0
      add	r10,1
      mov	[rbp - 112],r10
      mov	r10,[rbp - 112]
      imul	r10,8
      mov	[rbp - 112],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 136],r10
      mov	r10,[rbp - 136]
      imul	r10,8
      mov	[rbp - 136],r10
      mov	r10,[tmp]
      add	r10,[rbp - 136]
      mov	r10,[r10]
      add	r10,1
      mov	[rbp - 144],r10
      mov	r10,[rbp - 144]
      mov	r11,[tmp]
      add	r11,[rbp - 112]
      mov	[r11],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 184],r10
      mov	r10,[rbp - 184]
      imul	r10,8
      mov	[rbp - 184],r10
      mov	r10,[tmp]
      add	r10,[rbp - 184]
      mov	r10,[r10]
      add	r10,1
      mov	[rbp - 192],r10
      mov	r10,[rbp - 192]
      imul	r10,8
      mov	[rbp - 192],r10
      mov	r10,[rbp - 88]
      mov	r11,[prime]
      add	r11,[rbp - 192]
      mov	[r11],r10
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 216],r10
      mov	r10,[rbp - 216]
      imul	r10,8
      mov	[rbp - 216],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 240],r10
      mov	r10,[rbp - 240]
      imul	r10,8
      mov	[rbp - 240],r10
      mov	r11,[gps]
      add	r11,[rbp - 216]
      mov	r10,[tmp]
      mov	qword[r11],r10
      jmp	_0ifback
_0else:
_0ifback:
_2for:
      mov	r10,[rbp - 88]
      imul	r10,[rbp - 80]
      mov	[rbp - 296],r10
      mov	r10,[rbp - 296]
      add	r10,1
      mov	[rbp - 304],r10
      mov	r10,[rbp - 304]
      imul	r10,8
      mov	[rbp - 304],r10
      mov	r11,[b]
      add	r11,[rbp - 304]
      mov	qword[r11],0
      mov	r10,[rbp - 80]
      add	r10,1
      mov	[rbp - 312],r10
      mov	r10,[rbp - 312]
      mov	[rbp - 80],r10
      mov	r10,[rbp - 88]
      imul	r10,[rbp - 80]
      mov	[rbp - 320],r10
      mov	r10,[rbp - 320]
      cmp	r10,[rbp - 72]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 328],r10
      mov	r10,[rbp -  328]
      cmp	r10,1
      je	_2for
_2forback:
      mov	qword[rbp - 80],2
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 336],r10
      mov	r10,[rbp - 336]
      mov	[rbp - 88],r10
      mov	r10,[rbp - 88]
      cmp	r10,[rbp - 72]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 344],r10
      mov	r10,[rbp -  344]
      cmp	r10,1
      je	_3for
_3forback:
      mov	rsp,rbp
      pop rbp
      ret
getResult:
      push	rbp
      mov	rbp,rsp
      sub	rsp,560
      mov	[rbp - 72],rdi
      mov	[rbp - 80],rsi
      mov	[rbp - 88],rdx
      mov	r10,[rbp - 80]
      add	r10,1
      mov	[rbp - 416],r10
      mov	r10,[rbp - 416]
      imul	r10,8
      mov	[rbp - 416],r10
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 424],r10
      mov	r10,[rbp - 424]
      imul	r10,8
      mov	[rbp - 424],r10
      mov	r10,1
      not	r10
      add	r10,1
      mov	[rbp - 432],r10
      mov	r10,[result]
      cmp	r10,[rbp - 432]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 440],r10
      mov	 r10,[rbp-440]
      cmp	 r10,0
      je	_3else
_3if:
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 344],r10
      mov	r10,[rbp - 344]
      imul	r10,8
      mov	[rbp - 344],r10
      mov	r11,[prime]
      add	r11,[rbp - 344]
      mov	r10,[r11]
      imul	r10,2
      mov	[rbp - 352],r10
      mov	r10,[rbp - 80]
      add	r10,1
      mov	[rbp - 376],r10
      mov	r10,[rbp - 376]
      imul	r10,8
      mov	[rbp - 376],r10
      mov	r10,[rbp - 352]
      sub	r10,[prime]
      mov	[rbp - 384],r10
      mov	r10,[rbp - 384]
      cmp	r10,[rbp - 72]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 392],r10
      mov	 r10,[rbp-392]
      cmp	 r10,0
      je	_2else
_2if:
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 264],r10
      mov	r10,[rbp - 264]
      imul	r10,8
      mov	[rbp - 264],r10
      mov	r11,[prime]
      add	r11,[rbp - 264]
      mov	r10,[r11]
      imul	r10,2
      mov	[rbp - 272],r10
      mov	r10,[rbp - 80]
      add	r10,1
      mov	[rbp - 296],r10
      mov	r10,[rbp - 296]
      imul	r10,8
      mov	[rbp - 296],r10
      mov	r10,[rbp - 272]
      sub	r10,[prime]
      mov	[rbp - 304],r10
      mov	r10,[rbp - 304]
      add	r10,1
      mov	[rbp - 312],r10
      mov	r10,[rbp - 312]
      imul	r10,8
      mov	[rbp - 312],r10
      mov	r10,[b]
      cmp	r10,0
      setl r10b
      movzx r10,r10b
      mov	[rbp - 320],r10
      mov	 r10,[rbp-320]
      cmp	 r10,0
      je	_1else
_1if:
      mov	r10,[rbp - 80]
      add	r10,1
      mov	[rbp - 112],r10
      mov	r10,[rbp - 112]
      imul	r10,8
      mov	[rbp - 112],r10
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 120],r10
      mov	r10,[rbp - 120]
      imul	r10,8
      mov	[rbp - 120],r10
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 160],r10
      mov	r10,[rbp - 160]
      imul	r10,8
      mov	[rbp - 160],r10
      mov	r11,[prime]
      add	r11,[rbp - 160]
      mov	r10,[r11]
      imul	r10,2
      mov	[rbp - 168],r10
      mov	r10,[rbp - 80]
      add	r10,1
      mov	[rbp - 192],r10
      mov	r10,[rbp - 192]
      imul	r10,8
      mov	[rbp - 192],r10
      mov	r10,[rbp - 168]
      sub	r10,[prime]
      mov	[rbp - 200],r10
      mov	r10,[rbp - 200]
      add	r10,1
      mov	[rbp - 208],r10
      mov	r10,[rbp - 208]
      imul	r10,8
      mov	[rbp - 208],r10
      mov	rdi,[rbp-72]
      mov	rsi,[rbp-88]
      mov	rdx,[gps]
      push	r10
      push	r11
      call	getResult
      pop	r11
      pop	r10
      mov	[rbp -  216],rax
      mov	r10,[rbp - 216]
      add	r10,1
      mov	[rbp - 224],r10
      mov	r10,[rbp - 224]
      mov	r11,[result]
      add	r11,[rbp - 112]
      mov	r11,[r11]
      add	r11,[rbp - 120]
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
      mov	r10,[rbp - 80]
      add	r10,1
      mov	[rbp - 496],r10
      mov	r10,[rbp - 496]
      imul	r10,8
      mov	[rbp - 496],r10
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 504],r10
      mov	r10,[rbp - 504]
      imul	r10,8
      mov	[rbp - 504],r10
      mov	r10,1
      not	r10
      add	r10,1
      mov	[rbp - 512],r10
      mov	r10,[result]
      cmp	r10,[rbp - 512]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 520],r10
      mov	 r10,[rbp-520]
      cmp	 r10,0
      je	_4else
_4if:
      mov	r10,[rbp - 80]
      add	r10,1
      mov	[rbp - 464],r10
      mov	r10,[rbp - 464]
      imul	r10,8
      mov	[rbp - 464],r10
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 472],r10
      mov	r10,[rbp - 472]
      imul	r10,8
      mov	[rbp - 472],r10
      mov	r11,[result]
      add	r11,[rbp - 464]
      mov	r11,[r11]
      add	r11,[rbp - 472]
      mov	qword[r11],1
      jmp	_4ifback
_4else:
_4ifback:
      mov	r10,[rbp - 80]
      add	r10,1
      mov	[rbp - 544],r10
      mov	r10,[rbp - 544]
      imul	r10,8
      mov	[rbp - 544],r10
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 552],r10
      mov	r10,[rbp - 552]
      imul	r10,8
      mov	[rbp - 552],r10
      mov	rax,[result]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
printF:
      push	rbp
      mov	rbp,rsp
      sub	rsp,560
      mov	[rbp - 72],rdi
      mov	[rbp - 80],rsi
      mov	[rbp - 88],rdx
      mov	rdi,[rbp-72]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  96],rax
      mov	rdi,[rbp-96]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  104],rax
_4for:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],' '
      mov	byte[rax + 1],0
      mov	[rbp - 112],rax
      mov	rdi,[rbp-112]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  120],rax
      mov	rdi,[rbp-80]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  128],rax
      mov	rdi,[rbp-128]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  136],rax
      mov	r10,[rbp - 80]
      imul	r10,2
      mov	[rbp - 144],r10
      mov	r10,[rbp - 144]
      sub	r10,[rbp - 72]
      mov	[rbp - 152],r10
      mov	r10,[rbp - 152]
      mov	[rbp - 80],r10
      mov	r10,[rbp - 72]
      add	r10,[rbp - 80]
      mov	[rbp - 160],r10
      mov	eax,[rbp - 160]
      mov	r10,2
      cmp	r10,0
      je	_0div
      mov	r10d,2
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 168],rax
_0div:
      mov	r10,[rbp - 168]
      mov	[rbp - 72],r10
      mov	r10,[rbp - 88]
      sub	r10,1
      mov	[rbp - 176],r10
      mov	r10,[rbp - 176]
      mov	[rbp - 88],r10
      mov	r10,[rbp - 88]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov	[rbp - 184],r10
      mov	r10,[rbp -  184]
      cmp	r10,1
      je	_4for
_4forback:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'\'
      mov	byte[rax + 1],'n'
      mov	byte[rax + 2],0
      mov	[rbp - 192],rax
      mov	rdi,[rbp-192]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  200],rax
      mov	rsp,rbp
      pop rbp
      ret
main:
      push	rbp
      mov	rbp,rsp
      sub	rsp,680
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
      mov	[b],r10
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
      mov	[prime],r10
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
      mov	[gps],r10
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
      mov	[tmp],r10
      mov	rdi,170
      push	r10
      push	r11
      call	origin
      pop	r11
      pop	r10
      mov	[rbp -  72],rax
      mov	qword[rbp - 72],1000
      push	r10
      push	r11
      call	getInt
      pop	r11
      pop	r10
      mov	[rbp -  80],rax
      mov	r10,[rbp - 80]
      mov	[M],r10
      mov	qword[primeCount],0
      mov	qword[resultCount],0
      mov	r10,0
      add	r10,1
      mov	[rbp - 104],r10
      mov	r10,[rbp - 104]
      imul	r10,8
      mov	[rbp - 104],r10
      mov	r11,[tmp]
      add	r11,[rbp - 104]
      mov	qword[r11],0
      mov	qword[rbp - 88],0
_5for:
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 128],r10
      mov	r10,[rbp - 128]
      imul	r10,8
      mov	[rbp - 128],r10
      mov	r11,[b]
      add	r11,[rbp - 128]
      mov	qword[r11],1
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 152],r10
      mov	r10,[rbp - 152]
      imul	r10,8
      mov	[rbp - 152],r10
      mov	r11,[gps]
      add	r11,[rbp - 152]
      mov	qword[r11],0
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 160],r10
      mov	r10,[rbp - 160]
      mov	[rbp - 88],r10
      mov	r10,[rbp - 72]
      add	r10,1
      mov	[rbp - 168],r10
      mov	r10,[rbp - 88]
      cmp	r10,[rbp - 168]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 176],r10
      mov	r10,[rbp -  176]
      cmp	r10,1
      je	_5for
_5forback:
      mov	qword[rbp - 88],0
_6for:
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 208],r10
      mov	r10,[rbp - 208]
      imul	r10,8
      mov	[rbp - 208],r10
      mov	r11,[prime]
      add	r11,[rbp - 208]
      mov	qword[r11],0
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 216],r10
      mov	r10,[rbp - 216]
      mov	[rbp - 88],r10
      mov	r10,[M]
      add	r10,1
      mov	[rbp - 224],r10
      mov	r10,[rbp - 88]
      cmp	r10,[rbp - 224]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 232],r10
      mov	r10,[rbp -  232]
      cmp	r10,1
      je	_6for
_6forback:
      mov	qword[rbp - 88],0
_8for:
      mov	qword[j],0
_7for:
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 264],r10
      mov	r10,[rbp - 264]
      imul	r10,8
      mov	[rbp - 264],r10
      mov	r10,[j]
      add	r10,1
      mov	[rbp - 272],r10
      mov	r10,[rbp - 272]
      imul	r10,8
      mov	[rbp - 272],r10
      mov	r10,1
      not	r10
      add	r10,1
      mov	[rbp - 280],r10
      mov	r10,[rbp - 280]
      mov	r11,[result]
      add	r11,[rbp - 264]
      mov	r11,[r11]
      add	r11,[rbp - 272]
      mov	[r11],r10
      mov	r10,[j]
      add	r10,1
      mov	[rbp - 288],r10
      mov	r10,[rbp - 288]
      mov	[j],r10
      mov	r10,[j]
      cmp	r10,[M]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 296],r10
      mov	r10,[rbp -  296]
      cmp	r10,1
      je	_7for
_7forback:
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 312],r10
      mov	r10,[rbp - 312]
      mov	[rbp - 88],r10
      mov	r10,[rbp - 88]
      cmp	r10,[M]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 320],r10
      mov	r10,[rbp -  320]
      cmp	r10,1
      je	_8for
_8forback:
      mov	rdi,[rbp-72]
      push	r10
      push	r11
      call	getPrime
      pop	r11
      pop	r10
      mov	[rbp -  336],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 360],r10
      mov	r10,[rbp - 360]
      imul	r10,8
      mov	[rbp - 360],r10
      mov	r10,[tmp]
      mov	[primeCount],r10
      mov	qword[rbp - 88],1
_10for:
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 600],r10
      mov	r10,[rbp - 600]
      mov	[j],r10
_9for:
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 560],r10
      mov	r10,[rbp - 560]
      imul	r10,8
      mov	[rbp - 560],r10
      mov	r10,[j]
      add	r10,1
      mov	[rbp - 568],r10
      mov	r10,[rbp - 568]
      imul	r10,8
      mov	[rbp - 568],r10
      mov	r10,1
      not	r10
      add	r10,1
      mov	[rbp - 576],r10
      mov	r10,[result]
      cmp	r10,[rbp - 576]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 584],r10
      mov	 r10,[rbp-584]
      cmp	 r10,0
      je	_6else
_6if:
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 384],r10
      mov	r10,[rbp - 384]
      imul	r10,8
      mov	[rbp - 384],r10
      mov	r10,[j]
      add	r10,1
      mov	[rbp - 392],r10
      mov	r10,[rbp - 392]
      imul	r10,8
      mov	[rbp - 392],r10
      mov	rdi,[rbp-72]
      mov	rsi,[rbp-88]
      mov	rdx,[j]
      push	r10
      push	r11
      call	getResult
      pop	r11
      pop	r10
      mov	[rbp -  400],rax
      mov	r10,[rbp - 400]
      mov	r11,[result]
      add	r11,[rbp - 384]
      mov	r11,[r11]
      add	r11,[rbp - 392]
      mov	[r11],r10
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 520],r10
      mov	r10,[rbp - 520]
      imul	r10,8
      mov	[rbp - 520],r10
      mov	r10,[j]
      add	r10,1
      mov	[rbp - 528],r10
      mov	r10,[rbp - 528]
      imul	r10,8
      mov	[rbp - 528],r10
      mov	r11,[result]
      add	r11,[rbp - 520]
      mov	r11,[r11]
      add	r11,[rbp - 528]
      mov	r10,[r11]
      cmp	r10,1
      setg r10b
      movzx r10,r10b
      mov	[rbp - 536],r10
      mov	 r10,[rbp-536]
      cmp	 r10,0
      je	_5else
_5if:
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 424],r10
      mov	r10,[rbp - 424]
      imul	r10,8
      mov	[rbp - 424],r10
      mov	r10,[j]
      add	r10,1
      mov	[rbp - 448],r10
      mov	r10,[rbp - 448]
      imul	r10,8
      mov	[rbp - 448],r10
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 472],r10
      mov	r10,[rbp - 472]
      imul	r10,8
      mov	[rbp - 472],r10
      mov	r10,[j]
      add	r10,1
      mov	[rbp - 480],r10
      mov	r10,[rbp - 480]
      imul	r10,8
      mov	[rbp - 480],r10
      mov	rdi,[prime]
      mov	rsi,[prime]
      mov	rdx,[result]
      push	r10
      push	r11
      mov	rax,0
      call	printF
      pop	r11
      pop	r10
      mov	[rbp -  488],rax
      mov	r10,[resultCount]
      add	r10,1
      mov	[rbp - 496],r10
      mov	r10,[rbp - 496]
      mov	[resultCount],r10
      jmp	_5ifback
_5else:
_5ifback:
      jmp	_6ifback
_6else:
_6ifback:
      mov	r10,[j]
      add	r10,1
      mov	[rbp - 592],r10
      mov	r10,[rbp - 592]
      mov	[j],r10
      mov	r10,[j]
      cmp	r10,[primeCount]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 608],r10
      mov	r10,[rbp -  608]
      cmp	r10,1
      je	_9for
_9forback:
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 624],r10
      mov	r10,[rbp - 624]
      mov	[rbp - 88],r10
      mov	r10,[rbp - 88]
      cmp	r10,[primeCount]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 632],r10
      mov	r10,[rbp -  632]
      cmp	r10,1
      je	_10for
_10forback:
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
      mov	[rbp - 648],rax
      mov	rdi,[rbp-648]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  656],rax
      mov	rdi,[resultCount]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  664],rax
      mov	rdi,[rbp-664]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  672],rax
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
M:
	dq 0
i:
	dq 0
j:
	dq 0
primeCount:
	dq 0
resultCount:
	dq 0
b:
	dq 0
prime:
	dq 0
gps:
	dq 0
tmp:
	dq 0
result:
	dq 0
section .bss
stringbuffer:
	resb 256

