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
square:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 160],rdi
      mov	eax,[rbp - 160]
      mov	r10d,[sjtulcp]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 168],rdx
      mov	eax,[rbp - 160]
      mov	r10d,[sjtulcp]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 176],rdx
      mov	r10,[rbp - 168]
      imul	r10,[rbp - 176]
      mov	[rbp - 184],r10
      mov	rax,[rbp -  184]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
gcd:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 192],rdi
      mov	[rbp - 200],rsi
      mov	r10,[rbp - 200]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov	[rbp - 208],r10
      mov	 r10,[rbp-208]
      cmp	 r10,0
      je	_0else
_0if:
      mov	rax,[rbp -  192]
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_0ifback
_0else:
_0ifback:
      mov	r10,[rbp - 192]
      cmp	r10,[rbp - 200]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 240],r10
      mov	 r10,[rbp-240]
      cmp	 r10,0
      je	_1else
_1if:
      mov	rdi,[rbp-200]
      mov	rsi,[rbp-192]
      push	r10
      push	r11
      call	gcd
      pop	r11
      pop	r10
      mov	[rbp -  216],rax
      mov	rax,[rbp -  216]
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_1ifback
_1else:
      mov	eax,[rbp - 192]
      mov	r10d,[rbp - 200]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 224],rdx
      mov	rdi,[rbp-200]
      mov	rsi,[rbp-224]
      push	r10
      push	r11
      call	gcd
      pop	r11
      pop	r10
      mov	[rbp -  232],rax
      mov	rax,[rbp -  232]
      mov	rsp,rbp
      pop rbp
      ret
_1ifback:
      mov	rsp,rbp
      pop rbp
      ret
lcm:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 248],rdi
      mov	[rbp - 256],rsi
      mov	rdi,[rbp-248]
      mov	rsi,[rbp-256]
      push	r10
      push	r11
      call	gcd
      pop	r11
      pop	r10
      mov	[rbp -  264],rax
      mov	eax,[rbp - 248]
      mov	r10d,[rbp - 264]
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 272],rax
      mov	r10,[rbp - 272]
      imul	r10,[rbp - 256]
      mov	[rbp - 280],r10
      mov	rax,[rbp -  280]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
Rand:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	qword[rbp - 288],1
      mov	qword[rbp - 288],1
_0for:
      mov	r10,[sjtulcno]
      imul	r10,[sjtulcaa]
      mov	[rbp - 296],r10
      mov	r10,[rbp - 296]
      add	r10,[sjtulcbb]
      mov	[rbp - 304],r10
      mov	eax,[rbp - 304]
      mov	r10d,[sjtulcMOD]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 312],rdx
      mov	r10,[rbp - 312]
      mov	[sjtulcno],r10
_0while:
      mov	r10,[rbp - 288]
      mov	[rbp - 320],r10
      mov	r10,[rbp - 288]
      add	r10,1
      mov	[rbp - 288],r10
      mov	r10,[rbp - 288]
      cmp	r10,3
      setl r10b
      movzx r10,r10b
      mov	[rbp - 328],r10
      mov	r10,[rbp -  328]
      cmp	r10,1
      je	_0for
_0forback:
      mov	r10,[sjtulcno]
      cmp	r10,0
      setl r10b
      movzx r10,r10b
      mov	[rbp - 344],r10
      mov	 r10,[rbp-344]
      cmp	 r10,0
      je	_2else
_2if:
      mov	r10,[sjtulcno]
      not	r10
      add	r10,1
      mov	[rbp - 336],r10
      mov	r10,[rbp - 336]
      mov	[sjtulcno],r10
      jmp	_2ifback
_2else:
_2ifback:
      mov	rax,[sjtulcno]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
RandRange:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 352],rdi
      mov	[rbp - 360],rsi
      push	r10
      push	r11
      call	Rand
      pop	r11
      pop	r10
      mov	[rbp -  368],rax
      mov	r10,[rbp - 360]
      sub	r10,[rbp - 352]
      mov	[rbp - 376],r10
      mov	r10,[rbp - 376]
      add	r10,1
      mov	[rbp - 384],r10
      mov	eax,[rbp - 368]
      mov	r10d,[rbp - 384]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 392],rdx
      mov	r10,[rbp - 352]
      add	r10,[rbp - 392]
      mov	[rbp - 400],r10
      mov	r10,[rbp - 400]
      add	r10,1
      mov	[rbp - 408],r10
      mov	rax,[rbp -  408]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
init:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	r10,140005
      add	r10,1
      mov	[rbp - 424],r10
      mov	r10,[rbp - 424]
      imul	r10,8
      mov	[rbp - 424],r10
      mov	rdi,[rbp-424]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  432],rax
      mov	r11,[rbp - 432]
      add	r11,0
      mov	qword[r11],140005
      mov	r10,[rbp - 432]
      mov	[rbp - 416],r10
      mov	qword[rbp - 440],0
      mov	qword[rbp - 448],0
      mov	qword[rbp - 440],2
_1for:
      mov	r10,[rbp - 440]
      add	r10,1
      mov	[rbp - 472],r10
      mov	r10,[rbp - 472]
      imul	r10,8
      mov	[rbp - 472],r10
      mov	r10,[rbp - 440]
      mov	r11,[rbp - 416]
      add	r11,[rbp - 472]
      mov	[r11],r10
_1while:
      mov	r10,[rbp - 440]
      add	r10,1
      mov	[rbp - 440],r10
      mov	r10,[rbp - 440]
      cmp	r10,[sjtulcp]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 480],r10
      mov	r10,[rbp -  480]
      cmp	r10,1
      je	_1for
_1forback:
      mov	qword[rbp - 440],2
_2for:
      mov	qword[rbp - 448],1
_3for:
      mov	r10,[rbp - 440]
      add	r10,1
      mov	[rbp - 504],r10
      mov	r10,[rbp - 504]
      imul	r10,8
      mov	[rbp - 504],r10
      mov	r10,[rbp - 440]
      add	r10,1
      mov	[rbp - 528],r10
      mov	r10,[rbp - 528]
      imul	r10,8
      mov	[rbp - 528],r10
      mov	r10,[rbp - 416]
      add	r10,[rbp - 528]
      mov	rdi,[r10]
      push	r10
      push	r11
      call	square
      pop	r11
      pop	r10
      mov	[rbp -  536],rax
      mov	eax,[rbp - 536]
      mov	r10d,[sjtulcp]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 544],rdx
      mov	r10,[rbp - 544]
      mov	r11,[rbp - 416]
      add	r11,[rbp - 504]
      mov	[r11],r10
_3while:
      mov	r10,[rbp - 448]
      add	r10,1
      mov	[rbp - 448],r10
      mov	r10,[rbp - 448]
      cmp	r10,15
      setle r10b
      movzx r10,r10b
      mov	[rbp - 552],r10
      mov	r10,[rbp -  552]
      cmp	r10,1
      je	_3for
_3forback:
_2while:
      mov	r10,[rbp - 440]
      add	r10,1
      mov	[rbp - 440],r10
      mov	r10,[rbp - 440]
      cmp	r10,[sjtulcp]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 560],r10
      mov	r10,[rbp -  560]
      cmp	r10,1
      je	_2for
_2forback:
      mov	qword[rbp - 440],2
_4for:
      mov	r10,[rbp - 440]
      add	r10,1
      mov	[rbp - 600],r10
      mov	r10,[rbp - 600]
      imul	r10,8
      mov	[rbp - 600],r10
      mov	r10,[rbp - 416]
      add	r10,[rbp - 600]
      mov	r10,[r10]
      mov	[rbp - 576],r10
      mov	qword[rbp - 568],1
