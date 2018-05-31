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
check:
      push	rbp
      mov	rbp,rsp
      sub	rsp,48
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	r10,[rbp - 8]
      cmp	r10,[rbp - 16]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 24],r10
      mov	r10,[rbp - 24]
      cmp	r10,0
      je	_0check
      mov	r10,[rbp - 8]
      cmp	r10,0
      setge r10b
      movzx r10,r10b
      mov	[rbp - 32],r10
      mov	r10,[rbp - 24]
      and	r10,[rbp - 32]
_0check:
      mov	[rbp - 40],r10
      mov	rax,[rbp -  40]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
main:
      push	rbp
      mov	rbp,rsp
      sub	rsp,2872
      push	r10
      push	r11
      call	getInt
      pop	r11
      pop	r10
      mov	[rbp -  176],rax
      mov	r10,[rbp - 176]
      mov	[rbp - 48],r10
      mov	qword[rbp - 56],0
      mov	qword[rbp - 96],0
      mov	qword[rbp - 64],0
      mov	qword[rbp - 72],0
      mov	r10,[rbp - 48]
      sub	r10,1
      mov	[rbp - 184],r10
      mov	r10,[rbp - 184]
      mov	[rbp - 80],r10
      mov	r10,[rbp - 48]
      sub	r10,1
      mov	[rbp - 192],r10
      mov	r10,[rbp - 192]
      mov	[rbp - 88],r10
      mov	qword[rbp - 120],0
      mov	qword[rbp - 128],0
      mov	qword[rbp - 112],0
      mov	qword[rbp - 104],0
      mov	r10,[rbp - 48]
      imul	r10,[rbp - 48]
      mov	[rbp - 200],r10
      mov	r10,[rbp - 200]
      add	r10,1
      mov	[rbp - 208],r10
      mov	r10,[rbp - 208]
      imul	r10,8
      mov	[rbp - 208],r10
      mov	rdi,[rbp-208]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  216],rax
      mov	r10,[rbp - 200]
      mov	r11,[rbp - 216]
      add	r11,0
      mov	[r11],r10
      mov	r10,[rbp - 216]
      mov	[rbp - 136],r10
      mov	qword[rbp - 160],0
_0for:
      mov	r10,[rbp - 160]
      add	r10,1
      mov	[rbp - 240],r10
      mov	r10,[rbp - 240]
      imul	r10,8
      mov	[rbp - 240],r10
      mov	r11,[rbp - 136]
      add	r11,[rbp - 240]
      mov	qword[r11],0
      mov	r10,[rbp - 160]
      mov	[rbp - 248],r10
      mov	r10,[rbp - 160]
      add	r10,1
      mov	[rbp - 160],r10
      mov	r10,[rbp - 48]
      imul	r10,[rbp - 48]
      mov	[rbp - 256],r10
      mov	r10,[rbp - 160]
      cmp	r10,[rbp - 256]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 264],r10
      mov	r10,[rbp -  264]
      cmp	r10,1
      je	_0for
_0forback:
      mov	r10,[rbp - 48]
      imul	r10,[rbp - 48]
      mov	[rbp - 280],r10
      mov	r10,[rbp - 280]
      add	r10,1
      mov	[rbp - 288],r10
      mov	r10,[rbp - 288]
      imul	r10,8
      mov	[rbp - 288],r10
      mov	rdi,[rbp-288]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  296],rax
      mov	r10,[rbp - 280]
      mov	r11,[rbp - 296]
      add	r11,0
      mov	[r11],r10
      mov	r10,[rbp - 296]
      mov	[rbp - 144],r10
      mov	qword[rbp - 160],0
_1for:
      mov	r10,[rbp - 160]
      add	r10,1
      mov	[rbp - 320],r10
      mov	r10,[rbp - 320]
      imul	r10,8
      mov	[rbp - 320],r10
      mov	r11,[rbp - 144]
      add	r11,[rbp - 320]
      mov	qword[r11],0
      mov	r10,[rbp - 160]
      mov	[rbp - 328],r10
      mov	r10,[rbp - 160]
      add	r10,1
      mov	[rbp - 160],r10
      mov	r10,[rbp - 48]
      imul	r10,[rbp - 48]
      mov	[rbp - 336],r10
      mov	r10,[rbp - 160]
      cmp	r10,[rbp - 336]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 344],r10
      mov	r10,[rbp -  344]
      cmp	r10,1
      je	_1for
_1forback:
      mov	r10,[rbp - 48]
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
      mov	r10,[rbp - 48]
      mov	r11,[rbp - 368]
      add	r11,0
      mov	[r11],r10
      mov	r10,[rbp - 368]
      mov	[rbp - 152],r10
      mov	qword[rbp - 160],0
_3for:
      mov	r10,[rbp - 160]
      add	r10,1
      mov	[rbp - 392],r10
      mov	r10,[rbp - 392]
      imul	r10,8
      mov	[rbp - 392],r10
      mov	r10,[rbp - 48]
      add	r10,1
      mov	[rbp - 400],r10
      mov	r10,[rbp - 400]
      imul	r10,8
      mov	[rbp - 400],r10
      mov	rdi,[rbp-400]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  408],rax
      mov	r10,[rbp - 48]
      mov	r11,[rbp - 408]
      add	r11,0
      mov	[r11],r10
      mov	r10,[rbp - 408]
      mov	r11,[rbp - 152]
      add	r11,[rbp - 392]
      mov	[r11],r10
      mov	qword[rbp - 168],0
_2for:
      mov	r10,[rbp - 160]
      add	r10,1
      mov	[rbp - 432],r10
      mov	r10,[rbp - 432]
      imul	r10,8
      mov	[rbp - 432],r10
      mov	r10,[rbp - 168]
      add	r10,1
      mov	[rbp - 440],r10
      mov	r10,[rbp - 440]
      imul	r10,8
      mov	[rbp - 440],r10
      mov	r10,1
      not	r10
      add	r10,1
      mov	[rbp - 448],r10
      mov	r10,[rbp - 448]
      mov	r11,[rbp - 152]
      add	r11,[rbp - 432]
      mov	r11,[r11]
      add	r11,[rbp - 440]
      mov	[r11],r10
      mov	r10,[rbp - 168]
      mov	[rbp - 456],r10
      mov	r10,[rbp - 168]
      add	r10,1
      mov	[rbp - 168],r10
      mov	r10,[rbp - 168]
      cmp	r10,[rbp - 48]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 464],r10
      mov	r10,[rbp -  464]
      cmp	r10,1
      je	_2for
