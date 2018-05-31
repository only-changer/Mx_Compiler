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
      mov	[rbp - 40],rdi
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
      mov	[make],r10
      mov	qword[i],0
_1for:
      mov	r10,[i]
      add	r10,1
      mov	[rbp - 80],r10
      mov	r10,[rbp - 80]
      imul	r10,8
      mov	[rbp - 80],r10
      mov	r10,[rbp - 40]
      add	r10,1
      mov	[rbp - 88],r10
      mov	r10,[rbp - 88]
      imul	r10,8
      mov	[rbp - 88],r10
      mov	rdi,[rbp-88]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  96],rax
      mov	r10,[rbp - 40]
      mov	r11,[rbp - 96]
      add	r11,0
      mov	[r11],r10
      mov	r10,[rbp - 96]
      mov	r11,[make]
      add	r11,[rbp - 80]
      mov	[r11],r10
      mov	qword[j],0
_0for:
      mov	r10,[i]
      add	r10,1
      mov	[rbp - 120],r10
      mov	r10,[rbp - 120]
      imul	r10,8
      mov	[rbp - 120],r10
      mov	r10,[j]
      add	r10,1
      mov	[rbp - 128],r10
      mov	r10,[rbp - 128]
      imul	r10,8
      mov	[rbp - 128],r10
      mov	r11,[make]
      add	r11,[rbp - 120]
      mov	r11,[r11]
      add	r11,[rbp - 128]
      mov	qword[r11],0
      mov	r10,[j]
      mov	[rbp-136],r10
      mov	r10,[j]
      add	r10,1
      mov	[ j],r10
      mov	r10,[j]
      cmp	r10,[rbp - 40]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 144],r10
      mov	r10,[rbp -  144]
      cmp	r10,1
      je	_0for
_0forback:
      mov	r10,[i]
      mov	[rbp-160],r10
      mov	r10,[i]
      add	r10,1
      mov	[ i],r10
      mov	r10,[i]
      cmp	r10,[rbp - 40]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 168],r10
      mov	r10,[rbp -  168]
      cmp	r10,1
      je	_1for
_1forback:
      mov	rsp,rbp
      pop rbp
      ret
search:
      push	rbp
      mov	rbp,rsp
      sub	rsp,2424
      mov	[rbp - 184],rdi
      mov	[rbp - 192],rsi
      mov	[rbp - 200],rdx
	  mov	rdi,[rbp-184]
	  call	toString
	  mov	rdi,rax
	  call	print
	  mov	rdi,[rbp-192]
	  call	toString
	  mov	rdi,rax
	  call	print
	  mov	rdi,[rbp-200]
	  call	toString
	  mov	rdi,rax
	  call	println
      mov	r10,[rbp - 192]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov	[rbp - 2232],r10
      mov	r10,[rbp - 2232]
      cmp	r10,1
      je	_0check
      mov	r10,[rbp - 192]
      cmp	r10,0
      setl r10b
      movzx r10,r10b
      mov	[rbp - 2240],r10
      mov	r10,[rbp - 2232]
      or	r10,[rbp - 2240]
_0check:
      mov	[rbp - 2248],r10
      mov	r10,[rbp - 2248]
      cmp	r10,1
      je	_1check
      mov	r10,[rbp - 184]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov	[rbp - 2256],r10
      mov	r10,[rbp - 2248]
      or	r10,[rbp - 2256]
_1check:
      mov	[rbp - 2264],r10
      mov	r10,[rbp - 2264]
      cmp	r10,1
      je	_2check
      mov	r10,[rbp - 184]
      sub	r10,1
      mov	[rbp - 2288],r10
      mov	r10,[rbp - 2288]
      add	r10,1
      mov	[rbp - 2296],r10
      mov	r10,[rbp - 2296]
      imul	r10,8
      mov	[rbp - 2296],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 2304],r10
      mov	r10,[rbp - 2304]
      imul	r10,8
      mov	[rbp - 2304],r10
      mov	r10,[rbp - 184]
      sub	r10,1
      mov	[rbp - 2328],r10
      mov	r10,[rbp - 2328]
      add	r10,1
      mov	[rbp - 2336],r10
      mov	r10,[rbp - 2336]
      imul	r10,8
      mov	[rbp - 2336],r10
      mov	r10,1
      add	r10,1
      mov	[rbp - 2344],r10
      mov	r10,[rbp - 2344]
      imul	r10,8
      mov	[rbp - 2344],r10
      mov	r10,[make]
      add	r10,[rbp - 2296]
      mov	r10,[r10]
      add	r10,[rbp - 2304]
      mov	r10,[r10]
      mov	r11,[make]
      add	r11,[rbp - 2336]
      mov	r11,[r11]
      add	r11,[rbp - 2344]
      add	r10,[r11]
      mov	[rbp - 2352],r10
      mov	r10,[rbp - 184]
      sub	r10,1
      mov	[rbp - 2376],r10
      mov	r10,[rbp - 2376]
      add	r10,1
      mov	[rbp - 2384],r10
      mov	r10,[rbp - 2384]
      imul	r10,8
      mov	[rbp - 2384],r10
      mov	r10,2
      add	r10,1
      mov	[rbp - 2392],r10
      mov	r10,[rbp - 2392]
      imul	r10,8
      mov	[rbp - 2392],r10
      mov	r10,[rbp - 2352]
      mov	r11,[make]
      add	r11,[rbp - 2384]
      mov	r11,[r11]
      add	r11,[rbp - 2392]
      add	r10,[r11]
      mov	[rbp - 2400],r10
      mov	r10,[rbp - 2400]
      cmp	r10,15
      sete r10b
      movzx r10,r10b
      mov	[rbp - 2408],r10
      mov	r10,[rbp - 2264]
      or	r10,[rbp - 2408]