_5for:
      mov	rdi,[rbp-576]
      push	r10
      push	r11
      call	square
      pop	r11
      pop	r10
      mov	[rbp -  608],rax
      mov	eax,[rbp - 608]
      mov	r10d,[sjtulcp]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 616],rdx
      mov	r10,[rbp - 616]
      mov	[rbp - 576],r10
      mov	r10,[rbp - 576]
      add	r10,1
      mov	[rbp - 640],r10
      mov	r10,[rbp - 640]
      imul	r10,8
      mov	[rbp - 640],r10
      mov	r11,[sjtulcb]
      add	r11,[rbp - 640]
      mov	qword[r11],1
      mov	r10,[rbp - 440]
      add	r10,1
      mov	[rbp - 664],r10
      mov	r10,[rbp - 664]
      imul	r10,8
      mov	[rbp - 664],r10
      mov	r10,[rbp - 576]
      mov	r11,[rbp - 416]
      add	r11,[rbp - 664]
      cmp	r10,[r11]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 672],r10
      mov	 r10,[rbp-672]
      cmp	 r10,0
      je	_3else
_3if:
      jmp	_5forback
      jmp	_3ifback
_3else:
_3ifback:
_5while:
      mov	r10,[rbp - 568]
      add	r10,1
      mov	[rbp - 568],r10
      mov	r10,1
      cmp	r10,1
      je	_5for
_5forback:
      mov	rdi,[sjtulcL]
      mov	rsi,[rbp-568]
      push	r10
      push	r11
      call	lcm
      pop	r11
      pop	r10
      mov	[rbp -  680],rax
      mov	r10,[rbp - 680]
      mov	[sjtulcL],r10
_4while:
      mov	r10,[rbp - 440]
      add	r10,1
      mov	[rbp - 440],r10
      mov	r10,[rbp - 440]
      cmp	r10,[sjtulcp]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 688],r10
      mov	r10,[rbp -  688]
      cmp	r10,1
      je	_4for
_4forback:
      mov	r10,0
      add	r10,1
      mov	[rbp - 712],r10
      mov	r10,[rbp - 712]
      imul	r10,8
      mov	[rbp - 712],r10
      mov	r11,[sjtulcb]
      add	r11,[rbp - 712]
      mov	qword[r11],1
      mov	r10,1
      add	r10,1
      mov	[rbp - 736],r10
      mov	r10,[rbp - 736]
      imul	r10,8
      mov	[rbp - 736],r10
      mov	r11,[sjtulcb]
      add	r11,[rbp - 736]
      mov	qword[r11],1
      mov	rsp,rbp
      pop rbp
      ret
build:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 744],rdi
      mov	[rbp - 752],rsi
      mov	[rbp - 760],rdx
      mov	qword[rbp - 768],0
      mov	r10,[rbp - 752]
      cmp	r10,[rbp - 760]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 1584],r10
      mov	 r10,[rbp-1584]
      cmp	 r10,0
      je	_5else
_5if:
      mov	r10,[rbp - 744]
      add	r10,1
      mov	[rbp - 792],r10
      mov	r10,[rbp - 792]
      imul	r10,8
      mov	[rbp - 792],r10
      mov	r10,[rbp - 752]
      add	r10,1
      mov	[rbp - 816],r10
      mov	r10,[rbp - 816]
      imul	r10,8
      mov	[rbp - 816],r10
      mov	r10,[sjtulca]
      add	r10,[rbp - 816]
      mov	r10,[r10]
      mov	r11,[sjtulcsum]
      add	r11,[rbp - 792]
      mov	[r11],r10
      mov	r10,[rbp - 752]
      add	r10,1
      mov	[rbp - 1016],r10
      mov	r10,[rbp - 1016]
      imul	r10,8
      mov	[rbp - 1016],r10
      mov	r11,[sjtulca]
      add	r11,[rbp - 1016]
      mov	r10,[r11]
      cmp	r10,[sjtulcp]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 1024],r10
      mov	r10,[rbp - 1024]
      cmp	r10,0
      je	_0check
      mov	r10,[rbp - 752]
      add	r10,1
      mov	[rbp - 1048],r10
      mov	r10,[rbp - 1048]
      imul	r10,8
      mov	[rbp - 1048],r10
      mov	r11,[sjtulca]
      add	r11,[rbp - 1048]
      mov	r10,[r11]
      cmp	r10,0
      setge r10b
      movzx r10,r10b
      mov	[rbp - 1056],r10
      mov	r10,[rbp - 1024]
      and	r10,[rbp - 1056]
_0check:
      mov	[rbp - 1064],r10
      mov	r10,[rbp - 1064]
      cmp	r10,0
      je	_1check
      mov	r10,[rbp - 752]
      add	r10,1
      mov	[rbp - 1104],r10
      mov	r10,[rbp - 1104]
      imul	r10,8
      mov	[rbp - 1104],r10
      mov	r10,[sjtulca]
      add	r10,[rbp - 1104]
      mov	eax,[r10]
      mov	r10d,[sjtulcp]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 1112],rdx
      mov	r10,[rbp - 1112]
      add	r10,1
      mov	[rbp - 1120],r10
      mov	r10,[rbp - 1120]
      imul	r10,8
      mov	[rbp - 1120],r10
      mov	r11,[sjtulcb]
      add	r11,[rbp - 1120]
      mov	r10,[r11]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov	[rbp - 1128],r10
      mov	r10,[rbp - 1064]
      and	r10,[rbp - 1128]
_1check:
      mov	[rbp - 1136],r10
      mov	 r10,[rbp-1136]
      cmp	 r10,0
      je	_4else
_4if:
      mov	r10,[rbp - 744]
      add	r10,1
      mov	[rbp - 840],r10
      mov	r10,[rbp - 840]
      imul	r10,8
      mov	[rbp - 840],r10
      mov	r11,[sjtulcflag]
      add	r11,[rbp - 840]
      mov	qword[r11],1
      mov	r10,[rbp - 744]
      add	r10,1
      mov	[rbp - 864],r10
      mov	r10,[rbp - 864]
      imul	r10,8
      mov	[rbp - 864],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 872],r10
      mov	r10,[rbp - 872]
      imul	r10,8
      mov	[rbp - 872],r10
      mov	r10,[rbp - 752]
      add	r10,1
      mov	[rbp - 896],r10
      mov	r10,[rbp - 896]
      imul	r10,8
      mov	[rbp - 896],r10
      mov	r10,[sjtulca]
      add	r10,[rbp - 896]
      mov	r10,[r10]
      mov	r11,[sjtulcs]
      add	r11,[rbp - 864]
      mov	r11,[r11]
      add	r11,[rbp - 872]
      mov	[r11],r10
      mov	qword[rbp - 768],1
_6for:
      mov	r10,[rbp - 744]
      add	r10,1
      mov	[rbp - 920],r10
      mov	r10,[rbp - 920]
      imul	r10,8
      mov	[rbp - 920],r10
      mov	r10,[rbp - 768]
      add	r10,1
      mov	[rbp - 928],r10
      mov	r10,[rbp - 928]
      imul	r10,8
      mov	[rbp - 928],r10
      mov	r10,[rbp - 744]
      add	r10,1
      mov	[rbp - 952],r10
      mov	r10,[rbp - 952]
      imul	r10,8
      mov	[rbp - 952],r10
      mov	r10,[rbp - 768]
      sub	r10,1
      mov	[rbp - 960],r10
      mov	r10,[rbp - 960]
      add	r10,1
      mov	[rbp - 968],r10
      mov	r10,[rbp - 968]
      imul	r10,8
      mov	[rbp - 968],r10
      mov	r10,[sjtulcs]
      add	r10,[rbp - 952]
      mov	r10,[r10]
      add	r10,[rbp - 968]
      mov	rdi,[r10]
      push	r10
      push	r11
      call	square
      pop	r11
      pop	r10
      mov	[rbp -  976],rax
      mov	eax,[rbp - 976]
      mov	r10d,[sjtulcp]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 984],rdx
      mov	r10,[rbp - 984]
      mov	r11,[sjtulcs]
      add	r11,[rbp - 920]
      mov	r11,[r11]
      add	r11,[rbp - 928]
      mov	[r11],r10