_2forback:
      mov	r10,[rbp - 160]
      mov	[rbp - 480],r10
      mov	r10,[rbp - 160]
      add	r10,1
      mov	[rbp - 160],r10
      mov	r10,[rbp - 160]
      cmp	r10,[rbp - 48]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 488],r10
      mov	r10,[rbp -  488]
      cmp	r10,1
      je	_3for
_3forback:
      mov	r10,0
      add	r10,1
      mov	[rbp - 520],r10
      mov	r10,[rbp - 520]
      imul	r10,8
      mov	[rbp - 520],r10
      mov	r10,[rbp - 64]
      mov	r11,[rbp - 136]
      add	r11,[rbp - 520]
      mov	[r11],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 544],r10
      mov	r10,[rbp - 544]
      imul	r10,8
      mov	[rbp - 544],r10
      mov	r10,[rbp - 72]
      mov	r11,[rbp - 144]
      add	r11,[rbp - 544]
      mov	[r11],r10
      mov	r10,[rbp - 64]
      add	r10,1
      mov	[rbp - 568],r10
      mov	r10,[rbp - 568]
      imul	r10,8
      mov	[rbp - 568],r10
      mov	r10,[rbp - 72]
      add	r10,1
      mov	[rbp - 576],r10
      mov	r10,[rbp - 576]
      imul	r10,8
      mov	[rbp - 576],r10
      mov	r11,[rbp - 152]
      add	r11,[rbp - 568]
      mov	r11,[r11]
      add	r11,[rbp - 576]
      mov	qword[r11],0
      jmp	_4while
_4for:
      mov	r10,[rbp - 56]
      add	r10,1
      mov	[rbp - 616],r10
      mov	r10,[rbp - 616]
      imul	r10,8
      mov	[rbp - 616],r10
      mov	r10,[rbp - 136]
      add	r10,[rbp - 616]
      mov	r10,[r10]
      add	r10,1
      mov	[rbp - 624],r10
      mov	r10,[rbp - 624]
      imul	r10,8
      mov	[rbp - 624],r10
      mov	r10,[rbp - 56]
      add	r10,1
      mov	[rbp - 648],r10
      mov	r10,[rbp - 648]
      imul	r10,8
      mov	[rbp - 648],r10
      mov	r10,[rbp - 144]
      add	r10,[rbp - 648]
      mov	r10,[r10]
      add	r10,1
      mov	[rbp - 656],r10
      mov	r10,[rbp - 656]
      imul	r10,8
      mov	[rbp - 656],r10
      mov	r10,[rbp - 152]
      add	r10,[rbp - 624]
      mov	r10,[r10]
      add	r10,[rbp - 656]
      mov	r10,[r10]
      mov	[rbp - 112],r10
      mov	r10,[rbp - 56]
      add	r10,1
      mov	[rbp - 680],r10
      mov	r10,[rbp - 680]
      imul	r10,8
      mov	[rbp - 680],r10
      mov	r10,[rbp - 136]
      add	r10,[rbp - 680]
      mov	r10,[r10]
      sub	r10,1
      mov	[rbp - 688],r10
      mov	r10,[rbp - 688]
      mov	[rbp - 120],r10
      mov	r10,[rbp - 56]
      add	r10,1
      mov	[rbp - 712],r10
      mov	r10,[rbp - 712]
      imul	r10,8
      mov	[rbp - 712],r10
      mov	r10,[rbp - 144]
      add	r10,[rbp - 712]
      mov	r10,[r10]
      sub	r10,2
      mov	[rbp - 720],r10
      mov	r10,[rbp - 720]
      mov	[rbp - 128],r10
      mov	rdi,[rbp-120]
      mov	rsi,[rbp-48]
      push	r10
      push	r11
      call	check
      pop	r11
      pop	r10
      mov	[rbp -  848],rax
      mov	r10,[rbp - 848]
      cmp	r10,0
      je	_1check
      mov	rdi,[rbp-128]
      mov	rsi,[rbp-48]
      push	r10
      push	r11
      call	check
      pop	r11
      pop	r10
      mov	[rbp -  856],rax
      mov	r10,[rbp - 848]
      and	r10,[rbp - 856]
_1check:
      mov	[rbp - 864],r10
      mov	r10,[rbp - 864]
      cmp	r10,0
      je	_2check
      mov	r10,[rbp - 120]
      add	r10,1
      mov	[rbp - 888],r10
      mov	r10,[rbp - 888]
      imul	r10,8
      mov	[rbp - 888],r10
      mov	r10,[rbp - 128]
      add	r10,1
      mov	[rbp - 896],r10
      mov	r10,[rbp - 896]
      imul	r10,8
      mov	[rbp - 896],r10
      mov	r10,1
      not	r10
      add	r10,1
      mov	[rbp - 904],r10
      mov	r11,[rbp - 152]
      add	r11,[rbp - 888]
      mov	r11,[r11]
      add	r11,[rbp - 896]
      mov	r10,[r11]
      cmp	r10,[rbp - 904]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 912],r10
      mov	r10,[rbp - 864]
      and	r10,[rbp - 912]
_2check:
      mov	[rbp - 920],r10
      mov	 r10,[rbp-920]
      cmp	 r10,0
      je	_1else
