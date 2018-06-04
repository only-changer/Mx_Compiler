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
jmp     sjtulc_002
sjtulc_001: 
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
sjtulc_002: 
mov     eax, dword [rbp-10H]
movsxd  rdx, eax
mov     rax, qword [rbp-18H]
 add     rax, rdx
movzx   eax, byte [rax]
test    al, al
jnz     sjtulc_001
jmp     sjtulc_004
sjtulc_003:  
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
sjtulc_004: 
mov     eax, dword [rbp-0CH]
movsxd  rdx, eax
mov     rax, qword [rbp-20H]
add     rax, rdx
movzx   eax, byte [rax]
test    al, al
jnz     sjtulc_003
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
      sub	rsp,408
      mov	qword[rbp - 128],0
      jmp	_0whilecheck
_0for:
      mov	qword[rbp - 144],0
      mov	qword[rbp - 136],0
      jmp	_1whilecheck
_1for:
      mov	r10,[rbp - 128]
      add	r10,1
      mov	rcx,r10
      mov	r10,rcx
      imul	r10,8
      mov	rcx,r10
      mov	r10,[rbp - 136]
      add	r10,1
      mov	rdx,r10
      mov	r10,rdx
      imul	r10,8
      mov	rdx,r10
      mov	r10,[sjtulcsat]
      add	r10,rcx
      mov	r10,[r10]
      add	r10,rdx
      mov	r10,[r10]
      mov	[rbp - 152],r10
      mov	r10,[rbp - 152]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov	[rbp - 176],r10
      mov	r10,[rbp - 176]
      cmp	r10,0
      je	_0check
      mov	r10,[rbp - 152]
      add	r10,1
      mov	rcx,r10
      mov	r10,rcx
      imul	r10,8
      mov	rcx,r10
      mov	r11,[sjtulcassignment]
      add	r11,rcx
      mov	r10,[r11]
      cmp	r10,1
      sete r10b
      movzx r10,r10b
      mov	[rbp - 200],r10
      mov	r10,[rbp - 176]
      and	r10,[rbp - 200]
_0check:
      mov	[rbp - 208],r10
      mov	 r10,[rbp-208]
      cmp	 r10,0
      je	_0else
_0if:
      mov	qword[rbp - 144],1
      jmp	_0ifback
_0else:
_0ifback:
      mov	r10,[rbp - 152]
      cmp	r10,0
      setl r10b
      movzx r10,r10b
      mov	[rbp - 216],r10
      mov	r10,[rbp - 216]
      cmp	r10,0
      je	_1check
      mov	r10,[rbp - 152]
      not	r10
      add	r10,1
      mov	[rbp - 240],r10
      mov	r10,[rbp - 240]
      add	r10,1
      mov	rcx,r10
      mov	r10,rcx
      imul	r10,8
      mov	rcx,r10
      mov	r11,[sjtulcassignment]
      add	r11,rcx
      mov	r10,[r11]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov	[rbp - 248],r10
      mov	r10,[rbp - 216]
      and	r10,[rbp - 248]
_1check:
      mov	[rbp - 256],r10
      mov	 r10,[rbp-256]
      cmp	 r10,0
      je	_1else
_1if:
      mov	qword[rbp - 144],1
      jmp	_1ifback
_1else:
_1ifback:
_1while:
      mov	r10,[rbp - 136]
      add	r10,1
      mov	[rbp - 136],r10
_1whilecheck:
      mov	r10,[rbp - 136]
      cmp	r10,3
      setl r10b
      movzx r10,r10b
      mov	[rbp - 264],r10
      mov	r10,[rbp -  264]
      cmp	r10,1
      je	_1for
_1forback:
      mov	r10,[rbp - 144]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov	[rbp - 272],r10
      mov	 r10,[rbp-272]
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
_0while:
      mov	r10,[rbp - 128]
      add	r10,1
      mov	[rbp - 128],r10
_0whilecheck:
      mov	r10,[rbp - 128]
      cmp	r10,[sjtulcm]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 280],r10
      mov	r10,[rbp -  280]
      cmp	r10,1
      je	_0for
_0forback:
      mov	rax,1
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
myprint:
      push	rbp
      mov	rbp,rsp
      sub	rsp,288
      mov	[rbp - 288],rdi
      mov	qword[rbp - 128],0
      jmp	_2whilecheck