_2check:
      mov	[rbp - 2416],r10
      mov	 r10,[rbp-2416]
      cmp	 r10,0
      je	_7else
_7if:
      mov	r10,[rbp - 184]
      cmp	r10,2
      sete r10b
      movzx r10,r10b
      mov	[rbp - 2208],r10
      mov	r10,[rbp - 2208]
      cmp	r10,0
      je	_3check
      mov	r10,[rbp - 192]
      cmp	r10,2
      sete r10b
      movzx r10,r10b
      mov	[rbp - 2216],r10
      mov	r10,[rbp - 2208]
      and	r10,[rbp - 2216]
_3check:
      mov	[rbp - 2224],r10
      mov	 r10,[rbp-2224]
      cmp	 r10,0
      je	_6else
_1if:
      mov	r10,2
      add	r10,1
      mov	[rbp - 248],r10
      mov	r10,[rbp - 248]
      imul	r10,8
      mov	[rbp - 248],r10
      mov	r10,2
      add	r10,1
      mov	[rbp - 256],r10
      mov	r10,[rbp - 256]
      imul	r10,8
      mov	[rbp - 256],r10
      mov	r10,45
      sub	r10,[rbp - 200]
      mov	[rbp - 264],r10
      mov	r10,[rbp - 264]
      mov	r11,[make]
      add	r11,[rbp - 248]
      mov	r11,[r11]
      add	r11,[rbp - 256]
      mov	[r11],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 288],r10
      mov	r10,[rbp - 288]
      imul	r10,8
      mov	[rbp - 288],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 296],r10
      mov	r10,[rbp - 296]
      imul	r10,8
      mov	[rbp - 296],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 320],r10
      mov	r10,[rbp - 320]
      imul	r10,8
      mov	[rbp - 320],r10
      mov	r10,1
      add	r10,1
      mov	[rbp - 328],r10
      mov	r10,[rbp - 328]
      imul	r10,8
      mov	[rbp - 328],r10
      mov	r10,[make]
      add	r10,[rbp - 288]
      mov	r10,[r10]
      add	r10,[rbp - 296]
      mov	r10,[r10]
      mov	r11,[make]
      add	r11,[rbp - 320]
      mov	r11,[r11]
      add	r11,[rbp - 328]
      add	r10,[r11]
      mov	[rbp - 336],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 360],r10
      mov	r10,[rbp - 360]
      imul	r10,8
      mov	[rbp - 360],r10
      mov	r10,2
      add	r10,1
      mov	[rbp - 368],r10
      mov	r10,[rbp - 368]
      imul	r10,8
      mov	[rbp - 368],r10
      mov	r10,[rbp - 336]
      mov	r11,[make]
      add	r11,[rbp - 360]
      mov	r11,[r11]
      add	r11,[rbp - 368]
      add	r10,[r11]
      mov	[rbp - 376],r10
      mov	r10,[rbp - 376]
      mov	[rbp - 208],r10
      mov	r10,1
      add	r10,1
      mov	[rbp - 600],r10
      mov	r10,[rbp - 600]
      imul	r10,8
      mov	[rbp - 600],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 608],r10
      mov	r10,[rbp - 608]
      imul	r10,8
      mov	[rbp - 608],r10
      mov	r10,1
      add	r10,1
      mov	[rbp - 632],r10
      mov	r10,[rbp - 632]
      imul	r10,8
      mov	[rbp - 632],r10
      mov	r10,1
      add	r10,1
      mov	[rbp - 640],r10
      mov	r10,[rbp - 640]
      imul	r10,8
      mov	[rbp - 640],r10
      mov	r10,[make]
      add	r10,[rbp - 600]
      mov	r10,[r10]
      add	r10,[rbp - 608]
      mov	r10,[r10]
      mov	r11,[make]
      add	r11,[rbp - 632]
      mov	r11,[r11]
      add	r11,[rbp - 640]
      add	r10,[r11]
      mov	[rbp - 648],r10
      mov	r10,1
      add	r10,1
      mov	[rbp - 672],r10
      mov	r10,[rbp - 672]
      imul	r10,8
      mov	[rbp - 672],r10
      mov	r10,2
      add	r10,1
      mov	[rbp - 680],r10
      mov	r10,[rbp - 680]
      imul	r10,8
      mov	[rbp - 680],r10
      mov	r10,[rbp - 648]
      mov	r11,[make]
      add	r11,[rbp - 672]
      mov	r11,[r11]
      add	r11,[rbp - 680]
      add	r10,[r11]
      mov	[rbp - 688],r10
      mov	r10,[rbp - 688]
      cmp	r10,[rbp - 208]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 696],r10
      mov	r10,[rbp - 696]
      cmp	r10,0
      je	_4check
      mov	r10,2
      add	r10,1
      mov	[rbp - 720],r10
      mov	r10,[rbp - 720]
      imul	r10,8
      mov	[rbp - 720],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 728],r10
      mov	r10,[rbp - 728]
      imul	r10,8
      mov	[rbp - 728],r10
      mov	r10,2
      add	r10,1
      mov	[rbp - 752],r10
      mov	r10,[rbp - 752]
      imul	r10,8
      mov	[rbp - 752],r10
      mov	r10,1
      add	r10,1
      mov	[rbp - 760],r10
      mov	r10,[rbp - 760]
      imul	r10,8
      mov	[rbp - 760],r10
      mov	r10,[make]
      add	r10,[rbp - 720]
      mov	r10,[r10]
      add	r10,[rbp - 728]
      mov	r10,[r10]
      mov	r11,[make]
      add	r11,[rbp - 752]
      mov	r11,[r11]
      add	r11,[rbp - 760]
      add	r10,[r11]
      mov	[rbp - 768],r10
      mov	r10,2
      add	r10,1
      mov	[rbp - 792],r10
      mov	r10,[rbp - 792]
      imul	r10,8
      mov	[rbp - 792],r10
      mov	r10,2
      add	r10,1
      mov	[rbp - 800],r10
      mov	r10,[rbp - 800]
      imul	r10,8
      mov	[rbp - 800],r10
      mov	r10,[rbp - 768]
      mov	r11,[make]
      add	r11,[rbp - 792]
      mov	r11,[r11]
      add	r11,[rbp - 800]
      add	r10,[r11]
      mov	[rbp - 808],r10
      mov	r10,[rbp - 808]
      cmp	r10,[rbp - 208]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 816],r10
      mov	r10,[rbp - 696]
      and	r10,[rbp - 816]