_6while:
      mov	r10,[rbp - 768]
      add	r10,1
      mov	[rbp - 768],r10
      mov	r10,[rbp - 768]
      cmp	r10,[sjtulcL]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 992],r10
      mov	r10,[rbp -  992]
      cmp	r10,1
      je	_6for
_6forback:
      jmp	_4ifback
_4else:
_4ifback:
      mov	r10,[rbp - 744]
      add	r10,1
      mov	[rbp - 1160],r10
      mov	r10,[rbp - 1160]
      imul	r10,8
      mov	[rbp - 1160],r10
      mov	r11,[sjtulcnow]
      add	r11,[rbp - 1160]
      mov	qword[r11],0
      jmp	_5ifback
_5else:
      mov	r10,[rbp - 744]
      imul	r10,2
      mov	[rbp - 1176],r10
      mov	r10,[rbp - 1176]
      mov	[rbp - 1168],r10
      mov	r10,[rbp - 744]
      imul	r10,2
      mov	[rbp - 1192],r10
      mov	r10,[rbp - 1192]
      add	r10,1
      mov	[rbp - 1200],r10
      mov	r10,[rbp - 1200]
      mov	[rbp - 1184],r10
      mov	r10,[rbp - 752]
      add	r10,[rbp - 760]
      mov	[rbp - 1216],r10
      mov	eax,[rbp - 1216]
      mov	r10d,2
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 1224],rax
      mov	r10,[rbp - 1224]
      mov	[rbp - 1208],r10
      mov	rdi,[rbp-1168]
      mov	rsi,[rbp-752]
      mov	rdx,[rbp-1208]
      push	r10
      push	r11
      call	build
      pop	r11
      pop	r10
      mov	[rbp -  1232],rax
      mov	r10,[rbp - 1208]
      add	r10,1
      mov	[rbp - 1240],r10
      mov	rdi,[rbp-1184]
      mov	rsi,[rbp-1240]
      mov	rdx,[rbp-760]
      push	r10
      push	r11
      call	build
      pop	r11
      pop	r10
      mov	[rbp -  1248],rax
      mov	r10,[rbp - 744]
      add	r10,1
      mov	[rbp - 1272],r10
      mov	r10,[rbp - 1272]
      imul	r10,8
      mov	[rbp - 1272],r10
      mov	r10,[rbp - 1168]
      add	r10,1
      mov	[rbp - 1296],r10
      mov	r10,[rbp - 1296]
      imul	r10,8
      mov	[rbp - 1296],r10
      mov	r10,[rbp - 1184]
      add	r10,1
      mov	[rbp - 1320],r10
      mov	r10,[rbp - 1320]
      imul	r10,8
      mov	[rbp - 1320],r10
      mov	r10,[sjtulcsum]
      add	r10,[rbp - 1296]
      mov	r10,[r10]
      mov	r11,[sjtulcsum]
      add	r11,[rbp - 1320]
      add	r10,[r11]
      mov	[rbp - 1328],r10
      mov	r10,[rbp - 1328]
      mov	r11,[sjtulcsum]
      add	r11,[rbp - 1272]
      mov	[r11],r10
      mov	r10,[rbp - 744]
      add	r10,1
      mov	[rbp - 1352],r10
      mov	r10,[rbp - 1352]
      imul	r10,8
      mov	[rbp - 1352],r10
      mov	r10,[rbp - 1168]
      add	r10,1
      mov	[rbp - 1376],r10
      mov	r10,[rbp - 1376]
      imul	r10,8
      mov	[rbp - 1376],r10
      mov	r10,[rbp - 1184]
      add	r10,1
      mov	[rbp - 1400],r10
      mov	r10,[rbp - 1400]
      imul	r10,8
      mov	[rbp - 1400],r10
      mov	r11,[sjtulcflag]
      add	r11,[rbp - 1376]
      mov	r10,[r11]
      mov	r11,[sjtulcflag]
      add	r11,[rbp - 1400]
      and	r10,[r11]
_2check:
      mov	[rbp - 1408],r10
      mov	r10,[rbp - 1408]
      mov	r11,[sjtulcflag]
      add	r11,[rbp - 1352]
      mov	[r11],r10
      mov	r10,[rbp - 744]
      add	r10,1
      mov	[rbp - 1568],r10
      mov	r10,[rbp - 1568]
      imul	r10,8
      mov	[rbp - 1568],r10
      mov	r11,[sjtulcflag]
      add	r11,[rbp - 1568]
      mov	r10,[r11]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov	[rbp - 1576],r10
      mov	 r10,[rbp-1576]
      cmp	 r10,0
      je	_6else
_6if:
      mov	qword[rbp - 768],0
_7for:
      mov	r10,[rbp - 744]
      add	r10,1
      mov	[rbp - 1432],r10
      mov	r10,[rbp - 1432]
      imul	r10,8
      mov	[rbp - 1432],r10
      mov	r10,[rbp - 768]
      add	r10,1
      mov	[rbp - 1440],r10
      mov	r10,[rbp - 1440]
      imul	r10,8
      mov	[rbp - 1440],r10
      mov	r10,[rbp - 1168]
      add	r10,1
      mov	[rbp - 1464],r10
      mov	r10,[rbp - 1464]
      imul	r10,8
      mov	[rbp - 1464],r10
      mov	r10,[rbp - 768]
      add	r10,1
      mov	[rbp - 1472],r10
      mov	r10,[rbp - 1472]
      imul	r10,8
      mov	[rbp - 1472],r10
      mov	r10,[rbp - 1184]
      add	r10,1
      mov	[rbp - 1496],r10
      mov	r10,[rbp - 1496]
      imul	r10,8
      mov	[rbp - 1496],r10
      mov	r10,[rbp - 768]
      add	r10,1
      mov	[rbp - 1504],r10
      mov	r10,[rbp - 1504]
      imul	r10,8
      mov	[rbp - 1504],r10
      mov	r10,[sjtulcs]
      add	r10,[rbp - 1464]
      mov	r10,[r10]
      add	r10,[rbp - 1472]
      mov	r10,[r10]
      mov	r11,[sjtulcs]
      add	r11,[rbp - 1496]
      mov	r11,[r11]
      add	r11,[rbp - 1504]
      add	r10,[r11]
      mov	[rbp - 1512],r10
      mov	r10,[rbp - 1512]
      mov	r11,[sjtulcs]
      add	r11,[rbp - 1432]
      mov	r11,[r11]
      add	r11,[rbp - 1440]
      mov	[r11],r10
_7while:
      mov	r10,[rbp - 768]
      add	r10,1
      mov	[rbp - 768],r10
      mov	r10,[rbp - 768]
      cmp	r10,[sjtulcL]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 1520],r10
      mov	r10,[rbp -  1520]
      cmp	r10,1
      je	_7for
_7forback:
      mov	r10,0
      add	r10,1
      mov	[rbp - 1544],r10
      mov	r10,[rbp - 1544]
      imul	r10,8
      mov	[rbp - 1544],r10
      mov	r11,[sjtulcnow]
      add	r11,[rbp - 1544]
      mov	qword[r11],0
      jmp	_6ifback
_6else:
_6ifback:
_5ifback:
      mov	rsp,rbp
      pop rbp
      ret
pushdown:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 1592],rdi
      mov	r10,[rbp - 1592]
      add	r10,1
      mov	[rbp - 2192],r10
      mov	r10,[rbp - 2192]
      imul	r10,8
      mov	[rbp - 2192],r10
      mov	r11,[sjtulct]
      add	r11,[rbp - 2192]
      mov	r10,[r11]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov	[rbp - 2200],r10
      mov	 r10,[rbp-2200]
      cmp	 r10,0
      je	_7else