_2for:
      mov	rdi,[rbp-288]
      mov	rsi,[rbp-128]
      call	string.ord
      mov	[rbp -  136],rax
      mov	r10,[sjtulcmyHash]
      add	r10,[rbp - 136]
      mov	[rbp - 144],r10
      mov	r10,[rbp - 144]
      mov	[sjtulcmyHash],r10
_2while:
      mov	r10,[rbp - 128]
      add	r10,1
      mov	[rbp - 128],r10
_2whilecheck:
      mov	rdi,[rbp-288]
      call	string.length
      mov	[rbp -  152],rax
      mov	r10,[rbp - 128]
      cmp	r10,[rbp - 152]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 160],r10
      mov	r10,[rbp -  160]
      cmp	r10,1
      je	_2for
_2forback:
      mov	rsp,rbp
      pop rbp
      ret
payoff:
      push	rbp
      mov	rbp,rsp
      sub	rsp,320
      mov	[rbp - 168],rdi
      mov	[rbp - 176],rsi
      mov	qword[rbp - 128],0
      mov	qword[rbp - 136],0
      jmp	_3whilecheck
_3for:
      mov	r10,[rbp - 136]
      add	r10,1
      mov	rcx,r10
      mov	r10,rcx
      imul	r10,8
      mov	rcx,r10
      mov	r10,[rbp - 136]
      add	r10,1
      mov	rcx,r10
      mov	r10,rcx
      imul	r10,8
      mov	rcx,r10
      mov	r11,[rbp - 168]
      add	r11,rcx
      mov	r10,[r11]
      mov	r11,[rbp - 176]
      add	r11,rcx
      cmp	r10,[r11]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 184],r10
      mov	 r10,[rbp-184]
      cmp	 r10,0
      je	_3else
_3if:
      mov	r10,[rbp - 128]
      mov	[rbp - 144],r10
      mov	r10,[rbp - 128]
      add	r10,1
      mov	[rbp - 128],r10
      jmp	_3ifback
_3else:
_3ifback:
_3while:
      mov	r10,[rbp - 136]
      add	r10,1
      mov	[rbp - 136],r10
_3whilecheck:
      mov	r10,[rbp - 136]
      cmp	r10,3
      setl r10b
      movzx r10,r10b
      mov	[rbp - 192],r10
      mov	r10,[rbp -  192]
      cmp	r10,1
      je	_3for
_3forback:
      mov	rax,[rbp -  128]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
print_cond:
      push	rbp
      mov	rbp,rsp
      sub	rsp,464
      mov	[rbp - 200],rdi
      mov	r10,[rbp - 200]
      cmp	r10,[sjtulcn]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 256],r10
      mov	 r10,[rbp-256]
      cmp	 r10,0
      je	_5else
_5if:
      mov	qword[rbp - 128],lcstr0
      mov	rdi,[sjtulccond_ass]
      mov	rsi,[sjtulcassignment]
      call	payoff
      mov	[rbp -  136],rax
      mov	rdi,[rbp-136]
      call	toString
      mov	[rbp -  144],rax
      mov	rdi,[rbp-128]
      mov	rsi,[rbp-144]
      call	string.add
      mov	[rbp -  152],rax
      mov	qword[rbp - 160],lcstr1
      mov	rdi,[rbp-152]
      mov	rsi,[rbp-160]
      call	string.add
      mov	[rbp -  168],rax
      mov	rdi,[rbp-168]
      mov	rax,0
      call	myprint
      mov	[rbp -  176],rax
      mov	qword[rbp - 184],0
      jmp	_4whilecheck
_4for:
      mov	eax,[rbp - 184]
      mov	r10d,10
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 232],rdx
      mov	r10,[rbp - 232]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov	[rbp - 240],r10
      mov	 r10,[rbp-240]
      cmp	 r10,0
      je	_4else
_4if:
      mov	r10,[rbp - 184]
      add	r10,1
      mov	[rbp - 208],r10
      mov	r10,[rbp - 208]
      add	r10,1
      mov	rcx,r10
      mov	r10,rcx
      imul	r10,8
      mov	rcx,r10
      mov	r10,[sjtulccond_ass]
      add	r10,rcx
      mov	rdi,[r10]
      call	toString
      mov	[rbp -  216],rax
      mov	rdi,[rbp-216]
      mov	rax,0
      call	myprint
      mov	[rbp -  224],rax
      jmp	_4ifback
_4else:
_4ifback:
_4while:
      mov	r10,[rbp - 184]
      add	r10,1
      mov	[rbp - 184],r10
