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
add:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	r10,[rbp - 8]
      add	r10,[rbp - 16]
      mov	[rbp - 24],r10
      mov	eax,[rbp - 24]
      mov	r10d,233
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 32],rdx
      mov	rax,[rbp -  32]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
dp:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 40],rdi
      mov	r10,[rbp - 40]
      cmp	r10,1
      setle r10b
      movzx r10,r10b
      mov	[rbp - 928],r10
      mov	 r10,[rbp-928]
      cmp	 r10,0
      je	_0else
_0if:
      mov	r10,233
      imul	r10,7
      mov	[rbp - 56],r10
      mov	eax,7
      mov	r10d,[rbp - 56]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 64],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 72],r10
      mov	eax,[rbp - 64]
      mov	r10d,[rbp - 72]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 80],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 88],r10
      mov	eax,[rbp - 80]
      mov	r10d,[rbp - 88]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 96],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 104],r10
      mov	eax,[rbp - 96]
      mov	r10d,[rbp - 104]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 112],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 120],r10
      mov	eax,[rbp - 112]
      mov	r10d,[rbp - 120]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 128],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 136],r10
      mov	eax,[rbp - 128]
      mov	r10d,[rbp - 136]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 144],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 152],r10
      mov	eax,[rbp - 144]
      mov	r10d,[rbp - 152]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 160],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 168],r10
      mov	eax,[rbp - 160]
      mov	r10d,[rbp - 168]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 176],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 184],r10
      mov	eax,[rbp - 176]
      mov	r10d,[rbp - 184]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 192],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 200],r10
      mov	eax,[rbp - 192]
      mov	r10d,[rbp - 200]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 208],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 216],r10
      mov	eax,[rbp - 208]
      mov	r10d,[rbp - 216]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 224],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 232],r10
      mov	eax,[rbp - 224]
      mov	r10d,[rbp - 232]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 240],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 248],r10
      mov	eax,[rbp - 240]
      mov	r10d,[rbp - 248]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 256],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 264],r10
      mov	eax,[rbp - 256]
      mov	r10d,[rbp - 264]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 272],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 280],r10
      mov	eax,[rbp - 272]
      mov	r10d,[rbp - 280]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 288],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 296],r10
      mov	eax,[rbp - 288]
      mov	r10d,[rbp - 296]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 304],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 312],r10
      mov	eax,[rbp - 304]
      mov	r10d,[rbp - 312]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 320],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 328],r10
      mov	eax,[rbp - 320]
      mov	r10d,[rbp - 328]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 336],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 344],r10
      mov	eax,[rbp - 336]
      mov	r10d,[rbp - 344]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 352],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 360],r10
      mov	eax,[rbp - 352]
      mov	r10d,[rbp - 360]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 368],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 376],r10
      mov	eax,[rbp - 368]
      mov	r10d,[rbp - 376]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 384],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 392],r10
      mov	eax,[rbp - 384]
      mov	r10d,[rbp - 392]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 400],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 408],r10
      mov	eax,[rbp - 400]
      mov	r10d,[rbp - 408]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 416],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 424],r10
      mov	eax,[rbp - 416]
      mov	r10d,[rbp - 424]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 432],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 440],r10
      mov	eax,[rbp - 432]
      mov	r10d,[rbp - 440]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 448],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 456],r10
      mov	eax,[rbp - 448]
      mov	r10d,[rbp - 456]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 464],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 472],r10
      mov	eax,[rbp - 464]
      mov	r10d,[rbp - 472]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 480],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 488],r10
      mov	eax,[rbp - 480]
      mov	r10d,[rbp - 488]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 496],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 504],r10
      mov	eax,[rbp - 496]
      mov	r10d,[rbp - 504]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 512],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 520],r10
      mov	eax,[rbp - 512]
      mov	r10d,[rbp - 520]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 528],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 536],r10
      mov	eax,[rbp - 528]
      mov	r10d,[rbp - 536]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 544],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 552],r10
      mov	eax,[rbp - 544]
      mov	r10d,[rbp - 552]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 560],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 568],r10
      mov	eax,[rbp - 560]
      mov	r10d,[rbp - 568]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 576],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 584],r10
      mov	eax,[rbp - 576]
      mov	r10d,[rbp - 584]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 592],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 600],r10
      mov	eax,[rbp - 592]
      mov	r10d,[rbp - 600]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 608],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 616],r10
      mov	eax,[rbp - 608]
      mov	r10d,[rbp - 616]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 624],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 632],r10
      mov	eax,[rbp - 624]
      mov	r10d,[rbp - 632]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 640],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 648],r10
      mov	eax,[rbp - 640]
      mov	r10d,[rbp - 648]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 656],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 664],r10
      mov	eax,[rbp - 656]
      mov	r10d,[rbp - 664]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 672],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 680],r10
      mov	eax,[rbp - 672]
      mov	r10d,[rbp - 680]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 688],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 696],r10
      mov	eax,[rbp - 688]
      mov	r10d,[rbp - 696]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 704],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 712],r10
      mov	eax,[rbp - 704]
      mov	r10d,[rbp - 712]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 720],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 728],r10
      mov	eax,[rbp - 720]
      mov	r10d,[rbp - 728]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 736],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 744],r10
      mov	eax,[rbp - 736]
      mov	r10d,[rbp - 744]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 752],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 760],r10
      mov	eax,[rbp - 752]
      mov	r10d,[rbp - 760]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 768],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 776],r10
      mov	eax,[rbp - 768]
      mov	r10d,[rbp - 776]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 784],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 792],r10
      mov	eax,[rbp - 784]
      mov	r10d,[rbp - 792]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 800],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 808],r10
      mov	eax,[rbp - 800]
      mov	r10d,[rbp - 808]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 816],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 824],r10
      mov	eax,[rbp - 816]
      mov	r10d,[rbp - 824]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 832],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 840],r10
      mov	eax,[rbp - 832]
      mov	r10d,[rbp - 840]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 848],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 856],r10
      mov	eax,[rbp - 848]
      mov	r10d,[rbp - 856]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 864],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 872],r10
      mov	eax,[rbp - 864]
      mov	r10d,[rbp - 872]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 880],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 888],r10
      mov	eax,[rbp - 880]
      mov	r10d,[rbp - 888]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 896],rdx
      mov	r10,233
      imul	r10,7
      mov	[rbp - 904],r10
      mov	eax,[rbp - 896]
      mov	r10d,[rbp - 904]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 912],rdx
      mov	eax,[rbp - 912]
      mov	r10d,233
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 920],rdx
      mov	r10,[rbp - 920]
      mov	[rbp - 48],r10
      mov	rax,[rbp -  48]
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_0ifback
_0else:
_0ifback:
      mov	qword[rbp - 936],0
      mov	qword[rbp - 944],2