_7if:
      mov	r10,[rbp - 1592]
      imul	r10,2
      mov	[rbp - 1608],r10
      mov	r10,[rbp - 1608]
      mov	[rbp - 1600],r10
      mov	r10,[rbp - 1592]
      imul	r10,2
      mov	[rbp - 1624],r10
      mov	r10,[rbp - 1624]
      add	r10,1
      mov	[rbp - 1632],r10
      mov	r10,[rbp - 1632]
      mov	[rbp - 1616],r10
      mov	r10,[rbp - 1600]
      add	r10,1
      mov	[rbp - 1656],r10
      mov	r10,[rbp - 1656]
      imul	r10,8
      mov	[rbp - 1656],r10
      mov	r10,[rbp - 1600]
      add	r10,1
      mov	[rbp - 1680],r10
      mov	r10,[rbp - 1680]
      imul	r10,8
      mov	[rbp - 1680],r10
      mov	r10,[rbp - 1592]
      add	r10,1
      mov	[rbp - 1704],r10
      mov	r10,[rbp - 1704]
      imul	r10,8
      mov	[rbp - 1704],r10
      mov	r10,[sjtulcnow]
      add	r10,[rbp - 1680]
      mov	r10,[r10]
      mov	r11,[sjtulct]
      add	r11,[rbp - 1704]
      add	r10,[r11]
      mov	[rbp - 1712],r10
      mov	eax,[rbp - 1712]
      mov	r10d,[sjtulcL]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 1720],rdx
      mov	r10,[rbp - 1720]
      mov	r11,[sjtulcnow]
      add	r11,[rbp - 1656]
      mov	[r11],r10
      mov	r10,[rbp - 1600]
      add	r10,1
      mov	[rbp - 1744],r10
      mov	r10,[rbp - 1744]
      imul	r10,8
      mov	[rbp - 1744],r10
      mov	r10,[rbp - 1600]
      add	r10,1
      mov	[rbp - 1768],r10
      mov	r10,[rbp - 1768]
      imul	r10,8
      mov	[rbp - 1768],r10
      mov	r10,[rbp - 1600]
      add	r10,1
      mov	[rbp - 1792],r10
      mov	r10,[rbp - 1792]
      imul	r10,8
      mov	[rbp - 1792],r10
      mov	r10,[sjtulcnow]
      add	r10,[rbp - 1792]
      mov	r10,[r10]
      add	r10,1
      mov	[rbp - 1800],r10
      mov	r10,[rbp - 1800]
      imul	r10,8
      mov	[rbp - 1800],r10
      mov	r10,[sjtulcs]
      add	r10,[rbp - 1768]
      mov	r10,[r10]
      add	r10,[rbp - 1800]
      mov	r10,[r10]
      mov	r11,[sjtulcsum]
      add	r11,[rbp - 1744]
      mov	[r11],r10
      mov	r10,[rbp - 1600]
      add	r10,1
      mov	[rbp - 1824],r10
      mov	r10,[rbp - 1824]
      imul	r10,8
      mov	[rbp - 1824],r10
      mov	r10,[rbp - 1600]
      add	r10,1
      mov	[rbp - 1848],r10
      mov	r10,[rbp - 1848]
      imul	r10,8
      mov	[rbp - 1848],r10
      mov	r10,[rbp - 1592]
      add	r10,1
      mov	[rbp - 1872],r10
      mov	r10,[rbp - 1872]
      imul	r10,8
      mov	[rbp - 1872],r10
      mov	r10,[sjtulct]
      add	r10,[rbp - 1848]
      mov	r10,[r10]
      mov	r11,[sjtulct]
      add	r11,[rbp - 1872]
      add	r10,[r11]
      mov	[rbp - 1880],r10
      mov	eax,[rbp - 1880]
      mov	r10d,[sjtulcL]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 1888],rdx
      mov	r10,[rbp - 1888]
      mov	r11,[sjtulct]
      add	r11,[rbp - 1824]
      mov	[r11],r10
      mov	r10,[rbp - 1616]
      add	r10,1
      mov	[rbp - 1912],r10
      mov	r10,[rbp - 1912]
      imul	r10,8
      mov	[rbp - 1912],r10
      mov	r10,[rbp - 1616]
      add	r10,1
      mov	[rbp - 1936],r10
      mov	r10,[rbp - 1936]
      imul	r10,8
      mov	[rbp - 1936],r10
      mov	r10,[rbp - 1592]
      add	r10,1
      mov	[rbp - 1960],r10
      mov	r10,[rbp - 1960]
      imul	r10,8
      mov	[rbp - 1960],r10
      mov	r10,[sjtulcnow]
      add	r10,[rbp - 1936]
      mov	r10,[r10]
      mov	r11,[sjtulct]
      add	r11,[rbp - 1960]
      add	r10,[r11]
      mov	[rbp - 1968],r10
      mov	eax,[rbp - 1968]
      mov	r10d,[sjtulcL]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 1976],rdx
      mov	r10,[rbp - 1976]
      mov	r11,[sjtulcnow]
      add	r11,[rbp - 1912]
      mov	[r11],r10
      mov	r10,[rbp - 1616]
      add	r10,1
      mov	[rbp - 2000],r10
      mov	r10,[rbp - 2000]
      imul	r10,8
      mov	[rbp - 2000],r10
      mov	r10,[rbp - 1616]
      add	r10,1
      mov	[rbp - 2024],r10
      mov	r10,[rbp - 2024]
      imul	r10,8
      mov	[rbp - 2024],r10
      mov	r10,[rbp - 1616]
      add	r10,1
      mov	[rbp - 2048],r10
      mov	r10,[rbp - 2048]
      imul	r10,8
      mov	[rbp - 2048],r10
      mov	r10,[sjtulcnow]
      add	r10,[rbp - 2048]
      mov	r10,[r10]
      add	r10,1
      mov	[rbp - 2056],r10
      mov	r10,[rbp - 2056]
      imul	r10,8
      mov	[rbp - 2056],r10
      mov	r10,[sjtulcs]
      add	r10,[rbp - 2024]
      mov	r10,[r10]
      add	r10,[rbp - 2056]
      mov	r10,[r10]
      mov	r11,[sjtulcsum]
      add	r11,[rbp - 2000]
      mov	[r11],r10
      mov	r10,[rbp - 1616]
      add	r10,1
      mov	[rbp - 2080],r10
      mov	r10,[rbp - 2080]
      imul	r10,8
      mov	[rbp - 2080],r10
      mov	r10,[rbp - 1616]
      add	r10,1
      mov	[rbp - 2104],r10
      mov	r10,[rbp - 2104]
      imul	r10,8
      mov	[rbp - 2104],r10
      mov	r10,[rbp - 1592]
      add	r10,1
      mov	[rbp - 2128],r10
      mov	r10,[rbp - 2128]
      imul	r10,8
      mov	[rbp - 2128],r10
      mov	r10,[sjtulct]
      add	r10,[rbp - 2104]
      mov	r10,[r10]
      mov	r11,[sjtulct]
      add	r11,[rbp - 2128]
      add	r10,[r11]
      mov	[rbp - 2136],r10
      mov	eax,[rbp - 2136]
      mov	r10d,[sjtulcL]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 2144],rdx
      mov	r10,[rbp - 2144]
      mov	r11,[sjtulct]
      add	r11,[rbp - 2080]
      mov	[r11],r10
      mov	r10,[rbp - 1592]
      add	r10,1
      mov	[rbp - 2168],r10
      mov	r10,[rbp - 2168]
      imul	r10,8
      mov	[rbp - 2168],r10
      mov	r11,[sjtulct]
      add	r11,[rbp - 2168]
      mov	qword[r11],0
      jmp	_7ifback
_7else:
_7ifback:
      mov	rsp,rbp
      pop rbp
      ret
update:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 2208],rdi
      mov	[rbp - 2216],rsi
      mov	[rbp - 2224],rdx
      mov	r10,[sjtulcpl]
      cmp	r10,[rbp - 2216]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 2440],r10
      mov	r10,[rbp - 2440]
      cmp	r10,0
      je	_3check
      mov	r10,[sjtulcpr]
      cmp	r10,[rbp - 2224]
      setge r10b
      movzx r10,r10b
      mov	[rbp - 2448],r10
      mov	r10,[rbp - 2440]
      and	r10,[rbp - 2448]
_3check:
      mov	[rbp - 2456],r10
      mov	r10,[rbp - 2456]
      cmp	r10,0
      je	_4check
      mov	r10,[rbp - 2208]
      add	r10,1
      mov	[rbp - 2480],r10
      mov	r10,[rbp - 2480]
      imul	r10,8
      mov	[rbp - 2480],r10
      mov	r11,[sjtulcflag]
      add	r11,[rbp - 2480]
      mov	r10,[r11]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov	[rbp - 2488],r10
      mov	r10,[rbp - 2456]
      and	r10,[rbp - 2488]
_4check:
      mov	[rbp - 2496],r10
      mov	 r10,[rbp-2496]
      cmp	 r10,0
      je	_8else
_8if:
      mov	r10,[rbp - 2208]
      add	r10,1
      mov	[rbp - 2248],r10
      mov	r10,[rbp - 2248]
      imul	r10,8
      mov	[rbp - 2248],r10
      mov	r10,[rbp - 2208]
      add	r10,1
      mov	[rbp - 2272],r10
      mov	r10,[rbp - 2272]
      imul	r10,8
      mov	[rbp - 2272],r10
      mov	r10,[sjtulcnow]
      add	r10,[rbp - 2272]
      mov	r10,[r10]
      add	r10,1
      mov	[rbp - 2280],r10
      mov	eax,[rbp - 2280]
      mov	r10d,[sjtulcL]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 2288],rdx
      mov	r10,[rbp - 2288]
      mov	r11,[sjtulcnow]
      add	r11,[rbp - 2248]
      mov	[r11],r10
      mov	r10,[rbp - 2208]
      add	r10,1
      mov	[rbp - 2312],r10
      mov	r10,[rbp - 2312]
      imul	r10,8
      mov	[rbp - 2312],r10
      mov	r10,[rbp - 2208]
      add	r10,1
      mov	[rbp - 2336],r10
      mov	r10,[rbp - 2336]
      imul	r10,8
      mov	[rbp - 2336],r10
      mov	r10,[rbp - 2208]
      add	r10,1
      mov	[rbp - 2360],r10
      mov	r10,[rbp - 2360]
      imul	r10,8
      mov	[rbp - 2360],r10
      mov	r10,[sjtulcnow]
      add	r10,[rbp - 2360]
      mov	r10,[r10]
      add	r10,1
      mov	[rbp - 2368],r10
      mov	r10,[rbp - 2368]
      imul	r10,8
      mov	[rbp - 2368],r10
      mov	r10,[sjtulcs]
      add	r10,[rbp - 2336]
      mov	r10,[r10]
      add	r10,[rbp - 2368]
      mov	r10,[r10]
      mov	r11,[sjtulcsum]
      add	r11,[rbp - 2312]
      mov	[r11],r10
      mov	r10,[rbp - 2208]
      add	r10,1
      mov	[rbp - 2392],r10
      mov	r10,[rbp - 2392]
      imul	r10,8
      mov	[rbp - 2392],r10
      mov	r10,[rbp - 2208]
      add	r10,1
      mov	[rbp - 2416],r10
      mov	r10,[rbp - 2416]
      imul	r10,8
      mov	[rbp - 2416],r10
      mov	r10,[sjtulct]
      add	r10,[rbp - 2416]
      mov	r10,[r10]
      add	r10,1
      mov	[rbp - 2424],r10
      mov	eax,[rbp - 2424]
      mov	r10d,[sjtulcL]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 2432],rdx
      mov	r10,[rbp - 2432]
      mov	r11,[sjtulct]
      add	r11,[rbp - 2392]
      mov	[r11],r10
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_8ifback
_8else:
_8ifback:
      mov	r10,[rbp - 2216]
      cmp	r10,[rbp - 2224]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 2808],r10
      mov	 r10,[rbp-2808]
      cmp	 r10,0
      je	_10else
_10if:
      mov	r10,[rbp - 2208]
      add	r10,1
      mov	[rbp - 2520],r10
      mov	r10,[rbp - 2520]
      imul	r10,8
      mov	[rbp - 2520],r10
      mov	r10,[rbp - 2208]
      add	r10,1
      mov	[rbp - 2544],r10
      mov	r10,[rbp - 2544]
      imul	r10,8
      mov	[rbp - 2544],r10
      mov	r10,[sjtulcsum]
      add	r10,[rbp - 2544]
      mov	rdi,[r10]
      push	r10
      push	r11
      call	square
      pop	r11
      pop	r10
      mov	[rbp -  2552],rax
      mov	eax,[rbp - 2552]
      mov	r10d,[sjtulcp]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 2560],rdx
      mov	r10,[rbp - 2560]
      mov	r11,[sjtulcsum]
      add	r11,[rbp - 2520]
      mov	[r11],r10
      mov	r10,[rbp - 2208]
      add	r10,1
      mov	[rbp - 2784],r10
      mov	r10,[rbp - 2784]
      imul	r10,8
      mov	[rbp - 2784],r10
      mov	r10,[sjtulcsum]
      add	r10,[rbp - 2784]
      mov	r10,[r10]
      add	r10,1
      mov	[rbp - 2792],r10
      mov	r10,[rbp - 2792]
      imul	r10,8
      mov	[rbp - 2792],r10
      mov	r11,[sjtulcb]
      add	r11,[rbp - 2792]
      mov	r10,[r11]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov	[rbp - 2800],r10
      mov	 r10,[rbp-2800]
      cmp	 r10,0
      je	_9else
_9if:
      mov	r10,[rbp - 2208]
      add	r10,1
      mov	[rbp - 2584],r10
      mov	r10,[rbp - 2584]
      imul	r10,8
      mov	[rbp - 2584],r10
      mov	r11,[sjtulcflag]
      add	r11,[rbp - 2584]
      mov	qword[r11],1
      mov	r10,[rbp - 2208]
      add	r10,1
      mov	[rbp - 2608],r10
      mov	r10,[rbp - 2608]
      imul	r10,8
      mov	[rbp - 2608],r10
      mov	r10,0
      add	r10,1
      mov	[rbp - 2616],r10
      mov	r10,[rbp - 2616]
      imul	r10,8
      mov	[rbp - 2616],r10
      mov	r10,[rbp - 2208]
      add	r10,1
      mov	[rbp - 2640],r10
      mov	r10,[rbp - 2640]
      imul	r10,8
      mov	[rbp - 2640],r10
      mov	r10,[sjtulcsum]
      add	r10,[rbp - 2640]
      mov	r10,[r10]
      mov	r11,[sjtulcs]
      add	r11,[rbp - 2608]
      mov	r11,[r11]
      add	r11,[rbp - 2616]
      mov	[r11],r10
      mov	qword[rbp - 2648],0
      mov	qword[rbp - 2648],1
