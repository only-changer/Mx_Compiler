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
vectorinit:
      push	rbp
      mov	rbp,rsp
      sub	rsp,128
      mov	[rbp - 16],rdi
      mov	[rbp - 8],rsi
      mov	r10,[rbp - 8]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov	[rbp - 24],r10
      mov	 r10,[rbp-24]
      cmp	 r10,0
      je	_0else
_0if:
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_0ifback
_0else:
_0ifback:
      mov	r10,[rbp - 8]
      add	r10,0
      mov	r10,[r10]
      add	r10,0
      mov	[rbp - 32],r10
      mov	r10,[rbp - 32]
      add	r10,1
      mov	[rbp - 40],r10
      mov	r10,[rbp - 40]
      imul	r10,8
      mov	[rbp - 40],r10
      mov	rdi,[rbp-40]
      push	r12
      push	r13
      push	r14
      push	r15
      call	malloc
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov	[rbp -  48],rax
      mov	r10,[rbp - 32]
      mov	r11,[rbp - 48]
      add	r11,0
      mov	[r11],r10
      mov	r10,[rbp - 48]
      mov	r11,[rbp - 16]
      add	r11,0
      mov	[r11],r10
      mov	qword[rbp - 56],0
      jmp	_0whilecheck
_0for:
      mov	r10,[rbp - 56]
      add	r10,1
      mov	[rbp - 80],r10
      mov	r10,[rbp - 80]
      imul	r10,8
      mov	[rbp - 80],r10
      mov	r10,[rbp - 56]
      add	r10,1
      mov	[rbp - 104],r10
      mov	r10,[rbp - 104]
      imul	r10,8
      mov	[rbp - 104],r10
      mov	r10,[rbp - 8]
      add	r10,[rbp - 104]
      mov	r10,[r10]
      mov	r11,[rbp - 16]
      add	r11,0
      mov	r11,[r11]
      add	r11,[rbp - 80]
      mov	[r11],r10
_0while:
      mov	r10,[rbp - 56]
      add	r10,1
      mov	[rbp - 56],r10
_0whilecheck:
      mov	r10,[rbp - 8]
      add	r10,0
      mov	r10,[r10]
      add	r10,0
      mov	[rbp - 112],r10
      mov	r10,[rbp - 56]
      cmp	r10,[rbp - 112]
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_0for
_0forback:
      mov	rsp,rbp
      pop rbp
      ret
vectorgetDim:
      push	rbp
      mov	rbp,rsp
      sub	rsp,32
      mov 	r13,rdi
      mov	r11,r13
      add	r11,0
      mov	r10,[r11]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_1else
_1if:
      mov	rax,0
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_1ifback
_1else:
_1ifback:
      mov	r10,r13
      add	r10,0
      mov	r10,[r10]
      add	r10,0
      mov	r10,[r10]
      add	r10,0
      mov 	r12,r10
      mov 	rax,r12
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
vectordot:
      push	rbp
      mov	rbp,rsp
      sub	rsp,120
      mov	[rbp - 16],rdi
      mov	[rbp - 8],rsi
      mov	qword[rbp - 24],0
      mov 	r13,0
      jmp	_1while
_1for:
      mov	r10,[rbp - 24]
      add	r10,1
      mov	[rbp - 56],r10
      mov	r10,[rbp - 56]
      imul	r10,8
      mov	[rbp - 56],r10
      mov	r10,[rbp - 24]
      add	r10,1
      mov	[rbp - 80],r10
      mov	r10,[rbp - 80]
      imul	r10,8
      mov	[rbp - 80],r10
      mov	r10,[rbp - 16]
      add	r10,0
      mov	r10,[r10]
      add	r10,[rbp - 56]
      mov	r10,[r10]
      mov	r11,[rbp - 8]
      add	r11,0
      mov	r11,[r11]
      add	r11,[rbp - 80]
      imul	r10,[r11]
      mov 	r12,r10
      mov 	r10,r12
      mov 	r13,r10
      mov	r10,[rbp - 24]
      add	r10,1
      mov	[rbp - 24],r10