_0for:
      mov	r10,[rbp - 40]
      xor	r10,[rbp - 944]
      mov	[rbp - 976],r10
      mov	r10,[rbp - 976]
      cmp	r10,[rbp - 40]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 984],r10
      mov	 r10,[rbp-984]
      cmp	 r10,0
      je	_1else
_1if:
      mov	r10,[rbp - 40]
      xor	r10,[rbp - 944]
      mov	[rbp - 952],r10
      mov	rdi,[rbp-952]
      push	r10
      push	r11
      call	dp
      pop	r11
      pop	r10
      mov	[rbp -  960],rax
      mov	rdi,[rbp-936]
      mov	rsi,[rbp-960]
      push	r10
      push	r11
      call	add
      pop	r11
      pop	r10
      mov	[rbp -  968],rax
      mov	r10,[rbp - 968]
      mov	[rbp - 936],r10
      jmp	_1ifback
_1else:
_1ifback:
_0while:
      mov	r10,[rbp - 944]
      mov	[rbp - 992],r10
      mov	r10,[rbp - 944]
      add	r10,1
      mov	[rbp - 944],r10
      mov	r10,[rbp - 944]
      cmp	r10,[rbp - 40]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 1000],r10
      mov	r10,[rbp -  1000]
      cmp	r10,1
      je	_0for
_0forback:
      mov	rax,[rbp -  936]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
main:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      push	r10
      push	r11
      call	getInt
      pop	r11
      pop	r10
      mov	[rbp -  1024],rax
      mov	r10,[rbp - 1024]
      mov	[rbp - 1016],r10
      mov	qword[rbp - 1008],1
_1for:
      mov	rdi,[rbp-1008]
      push	r10
      push	r11
      call	dp
      pop	r11
      pop	r10
      mov	[rbp -  1032],rax
      mov	rdi,[rbp-1032]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  1040],rax
      mov	rdi,[rbp-1040]
      push	r10
      push	r11
      mov	rax,0
      call	println
      pop	r11
      pop	r10
      mov	[rbp -  1048],rax
_1while:
      mov	r10,[rbp - 1008]
      mov	[rbp - 1056],r10
      mov	r10,[rbp - 1008]
      add	r10,1
      mov	[rbp - 1008],r10
      mov	r10,[rbp - 1008]
      cmp	r10,[rbp - 1016]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 1064],r10
      mov	r10,[rbp -  1064]
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