_4whilecheck:
      mov	r10,[rbp - 184]
      cmp	r10,[sjtulcn]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 248],r10
      mov	r10,[rbp -  248]
      cmp	r10,1
      je	_4for
_4forback:
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_5ifback
_5else:
_5ifback:
      mov	r10,[rbp - 200]
      add	r10,1
      mov	[rbp - 280],r10
      mov	r10,[rbp - 280]
      add	r10,1
      mov	rcx,r10
      mov	r10,rcx
      imul	r10,8
      mov	rcx,r10
      mov	r11,[sjtulccond_ass]
      add	r11,rcx
      mov	qword[r11],1
      mov	r10,[rbp - 200]
      add	r10,1
      mov	[rbp - 288],r10
      mov	rdi,[rbp-288]
      mov	rax,0
      call	print_cond
      mov	[rbp -  296],rax
      mov	r10,[rbp - 200]
      add	r10,1
      mov	[rbp - 320],r10
      mov	r10,[rbp - 320]
      add	r10,1
      mov	rcx,r10
      mov	r10,rcx
      imul	r10,8
      mov	rcx,r10
      mov	r11,[sjtulccond_ass]
      add	r11,rcx
      mov	qword[r11],0
      mov	r10,[rbp - 200]
      add	r10,1
      mov	[rbp - 328],r10
      mov	rdi,[rbp-328]
      mov	rax,0
      call	print_cond
      mov	[rbp -  336],rax
      mov	rsp,rbp
      pop rbp
      ret
dfs:
      push	rbp
      mov	rbp,rsp
      sub	rsp,392
      mov	[rbp - 344],rdi
      mov	r10,[rbp - 344]
      cmp	r10,[sjtulcn]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 184],r10
      mov	 r10,[rbp-184]
      cmp	 r10,0
      je	_7else
_7if:
      call	check
      mov	[rbp -  168],rax
      mov	r10,[rbp - 168]
      cmp	r10,1
      sete r10b
      movzx r10,r10b
      mov	[rbp - 176],r10
      mov	 r10,[rbp-176]
      cmp	 r10,0
      je	_6else
_6if:
      mov	qword[rbp - 128],lcstr2
      mov	rdi,[rbp-128]
      mov	rax,0
      call	myprint
      mov	[rbp -  136],rax
      mov	rdi,0
      mov	rax,0
      call	print_cond
      mov	[rbp -  144],rax
      mov	qword[rbp - 152],lcstr3
      mov	rdi,[rbp-152]
      mov	rax,0
      call	myprint
      mov	[rbp -  160],rax
      jmp	_6ifback
_6else:
_6ifback:
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_7ifback
_7else:
_7ifback:
      mov	r10,[rbp - 344]
      add	r10,1
      mov	[rbp - 208],r10
      mov	r10,[rbp - 208]
      add	r10,1
      mov	rcx,r10
      mov	r10,rcx
      imul	r10,8
      mov	rcx,r10
      mov	r11,[sjtulcassignment]
      add	r11,rcx
      mov	qword[r11],1
      mov	r10,[rbp - 344]
      add	r10,1
      mov	[rbp - 216],r10
      mov	rdi,[rbp-216]
      call	dfs
      mov	[rbp -  224],rax
      mov	r10,[rbp - 344]
      add	r10,1
      mov	[rbp - 248],r10
      mov	r10,[rbp - 248]
      add	r10,1
      mov	rcx,r10
      mov	r10,rcx
      imul	r10,8
      mov	rcx,r10
      mov	r11,[sjtulcassignment]
      add	r11,rcx
      mov	qword[r11],0
      mov	r10,[rbp - 344]
      add	r10,1
      mov	[rbp - 256],r10
      mov	rdi,[rbp-256]
      call	dfs
      mov	[rbp -  264],rax
      mov	rsp,rbp
      pop rbp
      ret
print_last_cond:
      push	rbp
      mov	rbp,rsp
      sub	rsp,488
      mov	[rbp - 272],rdi
      mov	r10,[rbp - 272]
      cmp	r10,[sjtulcn]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 280],r10
      mov	 r10,[rbp-280]
      cmp	 r10,0
      je	_10else
_10if:
      mov	qword[rbp - 128],lcstr4
      mov	rdi,[rbp-128]
      mov	rax,0
      call	myprint
      mov	[rbp -  136],rax
      mov	qword[rbp - 144],1
      mov	qword[rbp - 152],0
      jmp	_5whilecheck