_1while:
      mov	rdi,[rbp-16]
      push	r12
      push	r13
      push	r14
      push	r15
      call	vectorgetDim
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov	r10,[rbp - 24]
      cmp 	r10,r12
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_1for
_1forback:
      mov 	rax,r13
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
vectorscalarInPlaceMultiply:
      push	rbp
      mov	rbp,rsp
      sub	rsp,120
      mov	[rbp - 16],rdi
      mov	[rbp - 8],rsi
      mov	r11,[rbp - 16]
      add	r11,0
      mov	r10,[r11]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
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
      mov	qword[rbp - 32],0
      jmp	_2whilecheck
_2for:
      mov	r10,[rbp - 32]
      add	r10,1
      mov	[rbp - 56],r10
      mov	r10,[rbp - 56]
      imul	r10,8
      mov	[rbp - 56],r10
      mov	r10,[rbp - 32]
      add	r10,1
      mov	[rbp - 80],r10
      mov	r10,[rbp - 80]
      imul	r10,8
      mov	[rbp - 80],r10
      mov	r10,[rbp - 8]
      mov	r11,[rbp - 16]
      add	r11,0
      mov	r11,[r11]
      add	r11,[rbp - 80]
      imul	r10,[r11]
      mov	[rbp - 88],r10
      mov	r10,[rbp - 88]
      mov	r11,[rbp - 16]
      add	r11,0
      mov	r11,[r11]
      add	r11,[rbp - 56]
      mov	[r11],r10
_2while:
      mov	r10,[rbp - 32]
      add	r10,1
      mov	[rbp - 32],r10
_2whilecheck:
      mov	rdi,[rbp-16]
      push	r12
      push	r13
      push	r14
      push	r15
      call	vectorgetDim
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov	r10,[rbp - 32]
      cmp 	r10,r12
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_2for
_2forback:
      mov	rax,[rbp -  16]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
vectoradd:
      push	rbp
      mov	rbp,rsp
      sub	rsp,256
      mov	[rbp - 16],rdi
      mov	[rbp - 8],rsi
      mov	rdi,[rbp-16]
      push	r12
      push	r13
      push	r14
      push	r15
      call	vectorgetDim
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov	[rbp -  32],rax
      mov	rdi,[rbp-8]
      push	r12
      push	r13
      push	r14
      push	r15
      call	vectorgetDim
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov	[rbp -  48],rax
      mov	r10,[rbp - 32]
      cmp	r10,[rbp - 48]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 56],r10
      mov	r10,[rbp - 56]
      cmp	r10,1
      je	_0check
      mov	rdi,[rbp-16]
      push	r12
      push	r13
      push	r14
      push	r15
      call	vectorgetDim
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov	[rbp -  72],rax
      mov	r10,[rbp - 72]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov	r10,[rbp - 56]
      or 	r10,r12
_0check:
      mov	[rbp - 88],r10
      mov	 r10,[rbp-88]
      cmp	 r10,0
      je	_3else
_3if:
      mov	rax,0
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_3ifback
_3else:
_3ifback:
      mov	rdi,8
      push	r12
      push	r13
      push	r14
      push	r15
      call	malloc
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	r10,r12
      mov	[rbp - 96],r10
      mov	rdi,[rbp-16]
      push	r12
      push	r13
      push	r14
      push	r15
      call	vectorgetDim
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov	[rbp -  128],rax
      mov	r10,[rbp - 128]
      add	r10,1
      mov	[rbp - 136],r10
      mov	r10,[rbp - 136]
      imul	r10,8
      mov	[rbp - 136],r10
      mov	rdi,[rbp-136]
      push	r12
      push	r13
      push	r14
      push	r15
      call	malloc
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov	[rbp -  144],rax
      mov	r10,[rbp - 128]
      mov	r11,[rbp - 144]
      add	r11,0
      mov	[r11],r10
      mov	r10,[rbp - 144]
      mov	r11,[rbp - 96]
      add	r11,0
      mov	[r11],r10
      mov	qword[rbp - 112],0
      jmp	_3whilecheck
