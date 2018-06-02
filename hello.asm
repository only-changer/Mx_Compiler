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
main:
      push	rbp
      mov	rbp,rsp
      sub	rsp,2000
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],34
      mov	byte[rax + 1],10
      mov	byte[rax + 2],'b'
      mov	byte[rax + 3],'d'
      mov	byte[rax + 4],'a'
      mov	byte[rax + 5],92
      mov	byte[rax + 6],34
      mov	byte[rax + 7],10
      mov	byte[rax + 8],'d'
      mov	byte[rax + 9],'b'
      mov	byte[rax + 10],'d'
      mov	byte[rax + 11],92
      mov	byte[rax + 12],'c'
      mov	byte[rax + 13],34
      mov	byte[rax + 14],92
      mov	byte[rax + 15],34
      mov	byte[rax + 16],'c'
      mov	byte[rax + 17],92
      mov	byte[rax + 18],'c'
      mov	byte[rax + 19],34
      mov	byte[rax + 20],0
      mov	[rbp - 16],rax
      mov	r10,[rbp - 16]
      mov	[rbp - 8],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],92
      mov	byte[rax + 1],'a'
      mov	byte[rax + 2],'b'
      mov	byte[rax + 3],10
      mov	byte[rax + 4],'a'
      mov	byte[rax + 5],'c'
      mov	byte[rax + 6],34
      mov	byte[rax + 7],34
      mov	byte[rax + 8],'a'
      mov	byte[rax + 9],'d'
      mov	byte[rax + 10],'d'
      mov	byte[rax + 11],10
      mov	byte[rax + 12],34
      mov	byte[rax + 13],10
      mov	byte[rax + 14],'a'
      mov	byte[rax + 15],'c'
      mov	byte[rax + 16],10
      mov	byte[rax + 17],'d'
      mov	byte[rax + 18],'b'
      mov	byte[rax + 19],34
      mov	byte[rax + 20],0
      mov	[rbp - 32],rax
      mov	r10,[rbp - 32]
      mov	[rbp - 24],r10
      push r10
      push r11
      mov	rdi,256
      call	malloc
      pop r10
      pop r11
      mov	byte[rax + 0],10
      mov	byte[rax + 1],'a'
      mov	byte[rax + 2],'b'
      mov	byte[rax + 3],'b'
      mov	byte[rax + 4],'d'
      mov	byte[rax + 5],'b'
      mov	byte[rax + 6],'d'
      mov	byte[rax + 7],'d'
      mov	byte[rax + 8],92
      mov	byte[rax + 9],92
      mov	byte[rax + 10],34
      mov	byte[rax + 11],'d'
      mov	byte[rax + 12],34
      mov	byte[rax + 13],'c'
      mov	byte[rax + 14],92
      mov	byte[rax + 15],'a'
      mov	byte[rax + 16],'d'
      mov	byte[rax + 17],'c'
      mov	byte[rax + 18],34
      mov	byte[rax + 19],'c'
      mov	byte[rax + 20],0
      mov	[rbp - 48],rax
      mov	r10,[rbp - 48]
      mov	[rbp - 40],r10
      mov	rdi,[rbp-40]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  56],rax
      mov	rdi,[rbp-56]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  64],rax
      mov	rdi,[rbp-64]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  72],rax
      mov	rdi,[rbp-72]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  80],rax
      mov	rdi,[rbp-80]
      mov	rsi,[rbp-8]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  88],rax
      mov	rdi,[rbp-88]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  96],rax
      mov	rdi,[rbp-96]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  104],rax
      mov	rdi,[rbp-104]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  112],rax
      mov	rdi,[rbp-112]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  120],rax
      mov	rdi,[rbp-120]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  128],rax
      mov	rdi,[rbp-40]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  136],rax
      mov	rdi,[rbp-136]
      mov	rsi,[rbp-8]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  144],rax
      mov	rdi,[rbp-144]
      mov	rsi,[rbp-8]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  152],rax
      mov	rdi,[rbp-152]
      mov	rsi,[rbp-8]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  160],rax
      mov	rdi,[rbp-160]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  168],rax
      mov	rdi,[rbp-168]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  176],rax
      mov	rdi,[rbp-176]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  184],rax
      mov	rdi,[rbp-184]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  192],rax
      mov	rdi,[rbp-192]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  200],rax
      mov	rdi,[rbp-200]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  208],rax
      mov	rdi,[rbp-24]
      mov	rsi,[rbp-8]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  216],rax
      mov	rdi,[rbp-216]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  224],rax
      mov	rdi,[rbp-224]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  232],rax
      mov	rdi,[rbp-232]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  240],rax
      mov	rdi,[rbp-240]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  248],rax
      mov	rdi,[rbp-248]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  256],rax
      mov	rdi,[rbp-256]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  264],rax
      mov	rdi,[rbp-264]
      mov	rsi,[rbp-8]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  272],rax
      mov	rdi,[rbp-272]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  280],rax
      mov	rdi,[rbp-280]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  288],rax
      mov	rdi,[rbp-24]
      mov	rsi,[rbp-8]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  296],rax
      mov	rdi,[rbp-296]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  304],rax
      mov	rdi,[rbp-304]
      mov	rsi,[rbp-8]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  312],rax
      mov	rdi,[rbp-312]
      mov	rsi,[rbp-8]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  320],rax
      mov	rdi,[rbp-320]
      mov	rsi,[rbp-8]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  328],rax
      mov	rdi,[rbp-328]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  336],rax
      mov	rdi,[rbp-336]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  344],rax
      mov	rdi,[rbp-344]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  352],rax
      mov	rdi,[rbp-352]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  360],rax
      mov	rdi,[rbp-360]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  368],rax
      mov	rdi,[rbp-24]
      mov	rsi,[rbp-8]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  376],rax
      mov	rdi,[rbp-376]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  384],rax
      mov	rdi,[rbp-384]
      mov	rsi,[rbp-8]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  392],rax
      mov	rdi,[rbp-392]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  400],rax
      mov	rdi,[rbp-400]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  408],rax
      mov	rdi,[rbp-408]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  416],rax
      mov	rdi,[rbp-416]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  424],rax
      mov	rdi,[rbp-424]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  432],rax
      mov	rdi,[rbp-432]
      mov	rsi,[rbp-8]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  440],rax
      mov	rdi,[rbp-440]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  448],rax
      mov	rdi,[rbp-8]
      mov	rsi,[rbp-8]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  456],rax
      mov	rdi,[rbp-456]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  464],rax
      mov	rdi,[rbp-464]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  472],rax
      mov	rdi,[rbp-472]
      mov	rsi,[rbp-8]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  480],rax
      mov	rdi,[rbp-480]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  488],rax
      mov	rdi,[rbp-488]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  496],rax
      mov	rdi,[rbp-496]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  504],rax
      mov	rdi,[rbp-504]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  512],rax
      mov	rdi,[rbp-512]
      mov	rsi,[rbp-8]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  520],rax
      mov	rdi,[rbp-520]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  528],rax
      mov	rdi,[rbp-24]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  536],rax
      mov	rdi,[rbp-536]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  544],rax
      mov	rdi,[rbp-544]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  552],rax
      mov	rdi,[rbp-552]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  560],rax
      mov	rdi,[rbp-560]
      mov	rsi,[rbp-8]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  568],rax
      mov	rdi,[rbp-568]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  576],rax
      mov	rdi,[rbp-576]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  584],rax
      mov	rdi,[rbp-584]
      mov	rsi,[rbp-8]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  592],rax
      mov	rdi,[rbp-592]
      mov	rsi,[rbp-8]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  600],rax
      mov	rdi,[rbp-600]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  608],rax
      mov	rdi,[rbp-8]
      mov	rsi,[rbp-8]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  616],rax
      mov	rdi,[rbp-616]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  624],rax
      mov	rdi,[rbp-624]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  632],rax
      mov	rdi,[rbp-632]
      mov	rsi,[rbp-8]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  640],rax
      mov	rdi,[rbp-640]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  648],rax
      mov	rdi,[rbp-648]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  656],rax
      mov	rdi,[rbp-656]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  664],rax
      mov	rdi,[rbp-664]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  672],rax
      mov	rdi,[rbp-672]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  680],rax
      mov	rdi,[rbp-680]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  688],rax
      mov	rdi,[rbp-40]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  696],rax
      mov	rdi,[rbp-696]
      mov	rsi,[rbp-8]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  704],rax
      mov	rdi,[rbp-704]
      mov	rsi,[rbp-8]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  712],rax
      mov	rdi,[rbp-712]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  720],rax
      mov	rdi,[rbp-720]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  728],rax
      mov	rdi,[rbp-728]
      mov	rsi,[rbp-8]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  736],rax
      mov	rdi,[rbp-736]
      mov	rsi,[rbp-8]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  744],rax
      mov	rdi,[rbp-744]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  752],rax
      mov	rdi,[rbp-752]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  760],rax
      mov	rdi,[rbp-760]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  768],rax
      mov	rdi,[rbp-8]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  776],rax
      mov	rdi,[rbp-776]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  784],rax
      mov	rdi,[rbp-784]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  792],rax
      mov	rdi,[rbp-792]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  800],rax
      mov	rdi,[rbp-800]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  808],rax
      mov	rdi,[rbp-808]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  816],rax
      mov	rdi,[rbp-816]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  824],rax
      mov	rdi,[rbp-824]
      mov	rsi,[rbp-24]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  832],rax
      mov	rdi,[rbp-832]
      mov	rsi,[rbp-40]
      push	r10
      push	r11
      call	string.add
      pop	r11
      pop	r10
      mov	[rbp -  840],rax
      mov	rdi,[rbp-840]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  848],rax
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