_8for:
      mov	r10,[rbp - 2208]
      add	r10,1
      mov	[rbp - 2672],r10
      mov	r10,[rbp - 2672]
      imul	r10,8
      mov	[rbp - 2672],r10
      mov	r10,[rbp - 2648]
      add	r10,1
      mov	[rbp - 2680],r10
      mov	r10,[rbp - 2680]
      imul	r10,8
      mov	[rbp - 2680],r10
      mov	r10,[rbp - 2208]
      add	r10,1
      mov	[rbp - 2704],r10
      mov	r10,[rbp - 2704]
      imul	r10,8
      mov	[rbp - 2704],r10
      mov	r10,[rbp - 2648]
      sub	r10,1
      mov	[rbp - 2712],r10
      mov	r10,[rbp - 2712]
      add	r10,1
      mov	[rbp - 2720],r10
      mov	r10,[rbp - 2720]
      imul	r10,8
      mov	[rbp - 2720],r10
      mov	r10,[sjtulcs]
      add	r10,[rbp - 2704]
      mov	r10,[r10]
      add	r10,[rbp - 2720]
      mov	rdi,[r10]
      push	r10
      push	r11
      call	square
      pop	r11
      pop	r10
      mov	[rbp -  2728],rax
      mov	eax,[rbp - 2728]
      mov	r10d,[sjtulcp]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 2736],rdx
      mov	r10,[rbp - 2736]
      mov	r11,[sjtulcs]
      add	r11,[rbp - 2672]
      mov	r11,[r11]
      add	r11,[rbp - 2680]
      mov	[r11],r10
_8while:
      mov	r10,[rbp - 2648]
      add	r10,1
      mov	[rbp - 2648],r10
      mov	r10,[rbp - 2648]
      cmp	r10,[sjtulcL]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 2744],r10
      mov	r10,[rbp -  2744]
      cmp	r10,1
      je	_8for
_8forback:
      jmp	_9ifback
_9else:
_9ifback:
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_10ifback
_10else:
_10ifback:
      mov	r10,[rbp - 2208]
      add	r10,1
      mov	[rbp - 2840],r10
      mov	r10,[rbp - 2840]
      imul	r10,8
      mov	[rbp - 2840],r10
      mov	r11,[sjtulct]
      add	r11,[rbp - 2840]
      mov	r10,[r11]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov	[rbp - 2848],r10
      mov	 r10,[rbp-2848]
      cmp	 r10,0
      je	_11else
_11if:
      mov	rdi,[rbp-2208]
      push	r10
      push	r11
      call	pushdown
      pop	r11
      pop	r10
      mov	[rbp -  2816],rax
      jmp	_11ifback
_11else:
_11ifback:
      mov	r10,[rbp - 2208]
      imul	r10,2
      mov	[rbp - 2864],r10
      mov	r10,[rbp - 2864]
      mov	[rbp - 2856],r10
      mov	r10,[rbp - 2208]
      imul	r10,2
      mov	[rbp - 2880],r10
      mov	r10,[rbp - 2880]
      add	r10,1
      mov	[rbp - 2888],r10
      mov	r10,[rbp - 2888]
      mov	[rbp - 2872],r10
      mov	r10,[rbp - 2216]
      add	r10,[rbp - 2224]
      mov	[rbp - 2904],r10
      mov	eax,[rbp - 2904]
      mov	r10d,2
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 2912],rax
      mov	r10,[rbp - 2912]
      mov	[rbp - 2896],r10
      mov	r10,[sjtulcpl]
      cmp	r10,[rbp - 2896]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 2928],r10
      mov	 r10,[rbp-2928]
      cmp	 r10,0
      je	_12else
_12if:
      mov	rdi,[rbp-2856]
      mov	rsi,[rbp-2216]
      mov	rdx,[rbp-2896]
      push	r10
      push	r11
      call	update
      pop	r11
      pop	r10
      mov	[rbp -  2920],rax
      jmp	_12ifback
_12else:
_12ifback:
      mov	r10,[rbp - 2896]
      add	r10,1
      mov	[rbp - 2952],r10
      mov	r10,[sjtulcpr]
      cmp	r10,[rbp - 2952]
      setge r10b
      movzx r10,r10b
      mov	[rbp - 2960],r10
      mov	 r10,[rbp-2960]
      cmp	 r10,0
      je	_13else
_13if:
      mov	r10,[rbp - 2896]
      add	r10,1
      mov	[rbp - 2936],r10
      mov	rdi,[rbp-2872]
      mov	rsi,[rbp-2936]
      mov	rdx,[rbp-2224]
      push	r10
      push	r11
      call	update
      pop	r11
      pop	r10
      mov	[rbp -  2944],rax
      jmp	_13ifback
_13else:
_13ifback:
      mov	r10,[rbp - 2208]
      add	r10,1
      mov	[rbp - 2984],r10
      mov	r10,[rbp - 2984]
      imul	r10,8
      mov	[rbp - 2984],r10
      mov	r10,[rbp - 2856]
      add	r10,1
      mov	[rbp - 3008],r10
      mov	r10,[rbp - 3008]
      imul	r10,8
      mov	[rbp - 3008],r10
      mov	r10,[rbp - 2872]
      add	r10,1
      mov	[rbp - 3032],r10
      mov	r10,[rbp - 3032]
      imul	r10,8
      mov	[rbp - 3032],r10
      mov	r10,[sjtulcsum]
      add	r10,[rbp - 3008]
      mov	r10,[r10]
      mov	r11,[sjtulcsum]
      add	r11,[rbp - 3032]
      add	r10,[r11]
      mov	[rbp - 3040],r10
      mov	r10,[rbp - 3040]
      mov	r11,[sjtulcsum]
      add	r11,[rbp - 2984]
      mov	[r11],r10
      mov	r10,[rbp - 2208]
      add	r10,1
      mov	[rbp - 3064],r10
      mov	r10,[rbp - 3064]
      imul	r10,8
      mov	[rbp - 3064],r10
      mov	r10,[rbp - 2856]
      add	r10,1
      mov	[rbp - 3088],r10
      mov	r10,[rbp - 3088]
      imul	r10,8
      mov	[rbp - 3088],r10
      mov	r10,[rbp - 2872]
      add	r10,1
      mov	[rbp - 3112],r10
      mov	r10,[rbp - 3112]
      imul	r10,8
      mov	[rbp - 3112],r10
      mov	r11,[sjtulcflag]
      add	r11,[rbp - 3088]
      mov	r10,[r11]
      mov	r11,[sjtulcflag]
      add	r11,[rbp - 3112]
      and	r10,[r11]
_5check:
      mov	[rbp - 3120],r10
      mov	r10,[rbp - 3120]
      mov	r11,[sjtulcflag]
      add	r11,[rbp - 3064]
      mov	[r11],r10
      mov	r10,[rbp - 2208]
      add	r10,1
      mov	[rbp - 3368],r10
      mov	r10,[rbp - 3368]
      imul	r10,8
      mov	[rbp - 3368],r10
      mov	r11,[sjtulcflag]
      add	r11,[rbp - 3368]
      mov	r10,[r11]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov	[rbp - 3376],r10
      mov	 r10,[rbp-3376]
      cmp	 r10,0
      je	_14else
_14if:
      mov	qword[rbp - 3128],0
      mov	qword[rbp - 3128],0