_4check:
      mov	[rbp - 824],r10
      mov	r10,[rbp - 824]
      cmp	r10,0
      je	_5check
      mov	r10,0
      add	r10,1
      mov	[rbp - 848],r10
      mov	r10,[rbp - 848]
      imul	r10,8
      mov	[rbp - 848],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 856],r10
      mov	r10,[rbp - 856]
      imul	r10,8
      mov	[rbp - 856],r10
      mov	r10,1
      add	r10,1
      mov	[rbp - 880],r10
      mov	r10,[rbp - 880]
      imul	r10,8
      mov	[rbp - 880],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 888],r10
      mov	r10,[rbp - 888]
      imul	r10,8
      mov	[rbp - 888],r10
      mov	r10,[make]
      add	r10,[rbp - 848]
      mov	r10,[r10]
      add	r10,[rbp - 856]
      mov	r10,[r10]
      mov	r11,[make]
      add	r11,[rbp - 880]
      mov	r11,[r11]
      add	r11,[rbp - 888]
      add	r10,[r11]
      mov	[rbp - 896],r10
      mov	r10,2
      add	r10,1
      mov	[rbp - 920],r10
      mov	r10,[rbp - 920]
      imul	r10,8
      mov	[rbp - 920],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 928],r10
      mov	r10,[rbp - 928]
      imul	r10,8
      mov	[rbp - 928],r10
      mov	r10,[rbp - 896]
      mov	r11,[make]
      add	r11,[rbp - 920]
      mov	r11,[r11]
      add	r11,[rbp - 928]
      add	r10,[r11]
      mov	[rbp - 936],r10
      mov	r10,[rbp - 936]
      cmp	r10,[rbp - 208]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 944],r10
      mov	r10,[rbp - 824]
      and	r10,[rbp - 944]
