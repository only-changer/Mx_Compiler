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
      sub	rsp,184
      mov	[rbp - 56],rdi
      mov	r10,[rbp - 56]
      add	r10,1
      mov	[rbp - 64],r10
      mov	r10,[rbp - 64]
      imul	r10,8
      mov	[rbp - 64],r10
      mov	rdi,[rbp-64]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  72],rax
      mov	r10,[rbp - 56]
      mov	r11,[rbp - 72]
      add	r11,0
      mov	[r11],r10
      mov	r10,[rbp - 72]
      mov	[lcc],r10
      mov	qword[lci],0
_0for:
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 96],r10
      mov	r10,[rbp - 96]
      imul	r10,8
      mov	[rbp - 96],r10
      mov	r10,[rbp - 56]
      add	r10,1
      mov	[rbp - 104],r10
      mov	r10,[rbp - 104]
      imul	r10,8
      mov	[rbp - 104],r10
      mov	rdi,[rbp-104]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  112],rax
      mov	r10,[rbp - 56]
      mov	r11,[rbp - 112]
      add	r11,0
      mov	[r11],r10
      mov	r10,[rbp - 112]
      mov	r11,[lcc]
      add	r11,[rbp - 96]
      mov	[r11],r10
      mov	qword[lcj],0
_1for:
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 136],r10
      mov	r10,[rbp - 136]
      imul	r10,8
      mov	[rbp - 136],r10
      mov	r10,[lcj]
      add	r10,1
      mov	[rbp - 144],r10
      mov	r10,[rbp - 144]
      imul	r10,8
      mov	[rbp - 144],r10
      mov	r11,[lcc]
      add	r11,[rbp - 136]
      mov	r11,[r11]
      add	r11,[rbp - 144]
      mov	qword[r11],0
_1while:
      mov	r10,[lcj]
      mov	[rbp-152],r10
      mov	r10,[lcj]
      add	r10,1
      mov	[lcj],r10
      mov	r10,[lcj]
      cmp	r10,[rbp - 56]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 160],r10
      mov	r10,[rbp -  160]
      cmp	r10,1
      je	_1for
_1forback:
_0while:
      mov	r10,[lci]
      mov	[rbp-168],r10
      mov	r10,[lci]
      add	r10,1
      mov	[lci],r10
      mov	r10,[lci]
      cmp	r10,[rbp - 56]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 176],r10
      mov	r10,[rbp -  176]
      cmp	r10,1
      je	_0for
_0forback:
      mov	rsp,rbp
      pop rbp
      ret
build:
      push	rbp
      mov	rbp,rsp
      sub	rsp,376
      mov	[rbp - 184],rdi
      mov	[rbp - 192],rsi
      mov	qword[lci],1
_2for:
      mov	qword[lcj],50
_3for:
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 216],r10
      mov	r10,[rbp - 216]
      imul	r10,8
      mov	[rbp - 216],r10
      mov	r10,[lcj]
      add	r10,1
      mov	[rbp - 224],r10
      mov	r10,[rbp - 224]
      imul	r10,8
      mov	[rbp - 224],r10
      mov	r11,[lcc]
      add	r11,[rbp - 216]
      mov	r11,[r11]
      add	r11,[rbp - 224]
      mov	qword[r11],1
_3while:
      mov	r10,[lcj]
      mov	[rbp-232],r10
      mov	r10,[lcj]
      add	r10,1
      mov	[lcj],r10
      mov	r10,98
      sub	r10,[lci]
      mov	[rbp - 240],r10
      mov	r10,[rbp - 240]
      add	r10,1
      mov	[rbp - 248],r10
      mov	r10,[lcj]
      cmp	r10,[rbp - 248]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 256],r10
      mov	r10,[rbp -  256]
      cmp	r10,1
      je	_3for
_3forback:
_2while:
      mov	r10,[lci]
      mov	[rbp-264],r10
      mov	r10,[lci]
      add	r10,1
      mov	[lci],r10
      mov	r10,[lci]
      cmp	r10,49
      setle r10b
      movzx r10,r10b
      mov	[rbp - 272],r10
      mov	r10,[rbp -  272]
      cmp	r10,1
      je	_2for