_9for:
      mov	r10,[rbp - 2208]
      add	r10,1
      mov	[rbp - 3152],r10
      mov	r10,[rbp - 3152]
      imul	r10,8
      mov	[rbp - 3152],r10
      mov	r10,[rbp - 3128]
      add	r10,1
      mov	[rbp - 3160],r10
      mov	r10,[rbp - 3160]
      imul	r10,8
      mov	[rbp - 3160],r10
      mov	r10,[rbp - 2856]
      add	r10,1
      mov	[rbp - 3184],r10
      mov	r10,[rbp - 3184]
      imul	r10,8
      mov	[rbp - 3184],r10
      mov	r10,[rbp - 2856]
      add	r10,1
      mov	[rbp - 3208],r10
      mov	r10,[rbp - 3208]
      imul	r10,8
      mov	[rbp - 3208],r10
      mov	r10,[rbp - 3128]
      mov	r11,[sjtulcnow]
      add	r11,[rbp - 3208]
      add	r10,[r11]
      mov	[rbp - 3216],r10
      mov	eax,[rbp - 3216]
      mov	r10d,[sjtulcL]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 3224],rdx
      mov	r10,[rbp - 3224]
      add	r10,1
      mov	[rbp - 3232],r10
      mov	r10,[rbp - 3232]
      imul	r10,8
      mov	[rbp - 3232],r10
      mov	r10,[rbp - 2872]
      add	r10,1
      mov	[rbp - 3256],r10
      mov	r10,[rbp - 3256]
      imul	r10,8
      mov	[rbp - 3256],r10
      mov	r10,[rbp - 2872]
      add	r10,1
      mov	[rbp - 3280],r10
      mov	r10,[rbp - 3280]
      imul	r10,8
      mov	[rbp - 3280],r10
      mov	r10,[rbp - 3128]
      mov	r11,[sjtulcnow]
      add	r11,[rbp - 3280]
      add	r10,[r11]
      mov	[rbp - 3288],r10
      mov	eax,[rbp - 3288]
      mov	r10d,[sjtulcL]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 3296],rdx
      mov	r10,[rbp - 3296]
      add	r10,1
      mov	[rbp - 3304],r10
      mov	r10,[rbp - 3304]
      imul	r10,8
      mov	[rbp - 3304],r10
      mov	r10,[sjtulcs]
      add	r10,[rbp - 3184]
      mov	r10,[r10]
      add	r10,[rbp - 3232]
      mov	r10,[r10]
      mov	r11,[sjtulcs]
      add	r11,[rbp - 3256]
      mov	r11,[r11]
      add	r11,[rbp - 3304]
      add	r10,[r11]
      mov	[rbp - 3312],r10
      mov	r10,[rbp - 3312]
      mov	r11,[sjtulcs]
      add	r11,[rbp - 3152]
      mov	r11,[r11]
      add	r11,[rbp - 3160]
      mov	[r11],r10
_9while:
      mov	r10,[rbp - 3128]
      add	r10,1
      mov	[rbp - 3128],r10
      mov	r10,[rbp - 3128]
      cmp	r10,[sjtulcL]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 3320],r10
      mov	r10,[rbp -  3320]
      cmp	r10,1
      je	_9for
_9forback:
      mov	r10,[rbp - 2208]
      add	r10,1
      mov	[rbp - 3344],r10
      mov	r10,[rbp - 3344]
      imul	r10,8
      mov	[rbp - 3344],r10
      mov	r11,[sjtulcnow]
      add	r11,[rbp - 3344]
      mov	qword[r11],0
      jmp	_14ifback
_14else:
_14ifback:
      mov	rsp,rbp
      pop rbp
      ret
query:
      push	rbp
      mov	rbp,rsp
      sub	rsp,20000
      mov	[rbp - 3384],rdi
      mov	[rbp - 3392],rsi
      mov	[rbp - 3400],rdx
      mov	r10,[sjtulcpl]
      cmp	r10,[rbp - 3392]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 3432],r10
      mov	r10,[rbp - 3432]
      cmp	r10,0
      je	_6check
      mov	r10,[sjtulcpr]
      cmp	r10,[rbp - 3400]
      setge r10b
      movzx r10,r10b
      mov	[rbp - 3440],r10
      mov	r10,[rbp - 3432]
      and	r10,[rbp - 3440]
_6check:
      mov	[rbp - 3448],r10
      mov	 r10,[rbp-3448]
      cmp	 r10,0
      je	_15else
_15if:
      mov	r10,[rbp - 3384]
      add	r10,1
      mov	[rbp - 3424],r10
      mov	r10,[rbp - 3424]
      imul	r10,8
      mov	[rbp - 3424],r10
      mov	r10,[sjtulcsum]
      add	r10,[rbp - 3424]
      mov	rax,[r10]
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_15ifback
_15else:
_15ifback:
      mov	r10,[rbp - 3384]
      imul	r10,2
      mov	[rbp - 3464],r10
      mov	r10,[rbp - 3464]
      mov	[rbp - 3456],r10
      mov	r10,[rbp - 3384]
      imul	r10,2
      mov	[rbp - 3480],r10
      mov	r10,[rbp - 3480]
      add	r10,1
      mov	[rbp - 3488],r10
      mov	r10,[rbp - 3488]
      mov	[rbp - 3472],r10
      mov	r10,[rbp - 3392]
      add	r10,[rbp - 3400]
      mov	[rbp - 3504],r10
      mov	eax,[rbp - 3504]
      mov	r10d,2
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 3512],rax
      mov	r10,[rbp - 3512]
      mov	[rbp - 3496],r10
      mov	qword[rbp - 3520],0
      mov	r10,[rbp - 3384]
      add	r10,1
      mov	[rbp - 3552],r10
      mov	r10,[rbp - 3552]
      imul	r10,8
      mov	[rbp - 3552],r10
      mov	r11,[sjtulct]
      add	r11,[rbp - 3552]
      mov	r10,[r11]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov	[rbp - 3560],r10
      mov	 r10,[rbp-3560]
      cmp	 r10,0
      je	_16else
_16if:
      mov	rdi,[rbp-3384]
      push	r10
      push	r11
      call	pushdown
      pop	r11
      pop	r10
      mov	[rbp -  3528],rax
      jmp	_16ifback
_16else:
_16ifback:
      mov	r10,[sjtulcpl]
      cmp	r10,[rbp - 3496]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 3592],r10
      mov	 r10,[rbp-3592]
      cmp	 r10,0
      je	_17else
_17if:
      mov	rdi,[rbp-3456]
      mov	rsi,[rbp-3392]
      mov	rdx,[rbp-3496]
      push	r10
      push	r11
      call	query
      pop	r11
      pop	r10
      mov	[rbp -  3568],rax
      mov	r10,[rbp - 3520]
      add	r10,[rbp - 3568]
      mov	[rbp - 3576],r10
      mov	eax,[rbp - 3576]
      mov	r10d,[sjtulcMOD]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 3584],rdx
      mov	r10,[rbp - 3584]
      mov	[rbp - 3520],r10
      jmp	_17ifback
_17else:
_17ifback:
      mov	r10,[rbp - 3496]
      add	r10,1
      mov	[rbp - 3632],r10
      mov	r10,[sjtulcpr]
      cmp	r10,[rbp - 3632]
      setge r10b
      movzx r10,r10b
      mov	[rbp - 3640],r10
      mov	 r10,[rbp-3640]
      cmp	 r10,0
      je	_18else
_18if:
      mov	r10,[rbp - 3496]
      add	r10,1
      mov	[rbp - 3600],r10
      mov	rdi,[rbp-3472]
      mov	rsi,[rbp-3600]
      mov	rdx,[rbp-3400]
      push	r10
      push	r11
      call	query
      pop	r11
      pop	r10
      mov	[rbp -  3608],rax
      mov	r10,[rbp - 3520]
      add	r10,[rbp - 3608]
      mov	[rbp - 3616],r10
      mov	eax,[rbp - 3616]
      mov	r10d,[sjtulcMOD]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 3624],rdx
      mov	r10,[rbp - 3624]
      mov	[rbp - 3520],r10
      jmp	_18ifback
_18else:
_18ifback:
      mov	rax,[rbp -  3520]
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
      mov	r10,500005
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
      mov	qword[r11],500005
      mov	r10,[rbp - 16]
      mov	[sjtulcb],r10
      mov	r10,500005
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
      mov	qword[r11],500005
      mov	r10,[rbp - 32]
      mov	[sjtulcnow],r10
      mov	r10,500005
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
      mov	qword[r11],500005
      mov	r10,[rbp - 48]
      mov	[sjtulct],r10
      mov	r10,200005
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
      mov	qword[r11],200005
      mov	r10,[rbp - 64]
      mov	[sjtulca],r10
      mov	qword[sjtulcL],1
      mov	r10,500005
      add	r10,1
      mov	[rbp - 72],r10
      mov	r10,[rbp - 72]
      imul	r10,8
      mov	[rbp - 72],r10
      mov	rdi,[rbp-72]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  80],rax
      mov	r11,[rbp - 80]
      add	r11,0
      mov	qword[r11],500005
      mov	r10,[rbp - 80]
      mov	[sjtulcflag],r10
      mov	r10,500005
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
      mov	r11,[rbp - 96]
      add	r11,0
      mov	qword[r11],500005
      mov	r10,[rbp - 96]
      mov	[rbp - 112],r10
      mov	qword[rbp - 104],0