_5check:
      mov	[rbp - 952],r10
      mov	r10,[rbp - 952]
      cmp	r10,0
      je	_6check
      mov	r10,0
      add	r10,1
      mov	[rbp - 976],r10
      mov	r10,[rbp - 976]
      imul	r10,8
      mov	[rbp - 976],r10
      mov	r10,1
      add	r10,1
      mov	[rbp - 984],r10
      mov	r10,[rbp - 984]
      imul	r10,8
      mov	[rbp - 984],r10
      mov	r10,1
      add	r10,1
      mov	[rbp - 1008],r10
      mov	r10,[rbp - 1008]
      imul	r10,8
      mov	[rbp - 1008],r10
      mov	r10,1
      add	r10,1
      mov	[rbp - 1016],r10
      mov	r10,[rbp - 1016]
      imul	r10,8
      mov	[rbp - 1016],r10
      mov	r10,[make]
      add	r10,[rbp - 976]
      mov	r10,[r10]
      add	r10,[rbp - 984]
      mov	r10,[r10]
      mov	r11,[make]
      add	r11,[rbp - 1008]
      mov	r11,[r11]
      add	r11,[rbp - 1016]
      add	r10,[r11]
      mov	[rbp - 1024],r10
      mov	r10,2
      add	r10,1
      mov	[rbp - 1048],r10
      mov	r10,[rbp - 1048]
      imul	r10,8
      mov	[rbp - 1048],r10
      mov	r10,1
      add	r10,1
      mov	[rbp - 1056],r10
      mov	r10,[rbp - 1056]
      imul	r10,8
      mov	[rbp - 1056],r10
      mov	r10,[rbp - 1024]
      mov	r11,[make]
      add	r11,[rbp - 1048]
      mov	r11,[r11]
      add	r11,[rbp - 1056]
      add	r10,[r11]
      mov	[rbp - 1064],r10
      mov	r10,[rbp - 1064]
      cmp	r10,[rbp - 208]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 1072],r10
      mov	r10,[rbp - 952]
      and	r10,[rbp - 1072]
_6check:
      mov	[rbp - 1080],r10
      mov	r10,[rbp - 1080]
      cmp	r10,0
      je	_7check
      mov	r10,0
      add	r10,1
      mov	[rbp - 1104],r10
      mov	r10,[rbp - 1104]
      imul	r10,8
      mov	[rbp - 1104],r10
      mov	r10,2
      add	r10,1
      mov	[rbp - 1112],r10
      mov	r10,[rbp - 1112]
      imul	r10,8
      mov	[rbp - 1112],r10
      mov	r10,1
      add	r10,1
      mov	[rbp - 1136],r10
      mov	r10,[rbp - 1136]
      imul	r10,8
      mov	[rbp - 1136],r10
      mov	r10,2
      add	r10,1
      mov	[rbp - 1144],r10
      mov	r10,[rbp - 1144]
      imul	r10,8
      mov	[rbp - 1144],r10
      mov	r10,[make]
      add	r10,[rbp - 1104]
      mov	r10,[r10]
      add	r10,[rbp - 1112]
      mov	r10,[r10]
      mov	r11,[make]
      add	r11,[rbp - 1136]
      mov	r11,[r11]
      add	r11,[rbp - 1144]
      add	r10,[r11]
      mov	[rbp - 1152],r10
      mov	r10,2
      add	r10,1
      mov	[rbp - 1176],r10
      mov	r10,[rbp - 1176]
      imul	r10,8
      mov	[rbp - 1176],r10
      mov	r10,2
      add	r10,1
      mov	[rbp - 1184],r10
      mov	r10,[rbp - 1184]
      imul	r10,8
      mov	[rbp - 1184],r10
      mov	r10,[rbp - 1152]
      mov	r11,[make]
      add	r11,[rbp - 1176]
      mov	r11,[r11]
      add	r11,[rbp - 1184]
      add	r10,[r11]
      mov	[rbp - 1192],r10
      mov	r10,[rbp - 1192]
      cmp	r10,[rbp - 208]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 1200],r10
      mov	r10,[rbp - 1080]
      and	r10,[rbp - 1200]
_7check:
      mov	[rbp - 1208],r10
      mov	r10,[rbp - 1208]
      cmp	r10,0
      je	_8check
      mov	r10,0
      add	r10,1
      mov	[rbp - 1232],r10
      mov	r10,[rbp - 1232]
      imul	r10,8
      mov	[rbp - 1232],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 1240],r10
      mov	r10,[rbp - 1240]
      imul	r10,8
      mov	[rbp - 1240],r10
      mov	r10,1
      add	r10,1
      mov	[rbp - 1264],r10
      mov	r10,[rbp - 1264]
      imul	r10,8
      mov	[rbp - 1264],r10
      mov	r10,1
      add	r10,1
      mov	[rbp - 1272],r10
      mov	r10,[rbp - 1272]
      imul	r10,8
      mov	[rbp - 1272],r10
      mov	r10,[make]
      add	r10,[rbp - 1232]
      mov	r10,[r10]
      add	r10,[rbp - 1240]
      mov	r10,[r10]
      mov	r11,[make]
      add	r11,[rbp - 1264]
      mov	r11,[r11]
      add	r11,[rbp - 1272]
      add	r10,[r11]
      mov	[rbp - 1280],r10
      mov	r10,2
      add	r10,1
      mov	[rbp - 1304],r10
      mov	r10,[rbp - 1304]
      imul	r10,8
      mov	[rbp - 1304],r10
      mov	r10,2
      add	r10,1
      mov	[rbp - 1312],r10
      mov	r10,[rbp - 1312]
      imul	r10,8
      mov	[rbp - 1312],r10
      mov	r10,[rbp - 1280]
      mov	r11,[make]
      add	r11,[rbp - 1304]
      mov	r11,[r11]
      add	r11,[rbp - 1312]
      add	r10,[r11]
      mov	[rbp - 1320],r10
      mov	r10,[rbp - 1320]
      cmp	r10,[rbp - 208]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 1328],r10
      mov	r10,[rbp - 1208]
      and	r10,[rbp - 1328]