_1if:
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 728],r10
      mov	r10,[rbp - 728]
      mov	[rbp - 96],r10
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 752],r10
      mov	r10,[rbp - 752]
      imul	r10,8
      mov	[rbp - 752],r10
      mov	r10,[rbp - 120]
      mov	r11,[rbp - 136]
      add	r11,[rbp - 752]
      mov	[r11],r10
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 776],r10
      mov	r10,[rbp - 776]
      imul	r10,8
      mov	[rbp - 776],r10
      mov	r10,[rbp - 128]
      mov	r11,[rbp - 144]
      add	r11,[rbp - 776]
      mov	[r11],r10
      mov	r10,[rbp - 120]
      add	r10,1
      mov	[rbp - 800],r10
      mov	r10,[rbp - 800]
      imul	r10,8
      mov	[rbp - 800],r10
      mov	r10,[rbp - 128]
      add	r10,1
      mov	[rbp - 808],r10
      mov	r10,[rbp - 808]
      imul	r10,8
      mov	[rbp - 808],r10
      mov	r10,[rbp - 112]
      add	r10,1
      mov	[rbp - 816],r10
      mov	r10,[rbp - 816]
      mov	r11,[rbp - 152]
      add	r11,[rbp - 800]
      mov	r11,[r11]
      add	r11,[rbp - 808]
      mov	[r11],r10
      mov	r10,[rbp - 120]
      cmp	r10,[rbp - 80]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 824],r10
      mov	r10,[rbp - 824]
      cmp	r10,0
      je	_3check
      mov	r10,[rbp - 128]
      cmp	r10,[rbp - 88]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 832],r10
      mov	r10,[rbp - 824]
      and	r10,[rbp - 832]
_3check:
      mov	[rbp - 840],r10
      mov	 r10,[rbp-840]
      cmp	 r10,0
      je	_0else
_0if:
      mov	qword[rbp - 104],1
      jmp	_0ifback
_0else:
_0ifback:
      jmp	_1ifback
_1else:
_1ifback:
      mov	r10,[rbp - 56]
      add	r10,1
      mov	[rbp - 944],r10
      mov	r10,[rbp - 944]
      imul	r10,8
      mov	[rbp - 944],r10
      mov	r10,[rbp - 136]
      add	r10,[rbp - 944]
      mov	r10,[r10]
      sub	r10,1
      mov	[rbp - 952],r10
      mov	r10,[rbp - 952]
      mov	[rbp - 120],r10
      mov	r10,[rbp - 56]
      add	r10,1
      mov	[rbp - 976],r10
      mov	r10,[rbp - 976]
      imul	r10,8
      mov	[rbp - 976],r10
      mov	r10,[rbp - 144]
      add	r10,[rbp - 976]
      mov	r10,[r10]
      add	r10,2
      mov	[rbp - 984],r10
      mov	r10,[rbp - 984]
      mov	[rbp - 128],r10
      mov	rdi,[rbp-120]
      mov	rsi,[rbp-48]
      push	r10
      push	r11
      call	check
      pop	r11
      pop	r10
      mov	[rbp -  1112],rax
      mov	r10,[rbp - 1112]
      cmp	r10,0
      je	_4check
      mov	rdi,[rbp-128]
      mov	rsi,[rbp-48]
      push	r10
      push	r11
      call	check
      pop	r11
      pop	r10
      mov	[rbp -  1120],rax
      mov	r10,[rbp - 1112]
      and	r10,[rbp - 1120]
_4check:
      mov	[rbp - 1128],r10
      mov	r10,[rbp - 1128]
      cmp	r10,0
      je	_5check
      mov	r10,[rbp - 120]
      add	r10,1
      mov	[rbp - 1152],r10
      mov	r10,[rbp - 1152]
      imul	r10,8
      mov	[rbp - 1152],r10
      mov	r10,[rbp - 128]
      add	r10,1
      mov	[rbp - 1160],r10
      mov	r10,[rbp - 1160]
      imul	r10,8
      mov	[rbp - 1160],r10
      mov	r10,1
      not	r10
      add	r10,1
      mov	[rbp - 1168],r10
      mov	r11,[rbp - 152]
      add	r11,[rbp - 1152]
      mov	r11,[r11]
      add	r11,[rbp - 1160]
      mov	r10,[r11]
      cmp	r10,[rbp - 1168]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 1176],r10
      mov	r10,[rbp - 1128]
      and	r10,[rbp - 1176]
_5check:
      mov	[rbp - 1184],r10
      mov	 r10,[rbp-1184]
      cmp	 r10,0
      je	_3else
_3if:
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 992],r10
      mov	r10,[rbp - 992]
      mov	[rbp - 96],r10
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 1016],r10
      mov	r10,[rbp - 1016]
      imul	r10,8
      mov	[rbp - 1016],r10
      mov	r10,[rbp - 120]
      mov	r11,[rbp - 136]
      add	r11,[rbp - 1016]
      mov	[r11],r10
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 1040],r10
      mov	r10,[rbp - 1040]
      imul	r10,8
      mov	[rbp - 1040],r10
      mov	r10,[rbp - 128]
      mov	r11,[rbp - 144]
      add	r11,[rbp - 1040]
      mov	[r11],r10
      mov	r10,[rbp - 120]
      add	r10,1
      mov	[rbp - 1064],r10
      mov	r10,[rbp - 1064]
      imul	r10,8
      mov	[rbp - 1064],r10
      mov	r10,[rbp - 128]
      add	r10,1
      mov	[rbp - 1072],r10
      mov	r10,[rbp - 1072]
      imul	r10,8
      mov	[rbp - 1072],r10
      mov	r10,[rbp - 112]
      add	r10,1
      mov	[rbp - 1080],r10
      mov	r10,[rbp - 1080]
      mov	r11,[rbp - 152]
      add	r11,[rbp - 1064]
      mov	r11,[r11]
      add	r11,[rbp - 1072]
      mov	[r11],r10
      mov	r10,[rbp - 120]
      cmp	r10,[rbp - 80]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 1088],r10
      mov	r10,[rbp - 1088]
      cmp	r10,0
      je	_6check
      mov	r10,[rbp - 128]
      cmp	r10,[rbp - 88]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 1096],r10
      mov	r10,[rbp - 1088]
      and	r10,[rbp - 1096]
_6check:
      mov	[rbp - 1104],r10
      mov	 r10,[rbp-1104]
      cmp	 r10,0
      je	_2else