_2forback:
      mov	qword[lci],1
_4for:
      mov	r10,[rbp - 184]
      add	r10,1
      mov	[rbp - 296],r10
      mov	r10,[rbp - 296]
      imul	r10,8
      mov	[rbp - 296],r10
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 304],r10
      mov	r10,[rbp - 304]
      imul	r10,8
      mov	[rbp - 304],r10
      mov	r11,[lcc]
      add	r11,[rbp - 296]
      mov	r11,[r11]
      add	r11,[rbp - 304]
      mov	qword[r11],1
_4while:
      mov	r10,[lci]
      mov	[rbp-312],r10
      mov	r10,[lci]
      add	r10,1
      mov	[lci],r10
      mov	r10,[lci]
      cmp	r10,49
      setle r10b
      movzx r10,r10b
      mov	[rbp - 320],r10
      mov	r10,[rbp -  320]
      cmp	r10,1
      je	_4for
_4forback:
      mov	qword[lci],50
_5for:
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 344],r10
      mov	r10,[rbp - 344]
      imul	r10,8
      mov	[rbp - 344],r10
      mov	r10,[rbp - 192]
      add	r10,1
      mov	[rbp - 352],r10
      mov	r10,[rbp - 352]
      imul	r10,8
      mov	[rbp - 352],r10
      mov	r11,[lcc]
      add	r11,[rbp - 344]
      mov	r11,[r11]
      add	r11,[rbp - 352]
      mov	qword[r11],1
_5while:
      mov	r10,[lci]
      mov	[rbp-360],r10
      mov	r10,[lci]
      add	r10,1
      mov	[lci],r10
      mov	r10,[lci]
      cmp	r10,98
      setle r10b
      movzx r10,r10b
      mov	[rbp - 368],r10
      mov	r10,[rbp -  368]
      cmp	r10,1
      je	_5for
_5forback:
      mov	rax,0
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
find:
      push	rbp
      mov	rbp,rsp
      sub	rsp,752
      mov	[rbp - 376],rdi
      mov	[rbp - 384],rsi
      mov	[rbp - 392],rdx
      mov	qword[lcopen],0
      mov	qword[lcclosed],1
      mov	qword[lci],1
_6for:
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 416],r10
      mov	r10,[rbp - 416]
      imul	r10,8
      mov	[rbp - 416],r10
      mov	r11,[lcvisit]
      add	r11,[rbp - 416]
      mov	qword[r11],0
_6while:
      mov	r10,[lci]
      mov	[rbp-424],r10
      mov	r10,[lci]
      add	r10,1
      mov	[lci],r10
      mov	r10,[lci]
      cmp	r10,[rbp - 376]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 432],r10
      mov	r10,[rbp -  432]
      cmp	r10,1
      je	_6for
_6forback:
      mov	r10,1
      add	r10,1
      mov	[rbp - 456],r10
      mov	r10,[rbp - 456]
      imul	r10,8
      mov	[rbp - 456],r10
      mov	r10,[rbp - 384]
      mov	r11,[lcf]
      add	r11,[rbp - 456]
      mov	[r11],r10
      mov	r10,[rbp - 384]
      add	r10,1
      mov	[rbp - 480],r10
      mov	r10,[rbp - 480]
      imul	r10,8
      mov	[rbp - 480],r10
      mov	r11,[lcvisit]
      add	r11,[rbp - 480]
      mov	qword[r11],1
      mov	r10,[rbp - 384]
      add	r10,1
      mov	[rbp - 504],r10
      mov	r10,[rbp - 504]
      imul	r10,8
      mov	[rbp - 504],r10
      mov	r11,[lcpre]
      add	r11,[rbp - 504]
      mov	qword[r11],0
      mov	qword[rbp - 392],0
      jmp	_7while
_7for:
      mov	r10,[lcopen]
      mov	[rbp-512],r10
      mov	r10,[lcopen]
      add	r10,1
      mov	[lcopen],r10
      mov	r10,[lcopen]
      add	r10,1
      mov	[rbp - 536],r10
      mov	r10,[rbp - 536]
      imul	r10,8
      mov	[rbp - 536],r10
      mov	r10,[lcf]
      add	r10,[rbp - 536]
      mov	r10,[r10]
      mov	[lci],r10
      mov	qword[lcj],1