_3for:
      mov	r10,[rbp - 112]
      add	r10,1
      mov	[rbp - 168],r10
      mov	r10,[rbp - 168]
      imul	r10,8
      mov	[rbp - 168],r10
      mov	r10,[rbp - 112]
      add	r10,1
      mov	[rbp - 192],r10
      mov	r10,[rbp - 192]
      imul	r10,8
      mov	[rbp - 192],r10
      mov	r10,[rbp - 112]
      add	r10,1
      mov	[rbp - 216],r10
      mov	r10,[rbp - 216]
      imul	r10,8
      mov	[rbp - 216],r10
      mov	r10,[rbp - 16]
      add	r10,0
      mov	r10,[r10]
      add	r10,[rbp - 192]
      mov	r10,[r10]
      mov	r11,[rbp - 8]
      add	r11,0
      mov	r11,[r11]
      add	r11,[rbp - 216]
      add	r10,[r11]
      mov	[rbp - 224],r10
      mov	r10,[rbp - 224]
      mov	r11,[rbp - 96]
      add	r11,0
      mov	r11,[r11]
      add	r11,[rbp - 168]
      mov	[r11],r10
_3while:
      mov	r10,[rbp - 112]
      add	r10,1
      mov	[rbp - 112],r10
_3whilecheck:
      mov	rdi,[rbp-16]
      push	r12
      push	r13
      push	r14
      push	r15
      call	vectorgetDim
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov	r10,[rbp - 112]
      cmp 	r10,r12
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_3for
_3forback:
      mov	rax,[rbp -  96]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
vectorset:
      push	rbp
      mov	rbp,rsp
      sub	rsp,80
      mov	[rbp - 24],rdi
      mov	[rbp - 8],rsi
      mov	[rbp - 16],rdx
      mov	rdi,[rbp-24]
      push	r12
      push	r13
      push	r14
      push	r15
      call	vectorgetDim
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov	[rbp -  40],rax
      mov	r10,[rbp - 40]
      cmp	r10,[rbp - 8]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 48],r10
      mov	 r10,[rbp-48]
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
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[rbp - 16]
      mov	r11,[rbp - 24]
      add	r11,0
      mov	r11,[r11]
      add	r11,r12
      mov	[r11],r10
      mov	rax,1
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
vectortostring:
      push	rbp
      mov	rbp,rsp
      sub	rsp,200
      mov 	r15,rdi
      mov 	r12,lcstr0
      mov 	r10,r12
      mov 	r14,r10
      mov 	rdi,r15
      push	r12
      push	r13
      push	r14
      push	r15
      call	vectorgetDim
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	r10,r12
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov 	r13,r10
      mov 	r10,r13
      cmp	 r10,0
      je	_5else
_5if:
      mov	r10,r15
      add	r10,0
      mov	r10,[r10]
      add	r10,8
      mov	rdi,[r10]
      push	r12
      push	r13
      push	r14
      push	r15
      call	toString
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	rdi,r14
      mov 	rsi,r12
      push	r12
      push	r13
      push	r14
      push	r15
      call	string.add
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	r10,r12
      mov 	r14,r10
      jmp	_5ifback
_5else:
_5ifback:
      mov	qword[rbp - 96],1
      jmp	_4whilecheck
_4for:
      mov 	r12,lcstr1
      mov 	rdi,r14
      mov 	rsi,r12
      push	r12
      push	r13
      push	r14
      push	r15
      call	string.add
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r13,rax
      mov	r10,[rbp - 96]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,r15
      add	r10,0
      mov	r10,[r10]
      add	r10,r12
      mov	rdi,[r10]
      push	r12
      push	r13
      push	r14
      push	r15
      call	toString
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	rdi,r13
      mov 	rsi,r12
      push	r12
      push	r13
      push	r14
      push	r15
      call	string.add
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	r10,r12
      mov 	r14,r10