_2if:
      mov	qword[rbp - 104],1
      jmp	_2ifback
_2else:
_2ifback:
      jmp	_3ifback
_3else:
_3ifback:
      mov	r10,[rbp - 56]
      add	r10,1
      mov	[rbp - 1208],r10
      mov	r10,[rbp - 1208]
      imul	r10,8
      mov	[rbp - 1208],r10
      mov	r10,[rbp - 136]
      add	r10,[rbp - 1208]
      mov	r10,[r10]
      add	r10,1
      mov	[rbp - 1216],r10
      mov	r10,[rbp - 1216]
      mov	[rbp - 120],r10
      mov	r10,[rbp - 56]
      add	r10,1
      mov	[rbp - 1240],r10
      mov	r10,[rbp - 1240]
      imul	r10,8
      mov	[rbp - 1240],r10
      mov	r10,[rbp - 144]
      add	r10,[rbp - 1240]
      mov	r10,[r10]
      sub	r10,2
      mov	[rbp - 1248],r10
      mov	r10,[rbp - 1248]
      mov	[rbp - 128],r10
      mov	rdi,[rbp-120]
      mov	rsi,[rbp-48]
      push	r10
      push	r11
      call	check
      pop	r11
      pop	r10
      mov	[rbp -  1376],rax
      mov	r10,[rbp - 1376]
      cmp	r10,0
      je	_7check
      mov	rdi,[rbp-128]
      mov	rsi,[rbp-48]
      push	r10
      push	r11
      call	check
      pop	r11
      pop	r10
      mov	[rbp -  1384],rax
      mov	r10,[rbp - 1376]
      and	r10,[rbp - 1384]
_7check:
      mov	[rbp - 1392],r10
      mov	r10,[rbp - 1392]
      cmp	r10,0
      je	_8check
      mov	r10,[rbp - 120]
      add	r10,1
      mov	[rbp - 1416],r10
      mov	r10,[rbp - 1416]
      imul	r10,8
      mov	[rbp - 1416],r10
      mov	r10,[rbp - 128]
      add	r10,1
      mov	[rbp - 1424],r10
      mov	r10,[rbp - 1424]
      imul	r10,8
      mov	[rbp - 1424],r10
      mov	r10,1
      not	r10
      add	r10,1
      mov	[rbp - 1432],r10
      mov	r11,[rbp - 152]
      add	r11,[rbp - 1416]
      mov	r11,[r11]
      add	r11,[rbp - 1424]
      mov	r10,[r11]
      cmp	r10,[rbp - 1432]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 1440],r10
      mov	r10,[rbp - 1392]
      and	r10,[rbp - 1440]
_8check:
      mov	[rbp - 1448],r10
      mov	 r10,[rbp-1448]
      cmp	 r10,0
      je	_5else
_5if:
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 1256],r10
      mov	r10,[rbp - 1256]
      mov	[rbp - 96],r10
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 1280],r10
      mov	r10,[rbp - 1280]
      imul	r10,8
      mov	[rbp - 1280],r10
      mov	r10,[rbp - 120]
      mov	r11,[rbp - 136]
      add	r11,[rbp - 1280]
      mov	[r11],r10
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 1304],r10
      mov	r10,[rbp - 1304]
      imul	r10,8
      mov	[rbp - 1304],r10
      mov	r10,[rbp - 128]
      mov	r11,[rbp - 144]
      add	r11,[rbp - 1304]
      mov	[r11],r10
      mov	r10,[rbp - 120]
      add	r10,1
      mov	[rbp - 1328],r10
      mov	r10,[rbp - 1328]
      imul	r10,8
      mov	[rbp - 1328],r10
      mov	r10,[rbp - 128]
      add	r10,1
      mov	[rbp - 1336],r10
      mov	r10,[rbp - 1336]
      imul	r10,8
      mov	[rbp - 1336],r10
      mov	r10,[rbp - 112]
      add	r10,1
      mov	[rbp - 1344],r10
      mov	r10,[rbp - 1344]
      mov	r11,[rbp - 152]
      add	r11,[rbp - 1328]
      mov	r11,[r11]
      add	r11,[rbp - 1336]
      mov	[r11],r10
      mov	r10,[rbp - 120]
      cmp	r10,[rbp - 80]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 1352],r10
      mov	r10,[rbp - 1352]
      cmp	r10,0
      je	_9check
      mov	r10,[rbp - 128]
      cmp	r10,[rbp - 88]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 1360],r10
      mov	r10,[rbp - 1352]
      and	r10,[rbp - 1360]
_9check:
      mov	[rbp - 1368],r10
      mov	 r10,[rbp-1368]
      cmp	 r10,0
      je	_4else
_4if:
      mov	qword[rbp - 104],1
      jmp	_4ifback
_4else:
_4ifback:
      jmp	_5ifback
_5else:
_5ifback:
      mov	r10,[rbp - 56]
      add	r10,1
      mov	[rbp - 1472],r10
      mov	r10,[rbp - 1472]
      imul	r10,8
      mov	[rbp - 1472],r10
      mov	r10,[rbp - 136]
      add	r10,[rbp - 1472]
      mov	r10,[r10]
      add	r10,1
      mov	[rbp - 1480],r10
      mov	r10,[rbp - 1480]
      mov	[rbp - 120],r10
      mov	r10,[rbp - 56]
      add	r10,1
      mov	[rbp - 1504],r10
      mov	r10,[rbp - 1504]
      imul	r10,8
      mov	[rbp - 1504],r10
      mov	r10,[rbp - 144]
      add	r10,[rbp - 1504]
      mov	r10,[r10]
      add	r10,2
      mov	[rbp - 1512],r10
      mov	r10,[rbp - 1512]
      mov	[rbp - 128],r10
      mov	rdi,[rbp-120]
      mov	rsi,[rbp-48]
      push	r10
      push	r11
      call	check
      pop	r11
      pop	r10
      mov	[rbp -  1640],rax
      mov	r10,[rbp - 1640]
      cmp	r10,0
      je	_10check
      mov	rdi,[rbp-128]
      mov	rsi,[rbp-48]
      push	r10
      push	r11
      call	check
      pop	r11
      pop	r10
      mov	[rbp -  1648],rax
      mov	r10,[rbp - 1640]
      and	r10,[rbp - 1648]