_8for:
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 648],r10
      mov	r10,[rbp - 648]
      imul	r10,8
      mov	[rbp - 648],r10
      mov	r10,[lcj]
      add	r10,1
      mov	[rbp - 656],r10
      mov	r10,[rbp - 656]
      imul	r10,8
      mov	[rbp - 656],r10
      mov	r11,[lcc]
      add	r11,[rbp - 648]
      mov	r11,[r11]
      add	r11,[rbp - 656]
      mov	r10,[r11]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov	[rbp - 664],r10
      mov	r10,[rbp - 664]
      cmp	r10,0
      je	_0check
      mov	r10,[lcj]
      add	r10,1
      mov	[rbp - 688],r10
      mov	r10,[rbp - 688]
      imul	r10,8
      mov	[rbp - 688],r10
      mov	r11,[lcvisit]
      add	r11,[rbp - 688]
      mov	r10,[r11]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov	[rbp - 696],r10
      mov	r10,[rbp - 664]
      and	r10,[rbp - 696]
_0check:
      mov	[rbp - 704],r10
      mov	 r10,[rbp-704]
      cmp	 r10,0
      je	_1else
_1if:
      mov	r10,[lcj]
      add	r10,1
      mov	[rbp - 560],r10
      mov	r10,[rbp - 560]
      imul	r10,8
      mov	[rbp - 560],r10
      mov	r11,[lcvisit]
      add	r11,[rbp - 560]
      mov	qword[r11],1
      mov	r10,[lcclosed]
      mov	[rbp-568],r10
      mov	r10,[lcclosed]
      add	r10,1
      mov	[lcclosed],r10
      mov	r10,[lcclosed]
      add	r10,1
      mov	[rbp - 592],r10
      mov	r10,[rbp - 592]
      imul	r10,8
      mov	[rbp - 592],r10
      mov	r11,[lcf]
      add	r11,[rbp - 592]
      mov	r10,[lcj]
      mov	qword[r11],r10
      mov	r10,[lcj]
      add	r10,1
      mov	[rbp - 616],r10
      mov	r10,[rbp - 616]
      imul	r10,8
      mov	[rbp - 616],r10
      mov	r11,[lcpre]
      add	r11,[rbp - 616]
      mov	r10,[lci]
      mov	qword[r11],r10
      mov	r10,[lcclosed]
      cmp	r10,[rbp - 376]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 624],r10
      mov	 r10,[rbp-624]
      cmp	 r10,0
      je	_0else
_0if:
      mov	qword[rbp - 392],1
      jmp	_0ifback
_0else:
_0ifback:
      jmp	_1ifback
_1else:
_1ifback:
_8while:
      mov	r10,[lcj]
      mov	[rbp-712],r10
      mov	r10,[lcj]
      add	r10,1
      mov	[lcj],r10
      mov	r10,[lcj]
      cmp	r10,[rbp - 376]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 720],r10
      mov	r10,[rbp -  720]
      cmp	r10,1
      je	_8for
_8forback:
_7while:
      mov	r10,[lcopen]
      cmp	r10,[lcclosed]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 728],r10
      mov	r10,[rbp - 728]
      cmp	r10,0
      je	_1check
      mov	r10,[rbp - 392]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov	[rbp - 736],r10
      mov	r10,[rbp - 728]
      and	r10,[rbp - 736]
_1check:
      mov	[rbp - 744],r10
      mov	r10,[rbp -  744]
      cmp	r10,1
      je	_7for
_7forback:
      mov	rax,[rbp -  392]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
improve:
      push	rbp
      mov	rbp,rsp
      sub	rsp,904
      mov	[rbp - 752],rdi
      mov	r10,[rbp - 752]
      mov	[lci],r10
      mov	r10,[lcans]
      mov	[rbp-760],r10
      mov	r10,[lcans]
      add	r10,1
      mov	[lcans],r10
      jmp	_9while