_8check:
      mov	[rbp - 1336],r10
      mov	r10,[rbp - 1336]
      cmp	r10,0
      je	_9check
      mov	r10,2
      add	r10,1
      mov	[rbp - 1360],r10
      mov	r10,[rbp - 1360]
      imul	r10,8
      mov	[rbp - 1360],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 1368],r10
      mov	r10,[rbp - 1368]
      imul	r10,8
      mov	[rbp - 1368],r10
      mov	r10,1
      add	r10,1
      mov	[rbp - 1392],r10
      mov	r10,[rbp - 1392]
      imul	r10,8
      mov	[rbp - 1392],r10
      mov	r10,1
      add	r10,1
      mov	[rbp - 1400],r10
      mov	r10,[rbp - 1400]
      imul	r10,8
      mov	[rbp - 1400],r10
      mov	r10,[make]
      add	r10,[rbp - 1360]
      mov	r10,[r10]
      add	r10,[rbp - 1368]
      mov	r10,[r10]
      mov	r11,[make]
      add	r11,[rbp - 1392]
      mov	r11,[r11]
      add	r11,[rbp - 1400]
      add	r10,[r11]
      mov	[rbp - 1408],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 1432],r10
      mov	r10,[rbp - 1432]
      imul	r10,8
      mov	[rbp - 1432],r10
      mov	r10,2
      add	r10,1
      mov	[rbp - 1440],r10
      mov	r10,[rbp - 1440]
      imul	r10,8
      mov	[rbp - 1440],r10
      mov	r10,[rbp - 1408]
      mov	r11,[make]
      add	r11,[rbp - 1432]
      mov	r11,[r11]
      add	r11,[rbp - 1440]
      add	r10,[r11]
      mov	[rbp - 1448],r10
      mov	r10,[rbp - 1448]
      cmp	r10,[rbp - 208]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 1456],r10
      mov	r10,[rbp - 1336]
      and	r10,[rbp - 1456]
_9check:
      mov	[rbp - 1464],r10
      mov	 r10,[rbp-1464]
      cmp	 r10,0
      je	_0else
_0if:
      mov	r10,0
      add	r10,1
      mov	[rbp - 400],r10
      mov	r10,[rbp - 400]
      imul	r10,8
      mov	[rbp - 400],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 424],r10
      mov	r10,[rbp - 424]
      imul	r10,8
      mov	[rbp - 424],r10
      mov	r10,[count]
      add	r10,[rbp - 424]
      mov	r10,[r10]
      add	r10,1
      mov	[rbp - 432],r10
      mov	r10,[rbp - 432]
      mov	r11,[count]
      add	r11,[rbp - 400]
      mov	[r11],r10
      mov	qword[rbp - 216],0
_3for:
      mov	qword[rbp - 224],0
_2for:
      mov	r10,[rbp - 216]
      add	r10,1
      mov	[rbp - 456],r10
      mov	r10,[rbp - 456]
      imul	r10,8
      mov	[rbp - 456],r10
      mov	r10,[rbp - 224]
      add	r10,1
      mov	[rbp - 464],r10
      mov	r10,[rbp - 464]
      imul	r10,8
      mov	[rbp - 464],r10
      mov	r10,[make]
      add	r10,[rbp - 456]
      mov	r10,[r10]
      add	r10,[rbp - 464]
      mov	rdi,[r10]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  472],rax
      mov	rdi,[rbp-472]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  480],rax
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],' '
      mov	byte[rax + 1],0
      mov	[rbp - 488],rax
      mov	rdi,[rbp-488]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  496],rax
      mov	r10,[rbp - 224]
      mov	[rbp - 504],r10
      mov	r10,[rbp - 224]
      add	r10,1
      mov	[rbp - 224],r10
      mov	r10,[rbp - 224]
      cmp	r10,2
      setle r10b
      movzx r10,r10b
      mov	[rbp - 512],r10
      mov	r10,[rbp -  512]
      cmp	r10,1
      je	_2for
_2forback:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'\'
      mov	byte[rax + 1],'n'
      mov	byte[rax + 2],0
      mov	[rbp - 528],rax
      mov	rdi,[rbp-528]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  536],rax
      mov	r10,[rbp - 216]
      mov	[rbp - 544],r10
      mov	r10,[rbp - 216]
      add	r10,1
      mov	[rbp - 216],r10
      mov	r10,[rbp - 216]
      cmp	r10,2
      setle r10b
      movzx r10,r10b
      mov	[rbp - 552],r10
      mov	r10,[rbp -  552]
      cmp	r10,1
      je	_3for