_10check:
      mov	[rbp - 1656],r10
      mov	r10,[rbp - 1656]
      cmp	r10,0
      je	_11check
      mov	r10,[rbp - 120]
      add	r10,1
      mov	[rbp - 1680],r10
      mov	r10,[rbp - 1680]
      imul	r10,8
      mov	[rbp - 1680],r10
      mov	r10,[rbp - 128]
      add	r10,1
      mov	[rbp - 1688],r10
      mov	r10,[rbp - 1688]
      imul	r10,8
      mov	[rbp - 1688],r10
      mov	r10,1
      not	r10
      add	r10,1
      mov	[rbp - 1696],r10
      mov	r11,[rbp - 152]
      add	r11,[rbp - 1680]
      mov	r11,[r11]
      add	r11,[rbp - 1688]
      mov	r10,[r11]
      cmp	r10,[rbp - 1696]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 1704],r10
      mov	r10,[rbp - 1656]
      and	r10,[rbp - 1704]
_11check:
      mov	[rbp - 1712],r10
      mov	 r10,[rbp-1712]
      cmp	 r10,0
      je	_7else
_7if:
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 1520],r10
      mov	r10,[rbp - 1520]
      mov	[rbp - 96],r10
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 1544],r10
      mov	r10,[rbp - 1544]
      imul	r10,8
      mov	[rbp - 1544],r10
      mov	r10,[rbp - 120]
      mov	r11,[rbp - 136]
      add	r11,[rbp - 1544]
      mov	[r11],r10
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 1568],r10
      mov	r10,[rbp - 1568]
      imul	r10,8
      mov	[rbp - 1568],r10
      mov	r10,[rbp - 128]
      mov	r11,[rbp - 144]
      add	r11,[rbp - 1568]
      mov	[r11],r10
      mov	r10,[rbp - 120]
      add	r10,1
      mov	[rbp - 1592],r10
      mov	r10,[rbp - 1592]
      imul	r10,8
      mov	[rbp - 1592],r10
      mov	r10,[rbp - 128]
      add	r10,1
      mov	[rbp - 1600],r10
      mov	r10,[rbp - 1600]
      imul	r10,8
      mov	[rbp - 1600],r10
      mov	r10,[rbp - 112]
      add	r10,1
      mov	[rbp - 1608],r10
      mov	r10,[rbp - 1608]
      mov	r11,[rbp - 152]
      add	r11,[rbp - 1592]
      mov	r11,[r11]
      add	r11,[rbp - 1600]
      mov	[r11],r10
      mov	r10,[rbp - 120]
      cmp	r10,[rbp - 80]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 1616],r10
      mov	r10,[rbp - 1616]
      cmp	r10,0
      je	_12check
      mov	r10,[rbp - 128]
      cmp	r10,[rbp - 88]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 1624],r10
      mov	r10,[rbp - 1616]
      and	r10,[rbp - 1624]
_12check:
      mov	[rbp - 1632],r10
      mov	 r10,[rbp-1632]
      cmp	 r10,0
      je	_6else
_6if:
      mov	qword[rbp - 104],1
      jmp	_6ifback
_6else:
_6ifback:
      jmp	_7ifback
_7else:
_7ifback:
      mov	r10,[rbp - 56]
      add	r10,1
      mov	[rbp - 1736],r10
      mov	r10,[rbp - 1736]
      imul	r10,8
      mov	[rbp - 1736],r10
      mov	r10,[rbp - 136]
      add	r10,[rbp - 1736]
      mov	r10,[r10]
      sub	r10,2
      mov	[rbp - 1744],r10
      mov	r10,[rbp - 1744]
      mov	[rbp - 120],r10
      mov	r10,[rbp - 56]
      add	r10,1
      mov	[rbp - 1768],r10
      mov	r10,[rbp - 1768]
      imul	r10,8
      mov	[rbp - 1768],r10
      mov	r10,[rbp - 144]
      add	r10,[rbp - 1768]
      mov	r10,[r10]
      sub	r10,1
      mov	[rbp - 1776],r10
      mov	r10,[rbp - 1776]
      mov	[rbp - 128],r10
      mov	rdi,[rbp-120]
      mov	rsi,[rbp-48]
      push	r10
      push	r11
      call	check
      pop	r11
      pop	r10
      mov	[rbp -  1904],rax
      mov	r10,[rbp - 1904]
      cmp	r10,0
      je	_13check
      mov	rdi,[rbp-128]
      mov	rsi,[rbp-48]
      push	r10
      push	r11
      call	check
      pop	r11
      pop	r10
      mov	[rbp -  1912],rax
      mov	r10,[rbp - 1904]
      and	r10,[rbp - 1912]
_13check:
      mov	[rbp - 1920],r10
      mov	r10,[rbp - 1920]
      cmp	r10,0
      je	_14check
      mov	r10,[rbp - 120]
      add	r10,1
      mov	[rbp - 1944],r10
      mov	r10,[rbp - 1944]
      imul	r10,8
      mov	[rbp - 1944],r10
      mov	r10,[rbp - 128]
      add	r10,1
      mov	[rbp - 1952],r10
      mov	r10,[rbp - 1952]
      imul	r10,8
      mov	[rbp - 1952],r10
      mov	r10,1
      not	r10
      add	r10,1
      mov	[rbp - 1960],r10
      mov	r11,[rbp - 152]
      add	r11,[rbp - 1944]
      mov	r11,[r11]
      add	r11,[rbp - 1952]
      mov	r10,[r11]
      cmp	r10,[rbp - 1960]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 1968],r10
      mov	r10,[rbp - 1920]
      and	r10,[rbp - 1968]
_14check:
      mov	[rbp - 1976],r10
      mov	 r10,[rbp-1976]
      cmp	 r10,0
      je	_9else