_4while:
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 96],r10
_4whilecheck:
      mov 	rdi,r15
      push	r12
      push	r13
      push	r14
      push	r15
      call	vectorgetDim
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov	r10,[rbp - 96]
      cmp 	r10,r12
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_4for
_4forback:
      mov 	r12,lcstr2
      mov 	rdi,r14
      mov 	rsi,r12
      push	r12
      push	r13
      push	r14
      push	r15
      call	string.add
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	r10,r12
      mov 	r14,r10
      mov 	rax,r14
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
vectorcopy:
      push	rbp
      mov	rbp,rsp
      sub	rsp,168
      mov	[rbp - 16],rdi
      mov	[rbp - 8],rsi
      mov	r10,[rbp - 8]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov	[rbp - 24],r10
      mov	 r10,[rbp-24]
      cmp	 r10,0
      je	_6else
_6if:
      mov	rax,0
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_6ifback
_6else:
_6ifback:
      mov	rdi,[rbp-8]
      push	r12
      push	r13
      push	r14
      push	r15
      call	vectorgetDim
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov	[rbp -  152],rax
      mov	r10,[rbp - 152]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov	[rbp - 160],r10
      mov	 r10,[rbp-160]
      cmp	 r10,0
      je	_7else
_7if:
      mov	r11,[rbp - 16]
      add	r11,0
      mov	qword[r11],0
      jmp	_7ifback
_7else:
      mov	rdi,[rbp-8]
      push	r12
      push	r13
      push	r14
      push	r15
      call	vectorgetDim
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r13,rax
      mov 	r10,r13
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov 	rdi,r12
      push	r12
      push	r13
      push	r14
      push	r15
      call	malloc
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov	[rbp -  56],rax
      mov 	r10,r13
      mov	r11,[rbp - 56]
      add	r11,0
      mov	[r11],r10
      mov	r10,[rbp - 56]
      mov	r11,[rbp - 16]
      add	r11,0
      mov	[r11],r10
      mov	qword[rbp - 64],0
      jmp	_5whilecheck
_5for:
      mov	r10,[rbp - 64]
      add	r10,1
      mov	[rbp - 88],r10
      mov	r10,[rbp - 88]
      imul	r10,8
      mov	[rbp - 88],r10
      mov	r10,[rbp - 64]
      add	r10,1
      mov	[rbp - 112],r10
      mov	r10,[rbp - 112]
      imul	r10,8
      mov	[rbp - 112],r10
      mov	r10,[rbp - 8]
      add	r10,0
      mov	r10,[r10]
      add	r10,[rbp - 112]
      mov	r10,[r10]
      mov	r11,[rbp - 16]
      add	r11,0
      mov	r11,[r11]
      add	r11,[rbp - 88]
      mov	[r11],r10
_5while:
      mov	r10,[rbp - 64]
      add	r10,1
      mov	[rbp - 64],r10
_5whilecheck:
      mov	rdi,[rbp-16]
      push	r12
      push	r13
      push	r14
      push	r15
      call	vectorgetDim
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov	r10,[rbp - 64]
      cmp 	r10,r12
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_5for
_5forback:
_7ifback:
      mov	rax,1
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
main:
      push	rbp
      mov	rbp,rsp
      sub	rsp,400
      mov	rdi,8
      push	r12
      push	r13
      push	r14
      push	r15
      call	malloc
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	r10,r12
      mov	[rbp - 8],r10
      mov 	r12,88
      mov 	rdi,r12
      push	r12
      push	r13
      push	r14
      push	r15
      call	malloc
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r13,rax
      mov	r11,r13
      add	r11,0
      mov	qword[r11],10
      mov 	r10,r13
      mov	[rbp - 24],r10
      mov	qword[rbp - 48],0
      jmp	_6whilecheck
_6for:
      mov	r10,[rbp - 48]
      add	r10,1
      mov	[rbp - 72],r10
      mov	r10,[rbp - 72]
      imul	r10,8
      mov	[rbp - 72],r10
      mov	r10,9
      sub	r10,[rbp - 48]
      mov	[rbp - 80],r10
      mov	r10,[rbp - 80]
      mov	r11,[rbp - 24]
      add	r11,[rbp - 72]
      mov	[r11],r10
_6while:
      mov	r10,[rbp - 48]
      add	r10,1
      mov	[rbp - 48],r10
_6whilecheck:
      mov	r10,[rbp - 48]
      cmp	r10,10
      setl r10b
      movzx r10,r10b
      mov	[rbp - 88],r10
      mov	r10,[rbp -  88]
      cmp	r10,1
      je	_6for
