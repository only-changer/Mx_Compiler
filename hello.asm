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
printNum:
      push	rbp
      mov	rbp,rsp
      sub	rsp,88
      mov	[rbp - 64],rdi
      mov	rdi,[rbp-64]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  72],rax
      mov	rdi,[rbp-72]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  80],rax
      mov	rsp,rbp
      pop rbp
      ret
main:
      push	rbp
      mov	rbp,rsp
      sub	rsp,752
      mov	r10,4
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
      mov	qword[r11],4
      mov	r10,[rbp - 16]
      mov	[lca],r10
      mov	rdi,16
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  40],rax
      mov	r10,5
      add	r10,1
      mov	[rbp - 48],r10
      mov	r10,[rbp - 48]
      imul	r10,16
      mov	[rbp - 48],r10
      mov	rdi,[rbp-48]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  56],rax
      mov	r11,[rbp - 56]
      add	r11,0
      mov	qword[r11],5
      mov	r10,[rbp - 56]
      mov	[lcb],r10
      mov	qword[lci],0
_0for:
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 104],r10
      mov	r10,[rbp - 104]
      imul	r10,8
      mov	[rbp - 104],r10
      mov	r10,11
      add	r10,1
      mov	[rbp - 112],r10
      mov	r10,[rbp - 112]
      imul	r10,8
      mov	[rbp - 112],r10
      mov	rdi,[rbp-112]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  120],rax
      mov	r11,[rbp - 120]
      add	r11,0
      mov	qword[r11],11
      mov	r10,[rbp - 120]
      mov	r11,[lca]
      add	r11,[rbp - 104]
      mov	[r11],r10
_0while:
      mov	r10,[lci]
      mov	[rbp-128],r10
      mov	r10,[lci]
      add	r10,1
      mov	[lci],r10
      mov	r10,[lci]
      cmp	r10,4
      setl r10b
      movzx r10,r10b
      mov	[rbp - 136],r10
      mov	r10,[rbp -  136]
      cmp	r10,1
      je	_0for
_0forback:
      mov	qword[lci],0
_1for:
      mov	qword[lcj],0
_2for:
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 160],r10
      mov	r10,[rbp - 160]
      imul	r10,8
      mov	[rbp - 160],r10
      mov	r10,[lcj]
      add	r10,1
      mov	[rbp - 168],r10
      mov	r10,[rbp - 168]
      imul	r10,8
      mov	[rbp - 168],r10
      mov	r11,[lca]
      add	r11,[rbp - 160]
      mov	r11,[r11]
      add	r11,[rbp - 168]
      mov	qword[r11],888
_2while:
      mov	r10,[lcj]
      mov	[rbp-176],r10
      mov	r10,[lcj]
      add	r10,1
      mov	[lcj],r10
      mov	r10,[lcj]
      cmp	r10,10
      setl r10b
      movzx r10,r10b
      mov	[rbp - 184],r10
      mov	r10,[rbp -  184]
      cmp	r10,1
      je	_2for
_2forback:
_1while:
      mov	r10,[lci]
      mov	[rbp-192],r10
      mov	r10,[lci]
      add	r10,1
      mov	[lci],r10
      mov	r10,[lci]
      cmp	r10,4
      setl r10b
      movzx r10,r10b
      mov	[rbp - 200],r10
      mov	r10,[rbp -  200]
      cmp	r10,1
      je	_1for
_1forback:
      mov	qword[lci],0
_3for:
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 224],r10
      mov	r10,[rbp - 224]
      imul	r10,16
      mov	[rbp - 224],r10
      mov	rdi,16
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  232],rax
      mov	r10,[rbp - 232]
      mov	r11,[lcb]
      add	r11,[rbp - 224]
      mov	[r11],r10
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 256],r10
      mov	r10,[rbp - 256]
      imul	r10,16
      mov	[rbp - 256],r10
      mov	r10,[lcb]
      add	r10,[rbp - 256]
      mov	r10,[r10]
      mov	[rbp - 264],r10
      mov	r10,1
      not	r10
      add	r10,1
      mov	[rbp - 272],r10
      mov	r10,[rbp - 272]
      mov	r11,[rbp - 264]
      add	r11,0
      mov	[r11],r10