_9if:
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 1784],r10
      mov	r10,[rbp - 1784]
      mov	[rbp - 96],r10
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 1808],r10
      mov	r10,[rbp - 1808]
      imul	r10,8
      mov	[rbp - 1808],r10
      mov	r10,[rbp - 120]
      mov	r11,[rbp - 136]
      add	r11,[rbp - 1808]
      mov	[r11],r10
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 1832],r10
      mov	r10,[rbp - 1832]
      imul	r10,8
      mov	[rbp - 1832],r10
      mov	r10,[rbp - 128]
      mov	r11,[rbp - 144]
      add	r11,[rbp - 1832]
      mov	[r11],r10
      mov	r10,[rbp - 120]
      add	r10,1
      mov	[rbp - 1856],r10
      mov	r10,[rbp - 1856]
      imul	r10,8
      mov	[rbp - 1856],r10
      mov	r10,[rbp - 128]
      add	r10,1
      mov	[rbp - 1864],r10
      mov	r10,[rbp - 1864]
      imul	r10,8
      mov	[rbp - 1864],r10
      mov	r10,[rbp - 112]
      add	r10,1
      mov	[rbp - 1872],r10
      mov	r10,[rbp - 1872]
      mov	r11,[rbp - 152]
      add	r11,[rbp - 1856]
      mov	r11,[r11]
      add	r11,[rbp - 1864]
      mov	[r11],r10
      mov	r10,[rbp - 120]
      cmp	r10,[rbp - 80]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 1880],r10
      mov	r10,[rbp - 1880]
      cmp	r10,0
      je	_15check
      mov	r10,[rbp - 128]
      cmp	r10,[rbp - 88]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 1888],r10
      mov	r10,[rbp - 1880]
      and	r10,[rbp - 1888]
_15check:
      mov	[rbp - 1896],r10
      mov	 r10,[rbp-1896]
      cmp	 r10,0
      je	_8else
_8if:
      mov	qword[rbp - 104],1
      jmp	_8ifback
_8else:
_8ifback:
      jmp	_9ifback
_9else:
_9ifback:
      mov	r10,[rbp - 56]
      add	r10,1
      mov	[rbp - 2000],r10
      mov	r10,[rbp - 2000]
      imul	r10,8
      mov	[rbp - 2000],r10
      mov	r10,[rbp - 136]
      add	r10,[rbp - 2000]
      mov	r10,[r10]
      sub	r10,2
      mov	[rbp - 2008],r10
      mov	r10,[rbp - 2008]
      mov	[rbp - 120],r10
      mov	r10,[rbp - 56]
      add	r10,1
      mov	[rbp - 2032],r10
      mov	r10,[rbp - 2032]
      imul	r10,8
      mov	[rbp - 2032],r10
      mov	r10,[rbp - 144]
      add	r10,[rbp - 2032]
      mov	r10,[r10]
      add	r10,1
      mov	[rbp - 2040],r10
      mov	r10,[rbp - 2040]
      mov	[rbp - 128],r10
      mov	rdi,[rbp-120]
      mov	rsi,[rbp-48]
      push	r10
      push	r11
      call	check
      pop	r11
      pop	r10
      mov	[rbp -  2168],rax
      mov	r10,[rbp - 2168]
      cmp	r10,0
      je	_16check
      mov	rdi,[rbp-128]
      mov	rsi,[rbp-48]
      push	r10
      push	r11
      call	check
      pop	r11
      pop	r10
      mov	[rbp -  2176],rax
      mov	r10,[rbp - 2168]
      and	r10,[rbp - 2176]
_16check:
      mov	[rbp - 2184],r10
      mov	r10,[rbp - 2184]
      cmp	r10,0
      je	_17check
      mov	r10,[rbp - 120]
      add	r10,1
      mov	[rbp - 2208],r10
      mov	r10,[rbp - 2208]
      imul	r10,8
      mov	[rbp - 2208],r10
      mov	r10,[rbp - 128]
      add	r10,1
      mov	[rbp - 2216],r10
      mov	r10,[rbp - 2216]
      imul	r10,8
      mov	[rbp - 2216],r10
      mov	r10,1
      not	r10
      add	r10,1
      mov	[rbp - 2224],r10
      mov	r11,[rbp - 152]
      add	r11,[rbp - 2208]
      mov	r11,[r11]
      add	r11,[rbp - 2216]
      mov	r10,[r11]
      cmp	r10,[rbp - 2224]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 2232],r10
      mov	r10,[rbp - 2184]
      and	r10,[rbp - 2232]
_17check:
      mov	[rbp - 2240],r10
      mov	 r10,[rbp-2240]
      cmp	 r10,0
      je	_11else
_11if:
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 2048],r10
      mov	r10,[rbp - 2048]
      mov	[rbp - 96],r10
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 2072],r10
      mov	r10,[rbp - 2072]
      imul	r10,8
      mov	[rbp - 2072],r10
      mov	r10,[rbp - 120]
      mov	r11,[rbp - 136]
      add	r11,[rbp - 2072]
      mov	[r11],r10
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 2096],r10
      mov	r10,[rbp - 2096]
      imul	r10,8
      mov	[rbp - 2096],r10
      mov	r10,[rbp - 128]
      mov	r11,[rbp - 144]
      add	r11,[rbp - 2096]
      mov	[r11],r10
      mov	r10,[rbp - 120]
      add	r10,1
      mov	[rbp - 2120],r10
      mov	r10,[rbp - 2120]
      imul	r10,8
      mov	[rbp - 2120],r10
      mov	r10,[rbp - 128]
      add	r10,1
      mov	[rbp - 2128],r10
      mov	r10,[rbp - 2128]
      imul	r10,8
      mov	[rbp - 2128],r10
      mov	r10,[rbp - 112]
      add	r10,1
      mov	[rbp - 2136],r10
      mov	r10,[rbp - 2136]
      mov	r11,[rbp - 152]
      add	r11,[rbp - 2120]
      mov	r11,[r11]
      add	r11,[rbp - 2128]
      mov	[r11],r10
      mov	r10,[rbp - 120]
      cmp	r10,[rbp - 80]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 2144],r10
      mov	r10,[rbp - 2144]
      cmp	r10,0
      je	_18check
      mov	r10,[rbp - 128]
      cmp	r10,[rbp - 88]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 2152],r10
      mov	r10,[rbp - 2144]
      and	r10,[rbp - 2152]