_9for:
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 784],r10
      mov	r10,[rbp - 784]
      imul	r10,8
      mov	[rbp - 784],r10
      mov	r10,[lcpre]
      add	r10,[rbp - 784]
      mov	r10,[r10]
      mov	[lcj],r10
      mov	r10,[lcj]
      add	r10,1
      mov	[rbp - 808],r10
      mov	r10,[rbp - 808]
      imul	r10,8
      mov	[rbp - 808],r10
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 816],r10
      mov	r10,[rbp - 816]
      imul	r10,8
      mov	[rbp - 816],r10
      mov	r10,[lcc]
      add	r10,[rbp - 808]
      mov	r10,[r10]
      add	r10,[rbp - 816]
      mov	r10,[r10]
      mov	[rbp - 824],r10
      mov	r10,[lcc]
      add	r10,[rbp - 808]
      mov	r10,[r10]
      add	r10,[rbp - 816]
      mov	r10,[r10]
      sub	r10,1
      mov	r11,[lcc]
      add	r11,[rbp - 808]
      mov	r11,[r11]
      add	r11,[rbp - 816]
      mov	[r11],r10
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 848],r10
      mov	r10,[rbp - 848]
      imul	r10,8
      mov	[rbp - 848],r10
      mov	r10,[lcj]
      add	r10,1
      mov	[rbp - 856],r10
      mov	r10,[rbp - 856]
      imul	r10,8
      mov	[rbp - 856],r10
      mov	r10,[lcc]
      add	r10,[rbp - 848]
      mov	r10,[r10]
      add	r10,[rbp - 856]
      mov	r10,[r10]
      mov	[rbp - 864],r10
      mov	r10,[lcc]
      add	r10,[rbp - 848]
      mov	r10,[r10]
      add	r10,[rbp - 856]
      mov	r10,[r10]
      add	r10,1
      mov	r11,[lcc]
      add	r11,[rbp - 848]
      mov	r11,[r11]
      add	r11,[rbp - 856]
      mov	[r11],r10
      mov	r10,[lcj]
      mov	[lci],r10
_9while:
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 888],r10
      mov	r10,[rbp - 888]
      imul	r10,8
      mov	[rbp - 888],r10
      mov	r11,[lcpre]
      add	r11,[rbp - 888]
      mov	r10,[r11]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov	[rbp - 896],r10
      mov	r10,[rbp -  896]
      cmp	r10,1
      je	_9for
_9forback:
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
      sub	rsp,1000
      mov	qword[lcans],0
      mov	r10,110
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
      mov	qword[r11],110
      mov	r10,[rbp - 16]
      mov	[lcvisit],r10
      mov	r10,110
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
      mov	qword[r11],110
      mov	r10,[rbp - 32]
      mov	[lcpre],r10
      mov	r10,110
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
      mov	qword[r11],110
      mov	r10,[rbp - 48]
      mov	[lcf],r10
      mov	rdi,110
      push	r10
      push	r11
      call	origin
      pop	r11
      pop	r10
      mov	[rbp -  904],rax
      mov	qword[rbp - 912],0
      mov	qword[rbp - 920],99
      mov	qword[rbp - 928],100
      mov	qword[rbp - 936],0
      mov	rdi,[rbp-920]
      mov	rsi,[rbp-928]
      push	r10
      push	r11
      call	build
      pop	r11
      pop	r10
      mov	[rbp -  952],rax
      jmp	_10while
_10for:
      mov	rdi,[rbp-928]
      push	r10
      push	r11
      call	improve
      pop	r11
      pop	r10
      mov	[rbp -  960],rax
_10while:
      mov	rdi,[rbp-928]
      mov	rsi,[rbp-920]
      mov	rdx,[rbp-936]
      push	r10
      push	r11
      call	find
      pop	r11
      pop	r10
      mov	[rbp -  968],rax
      mov	r10,[rbp - 968]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov	[rbp - 976],r10
      mov	r10,[rbp -  976]
      cmp	r10,1
      je	_10for
_10forback:
      mov	rdi,[lcans]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  984],rax
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

lcc:
	dq 0
lcans:
	dq 0
lcvisit:
	dq 0
lcpre:
	dq 0
lcf:
	dq 0
lci:
	dq 0
lcj:
	dq 0
lcopen:
	dq 0
lcclosed:
	dq 0
section .bss
stringbuffer:
	resb 256