_5for:
      mov	r10,[rbp - 152]
      add	r10,1
      mov	[rbp - 176],r10
      mov	r10,[rbp - 176]
      add	r10,1
      mov	rcx,r10
      mov	r10,rcx
      imul	r10,8
      mov	rcx,r10
      mov	r11,[sjtulcassignment]
      add	r11,rcx
      mov	r10,[r11]
      cmp	r10,1
      sete r10b
      movzx r10,r10b
      mov	[rbp - 184],r10
      mov	 r10,[rbp-184]
      cmp	 r10,0
      je	_8else
_8if:
      mov	qword[rbp - 144],0
      jmp	_8ifback
_8else:
_8ifback:
      mov	r10,[rbp - 152]
      add	r10,1
      mov	[rbp - 208],r10
      mov	r10,[rbp - 208]
      add	r10,1
      mov	rcx,r10
      mov	r10,rcx
      imul	r10,8
      mov	rcx,r10
      mov	r10,[sjtulcassignment]
      add	r10,rcx
      mov	rdi,[r10]
      call	toString
      mov	[rbp -  216],rax
      mov	rdi,[rbp-216]
      mov	rax,0
      call	myprint
      mov	[rbp -  224],rax
_5while:
      mov	r10,[rbp - 152]
      add	r10,1
      mov	[rbp - 152],r10
_5whilecheck:
      mov	r10,[rbp - 152]
      cmp	r10,[sjtulcn]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 232],r10
      mov	r10,[rbp -  232]
      cmp	r10,1
      je	_5for
_5forback:
      mov	r10,[rbp - 144]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov	[rbp - 272],r10
      mov	 r10,[rbp-272]
      cmp	 r10,0
      je	_9else
_9if:
      mov	qword[rbp - 240],lcstr5
      mov	rdi,[rbp-240]
      mov	rax,0
      call	myprint
      mov	[rbp -  248],rax
      jmp	_9ifback
_9else:
      mov	qword[rbp - 256],lcstr6
      mov	rdi,[rbp-256]
      mov	rax,0
      call	myprint
      mov	[rbp -  264],rax
_9ifback:
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_10ifback
_10else:
_10ifback:
      mov	r10,[rbp - 272]
      add	r10,1
      mov	[rbp - 304],r10
      mov	r10,[rbp - 304]
      add	r10,1
      mov	rcx,r10
      mov	r10,rcx
      imul	r10,8
      mov	rcx,r10
      mov	r11,[sjtulcassignment]
      add	r11,rcx
      mov	qword[r11],1
      mov	r10,[rbp - 272]
      add	r10,1
      mov	[rbp - 312],r10
      mov	rdi,[rbp-312]
      mov	rax,0
      call	print_last_cond
      mov	[rbp -  320],rax
      mov	r10,[rbp - 272]
      add	r10,1
      mov	[rbp - 344],r10
      mov	r10,[rbp - 344]
      add	r10,1
      mov	rcx,r10
      mov	r10,rcx
      imul	r10,8
      mov	rcx,r10
      mov	r11,[sjtulcassignment]
      add	r11,rcx
      mov	qword[r11],0
      mov	r10,[rbp - 272]
      add	r10,1
      mov	[rbp - 352],r10
      mov	rdi,[rbp-352]
      mov	rax,0
      call	print_last_cond
      mov	[rbp -  360],rax
      mov	rsp,rbp
      pop rbp
      ret
main:
      push	rbp
      mov	rbp,rsp
      sub	rsp,544
      mov	qword[sjtulcmyHash],0
      call	getInt
      mov	[rbp -  128],rax
      mov	r10,[rbp - 128]
      mov	[sjtulck],r10
      mov	r10,2
      imul	r10,[sjtulck]
      mov	[rbp - 136],r10
      mov	r10,[rbp - 136]
      add	r10,1
      mov	[rbp - 144],r10
      mov	r10,[rbp - 144]
      mov	[sjtulcn],r10
      mov	r10,[sjtulck]
      mov	[sjtulcm],r10
      mov	qword[sjtulclast],1
      mov	qword[rbp - 152],lcstr7
      mov	rdi,[rbp-152]
      mov	rax,0
      call	myprint
      mov	[rbp -  160],rax
      mov	r10,[sjtulcm]
      add	r10,1
      mov	[rbp - 168],r10
      mov	r10,[rbp - 168]
      imul	r10,8
      mov	[rbp - 168],r10
      mov	rdi,[rbp-168]
      call	malloc
      mov	[rbp -  176],rax
      mov	r11,[rbp - 176]
      add	r11,0
      mov	r10,[sjtulcm]
      mov	qword[r11],r10
      mov	r10,[rbp - 176]
      mov	[sjtulcsat],r10
      mov	qword[rbp - 184],0
      jmp	_6whilecheck