_3while:
      mov	r10,[lci]
      mov	[rbp-280],r10
      mov	r10,[lci]
      add	r10,1
      mov	[lci],r10
      mov	r10,[lci]
      cmp	r10,5
      setl r10b
      movzx r10,r10b
      mov	[rbp - 288],r10
      mov	r10,[rbp -  288]
      cmp	r10,1
      je	_3for
_3forback:
      mov	r10,3
      add	r10,1
      mov	[rbp - 312],r10
      mov	r10,[rbp - 312]
      imul	r10,8
      mov	[rbp - 312],r10
      mov	r10,9
      add	r10,1
      mov	[rbp - 320],r10
      mov	r10,[rbp - 320]
      imul	r10,8
      mov	[rbp - 320],r10
      mov	r10,[lca]
      add	r10,[rbp - 312]
      mov	r10,[r10]
      add	r10,[rbp - 320]
      mov	rdi,[r10]
      push	r10
      push	r11
      mov	rax,0
      call	printNum
      pop	r11
      pop	r10
      mov	[rbp -  328],rax
      mov	qword[lci],0
_4for:
      mov	qword[lcj],0
_5for:
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 352],r10
      mov	r10,[rbp - 352]
      imul	r10,8
      mov	[rbp - 352],r10
      mov	r10,[lcj]
      add	r10,1
      mov	[rbp - 360],r10
      mov	r10,[rbp - 360]
      imul	r10,8
      mov	[rbp - 360],r10
      mov	r10,[lci]
      imul	r10,10
      mov	[rbp - 368],r10
      mov	r10,[rbp - 368]
      add	r10,[lcj]
      mov	[rbp - 376],r10
      mov	r10,[rbp - 376]
      mov	r11,[lca]
      add	r11,[rbp - 352]
      mov	r11,[r11]
      add	r11,[rbp - 360]
      mov	[r11],r10
_5while:
      mov	r10,[lcj]
      mov	[rbp-384],r10
      mov	r10,[lcj]
      add	r10,1
      mov	[lcj],r10
      mov	r10,[lcj]
      cmp	r10,9
      setle r10b
      movzx r10,r10b
      mov	[rbp - 392],r10
      mov	r10,[rbp -  392]
      cmp	r10,1
      je	_5for
_5forback:
_4while:
      mov	r10,[lci]
      mov	[rbp-400],r10
      mov	r10,[lci]
      add	r10,1
      mov	[lci],r10
      mov	r10,[lci]
      cmp	r10,3
      setle r10b
      movzx r10,r10b
      mov	[rbp - 408],r10
      mov	r10,[rbp -  408]
      cmp	r10,1
      je	_4for
_4forback:
      mov	qword[lci],0
_6for:
      mov	qword[lcj],0
_7for:
      mov	r10,[lci]
      add	r10,1
      mov	[rbp - 432],r10
      mov	r10,[rbp - 432]
      imul	r10,8
      mov	[rbp - 432],r10
      mov	r10,[lcj]
      add	r10,1
      mov	[rbp - 440],r10
      mov	r10,[rbp - 440]
      imul	r10,8
      mov	[rbp - 440],r10
      mov	r10,[lca]
      add	r10,[rbp - 432]
      mov	r10,[r10]
      add	r10,[rbp - 440]
      mov	rdi,[r10]
      push	r10
      push	r11
      mov	rax,0
      call	printNum
      pop	r11
      pop	r10
      mov	[rbp -  448],rax
_7while:
      mov	r10,[lcj]
      mov	[rbp-456],r10
      mov	r10,[lcj]
      add	r10,1
      mov	[lcj],r10
      mov	r10,[lcj]
      cmp	r10,9
      setle r10b
      movzx r10,r10b
      mov	[rbp - 464],r10
      mov	r10,[rbp -  464]
      cmp	r10,1
      je	_7for
_7forback:
_6while:
      mov	r10,[lci]
      mov	[rbp-472],r10
      mov	r10,[lci]
      add	r10,1
      mov	[lci],r10
      mov	r10,[lci]
      cmp	r10,3
      setle r10b
      movzx r10,r10b
      mov	[rbp - 480],r10
      mov	r10,[rbp -  480]
      cmp	r10,1
      je	_6for