_6forback:
      mov	rdi,[rbp-8]
      mov	rsi,[rbp-24]
      push	r12
      push	r13
      push	r14
      push	r15
      call	vectorinit
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	r12,lcstr3
      mov 	rdi,r12
      push	r12
      push	r13
      push	r14
      push	r15
      mov	rax,0
      call	print
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov	rdi,[rbp-8]
      push	r12
      push	r13
      push	r14
      push	r15
      call	vectortostring
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	rdi,r12
      push	r12
      push	r13
      push	r14
      push	r15
      mov	rax,0
      call	println
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov	rdi,8
      push	r12
      push	r13
      push	r14
      push	r15
      call	malloc
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	r10,r12
      mov 	r13,r10
      mov 	rdi,r13
      mov	rsi,[rbp-8]
      push	r12
      push	r13
      push	r14
      push	r15
      call	vectorcopy
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	rdi,r13
      mov	rsi,3
      mov	rdx,817
      push	r12
      push	r13
      push	r14
      push	r15
      call	vectorset
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	r10,r12
      cmp	 r10,0
      je	_8else
_8if:
      mov 	r12,lcstr4
      mov 	rdi,r12
      push	r12
      push	r13
      push	r14
      push	r15
      mov	rax,0
      call	println
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      jmp	_8ifback
_8else:
_8ifback:
      mov 	r12,lcstr5
      mov 	rdi,r12
      push	r12
      push	r13
      push	r14
      push	r15
      mov	rax,0
      call	print
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	rdi,r13
      push	r12
      push	r13
      push	r14
      push	r15
      call	vectortostring
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	rdi,r12
      push	r12
      push	r13
      push	r14
      push	r15
      mov	rax,0
      call	println
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	r12,lcstr6
      mov 	rdi,r12
      push	r12
      push	r13
      push	r14
      push	r15
      mov	rax,0
      call	print
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov	rdi,[rbp-8]
      mov 	rsi,r13
      push	r12
      push	r13
      push	r14
      push	r15
      call	vectoradd
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov	rdi,rax
      push	r12
      push	r13
      push	r14
      push	r15
      call	vectortostring
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	rdi,r12
      push	r12
      push	r13
      push	r14
      push	r15
      mov	rax,0
      call	println
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	r12,lcstr7
      mov 	rdi,r12
      push	r12
      push	r13
      push	r14
      push	r15
      mov	rax,0
      call	print
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov	rdi,[rbp-8]
      mov 	rsi,r13
      push	r12
      push	r13
      push	r14
      push	r15
      call	vectordot
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	rdi,r12
      push	r12
      push	r13
      push	r14
      push	r15
      call	toString
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	rdi,r12
      push	r12
      push	r13
      push	r14
      push	r15
      mov	rax,0
      call	println
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	r12,lcstr8
      mov 	rdi,r12
      push	r12
      push	r13
      push	r14
      push	r15
      mov	rax,0
      call	print
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	rdi,r13
      mov	rsi,8
      push	r12
      push	r13
      push	r14
      push	r15
      call	vectorscalarInPlaceMultiply
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov	rdi,rax
      push	r12
      push	r13
      push	r14
      push	r15
      call	vectortostring
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	rdi,r12
      push	r12
      push	r13
      push	r14
      push	r15
      mov	rax,0
      call	println
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
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

	dq 2
lcstr0:
	db	40,32,0
	dq 2
lcstr1:
	db	44,32,0
	dq 2
lcstr2:
	db	32,41,0
	dq 10
lcstr3:
	db	118,101,99,116,111,114,32,120,58,32,0
	dq 8
lcstr4:
	db	101,120,99,105,116,101,100,33,0
	dq 10
lcstr5:
	db	118,101,99,116,111,114,32,121,58,32,0
	dq 7
lcstr6:
	db	120,32,43,32,121,58,32,0
	dq 7
lcstr7:
	db	120,32,42,32,121,58,32,0
	dq 14
lcstr8:
	db	40,49,32,60,60,32,51,41,32,42,32,121,58,32,0
section .bss
stringbuffer:
	resb 256