_6for:
      mov	qword[rbp - 200],32
      mov	rdi,[rbp-200]
      call	malloc
      mov	[rbp -  208],rax
      mov	r11,[rbp - 208]
      add	r11,0
      mov	qword[r11],3
      mov	r10,[rbp - 208]
      mov	[rbp - 192],r10
      mov	r11,[rbp - 192]
      add	r11,8
      mov	r10,[sjtulclast]
      mov	qword[r11],r10
      mov	r10,[sjtulclast]
      add	r10,1
      mov	[rbp - 264],r10
      mov	r10,[rbp - 264]
      mov	r11,[rbp - 192]
      add	r11,16
      mov	[r11],r10
      mov	r10,[sjtulclast]
      add	r10,2
      mov	[rbp - 296],r10
      mov	r10,[rbp - 296]
      not	r10
      add	r10,1
      mov	[rbp - 304],r10
      mov	r10,[rbp - 304]
      mov	r11,[rbp - 192]
      add	r11,24
      mov	[r11],r10
      mov	r10,[sjtulclast]
      add	r10,2
      mov	[rbp - 312],r10
      mov	r10,[rbp - 312]
      mov	[sjtulclast],r10
      mov	r10,[rbp - 184]
      add	r10,1
      mov	rcx,r10
      mov	r10,rcx
      imul	r10,8
      mov	rcx,r10
      mov	r10,[rbp - 192]
      mov	r11,[sjtulcsat]
      add	r11,rcx
      mov	[r11],r10
_6while:
      mov	r10,[rbp - 184]
      add	r10,1
      mov	[rbp - 184],r10
_6whilecheck:
      mov	r10,[rbp - 184]
      cmp	r10,[sjtulcm]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 336],r10
      mov	r10,[rbp -  336]
      cmp	r10,1
      je	_6for
_6forback:
      mov	r10,[sjtulcn]
      add	r10,1
      mov	[rbp - 344],r10
      mov	r10,[rbp - 344]
      add	r10,1
      mov	[rbp - 352],r10
      mov	r10,[rbp - 352]
      imul	r10,8
      mov	[rbp - 352],r10
      mov	rdi,[rbp-352]
      call	malloc
      mov	[rbp -  360],rax
      mov	r10,[rbp - 344]
      mov	r11,[rbp - 360]
      add	r11,0
      mov	[r11],r10
      mov	r10,[rbp - 360]
      mov	[sjtulcassignment],r10
      mov	r10,[sjtulcn]
      add	r10,1
      mov	[rbp - 368],r10
      mov	r10,[rbp - 368]
      add	r10,1
      mov	[rbp - 376],r10
      mov	r10,[rbp - 376]
      imul	r10,8
      mov	[rbp - 376],r10
      mov	rdi,[rbp-376]
      call	malloc
      mov	[rbp -  384],rax
      mov	r10,[rbp - 368]
      mov	r11,[rbp - 384]
      add	r11,0
      mov	[r11],r10
      mov	r10,[rbp - 384]
      mov	[sjtulccond_ass],r10
      mov	rdi,0
      call	dfs
      mov	[rbp -  392],rax
      mov	rdi,0
      mov	rax,0
      call	print_last_cond
      mov	[rbp -  400],rax
      mov	rdi,[sjtulcmyHash]
      call	toString
      mov	[rbp -  408],rax
      mov	rdi,[rbp-408]
      mov	rax,0
      call	println
      mov	[rbp -  416],rax
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

sjtulcsat:
	dq 0
sjtulcassignment:
	dq 0
sjtulccond_ass:
	dq 0
sjtulck:
	dq 0
sjtulcn:
	dq 0
sjtulcm:
	dq 0
sjtulclast:
	dq 0
sjtulcmyHash:
	dq 0
	dq 2
lcstr0:
	db	45,32,0
	dq 2
lcstr1:
	db	42,120,0
	dq 3
lcstr2:
	db	120,122,32,0
	dq 7
lcstr3:
	db	32,60,61,32,48,59,10,0
	dq 1
lcstr4:
	db	120,0
	dq 3
lcstr5:
	db	32,43,32,0
	dq 6
lcstr6:
	db	32,61,32,49,59,10,0
	dq 9
lcstr7:
	db	109,97,120,58,32,120,122,59,10,0
section .bss
stringbuffer:
	resb 256