_3forback:
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],'\'
      mov	byte[rax + 1],'n'
      mov	byte[rax + 2],0
      mov	[rbp - 568],rax
      mov	rdi,[rbp-568]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  576],rax
      jmp	_0ifback
_0else:
_0ifback:
      jmp	_1ifback
_1else:
      mov	r10,[rbp - 192]
      cmp	r10,2
      sete r10b
      movzx r10,r10b
      mov	[rbp - 2200],r10
      mov	 r10,[rbp-2200]
      cmp	 r10,0
      je	_6else
_4if:
      mov	r10,[rbp - 184]
      add	r10,1
      mov	[rbp - 1488],r10
      mov	r10,[rbp - 1488]
      imul	r10,8
      mov	[rbp - 1488],r10
      mov	r10,[rbp - 192]
      add	r10,1
      mov	[rbp - 1496],r10
      mov	r10,[rbp - 1496]
      imul	r10,8
      mov	[rbp - 1496],r10
      mov	r10,[rbp - 184]
      add	r10,1
      mov	[rbp - 1520],r10
      mov	r10,[rbp - 1520]
      imul	r10,8
      mov	[rbp - 1520],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 1528],r10
      mov	r10,[rbp - 1528]
      imul	r10,8
      mov	[rbp - 1528],r10
      mov	r10,15
      mov	r11,[make]
      add	r11,[rbp - 1520]
      mov	r11,[r11]
      add	r11,[rbp - 1528]
      sub	r10,[r11]
      mov	[rbp - 1536],r10
      mov	r10,[rbp - 184]
      add	r10,1
      mov	[rbp - 1560],r10
      mov	r10,[rbp - 1560]
      imul	r10,8
      mov	[rbp - 1560],r10
      mov	r10,1
      add	r10,1
      mov	[rbp - 1568],r10
      mov	r10,[rbp - 1568]
      imul	r10,8
      mov	[rbp - 1568],r10
      mov	r10,[rbp - 1536]
      mov	r11,[make]
      add	r11,[rbp - 1560]
      mov	r11,[r11]
      add	r11,[rbp - 1568]
      sub	r10,[r11]
      mov	[rbp - 1576],r10
      mov	r10,[rbp - 1576]
      mov	r11,[make]
      add	r11,[rbp - 1488]
      mov	r11,[r11]
      add	r11,[rbp - 1496]
      mov	[r11],r10
      mov	r10,[rbp - 184]
      add	r10,1
      mov	[rbp - 1832],r10
      mov	r10,[rbp - 1832]
      imul	r10,8
      mov	[rbp - 1832],r10
      mov	r10,[rbp - 192]
      add	r10,1
      mov	[rbp - 1840],r10
      mov	r10,[rbp - 1840]
      imul	r10,8
      mov	[rbp - 1840],r10
      mov	r11,[make]
      add	r11,[rbp - 1832]
      mov	r11,[r11]
      add	r11,[rbp - 1840]
      mov	r10,[r11]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov	[rbp - 1848],r10
      mov	r10,[rbp - 1848]
      cmp	r10,0
      je	_10check
      mov	r10,[rbp - 184]
      add	r10,1
      mov	[rbp - 1872],r10
      mov	r10,[rbp - 1872]
      imul	r10,8
      mov	[rbp - 1872],r10
      mov	r10,[rbp - 192]
      add	r10,1
      mov	[rbp - 1880],r10
      mov	r10,[rbp - 1880]
      imul	r10,8
      mov	[rbp - 1880],r10
      mov	r11,[make]
      add	r11,[rbp - 1872]
      mov	r11,[r11]
      add	r11,[rbp - 1880]
      mov	r10,[r11]
      cmp	r10,10
      setl r10b
      movzx r10,r10b
      mov	[rbp - 1888],r10
      mov	r10,[rbp - 1848]
      and	r10,[rbp - 1888]
_10check:
      mov	[rbp - 1896],r10
      mov	r10,[rbp - 1896]
      cmp	r10,0
      je	_11check
      mov	r10,[rbp - 184]
      add	r10,1
      mov	[rbp - 1936],r10
      mov	r10,[rbp - 1936]
      imul	r10,8
      mov	[rbp - 1936],r10
      mov	r10,[rbp - 192]
      add	r10,1
      mov	[rbp - 1944],r10
      mov	r10,[rbp - 1944]
      imul	r10,8
      mov	[rbp - 1944],r10
      mov	r10,[make]
      add	r10,[rbp - 1936]
      mov	r10,[r10]
      add	r10,[rbp - 1944]
      mov	r10,[r10]
      add	r10,1
      mov	[rbp - 1952],r10
      mov	r10,[rbp - 1952]
      imul	r10,8
      mov	[rbp - 1952],r10
      mov	r11,[color]
      add	r11,[rbp - 1952]
      mov	r10,[r11]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov	[rbp - 1960],r10
      mov	r10,[rbp - 1896]
      and	r10,[rbp - 1960]