_18check:
      mov	[rbp - 2160],r10
      mov	 r10,[rbp-2160]
      cmp	 r10,0
      je	_10else
_10if:
      mov	qword[rbp - 104],1
      jmp	_10ifback
_10else:
_10ifback:
      jmp	_11ifback
_11else:
_11ifback:
      mov	r10,[rbp - 56]
      add	r10,1
      mov	[rbp - 2264],r10
      mov	r10,[rbp - 2264]
      imul	r10,8
      mov	[rbp - 2264],r10
      mov	r10,[rbp - 136]
      add	r10,[rbp - 2264]
      mov	r10,[r10]
      add	r10,2
      mov	[rbp - 2272],r10
      mov	r10,[rbp - 2272]
      mov	[rbp - 120],r10
      mov	r10,[rbp - 56]
      add	r10,1
      mov	[rbp - 2296],r10
      mov	r10,[rbp - 2296]
      imul	r10,8
      mov	[rbp - 2296],r10
      mov	r10,[rbp - 144]
      add	r10,[rbp - 2296]
      mov	r10,[r10]
      sub	r10,1
      mov	[rbp - 2304],r10
      mov	r10,[rbp - 2304]
      mov	[rbp - 128],r10
      mov	rdi,[rbp-120]
      mov	rsi,[rbp-48]
      push	r10
      push	r11
      call	check
      pop	r11
      pop	r10
      mov	[rbp -  2432],rax
      mov	r10,[rbp - 2432]
      cmp	r10,0
      je	_19check
      mov	rdi,[rbp-128]
      mov	rsi,[rbp-48]
      push	r10
      push	r11
      call	check
      pop	r11
      pop	r10
      mov	[rbp -  2440],rax
      mov	r10,[rbp - 2432]
      and	r10,[rbp - 2440]
_19check:
      mov	[rbp - 2448],r10
      mov	r10,[rbp - 2448]
      cmp	r10,0
      je	_20check
      mov	r10,[rbp - 120]
      add	r10,1
      mov	[rbp - 2472],r10
      mov	r10,[rbp - 2472]
      imul	r10,8
      mov	[rbp - 2472],r10
      mov	r10,[rbp - 128]
      add	r10,1
      mov	[rbp - 2480],r10
      mov	r10,[rbp - 2480]
      imul	r10,8
      mov	[rbp - 2480],r10
      mov	r10,1
      not	r10
      add	r10,1
      mov	[rbp - 2488],r10
      mov	r11,[rbp - 152]
      add	r11,[rbp - 2472]
      mov	r11,[r11]
      add	r11,[rbp - 2480]
      mov	r10,[r11]
      cmp	r10,[rbp - 2488]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 2496],r10
      mov	r10,[rbp - 2448]
      and	r10,[rbp - 2496]
_20check:
      mov	[rbp - 2504],r10
      mov	 r10,[rbp-2504]
      cmp	 r10,0
      je	_13else
_13if:
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 2312],r10
      mov	r10,[rbp - 2312]
      mov	[rbp - 96],r10
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 2336],r10
      mov	r10,[rbp - 2336]
      imul	r10,8
      mov	[rbp - 2336],r10
      mov	r10,[rbp - 120]
      mov	r11,[rbp - 136]
      add	r11,[rbp - 2336]
      mov	[r11],r10
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 2360],r10
      mov	r10,[rbp - 2360]
      imul	r10,8
      mov	[rbp - 2360],r10
      mov	r10,[rbp - 128]
      mov	r11,[rbp - 144]
      add	r11,[rbp - 2360]
      mov	[r11],r10
      mov	r10,[rbp - 120]
      add	r10,1
      mov	[rbp - 2384],r10
      mov	r10,[rbp - 2384]
      imul	r10,8
      mov	[rbp - 2384],r10
      mov	r10,[rbp - 128]
      add	r10,1
      mov	[rbp - 2392],r10
      mov	r10,[rbp - 2392]
      imul	r10,8
      mov	[rbp - 2392],r10
      mov	r10,[rbp - 112]
      add	r10,1
      mov	[rbp - 2400],r10
      mov	r10,[rbp - 2400]
      mov	r11,[rbp - 152]
      add	r11,[rbp - 2384]
      mov	r11,[r11]
      add	r11,[rbp - 2392]
      mov	[r11],r10
      mov	r10,[rbp - 120]
      cmp	r10,[rbp - 80]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 2408],r10
      mov	r10,[rbp - 2408]
      cmp	r10,0
      je	_21check
      mov	r10,[rbp - 128]
      cmp	r10,[rbp - 88]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 2416],r10
      mov	r10,[rbp - 2408]
      and	r10,[rbp - 2416]
_21check:
      mov	[rbp - 2424],r10
      mov	 r10,[rbp-2424]
      cmp	 r10,0
      je	_12else
_12if:
      mov	qword[rbp - 104],1
      jmp	_12ifback
_12else:
_12ifback:
      jmp	_13ifback
_13else:
_13ifback:
      mov	r10,[rbp - 56]
      add	r10,1
      mov	[rbp - 2528],r10
      mov	r10,[rbp - 2528]
      imul	r10,8
      mov	[rbp - 2528],r10
      mov	r10,[rbp - 136]
      add	r10,[rbp - 2528]
      mov	r10,[r10]
      add	r10,2
      mov	[rbp - 2536],r10
      mov	r10,[rbp - 2536]
      mov	[rbp - 120],r10
      mov	r10,[rbp - 56]
      add	r10,1
      mov	[rbp - 2560],r10
      mov	r10,[rbp - 2560]
      imul	r10,8
      mov	[rbp - 2560],r10
      mov	r10,[rbp - 144]
      add	r10,[rbp - 2560]
      mov	r10,[r10]
      add	r10,1
      mov	[rbp - 2568],r10
      mov	r10,[rbp - 2568]
      mov	[rbp - 128],r10
      mov	rdi,[rbp-120]
      mov	rsi,[rbp-48]
      push	r10
      push	r11
      call	check
      pop	r11
      pop	r10
      mov	[rbp -  2696],rax
      mov	r10,[rbp - 2696]
      cmp	r10,0
      je	_22check
      mov	rdi,[rbp-128]
      mov	rsi,[rbp-48]
      push	r10
      push	r11
      call	check
      pop	r11
      pop	r10
      mov	[rbp -  2704],rax
      mov	r10,[rbp - 2696]
      and	r10,[rbp - 2704]