_0arr:
      mov	r10,[rbp - 104]
      add	r10,1
      mov	[rbp - 104],r10
      mov	r10,[rbp - 96]
      add	r10,8
      mov	[rbp - 96],r10
      mov	r10,80
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
      mov	r11,[rbp - 128]
      add	r11,0
      mov	qword[r11],80
      mov	r10,[rbp - 128]
      mov	r11,[rbp - 96]
      add	r11,0
      mov	[r11],r10
      mov	r10,[rbp - 104]
      cmp	r10,500005
      setl r10b
      movzx r10,r10b
      mov	[rbp - 136],r10
      mov	r10,[rbp - 136]
      cmp	r10,1
      je	_0arr
      mov	r10,[rbp - 112]
      mov	[sjtulcs],r10
      mov	r10,500005
      add	r10,1
      mov	[rbp - 144],r10
      mov	r10,[rbp - 144]
      imul	r10,8
      mov	[rbp - 144],r10
      mov	rdi,[rbp-144]
      push	r10
      push	r11
      call	malloc
      pop	r11
      pop	r10
      mov	[rbp -  152],rax
      mov	r11,[rbp - 152]
      add	r11,0
      mov	qword[r11],500005
      mov	r10,[rbp - 152]
      mov	[sjtulcsum],r10
      mov	qword[sjtulcans],0
      mov	qword[sjtulcaa],13131
      mov	qword[sjtulcbb],5353
      mov	qword[sjtulcMOD],32761
      mov	qword[sjtulcno],1
      mov	qword[sjtulcpl],0
      mov	qword[sjtulcpr],0
      push	r10
      push	r11
      call	getInt
      pop	r11
      pop	r10
      mov	[rbp -  3648],rax
      mov	r10,[rbp - 3648]
      mov	[sjtulcn],r10
      push	r10
      push	r11
      call	getInt
      pop	r11
      pop	r10
      mov	[rbp -  3656],rax
      mov	r10,[rbp - 3656]
      mov	[sjtulcm],r10
      push	r10
      push	r11
      call	getInt
      pop	r11
      pop	r10
      mov	[rbp -  3664],rax
      mov	r10,[rbp - 3664]
      mov	[sjtulcp],r10
      mov	qword[rbp - 3672],1
      mov	qword[rbp - 3672],1
_10for:
      mov	r10,[rbp - 3672]
      add	r10,1
      mov	[rbp - 3696],r10
      mov	r10,[rbp - 3696]
      imul	r10,8
      mov	[rbp - 3696],r10
      mov	rdi,0
      mov	rsi,[sjtulcp]
      push	r10
      push	r11
      call	RandRange
      pop	r11
      pop	r10
      mov	[rbp -  3704],rax
      mov	r10,[rbp - 3704]
      mov	r11,[sjtulca]
      add	r11,[rbp - 3696]
      mov	[r11],r10
_10while:
      mov	r10,[rbp - 3672]
      add	r10,1
      mov	[rbp - 3672],r10
      mov	r10,[rbp - 3672]
      cmp	r10,[sjtulcn]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 3712],r10
      mov	r10,[rbp -  3712]
      cmp	r10,1
      je	_10for
_10forback:
      push	r10
      push	r11
      call	init
      pop	r11
      pop	r10
      mov	[rbp -  3720],rax
      mov	rdi,1
      mov	rsi,1
      mov	rdx,[sjtulcn]
      push	r10
      push	r11
      call	build
      pop	r11
      pop	r10
      mov	[rbp -  3728],rax
      jmp	_11while
_11for:
      push	r10
      push	r11
      call	Rand
      pop	r11
      pop	r10
      mov	[rbp -  3736],rax
      mov	eax,[rbp - 3736]
      mov	r10d,2
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 3744],rdx
      mov	r10,[rbp - 3744]
      mov	[sjtulcop],r10
      mov	rdi,1
      mov	rsi,[sjtulcn]
      push	r10
      push	r11
      call	RandRange
      pop	r11
      pop	r10
      mov	[rbp -  3752],rax
      mov	r10,[rbp - 3752]
      mov	[sjtulcpl],r10
      mov	rdi,1
      mov	rsi,[sjtulcn]
      push	r10
      push	r11
      call	RandRange
      pop	r11
      pop	r10
      mov	[rbp -  3760],rax
      mov	r10,[rbp - 3760]
      mov	[sjtulcpr],r10
      jmp	_12while
_12for:
      mov	rdi,1
      mov	rsi,[sjtulcn]
      push	r10
      push	r11
      call	RandRange
      pop	r11
      pop	r10
      mov	[rbp -  3768],rax
      mov	r10,[rbp - 3768]
      mov	[sjtulcpr],r10
_12while:
      mov	r10,[sjtulcpr]
      cmp	r10,[sjtulcpl]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 3776],r10
      mov	r10,[rbp -  3776]
      cmp	r10,1
      je	_12for
_12forback:
      mov	r10,[sjtulcop]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov	[rbp - 3792],r10
      mov	 r10,[rbp-3792]
      cmp	 r10,0
      je	_19else
_19if:
      mov	rdi,1
      mov	rsi,1
      mov	rdx,[sjtulcn]
      push	r10
      push	r11
      call	update
      pop	r11
      pop	r10
      mov	[rbp -  3784],rax
      jmp	_19ifback
_19else:
_19ifback:
      mov	r10,[sjtulcop]
      cmp	r10,1
      sete r10b
      movzx r10,r10b
      mov	[rbp - 3824],r10
      mov	 r10,[rbp-3824]
      cmp	 r10,0
      je	_20else
_20if:
      mov	rdi,1
      mov	rsi,1
      mov	rdx,[sjtulcn]
      push	r10
      push	r11
      call	query
      pop	r11
      pop	r10
      mov	[rbp -  3800],rax
      mov	r10,[sjtulcans]
      add	r10,[rbp - 3800]
      mov	[rbp - 3808],r10
      mov	eax,[rbp - 3808]
      mov	r10d,[sjtulcMOD]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 3816],rdx
      mov	r10,[rbp - 3816]
      mov	[sjtulcans],r10
      jmp	_20ifback
_20else:
_20ifback:
      mov	r10,[sjtulcm]
      mov	[rbp-3832],r10
      mov	r10,[sjtulcm]
      sub	r10,1
      mov	[sjtulcm],r10
_11while:
      mov	r10,[sjtulcm]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov	[rbp - 3840],r10
      mov	r10,[rbp -  3840]
      cmp	r10,1
      je	_11for
_11forback:
      mov	rdi,[sjtulcans]
      push	r10
      push	r11
      call	toString
      pop	r11
      pop	r10
      mov	[rbp -  3848],rax
      mov	rdi,[rbp-3848]
      push	r10
      push	r11
      mov	rax,0
      call	print
      pop	r11
      pop	r10
      mov	[rbp -  3856],rax
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

sjtulcb:
	dq 0
sjtulcnow:
	dq 0
sjtulct:
	dq 0
sjtulca:
	dq 0
sjtulcn:
	dq 0
sjtulcm:
	dq 0
sjtulcp:
	dq 0
sjtulcop:
	dq 0
sjtulcL:
	dq 0
sjtulcflag:
	dq 0
sjtulcs:
	dq 0
sjtulcsum:
	dq 0
sjtulcans:
	dq 0
sjtulcaa:
	dq 0
sjtulcbb:
	dq 0
sjtulcMOD:
	dq 0
sjtulcno:
	dq 0
sjtulcpl:
	dq 0
sjtulcpr:
	dq 0
section .bss
stringbuffer:
	resb 256