_11check:
      mov	[rbp - 1968],r10
      mov	 r10,[rbp-1968]
      cmp	 r10,0
      je	_3else
_3if:
      mov	r10,[rbp - 184]
      add	r10,1
      mov	[rbp - 1616],r10
      mov	r10,[rbp - 1616]
      imul	r10,8
      mov	[rbp - 1616],r10
      mov	r10,[rbp - 192]
      add	r10,1
      mov	[rbp - 1624],r10
      mov	r10,[rbp - 1624]
      imul	r10,8
      mov	[rbp - 1624],r10
      mov	r10,[make]
      add	r10,[rbp - 1616]
      mov	r10,[r10]
      add	r10,[rbp - 1624]
      mov	r10,[r10]
      add	r10,1
      mov	[rbp - 1632],r10
      mov	r10,[rbp - 1632]
      imul	r10,8
      mov	[rbp - 1632],r10
      mov	r11,[color]
      add	r11,[rbp - 1632]
      mov	qword[r11],1
      mov	r10,[rbp - 192]
      cmp	r10,2
      sete r10b
      movzx r10,r10b
      mov	[rbp - 1752],r10
      mov	 r10,[rbp-1752]
      cmp	 r10,0
      je	_2else
_2if:
      mov	r10,[rbp - 184]
      add	r10,1
      mov	[rbp - 1640],r10
      mov	r10,[rbp - 184]
      add	r10,1
      mov	[rbp - 1664],r10
      mov	r10,[rbp - 1664]
      imul	r10,8
      mov	[rbp - 1664],r10
      mov	r10,[rbp - 192]
      add	r10,1
      mov	[rbp - 1672],r10
      mov	r10,[rbp - 1672]
      imul	r10,8
      mov	[rbp - 1672],r10
      mov	r10,[rbp - 200]
      mov	r11,[make]
      add	r11,[rbp - 1664]
      mov	r11,[r11]
      add	r11,[rbp - 1672]
      add	r10,[r11]
      mov	[rbp - 1680],r10
      mov	rdi,[rbp-1640]
      mov	rsi,0
      mov	rdx,[rbp-1680]
      push	r10
      push	r11
      call	search
      pop	r11
      pop	r10
      mov	[rbp -  1688],rax
      jmp	_2ifback
_2else:
      mov	r10,[rbp - 192]
      add	r10,1
      mov	[rbp - 1696],r10
      mov	r10,[rbp - 184]
      add	r10,1
      mov	[rbp - 1720],r10
      mov	r10,[rbp - 1720]
      imul	r10,8
      mov	[rbp - 1720],r10
      mov	r10,[rbp - 192]
      add	r10,1
      mov	[rbp - 1728],r10
      mov	r10,[rbp - 1728]
      imul	r10,8
      mov	[rbp - 1728],r10
      mov	r10,[rbp - 200]
      mov	r11,[make]
      add	r11,[rbp - 1720]
      mov	r11,[r11]
      add	r11,[rbp - 1728]
      add	r10,[r11]
      mov	[rbp - 1736],r10
      mov	rdi,[rbp-184]
      mov	rsi,[rbp-1696]
      mov	rdx,[rbp-1736]
      push	r10
      push	r11
      call	search
      pop	r11
      pop	r10
      mov	[rbp -  1744],rax
_2ifback:
      mov	r10,[rbp - 184]
      add	r10,1
      mov	[rbp - 1792],r10
      mov	r10,[rbp - 1792]
      imul	r10,8
      mov	[rbp - 1792],r10
      mov	r10,[rbp - 192]
      add	r10,1
      mov	[rbp - 1800],r10
      mov	r10,[rbp - 1800]
      imul	r10,8
      mov	[rbp - 1800],r10
      mov	r10,[make]
      add	r10,[rbp - 1792]
      mov	r10,[r10]
      add	r10,[rbp - 1800]
      mov	r10,[r10]
      add	r10,1
      mov	[rbp - 1808],r10
      mov	r10,[rbp - 1808]
      imul	r10,8
      mov	[rbp - 1808],r10
      mov	r11,[color]
      add	r11,[rbp - 1808]
      mov	qword[r11],0
      jmp	_3ifback
_3else:
_3ifback:
      jmp	_4ifback
_4else:
      mov	qword[rbp - 216],1
_4for:
      mov	r10,[rbp - 216]
      add	r10,1
      mov	[rbp - 2160],r10
      mov	r10,[rbp - 2160]
      imul	r10,8
      mov	[rbp - 2160],r10
      mov	r11,[color]
      add	r11,[rbp - 2160]
      mov	r10,[r11]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov	[rbp - 2168],r10
      mov	 r10,[rbp-2168]
      cmp	 r10,0
      je	_6else