_22check:
      mov	[rbp - 2712],r10
      mov	r10,[rbp - 2712]
      cmp	r10,0
      je	_23check
      mov	r10,[rbp - 120]
      add	r10,1
      mov	[rbp - 2736],r10
      mov	r10,[rbp - 2736]
      imul	r10,8
      mov	[rbp - 2736],r10
      mov	r10,[rbp - 128]
      add	r10,1
      mov	[rbp - 2744],r10
      mov	r10,[rbp - 2744]
      imul	r10,8
      mov	[rbp - 2744],r10
      mov	r10,1
      not	r10
      add	r10,1
      mov	[rbp - 2752],r10
      mov	r11,[rbp - 152]
      add	r11,[rbp - 2736]
      mov	r11,[r11]
      add	r11,[rbp - 2744]
      mov	r10,[r11]
      cmp	r10,[rbp - 2752]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 2760],r10
      mov	r10,[rbp - 2712]
      and	r10,[rbp - 2760]
_23check:
      mov	[rbp - 2768],r10
      mov	 r10,[rbp-2768]
      cmp	 r10,0
      je	_15else
_15if:
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 2576],r10
      mov	r10,[rbp - 2576]
      mov	[rbp - 96],r10
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 2600],r10
      mov	r10,[rbp - 2600]
      imul	r10,8
      mov	[rbp - 2600],r10
      mov	r10,[rbp - 120]
      mov	r11,[rbp - 136]
      add	r11,[rbp - 2600]
      mov	[r11],r10
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 2624],r10
      mov	r10,[rbp - 2624]
      imul	r10,8
      mov	[rbp - 2624],r10
      mov	r10,[rbp - 128]
      mov	r11,[rbp - 144]
      add	r11,[rbp - 2624]
      mov	[r11],r10
      mov	r10,[rbp - 120]
      add	r10,1
      mov	[rbp - 2648],r10
      mov	r10,[rbp - 2648]
      imul	r10,8
      mov	[rbp - 2648],r10
      mov	r10,[rbp - 128]
      add	r10,1
      mov	[rbp - 2656],r10
      mov	r10,[rbp - 2656]
      imul	r10,8
      mov	[rbp - 2656],r10
      mov	r10,[rbp - 112]
      add	r10,1
      mov	[rbp - 2664],r10
      mov	r10,[rbp - 2664]
      mov	r11,[rbp - 152]
      add	r11,[rbp - 2648]
      mov	r11,[r11]
      add	r11,[rbp - 2656]
      mov	[r11],r10
      mov	r10,[rbp - 120]
      cmp	r10,[rbp - 80]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 2672],r10
      mov	r10,[rbp - 2672]
      cmp	r10,0
      je	_24check
      mov	r10,[rbp - 128]
      cmp	r10,[rbp - 88]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 2680],r10
      mov	r10,[rbp - 2672]
      and	r10,[rbp - 2680]
_24check:
      mov	[rbp - 2688],r10
      mov	 r10,[rbp-2688]
      cmp	 r10,0
      je	_14else
_14if:
      mov	qword[rbp - 104],1
      jmp	_14ifback
_14else:
_14ifback:
      jmp	_15ifback
_15else:
_15ifback:
      mov	r10,[rbp - 104]
      cmp	r10,1
      sete r10b
      movzx r10,r10b
      mov	[rbp - 2776],r10
      mov	 r10,[rbp-2776]
      cmp	 r10,0
      je	_16else
_16if:
      jmp	_16ifback
_16else:
_16ifback:
      mov	r10,[rbp - 56]
      add	r10,1
      mov	[rbp - 2784],r10
      mov	r10,[rbp - 2784]
      mov	[rbp - 56],r10
_4while:
      mov	r10,[rbp - 56]
      cmp	r10,[rbp - 96]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 2792],r10
      mov	r10,[rbp -  2792]
      cmp	r10,1
      je	_4for
_4forback:
      mov	r10,[rbp - 104]
      cmp	r10,1
      sete r10b
      movzx r10,r10b
      mov	[rbp - 2864],r10
      mov	 r10,[rbp-2864]
      cmp	 r10,0
      je	_17else
_17if:
      mov	r10,[rbp - 80]
      add	r10,1
      mov	[rbp - 2816],r10
      mov	r10,[rbp - 2816]
      imul	r10,8
      mov	[rbp - 2816],r10
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 2824],r10
      mov	r10,[rbp - 2824]
      imul	r10,8
      mov	[rbp - 2824],r10
      mov	r10,[rbp - 152]
      add	r10,[rbp - 2816]
      mov	r10,[r10]
      add	r10,[rbp - 2824]
      mov	rdi,[r10]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  2832],rax
      mov	rdi,[rbp-2832]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  2840],rax
      jmp	_17ifback
_17else:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'n'
      mov	byte[rax + 1],'o'
      mov	byte[rax + 2],' '
      mov	byte[rax + 3],'s'
      mov	byte[rax + 4],'o'
      mov	byte[rax + 5],'l'
      mov	byte[rax + 6],'u'
      mov	byte[rax + 7],'t'
      mov	byte[rax + 8],'i'
      mov	byte[rax + 9],'o'
      mov	byte[rax + 10],'n'
      mov	byte[rax + 11],'!'
      mov	byte[rax + 12],10
      mov	byte[rax + 13],0
      mov	[rbp - 2848],rax
      mov	rdi,[rbp-2848]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  2856],rax
_17ifback:
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