_6forback:
      mov	r10,2
      add	r10,1
      mov	[rbp - 504],r10
      mov	r10,[rbp - 504]
      imul	r10,8
      mov	[rbp - 504],r10
      mov	r10,10
      add	r10,1
      mov	[rbp - 512],r10
      mov	r10,[rbp - 512]
      imul	r10,8
      mov	[rbp - 512],r10
      mov	r11,[lca]
      add	r11,[rbp - 504]
      mov	r11,[r11]
      add	r11,[rbp - 512]
      mov	qword[r11],0
      mov	r10,2
      add	r10,1
      mov	[rbp - 536],r10
      mov	r10,[rbp - 536]
      imul	r10,8
      mov	[rbp - 536],r10
      mov	r10,10
      add	r10,1
      mov	[rbp - 544],r10
      mov	r10,[rbp - 544]
      imul	r10,8
      mov	[rbp - 544],r10
      mov	r10,[lca]
      add	r10,[rbp - 536]
      mov	r10,[r10]
      add	r10,[rbp - 544]
      mov	rdi,[r10]
      push	r10
      push	r11
      mov	rax,0
      call	printNum
      pop	r11
      pop	r10
      mov	[rbp -  552],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 576],r10
      mov	r10,[rbp - 576]
      imul	r10,16
      mov	[rbp - 576],r10
      mov	r10,[lcb]
      add	r10,[rbp - 576]
      mov	r10,[r10]
      mov	[rbp - 584],r10
      mov	r10,2
      not	r10
      add	r10,1
      mov	[rbp - 592],r10
      mov	r10,[rbp - 592]
      mov	r11,[rbp - 584]
      add	r11,0
      mov	[r11],r10
      mov	r10,2
      add	r10,1
      mov	[rbp - 632],r10
      mov	r10,[rbp - 632]
      imul	r10,8
      mov	[rbp - 632],r10
      mov	r10,10
      add	r10,1
      mov	[rbp - 640],r10
      mov	r10,[rbp - 640]
      imul	r10,8
      mov	[rbp - 640],r10
      mov	r10,[lca]
      add	r10,[rbp - 632]
      mov	r10,[r10]
      add	r10,[rbp - 640]
      mov	r10,[r10]
      add	r10,1
      mov	[rbp - 648],r10
      mov	r10,[rbp - 648]
      imul	r10,16
      mov	[rbp - 648],r10
      mov	r10,[lcb]
      add	r10,[rbp - 648]
      mov	r10,[r10]
      mov	[rbp - 656],r10
      mov	r10,10
      not	r10
      add	r10,1
      mov	[rbp - 664],r10
      mov	r10,[rbp - 664]
      mov	r11,[rbp - 656]
      add	r11,0
      mov	[r11],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 688],r10
      mov	r10,[rbp - 688]
      imul	r10,16
      mov	[rbp - 688],r10
      mov	r10,[lcb]
      add	r10,[rbp - 688]
      mov	r10,[r10]
      mov	[rbp - 696],r10
      mov	r10,[rbp - 696]
      add	r10,0
      mov	rdi,[r10]
      push	r10
      push	r11
      mov	rax,0
      call	printNum
      pop	r11
      pop	r10
      mov	[rbp -  704],rax
      mov	r10,1
      add	r10,1
      mov	[rbp - 728],r10
      mov	r10,[rbp - 728]
      imul	r10,16
      mov	[rbp - 728],r10
      mov	r10,[lcb]
      add	r10,[rbp - 728]
      mov	r10,[r10]
      mov	[rbp - 736],r10
      mov	r10,[rbp - 736]
      add	r10,0
      mov	rdi,[r10]
      push	r10
      push	r11
      mov	rax,0
      call	printNum
      pop	r11
      pop	r10
      mov	[rbp -  744],rax
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

lca:
	dq 0
lci:
	dq 0
lcj:
	dq 0
lcb:
	dq 0
section .bss
stringbuffer:
	resb 256