_6if:
      mov	r10,[rbp - 216]
      add	r10,1
      mov	[rbp - 1992],r10
      mov	r10,[rbp - 1992]
      imul	r10,8
      mov	[rbp - 1992],r10
      mov	r11,[color]
      add	r11,[rbp - 1992]
      mov	qword[r11],1
      mov	r10,[rbp - 184]
      add	r10,1
      mov	[rbp - 2016],r10
      mov	r10,[rbp - 2016]
      imul	r10,8
      mov	[rbp - 2016],r10
      mov	r10,[rbp - 192]
      add	r10,1
      mov	[rbp - 2024],r10
      mov	r10,[rbp - 2024]
      imul	r10,8
      mov	[rbp - 2024],r10
      mov	r10,[rbp - 216]
      mov	r11,[make]
      add	r11,[rbp - 2016]
      mov	r11,[r11]
      add	r11,[rbp - 2024]
      mov	[r11],r10
      mov	r10,[rbp - 192]
      cmp	r10,2
      sete r10b
      movzx r10,r10b
      mov	[rbp - 2080],r10
      mov	 r10,[rbp-2080]
      cmp	 r10,0
      je	_5else
_5if:
      mov	r10,[rbp - 184]
      add	r10,1
      mov	[rbp - 2032],r10
      mov	r10,[rbp - 200]
      add	r10,[rbp - 216]
      mov	[rbp - 2040],r10
      mov	rdi,[rbp-2032]
      mov	rsi,0
      mov	rdx,[rbp-2040]
      push	r10
      push	r11
      call	search
      pop	r11
      pop	r10
      mov	[rbp -  2048],rax
      jmp	_5ifback
_5else:
      mov	r10,[rbp - 192]
      add	r10,1
      mov	[rbp - 2056],r10
      mov	r10,[rbp - 200]
      add	r10,[rbp - 216]
      mov	[rbp - 2064],r10
	  mov	rdi,[rbp-184]
	  call	toString
	  mov	rdi,rax
	  call	print
	  mov	rdi,[rbp-2056]
	  call	toString
	  mov	rdi,rax
	  call	print
	  mov	rdi,[rbp-2064]
	  call	toString
	  mov	rdi,rax
	  call	println
      mov	rdi,[rbp-184]
      mov	rsi,[rbp-2056]
      mov	rdx,[rbp-2064]
      push	r10
      push	r11
      call	search
      pop	r11
      pop	r10
      mov	[rbp -  2072],rax
_5ifback:
      mov	r10,[rbp - 184]
      add	r10,1
      mov	[rbp - 2104],r10
      mov	r10,[rbp - 2104]
      imul	r10,8
      mov	[rbp - 2104],r10
      mov	r10,[rbp - 192]
      add	r10,1
      mov	[rbp - 2112],r10
      mov	r10,[rbp - 2112]
      imul	r10,8
      mov	[rbp - 2112],r10
      mov	r11,[make]
      add	r11,[rbp - 2104]
      mov	r11,[r11]
      add	r11,[rbp - 2112]
      mov	qword[r11],0
      mov	r10,[rbp - 216]
      add	r10,1
      mov	[rbp - 2136],r10
      mov	r10,[rbp - 2136]
      imul	r10,8
      mov	[rbp - 2136],r10
      mov	r11,[color]
      add	r11,[rbp - 2136]
      mov	qword[r11],0
      jmp	_6ifback
_6else:
_6ifback:
      mov	r10,[rbp - 216]
      mov	[rbp - 2176],r10
      mov	r10,[rbp - 216]
      add	r10,1
      mov	[rbp - 216],r10
      mov	r10,[rbp - 216]
      cmp	r10,9
      setle r10b
      movzx r10,r10b
      mov	[rbp - 2184],r10
      mov	r10,[rbp -  2184]
      cmp	r10,1
      je	_4for
_4forback:
_4ifback:
_1ifback:
      jmp	_7ifback
_7else:
_7ifback:
      mov	rsp,rbp
      pop rbp
      ret
main:
      push	rbp
      mov	rbp,rsp
      sub	rsp,2480
      mov	r10,10
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
      mov	qword[r11],10
      mov	r10,[rbp - 16]
      mov	[color],r10
      mov	r10,1
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
      mov	qword[r11],1
      mov	r10,[rbp - 32]
      mov	[count],r10
      mov	rdi,3
      push	r10
      push	r11
      call	origin
      pop	r11
      pop	r10
      mov	[rbp -  2424],rax
      mov	rdi,0
      mov	rsi,0
      mov	rdx,0
      push	r10
      push	r11
      call	search
      pop	r11
      pop	r10
      mov	[rbp -  2432],rax
      mov	r10,0
      add	r10,1
      mov	[rbp - 2456],r10
      mov	r10,[rbp - 2456]
      imul	r10,8
      mov	[rbp - 2456],r10
      mov	r10,[count]
      add	r10,[rbp - 2456]
      mov	rdi,[r10]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  2464],rax
      mov	rdi,[rbp-2464]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  2472],rax
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

make:
	dq 0
color:
	dq 0
count:
	dq 0
i:
	dq 0
j:
	dq 0
section .bss
stringbuffer:
	resb 256

