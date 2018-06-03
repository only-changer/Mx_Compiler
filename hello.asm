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
hex2int:
      push	rbp
      mov	rbp,rsp
      sub	rsp,232
      mov	[rbp - 8],rdi
      mov	qword[rbp - 24],0
      mov	qword[rbp - 16],0
      jmp	_0whilecheck
_0for:
      mov	rdi,[rbp-8]
      mov	rsi,[rbp-16]
      call	string.ord
      mov	[rbp -  40],rax
      mov	r10,[rbp - 40]
      mov	[rbp - 32],r10
      mov	r10,[rbp - 32]
      cmp	r10,48
      setge r10b
      movzx r10,r10b
      mov	[rbp - 184],r10
      mov	r10,[rbp - 184]
      cmp	r10,0
      je	_0check
      mov	r10,[rbp - 32]
      cmp	r10,57
      setle r10b
      movzx r10,r10b
      mov	[rbp - 192],r10
      mov	r10,[rbp - 184]
      and	r10,[rbp - 192]
_0check:
      mov	[rbp - 200],r10
      mov	 r10,[rbp-200]
      cmp	 r10,0
      je	_0else
_0if:
      mov	r10,[rbp - 24]
      imul	r10,16
      mov	[rbp - 48],r10
      mov	r10,[rbp - 48]
      add	r10,[rbp - 32]
      mov	[rbp - 56],r10
      mov	r10,[rbp - 56]
      sub	r10,48
      mov	[rbp - 64],r10
      mov	r10,[rbp - 64]
      mov	[rbp - 24],r10
      jmp	_0ifback
_0else:
      mov	r10,[rbp - 32]
      cmp	r10,65
      setge r10b
      movzx r10,r10b
      mov	[rbp - 160],r10
      mov	r10,[rbp - 160]
      cmp	r10,0
      je	_1check
      mov	r10,[rbp - 32]
      cmp	r10,70
      setle r10b
      movzx r10,r10b
      mov	[rbp - 168],r10
      mov	r10,[rbp - 160]
      and	r10,[rbp - 168]
_1check:
      mov	[rbp - 176],r10
      mov	 r10,[rbp-176]
      cmp	 r10,0
      je	_1else
_1if:
      mov	r10,[rbp - 24]
      imul	r10,16
      mov	[rbp - 72],r10
      mov	r10,[rbp - 72]
      add	r10,[rbp - 32]
      mov	[rbp - 80],r10
      mov	r10,[rbp - 80]
      sub	r10,65
      mov	[rbp - 88],r10
      mov	r10,[rbp - 88]
      add	r10,10
      mov	[rbp - 96],r10
      mov	r10,[rbp - 96]
      mov	[rbp - 24],r10
      jmp	_1ifback
_1else:
      mov	r10,[rbp - 32]
      cmp	r10,97
      setge r10b
      movzx r10,r10b
      mov	[rbp - 136],r10
      mov	r10,[rbp - 136]
      cmp	r10,0
      je	_2check
      mov	r10,[rbp - 32]
      cmp	r10,102
      setle r10b
      movzx r10,r10b
      mov	[rbp - 144],r10
      mov	r10,[rbp - 136]
      and	r10,[rbp - 144]
_2check:
      mov	[rbp - 152],r10
      mov	 r10,[rbp-152]
      cmp	 r10,0
      je	_2else
_2if:
      mov	r10,[rbp - 24]
      imul	r10,16
      mov	[rbp - 104],r10
      mov	r10,[rbp - 104]
      add	r10,[rbp - 32]
      mov	[rbp - 112],r10
      mov	r10,[rbp - 112]
      sub	r10,97
      mov	[rbp - 120],r10
      mov	r10,[rbp - 120]
      add	r10,10
      mov	[rbp - 128],r10
      mov	r10,[rbp - 128]
      mov	[rbp - 24],r10
      jmp	_2ifback
_2else:
      mov	rax,0
      mov	rsp,rbp
      pop rbp
      ret
_2ifback:
_1ifback:
_0ifback:
_0while:
      mov	r10,[rbp - 16]
      mov	[rbp - 208],r10
      mov	r10,[rbp - 16]
      add	r10,1
      mov	[rbp - 16],r10
_0whilecheck:
      mov	rdi,[rbp-8]
      call	string.length
      mov	[rbp -  216],rax
      mov	r10,[rbp - 16]
      cmp	r10,[rbp - 216]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 224],r10
      mov	r10,[rbp -  224]
      cmp	r10,1
      je	_0for
_0forback:
      mov	rax,[rbp -  24]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
int2chr:
      push	rbp
      mov	rbp,rsp
      sub	rsp,80
      mov	[rbp - 16],rdi
      mov	r10,[rbp - 16]
      cmp	r10,32
      setge r10b
      movzx r10,r10b
      mov	[rbp - 48],r10
      mov	r10,[rbp - 48]
      cmp	r10,0
      je	_3check
      mov	r10,[rbp - 16]
      cmp	r10,126
      setle r10b
      movzx r10,r10b
      mov	[rbp - 56],r10
      mov	r10,[rbp - 48]
      and	r10,[rbp - 56]
_3check:
      mov	[rbp - 64],r10
      mov	 r10,[rbp-64]
      cmp	 r10,0
      je	_3else
_3if:
      mov	r10,[rbp - 16]
      sub	r10,32
      mov	[rbp - 24],r10
      mov	r10,[rbp - 16]
      sub	r10,32
      mov	[rbp - 32],r10
      mov	rdi,[sjtulcasciiTable]
      mov	rsi,[rbp-24]
      mov	rdx,[rbp-32]
      call	string.substring
      mov	[rbp -  40],rax
      mov	rax,[rbp -  40]
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_3ifback
_3else:
_3ifback:
      mov	rdi,256
      call	malloc
      mov	byte[rax + 0],0
      mov	[rbp - 72],rax
      mov	rax,[rbp -  72]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
toStringHex:
      push	rbp
      mov	rbp,rsp
      sub	rsp,144
      mov	[rbp - 8],rdi
      mov	rdi,256
      call	malloc
      mov	byte[rax + 0],0
      mov	[rbp - 24],rax
      mov	r10,[rbp - 24]
      mov	[rbp - 16],r10
      mov	qword[rbp - 32],28
      jmp	_1whilecheck
_1for:
      mov	r10,[rbp - 8]
      mov	cl,[rbp - 32]
      sar	r10,cl
      mov	[rbp - 48],r10
      mov	r10,[rbp - 48]
      and	r10,15
_4check:
      mov	[rbp - 56],r10
      mov	r10,[rbp - 56]
      mov	[rbp - 40],r10
      mov	r10,[rbp - 40]
      cmp	r10,10
      setl r10b
      movzx r10,r10b
      mov	[rbp - 120],r10
      mov	 r10,[rbp-120]
      cmp	 r10,0
      je	_4else
_4if:
      mov	r10,48
      add	r10,[rbp - 40]
      mov	[rbp - 64],r10
      mov	rdi,[rbp-64]
      call	int2chr
      mov	[rbp -  72],rax
      mov	rdi,[rbp-16]
      mov	rsi,[rbp-72]
      call	string.add
      mov	[rbp -  80],rax
      mov	r10,[rbp - 80]
      mov	[rbp - 16],r10
      jmp	_4ifback
_4else:
      mov	r10,65
      add	r10,[rbp - 40]
      mov	[rbp - 88],r10
      mov	r10,[rbp - 88]
      sub	r10,10
      mov	[rbp - 96],r10
      mov	rdi,[rbp-96]
      call	int2chr
      mov	[rbp -  104],rax
      mov	rdi,[rbp-16]
      mov	rsi,[rbp-104]
      call	string.add
      mov	[rbp -  112],rax
      mov	r10,[rbp - 112]
      mov	[rbp - 16],r10
_4ifback:
_1while:
      mov	r10,[rbp - 32]
      sub	r10,4
      mov	[rbp - 128],r10
      mov	r10,[rbp - 128]
      mov	[rbp - 32],r10
_1whilecheck:
      mov	r10,[rbp - 32]
      cmp	r10,0
      setge r10b
      movzx r10,r10b
      mov	[rbp - 136],r10
      mov	r10,[rbp -  136]
      cmp	r10,1
      je	_1for
_1forback:
      mov	rax,[rbp -  16]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
rotate_left:
      push	rbp
      mov	rbp,rsp
      sub	rsp,208
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	r10,[rbp - 16]
      cmp	r10,1
      sete r10b
      movzx r10,r10b
      mov	[rbp - 64],r10
      mov	 r10,[rbp-64]
      cmp	 r10,0
      je	_5else
_5if:
      mov	r10,[rbp - 8]
      and	r10,2147483647
_5check:
      mov	[rbp - 24],r10
      mov	r10,[rbp - 24]
      sal	r10,1
      mov	[rbp - 32],r10
      mov	r10,[rbp - 8]
      sar	r10,31
      mov	[rbp - 40],r10
      mov	r10,[rbp - 40]
      and	r10,1
_6check:
      mov	[rbp - 48],r10
      mov	r10,[rbp - 32]
      or	r10,[rbp - 48]
_7check:
      mov	[rbp - 56],r10
      mov	rax,[rbp -  56]
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_5ifback
_5else:
_5ifback:
      mov	r10,[rbp - 16]
      cmp	r10,31
      sete r10b
      movzx r10,r10b
      mov	[rbp - 112],r10
      mov	 r10,[rbp-112]
      cmp	 r10,0
      je	_6else
_6if:
      mov	r10,[rbp - 8]
      and	r10,1
_8check:
      mov	[rbp - 72],r10
      mov	r10,[rbp - 72]
      sal	r10,31
      mov	[rbp - 80],r10
      mov	r10,[rbp - 8]
      sar	r10,1
      mov	[rbp - 88],r10
      mov	r10,[rbp - 88]
      and	r10,2147483647
_9check:
      mov	[rbp - 96],r10
      mov	r10,[rbp - 80]
      or	r10,[rbp - 96]
_10check:
      mov	[rbp - 104],r10
      mov	rax,[rbp -  104]
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_6ifback
_6else:
_6ifback:
      mov	r10,32
      sub	r10,[rbp - 16]
      mov	[rbp - 120],r10
      mov	r10,1
      mov	cl,[rbp - 120]
      sal	r10,cl
      mov	[rbp - 128],r10
      mov	r10,[rbp - 128]
      sub	r10,1
      mov	[rbp - 136],r10
      mov	r10,[rbp - 8]
      and	r10,[rbp - 136]
_11check:
      mov	[rbp - 144],r10
      mov	r10,[rbp - 144]
      mov	cl,[rbp - 16]
      sal	r10,cl
      mov	[rbp - 152],r10
      mov	r10,32
      sub	r10,[rbp - 16]
      mov	[rbp - 160],r10
      mov	r10,[rbp - 8]
      mov	cl,[rbp - 160]
      sar	r10,cl
      mov	[rbp - 168],r10
      mov	r10,1
      mov	cl,[rbp - 16]
      sal	r10,cl
      mov	[rbp - 176],r10
      mov	r10,[rbp - 176]
      sub	r10,1
      mov	[rbp - 184],r10
      mov	r10,[rbp - 168]
      and	r10,[rbp - 184]
_12check:
      mov	[rbp - 192],r10
      mov	r10,[rbp - 152]
      or	r10,[rbp - 192]
_13check:
      mov	[rbp - 200],r10
      mov	rax,[rbp -  200]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
add:
      push	rbp
      mov	rbp,rsp
      sub	rsp,152
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	r10,[rbp - 8]
      and	r10,65535
_14check:
      mov	[rbp - 32],r10
      mov	r10,[rbp - 16]
      and	r10,65535
_15check:
      mov	[rbp - 40],r10
      mov	r10,[rbp - 32]
      add	r10,[rbp - 40]
      mov	[rbp - 48],r10
      mov	r10,[rbp - 48]
      mov	[rbp - 24],r10
      mov	r10,[rbp - 8]
      sar	r10,16
      mov	[rbp - 64],r10
      mov	r10,[rbp - 64]
      and	r10,65535
_16check:
      mov	[rbp - 72],r10
      mov	r10,[rbp - 16]
      sar	r10,16
      mov	[rbp - 80],r10
      mov	r10,[rbp - 80]
      and	r10,65535
_17check:
      mov	[rbp - 88],r10
      mov	r10,[rbp - 72]
      add	r10,[rbp - 88]
      mov	[rbp - 96],r10
      mov	r10,[rbp - 24]
      sar	r10,16
      mov	[rbp - 104],r10
      mov	r10,[rbp - 96]
      add	r10,[rbp - 104]
      mov	[rbp - 112],r10
      mov	r10,[rbp - 112]
      and	r10,65535
_18check:
      mov	[rbp - 120],r10
      mov	r10,[rbp - 120]
      mov	[rbp - 56],r10
      mov	r10,[rbp - 56]
      sal	r10,16
      mov	[rbp - 128],r10
      mov	r10,[rbp - 24]
      and	r10,65535
_19check:
      mov	[rbp - 136],r10
      mov	r10,[rbp - 128]
      or	r10,[rbp - 136]
_20check:
      mov	[rbp - 144],r10
      mov	rax,[rbp -  144]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
lohi:
      push	rbp
      mov	rbp,rsp
      sub	rsp,40
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	r10,[rbp - 16]
      sal	r10,16
      mov	[rbp - 24],r10
      mov	r10,[rbp - 8]
      or	r10,[rbp - 24]
_21check:
      mov	[rbp - 32],r10
      mov	rax,[rbp -  32]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
sha1:
      push	rbp
      mov	rbp,rsp
      sub	rsp,1512
      mov	[rbp - 120],rdi
      mov	[rbp - 128],rsi
      mov	r10,[rbp - 128]
      add	r10,64
      mov	[rbp - 144],r10
      mov	r10,[rbp - 144]
      sub	r10,56
      mov	[rbp - 152],r10
      mov	eax,[rbp - 152]
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 160],rax
      mov	r10,[rbp - 160]
      add	r10,1
      mov	[rbp - 168],r10
      mov	r10,[rbp - 168]
      mov	[rbp - 136],r10
      mov	r10,[rbp - 136]
      cmp	r10,[sjtulcMAXCHUNK]
      setg r10b
      movzx r10,r10b
      mov	[rbp - 192],r10
      mov	 r10,[rbp-192]
      cmp	 r10,0
      je	_7else
_7if:
      mov	rdi,256
      call	malloc
      mov	byte[rax + 0],'n'
      mov	byte[rax + 1],'C'
      mov	byte[rax + 2],'h'
      mov	byte[rax + 3],'u'
      mov	byte[rax + 4],'n'
      mov	byte[rax + 5],'k'
      mov	byte[rax + 6],' '
      mov	byte[rax + 7],'>'
      mov	byte[rax + 8],' '
      mov	byte[rax + 9],'M'
      mov	byte[rax + 10],'A'
      mov	byte[rax + 11],'X'
      mov	byte[rax + 12],'C'
      mov	byte[rax + 13],'H'
      mov	byte[rax + 14],'U'
      mov	byte[rax + 15],'N'
      mov	byte[rax + 16],'K'
      mov	byte[rax + 17],'!'
      mov	byte[rax + 18],0
      mov	[rbp - 176],rax
      mov	rdi,[rbp-176]
      mov	rax,0
      call	println
      mov	[rbp -  184],rax
      mov	rax,0
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_7ifback
_7else:
_7ifback:
      mov	qword[rbp - 200],0
      jmp	_2whilecheck
_2for:
      mov	qword[rbp - 208],0
      jmp	_3whilecheck
_3for:
      mov	r10,[rbp - 200]
      add	r10,1
      mov	[rbp - 232],r10
      mov	r10,[rbp - 232]
      imul	r10,8
      mov	[rbp - 232],r10
      mov	r10,[rbp - 208]
      add	r10,1
      mov	[rbp - 240],r10
      mov	r10,[rbp - 240]
      imul	r10,8
      mov	[rbp - 240],r10
      mov	r11,[sjtulcchunks]
      add	r11,[rbp - 232]
      mov	r11,[r11]
      add	r11,[rbp - 240]
      mov	qword[r11],0
_3while:
      mov	r10,[rbp - 208]
      mov	[rbp - 248],r10
      mov	r10,[rbp - 208]
      add	r10,1
      mov	[rbp - 208],r10
_3whilecheck:
      mov	r10,[rbp - 208]
      cmp	r10,80
      setl r10b
      movzx r10,r10b
      mov	[rbp - 256],r10
      mov	r10,[rbp -  256]
      cmp	r10,1
      je	_3for
_3forback:
_2while:
      mov	r10,[rbp - 200]
      mov	[rbp - 264],r10
      mov	r10,[rbp - 200]
      add	r10,1
      mov	[rbp - 200],r10
_2whilecheck:
      mov	r10,[rbp - 200]
      cmp	r10,[rbp - 136]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 272],r10
      mov	r10,[rbp -  272]
      cmp	r10,1
      je	_2for
_2forback:
      mov	qword[rbp - 200],0
      jmp	_4whilecheck
_4for:
      mov	eax,[rbp - 200]
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 296],rax
      mov	r10,[rbp - 296]
      add	r10,1
      mov	[rbp - 304],r10
      mov	r10,[rbp - 304]
      imul	r10,8
      mov	[rbp - 304],r10
      mov	eax,[rbp - 200]
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 312],rdx
      mov	eax,[rbp - 312]
      mov	r10d,4
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 320],rax
      mov	r10,[rbp - 320]
      add	r10,1
      mov	[rbp - 328],r10
      mov	r10,[rbp - 328]
      imul	r10,8
      mov	[rbp - 328],r10
      mov	eax,[rbp - 200]
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 352],rax
      mov	r10,[rbp - 352]
      add	r10,1
      mov	[rbp - 360],r10
      mov	r10,[rbp - 360]
      imul	r10,8
      mov	[rbp - 360],r10
      mov	eax,[rbp - 200]
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 368],rdx
      mov	eax,[rbp - 368]
      mov	r10d,4
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 376],rax
      mov	r10,[rbp - 376]
      add	r10,1
      mov	[rbp - 384],r10
      mov	r10,[rbp - 384]
      imul	r10,8
      mov	[rbp - 384],r10
      mov	r10,[rbp - 200]
      add	r10,1
      mov	[rbp - 408],r10
      mov	r10,[rbp - 408]
      imul	r10,8
      mov	[rbp - 408],r10
      mov	eax,[rbp - 200]
      mov	r10d,4
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 416],rdx
      mov	r10,3
      sub	r10,[rbp - 416]
      mov	[rbp - 424],r10
      mov	r10,[rbp - 424]
      imul	r10,8
      mov	[rbp - 432],r10
      mov	r10,[rbp - 120]
      mov	cl,[rbp - 432]
      sal	r10,cl
      mov	[rbp - 440],r10
      mov	r11,[sjtulcchunks]
      add	r11,[rbp - 360]
      mov	r11,[r11]
      add	r11,[rbp - 384]
      mov	r10,[r11]
      or	r10,[rbp - 440]
_22check:
      mov	[rbp - 448],r10
      mov	r10,[rbp - 448]
      mov	r11,[sjtulcchunks]
      add	r11,[rbp - 304]
      mov	r11,[r11]
      add	r11,[rbp - 328]
      mov	[r11],r10
_4while:
      mov	r10,[rbp - 200]
      mov	[rbp - 456],r10
      mov	r10,[rbp - 200]
      add	r10,1
      mov	[rbp - 200],r10
_4whilecheck:
      mov	r10,[rbp - 200]
      cmp	r10,[rbp - 128]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 464],r10
      mov	r10,[rbp -  464]
      cmp	r10,1
      je	_4for
_4forback:
      mov	eax,[rbp - 200]
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 488],rax
      mov	r10,[rbp - 488]
      add	r10,1
      mov	[rbp - 496],r10
      mov	r10,[rbp - 496]
      imul	r10,8
      mov	[rbp - 496],r10
      mov	eax,[rbp - 200]
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 504],rdx
      mov	eax,[rbp - 504]
      mov	r10d,4
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 512],rax
      mov	r10,[rbp - 512]
      add	r10,1
      mov	[rbp - 520],r10
      mov	r10,[rbp - 520]
      imul	r10,8
      mov	[rbp - 520],r10
      mov	eax,[rbp - 200]
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 544],rax
      mov	r10,[rbp - 544]
      add	r10,1
      mov	[rbp - 552],r10
      mov	r10,[rbp - 552]
      imul	r10,8
      mov	[rbp - 552],r10
      mov	eax,[rbp - 200]
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 560],rdx
      mov	eax,[rbp - 560]
      mov	r10d,4
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 568],rax
      mov	r10,[rbp - 568]
      add	r10,1
      mov	[rbp - 576],r10
      mov	r10,[rbp - 576]
      imul	r10,8
      mov	[rbp - 576],r10
      mov	eax,[rbp - 200]
      mov	r10d,4
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 584],rdx
      mov	r10,3
      sub	r10,[rbp - 584]
      mov	[rbp - 592],r10
      mov	r10,[rbp - 592]
      imul	r10,8
      mov	[rbp - 600],r10
      mov	r10,128
      mov	cl,[rbp - 600]
      sal	r10,cl
      mov	[rbp - 608],r10
      mov	r11,[sjtulcchunks]
      add	r11,[rbp - 552]
      mov	r11,[r11]
      add	r11,[rbp - 576]
      mov	r10,[r11]
      or	r10,[rbp - 608]
_23check:
      mov	[rbp - 616],r10
      mov	r10,[rbp - 616]
      mov	r11,[sjtulcchunks]
      add	r11,[rbp - 496]
      mov	r11,[r11]
      add	r11,[rbp - 520]
      mov	[r11],r10
      mov	r10,[rbp - 136]
      sub	r10,1
      mov	[rbp - 640],r10
      mov	r10,[rbp - 640]
      add	r10,1
      mov	[rbp - 648],r10
      mov	r10,[rbp - 648]
      imul	r10,8
      mov	[rbp - 648],r10
      mov	r10,15
      add	r10,1
      mov	[rbp - 656],r10
      mov	r10,[rbp - 656]
      imul	r10,8
      mov	[rbp - 656],r10
      mov	r10,[rbp - 128]
      sal	r10,3
      mov	[rbp - 664],r10
      mov	r10,[rbp - 664]
      mov	r11,[sjtulcchunks]
      add	r11,[rbp - 648]
      mov	r11,[r11]
      add	r11,[rbp - 656]
      mov	[r11],r10
      mov	r10,[rbp - 136]
      sub	r10,1
      mov	[rbp - 688],r10
      mov	r10,[rbp - 688]
      add	r10,1
      mov	[rbp - 696],r10
      mov	r10,[rbp - 696]
      imul	r10,8
      mov	[rbp - 696],r10
      mov	r10,14
      add	r10,1
      mov	[rbp - 704],r10
      mov	r10,[rbp - 704]
      imul	r10,8
      mov	[rbp - 704],r10
      mov	r10,[rbp - 128]
      sar	r10,29
      mov	[rbp - 712],r10
      mov	r10,[rbp - 712]
      and	r10,7
_24check:
      mov	[rbp - 720],r10
      mov	r10,[rbp - 720]
      mov	r11,[sjtulcchunks]
      add	r11,[rbp - 696]
      mov	r11,[r11]
      add	r11,[rbp - 704]
      mov	[r11],r10
      mov	qword[rbp - 728],1732584193
      mov	rdi,43913
      mov	rsi,61389
      call	lohi
      mov	[rbp -  744],rax
      mov	r10,[rbp - 744]
      mov	[rbp - 736],r10
      mov	rdi,56574
      mov	rsi,39098
      call	lohi
      mov	[rbp -  760],rax
      mov	r10,[rbp - 760]
      mov	[rbp - 752],r10
      mov	qword[rbp - 768],271733878
      mov	rdi,57840
      mov	rsi,50130
      call	lohi
      mov	[rbp -  784],rax
      mov	r10,[rbp - 784]
      mov	[rbp - 776],r10
      mov	qword[rbp - 200],0
      jmp	_5whilecheck
_5for:
      mov	qword[rbp - 208],16
      jmp	_6whilecheck
_6for:
      mov	r10,[rbp - 200]
      add	r10,1
      mov	[rbp - 808],r10
      mov	r10,[rbp - 808]
      imul	r10,8
      mov	[rbp - 808],r10
      mov	r10,[rbp - 208]
      add	r10,1
      mov	[rbp - 816],r10
      mov	r10,[rbp - 816]
      imul	r10,8
      mov	[rbp - 816],r10
      mov	r10,[rbp - 200]
      add	r10,1
      mov	[rbp - 840],r10
      mov	r10,[rbp - 840]
      imul	r10,8
      mov	[rbp - 840],r10
      mov	r10,[rbp - 208]
      sub	r10,3
      mov	[rbp - 848],r10
      mov	r10,[rbp - 848]
      add	r10,1
      mov	[rbp - 856],r10
      mov	r10,[rbp - 856]
      imul	r10,8
      mov	[rbp - 856],r10
      mov	r10,[rbp - 200]
      add	r10,1
      mov	[rbp - 880],r10
      mov	r10,[rbp - 880]
      imul	r10,8
      mov	[rbp - 880],r10
      mov	r10,[rbp - 208]
      sub	r10,8
      mov	[rbp - 888],r10
      mov	r10,[rbp - 888]
      add	r10,1
      mov	[rbp - 896],r10
      mov	r10,[rbp - 896]
      imul	r10,8
      mov	[rbp - 896],r10
      mov	r10,[sjtulcchunks]
      add	r10,[rbp - 840]
      mov	r10,[r10]
      add	r10,[rbp - 856]
      mov	r10,[r10]
      mov	r11,[sjtulcchunks]
      add	r11,[rbp - 880]
      mov	r11,[r11]
      add	r11,[rbp - 896]
      xor	r10,[r11]
      mov	[rbp - 904],r10
      mov	r10,[rbp - 200]
      add	r10,1
      mov	[rbp - 928],r10
      mov	r10,[rbp - 928]
      imul	r10,8
      mov	[rbp - 928],r10
      mov	r10,[rbp - 208]
      sub	r10,14
      mov	[rbp - 936],r10
      mov	r10,[rbp - 936]
      add	r10,1
      mov	[rbp - 944],r10
      mov	r10,[rbp - 944]
      imul	r10,8
      mov	[rbp - 944],r10
      mov	r10,[rbp - 904]
      mov	r11,[sjtulcchunks]
      add	r11,[rbp - 928]
      mov	r11,[r11]
      add	r11,[rbp - 944]
      xor	r10,[r11]
      mov	[rbp - 952],r10
      mov	r10,[rbp - 200]
      add	r10,1
      mov	[rbp - 976],r10
      mov	r10,[rbp - 976]
      imul	r10,8
      mov	[rbp - 976],r10
      mov	r10,[rbp - 208]
      sub	r10,16
      mov	[rbp - 984],r10
      mov	r10,[rbp - 984]
      add	r10,1
      mov	[rbp - 992],r10
      mov	r10,[rbp - 992]
      imul	r10,8
      mov	[rbp - 992],r10
      mov	r10,[rbp - 952]
      mov	r11,[sjtulcchunks]
      add	r11,[rbp - 976]
      mov	r11,[r11]
      add	r11,[rbp - 992]
      xor	r10,[r11]
      mov	[rbp - 1000],r10
      mov	rdi,[rbp-1000]
      mov	rsi,1
      call	rotate_left
      mov	[rbp -  1008],rax
      mov	r10,[rbp - 1008]
      mov	r11,[sjtulcchunks]
      add	r11,[rbp - 808]
      mov	r11,[r11]
      add	r11,[rbp - 816]
      mov	[r11],r10
_6while:
      mov	r10,[rbp - 208]
      mov	[rbp - 1016],r10
      mov	r10,[rbp - 208]
      add	r10,1
      mov	[rbp - 208],r10
_6whilecheck:
      mov	r10,[rbp - 208]
      cmp	r10,80
      setl r10b
      movzx r10,r10b
      mov	[rbp - 1024],r10
      mov	r10,[rbp -  1024]
      cmp	r10,1
      je	_6for
_6forback:
      mov	r10,[rbp - 728]
      mov	[rbp - 1032],r10
      mov	r10,[rbp - 736]
      mov	[rbp - 1040],r10
      mov	r10,[rbp - 752]
      mov	[rbp - 1048],r10
      mov	r10,[rbp - 768]
      mov	[rbp - 1056],r10
      mov	r10,[rbp - 776]
      mov	[rbp - 1064],r10
      mov	qword[rbp - 208],0
      jmp	_7whilecheck
_7for:
      mov	r10,[rbp - 208]
      cmp	r10,20
      setl r10b
      movzx r10,r10b
      mov	[rbp - 1224],r10
      mov	 r10,[rbp-1224]
      cmp	 r10,0
      je	_8else
_8if:
      mov	r10,[rbp - 1040]
      and	r10,[rbp - 1048]
_25check:
      mov	[rbp - 1088],r10
      mov	r10,[rbp - 1096]
      and	r10,[rbp - 1056]
_26check:
      mov	[rbp - 1104],r10
      mov	r10,[rbp - 1088]
      or	r10,[rbp - 1104]
_27check:
      mov	[rbp - 1112],r10
      mov	r10,[rbp - 1112]
      mov	[rbp - 1072],r10
      mov	qword[rbp - 1080],1518500249
      jmp	_8ifback
_8else:
      mov	r10,[rbp - 208]
      cmp	r10,40
      setl r10b
      movzx r10,r10b
      mov	[rbp - 1216],r10
      mov	 r10,[rbp-1216]
      cmp	 r10,0
      je	_9else
_9if:
      mov	r10,[rbp - 1040]
      xor	r10,[rbp - 1048]
      mov	[rbp - 1120],r10
      mov	r10,[rbp - 1120]
      xor	r10,[rbp - 1056]
      mov	[rbp - 1128],r10
      mov	r10,[rbp - 1128]
      mov	[rbp - 1072],r10
      mov	qword[rbp - 1080],1859775393
      jmp	_9ifback
_9else:
      mov	r10,[rbp - 208]
      cmp	r10,60
      setl r10b
      movzx r10,r10b
      mov	[rbp - 1208],r10
      mov	 r10,[rbp-1208]
      cmp	 r10,0
      je	_10else
_10if:
      mov	r10,[rbp - 1040]
      and	r10,[rbp - 1048]
_28check:
      mov	[rbp - 1136],r10
      mov	r10,[rbp - 1040]
      and	r10,[rbp - 1056]
_29check:
      mov	[rbp - 1144],r10
      mov	r10,[rbp - 1136]
      or	r10,[rbp - 1144]
_30check:
      mov	[rbp - 1152],r10
      mov	r10,[rbp - 1048]
      and	r10,[rbp - 1056]
_31check:
      mov	[rbp - 1160],r10
      mov	r10,[rbp - 1152]
      or	r10,[rbp - 1160]
_32check:
      mov	[rbp - 1168],r10
      mov	r10,[rbp - 1168]
      mov	[rbp - 1072],r10
      mov	rdi,48348
      mov	rsi,36635
      call	lohi
      mov	[rbp -  1176],rax
      mov	r10,[rbp - 1176]
      mov	[rbp - 1080],r10
      jmp	_10ifback
_10else:
      mov	r10,[rbp - 1040]
      xor	r10,[rbp - 1048]
      mov	[rbp - 1184],r10
      mov	r10,[rbp - 1184]
      xor	r10,[rbp - 1056]
      mov	[rbp - 1192],r10
      mov	r10,[rbp - 1192]
      mov	[rbp - 1072],r10
      mov	rdi,49622
      mov	rsi,51810
      call	lohi
      mov	[rbp -  1200],rax
      mov	r10,[rbp - 1200]
      mov	[rbp - 1080],r10
_10ifback:
_9ifback:
_8ifback:
      mov	rdi,[rbp-1032]
      mov	rsi,5
      call	rotate_left
      mov	[rbp -  1240],rax
      mov	rdi,[rbp-1240]
      mov	rsi,[rbp-1064]
      call	add
      mov	[rbp -  1248],rax
      mov	rdi,[rbp-1072]
      mov	rsi,[rbp-1080]
      call	add
      mov	[rbp -  1256],rax
      mov	rdi,[rbp-1248]
      mov	rsi,[rbp-1256]
      call	add
      mov	[rbp -  1264],rax
      mov	r10,[rbp - 200]
      add	r10,1
      mov	[rbp - 1288],r10
      mov	r10,[rbp - 1288]
      imul	r10,8
      mov	[rbp - 1288],r10
      mov	r10,[rbp - 208]
      add	r10,1
      mov	[rbp - 1296],r10
      mov	r10,[rbp - 1296]
      imul	r10,8
      mov	[rbp - 1296],r10
      mov	rdi,[rbp-1264]
      mov	r10,[sjtulcchunks]
      add	r10,[rbp - 1288]
      mov	r10,[r10]
      add	r10,[rbp - 1296]
      mov	rsi,[r10]
      call	add
      mov	[rbp -  1304],rax
      mov	r10,[rbp - 1304]
      mov	[rbp - 1232],r10
      mov	r10,[rbp - 1056]
      mov	[rbp - 1064],r10
      mov	r10,[rbp - 1048]
      mov	[rbp - 1056],r10
      mov	rdi,[rbp-1040]
      mov	rsi,30
      call	rotate_left
      mov	[rbp -  1312],rax
      mov	r10,[rbp - 1312]
      mov	[rbp - 1048],r10
      mov	r10,[rbp - 1032]
      mov	[rbp - 1040],r10
      mov	r10,[rbp - 1232]
      mov	[rbp - 1032],r10
_7while:
      mov	r10,[rbp - 208]
      mov	[rbp - 1320],r10
      mov	r10,[rbp - 208]
      add	r10,1
      mov	[rbp - 208],r10
_7whilecheck:
      mov	r10,[rbp - 208]
      cmp	r10,80
      setl r10b
      movzx r10,r10b
      mov	[rbp - 1328],r10
      mov	r10,[rbp -  1328]
      cmp	r10,1
      je	_7for
_7forback:
      mov	rdi,[rbp-728]
      mov	rsi,[rbp-1032]
      call	add
      mov	[rbp -  1336],rax
      mov	r10,[rbp - 1336]
      mov	[rbp - 728],r10
      mov	rdi,[rbp-736]
      mov	rsi,[rbp-1040]
      call	add
      mov	[rbp -  1344],rax
      mov	r10,[rbp - 1344]
      mov	[rbp - 736],r10
      mov	rdi,[rbp-752]
      mov	rsi,[rbp-1048]
      call	add
      mov	[rbp -  1352],rax
      mov	r10,[rbp - 1352]
      mov	[rbp - 752],r10
      mov	rdi,[rbp-768]
      mov	rsi,[rbp-1056]
      call	add
      mov	[rbp -  1360],rax
      mov	r10,[rbp - 1360]
      mov	[rbp - 768],r10
      mov	rdi,[rbp-776]
      mov	rsi,[rbp-1064]
      call	add
      mov	[rbp -  1368],rax
      mov	r10,[rbp - 1368]
      mov	[rbp - 776],r10
_5while:
      mov	r10,[rbp - 200]
      mov	[rbp - 1376],r10
      mov	r10,[rbp - 200]
      add	r10,1
      mov	[rbp - 200],r10
_5whilecheck:
      mov	r10,[rbp - 200]
      cmp	r10,[rbp - 136]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 1384],r10
      mov	r10,[rbp -  1384]
      cmp	r10,1
      je	_5for
_5forback:
      mov	r10,0
      add	r10,1
      mov	[rbp - 1408],r10
      mov	r10,[rbp - 1408]
      imul	r10,8
      mov	[rbp - 1408],r10
      mov	r10,[rbp - 728]
      mov	r11,[sjtulcoutputBuffer]
      add	r11,[rbp - 1408]
      mov	[r11],r10
      mov	r10,1
      add	r10,1
      mov	[rbp - 1432],r10
      mov	r10,[rbp - 1432]
      imul	r10,8
      mov	[rbp - 1432],r10
      mov	r10,[rbp - 736]
      mov	r11,[sjtulcoutputBuffer]
      add	r11,[rbp - 1432]
      mov	[r11],r10
      mov	r10,2
      add	r10,1
      mov	[rbp - 1456],r10
      mov	r10,[rbp - 1456]
      imul	r10,8
      mov	[rbp - 1456],r10
      mov	r10,[rbp - 752]
      mov	r11,[sjtulcoutputBuffer]
      add	r11,[rbp - 1456]
      mov	[r11],r10
      mov	r10,3
      add	r10,1
      mov	[rbp - 1480],r10
      mov	r10,[rbp - 1480]
      imul	r10,8
      mov	[rbp - 1480],r10
      mov	r10,[rbp - 768]
      mov	r11,[sjtulcoutputBuffer]
      add	r11,[rbp - 1480]
      mov	[r11],r10
      mov	r10,4
      add	r10,1
      mov	[rbp - 1504],r10
      mov	r10,[rbp - 1504]
      imul	r10,8
      mov	[rbp - 1504],r10
      mov	r10,[rbp - 776]
      mov	r11,[sjtulcoutputBuffer]
      add	r11,[rbp - 1504]
      mov	[r11],r10
      mov	rax,[sjtulcoutputBuffer]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
computeSHA1:
      push	rbp
      mov	rbp,rsp
      sub	rsp,184
      mov	[rbp - 8],rdi
      mov	qword[rbp - 16],0
      jmp	_8whilecheck
_8for:
      mov	r10,[rbp - 16]
      add	r10,1
      mov	[rbp - 40],r10
      mov	r10,[rbp - 40]
      imul	r10,8
      mov	[rbp - 40],r10
      mov	rdi,[rbp-8]
      mov	rsi,[rbp-16]
      call	string.ord
      mov	[rbp -  48],rax
      mov	r10,[rbp - 48]
      mov	r11,[sjtulcinputBuffer]
      add	r11,[rbp - 40]
      mov	[r11],r10
_8while:
      mov	r10,[rbp - 16]
      mov	[rbp - 56],r10
      mov	r10,[rbp - 16]
      add	r10,1
      mov	[rbp - 16],r10
_8whilecheck:
      mov	rdi,[rbp-8]
      call	string.length
      mov	[rbp -  64],rax
      mov	r10,[rbp - 16]
      cmp	r10,[rbp - 64]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 72],r10
      mov	r10,[rbp -  72]
      cmp	r10,1
      je	_8for
_8forback:
      mov	rdi,[rbp-8]
      call	string.length
      mov	[rbp -  88],rax
      mov	rdi,[sjtulcinputBuffer]
      mov	rsi,[rbp-88]
      call	sha1
      mov	[rbp -  96],rax
      mov	r10,[rbp - 96]
      mov	[rbp - 80],r10
      mov	qword[rbp - 16],0
      jmp	_9whilecheck
_9for:
      mov	r10,[rbp - 16]
      add	r10,1
      mov	[rbp - 120],r10
      mov	r10,[rbp - 120]
      imul	r10,8
      mov	[rbp - 120],r10
      mov	r10,[rbp - 80]
      add	r10,[rbp - 120]
      mov	rdi,[r10]
      call	toStringHex
      mov	[rbp -  128],rax
      mov	rdi,[rbp-128]
      mov	rax,0
      call	print
      mov	[rbp -  136],rax
_9while:
      mov	r10,[rbp - 16]
      mov	[rbp - 144],r10
      mov	r10,[rbp - 16]
      add	r10,1
      mov	[rbp - 16],r10
_9whilecheck:
      mov	r10,[rbp - 80]
      add	r10,0
      mov	r10,[r10]
      add	r10,0
      mov	[rbp - 152],r10
      mov	r10,[rbp - 16]
      cmp	r10,[rbp - 152]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 160],r10
      mov	r10,[rbp -  160]
      cmp	r10,1
      je	_9for
_9forback:
      mov	rdi,256
      call	malloc
      mov	byte[rax + 0],0
      mov	[rbp - 168],rax
      mov	rdi,[rbp-168]
      mov	rax,0
      call	println
      mov	[rbp -  176],rax
      mov	rsp,rbp
      pop rbp
      ret
nextLetter:
      push	rbp
      mov	rbp,rsp
      sub	rsp,56
      mov	[rbp - 8],rdi
      mov	r10,[rbp - 8]
      cmp	r10,122
      sete r10b
      movzx r10,r10b
      mov	[rbp - 24],r10
      mov	 r10,[rbp-24]
      cmp	 r10,0
      je	_11else
_11if:
      mov	r10,1
      not	r10
      add	r10,1
      mov	[rbp - 16],r10
      mov	rax,[rbp -  16]
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_11ifback
_11else:
_11ifback:
      mov	r10,[rbp - 8]
      cmp	r10,90
      sete r10b
      movzx r10,r10b
      mov	[rbp - 32],r10
      mov	 r10,[rbp-32]
      cmp	 r10,0
      je	_12else
_12if:
      mov	rax,97
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_12ifback
_12else:
_12ifback:
      mov	r10,[rbp - 8]
      cmp	r10,57
      sete r10b
      movzx r10,r10b
      mov	[rbp - 40],r10
      mov	 r10,[rbp-40]
      cmp	 r10,0
      je	_13else
_13if:
      mov	rax,65
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_13ifback
_13else:
_13ifback:
      mov	r10,[rbp - 8]
      add	r10,1
      mov	[rbp - 48],r10
      mov	rax,[rbp -  48]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
nextText:
      push	rbp
      mov	rbp,rsp
      sub	rsp,176
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	r10,[rbp - 16]
      sub	r10,1
      mov	[rbp - 160],r10
      mov	r10,[rbp - 160]
      mov	[rbp - 24],r10
      jmp	_10whilecheck
_10for:
      mov	r10,[rbp - 24]
      add	r10,1
      mov	[rbp - 48],r10
      mov	r10,[rbp - 48]
      imul	r10,8
      mov	[rbp - 48],r10
      mov	r10,[rbp - 24]
      add	r10,1
      mov	[rbp - 72],r10
      mov	r10,[rbp - 72]
      imul	r10,8
      mov	[rbp - 72],r10
      mov	r10,[rbp - 8]
      add	r10,[rbp - 72]
      mov	rdi,[r10]
      call	nextLetter
      mov	[rbp -  80],rax
      mov	r10,[rbp - 80]
      mov	r11,[rbp - 8]
      add	r11,[rbp - 48]
      mov	[r11],r10
      mov	r10,[rbp - 24]
      add	r10,1
      mov	[rbp - 128],r10
      mov	r10,[rbp - 128]
      imul	r10,8
      mov	[rbp - 128],r10
      mov	r10,1
      not	r10
      add	r10,1
      mov	[rbp - 136],r10
      mov	r11,[rbp - 8]
      add	r11,[rbp - 128]
      mov	r10,[r11]
      cmp	r10,[rbp - 136]
      sete r10b
      movzx r10,r10b
      mov	[rbp - 144],r10
      mov	 r10,[rbp-144]
      cmp	 r10,0
      je	_14else
_14if:
      mov	r10,[rbp - 24]
      add	r10,1
      mov	[rbp - 104],r10
      mov	r10,[rbp - 104]
      imul	r10,8
      mov	[rbp - 104],r10
      mov	r11,[rbp - 8]
      add	r11,[rbp - 104]
      mov	qword[r11],48
      jmp	_14ifback
_14else:
      mov	rax,1
      mov	rsp,rbp
      pop rbp
      ret
_14ifback:
_10while:
      mov	r10,[rbp - 24]
      mov	[rbp - 152],r10
      mov	r10,[rbp - 24]
      sub	r10,1
      mov	[rbp - 24],r10
_10whilecheck:
      mov	r10,[rbp - 24]
      cmp	r10,0
      setge r10b
      movzx r10,r10b
      mov	[rbp - 168],r10
      mov	r10,[rbp -  168]
      cmp	r10,1
      je	_10for
_10forback:
      mov	rax,0
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
array_equal:
      push	rbp
      mov	rbp,rsp
      sub	rsp,136
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	r10,[rbp - 8]
      add	r10,0
      mov	r10,[r10]
      add	r10,0
      mov	[rbp - 24],r10
      mov	r10,[rbp - 16]
      add	r10,0
      mov	r10,[r10]
      add	r10,0
      mov	[rbp - 32],r10
      mov	r10,[rbp - 24]
      cmp	r10,[rbp - 32]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 40],r10
      mov	 r10,[rbp-40]
      cmp	 r10,0
      je	_15else
_15if:
      mov	rax,0
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_15ifback
_15else:
_15ifback:
      mov	qword[rbp - 48],0
      jmp	_11whilecheck
_11for:
      mov	r10,[rbp - 48]
      add	r10,1
      mov	[rbp - 72],r10
      mov	r10,[rbp - 72]
      imul	r10,8
      mov	[rbp - 72],r10
      mov	r10,[rbp - 48]
      add	r10,1
      mov	[rbp - 96],r10
      mov	r10,[rbp - 96]
      imul	r10,8
      mov	[rbp - 96],r10
      mov	r11,[rbp - 8]
      add	r11,[rbp - 72]
      mov	r10,[r11]
      mov	r11,[rbp - 16]
      add	r11,[rbp - 96]
      cmp	r10,[r11]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 104],r10
      mov	 r10,[rbp-104]
      cmp	 r10,0
      je	_16else
_16if:
      mov	rax,0
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_16ifback
_16else:
_16ifback:
_11while:
      mov	r10,[rbp - 48]
      mov	[rbp - 112],r10
      mov	r10,[rbp - 48]
      add	r10,1
      mov	[rbp - 48],r10
_11whilecheck:
      mov	r10,[rbp - 8]
      add	r10,0
      mov	r10,[r10]
      add	r10,0
      mov	[rbp - 120],r10
      mov	r10,[rbp - 48]
      cmp	r10,[rbp - 120]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 128],r10
      mov	r10,[rbp -  128]
      cmp	r10,1
      je	_11for
_11forback:
      mov	rax,1
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
crackSHA1:
      push	rbp
      mov	rbp,rsp
      sub	rsp,472
      mov	[rbp - 8],rdi
      mov	r10,5
      add	r10,1
      mov	[rbp - 24],r10
      mov	r10,[rbp - 24]
      imul	r10,8
      mov	[rbp - 24],r10
      mov	rdi,[rbp-24]
      call	malloc
      mov	[rbp -  32],rax
      mov	r11,[rbp - 32]
      add	r11,0
      mov	qword[r11],5
      mov	r10,[rbp - 32]
      mov	[rbp - 16],r10
      mov	rdi,[rbp-8]
      call	string.length
      mov	[rbp -  56],rax
      mov	r10,[rbp - 56]
      cmp	r10,40
      setne r10b
      movzx r10,r10b
      mov	[rbp - 64],r10
      mov	 r10,[rbp-64]
      cmp	 r10,0
      je	_17else
_17if:
      mov	rdi,256
      call	malloc
      mov	byte[rax + 0],'I'
      mov	byte[rax + 1],'n'
      mov	byte[rax + 2],'v'
      mov	byte[rax + 3],'a'
      mov	byte[rax + 4],'l'
      mov	byte[rax + 5],'i'
      mov	byte[rax + 6],'d'
      mov	byte[rax + 7],' '
      mov	byte[rax + 8],'i'
      mov	byte[rax + 9],'n'
      mov	byte[rax + 10],'p'
      mov	byte[rax + 11],'u'
      mov	byte[rax + 12],'t'
      mov	byte[rax + 13],0
      mov	[rbp - 40],rax
      mov	rdi,[rbp-40]
      mov	rax,0
      call	println
      mov	[rbp -  48],rax
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_17ifback
_17else:
_17ifback:
      mov	qword[rbp - 72],0
      jmp	_12whilecheck
_12for:
      mov	r10,[rbp - 72]
      add	r10,1
      mov	[rbp - 96],r10
      mov	r10,[rbp - 96]
      imul	r10,8
      mov	[rbp - 96],r10
      mov	r11,[rbp - 16]
      add	r11,[rbp - 96]
      mov	qword[r11],0
_12while:
      mov	r10,[rbp - 72]
      mov	[rbp - 104],r10
      mov	r10,[rbp - 72]
      add	r10,1
      mov	[rbp - 72],r10
_12whilecheck:
      mov	r10,[rbp - 72]
      cmp	r10,5
      setl r10b
      movzx r10,r10b
      mov	[rbp - 112],r10
      mov	r10,[rbp -  112]
      cmp	r10,1
      je	_12for
_12forback:
      mov	qword[rbp - 72],0
      jmp	_13whilecheck
_13for:
      mov	eax,[rbp - 72]
      mov	r10d,8
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 136],rax
      mov	r10,[rbp - 136]
      add	r10,1
      mov	[rbp - 144],r10
      mov	r10,[rbp - 144]
      imul	r10,8
      mov	[rbp - 144],r10
      mov	eax,[rbp - 72]
      mov	r10d,8
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 168],rax
      mov	r10,[rbp - 168]
      add	r10,1
      mov	[rbp - 176],r10
      mov	r10,[rbp - 176]
      imul	r10,8
      mov	[rbp - 176],r10
      mov	r10,[rbp - 72]
      add	r10,3
      mov	[rbp - 184],r10
      mov	rdi,[rbp-8]
      mov	rsi,[rbp-72]
      mov	rdx,[rbp-184]
      call	string.substring
      mov	[rbp -  192],rax
      mov	rdi,[rbp-192]
      call	hex2int
      mov	[rbp -  200],rax
      mov	eax,[rbp - 72]
      mov	r10d,4
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 208],rax
      mov	eax,[rbp - 208]
      mov	r10d,2
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 216],rdx
      mov	r10,1
      sub	r10,[rbp - 216]
      mov	[rbp - 224],r10
      mov	r10,[rbp - 224]
      imul	r10,16
      mov	[rbp - 232],r10
      mov	r10,[rbp - 200]
      mov	cl,[rbp - 232]
      sal	r10,cl
      mov	[rbp - 240],r10
      mov	r11,[rbp - 16]
      add	r11,[rbp - 176]
      mov	r10,[r11]
      or	r10,[rbp - 240]
_33check:
      mov	[rbp - 248],r10
      mov	r10,[rbp - 248]
      mov	r11,[rbp - 16]
      add	r11,[rbp - 144]
      mov	[r11],r10
_13while:
      mov	r10,[rbp - 72]
      add	r10,4
      mov	[rbp - 256],r10
      mov	r10,[rbp - 256]
      mov	[rbp - 72],r10
_13whilecheck:
      mov	r10,[rbp - 72]
      cmp	r10,40
      setl r10b
      movzx r10,r10b
      mov	[rbp - 264],r10
      mov	r10,[rbp -  264]
      cmp	r10,1
      je	_13for
_13forback:
      mov	qword[rbp - 272],4
      mov	qword[rbp - 280],1
      jmp	_14whilecheck
_14for:
      mov	qword[rbp - 72],0
      jmp	_15whilecheck
_15for:
      mov	r10,[rbp - 72]
      add	r10,1
      mov	[rbp - 304],r10
      mov	r10,[rbp - 304]
      imul	r10,8
      mov	[rbp - 304],r10
      mov	r11,[sjtulcinputBuffer]
      add	r11,[rbp - 304]
      mov	qword[r11],48
_15while:
      mov	r10,[rbp - 72]
      mov	[rbp - 312],r10
      mov	r10,[rbp - 72]
      add	r10,1
      mov	[rbp - 72],r10
_15whilecheck:
      mov	r10,[rbp - 72]
      cmp	r10,[rbp - 280]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 320],r10
      mov	r10,[rbp -  320]
      cmp	r10,1
      je	_15for
_15forback:
      jmp	_16while
_16for:
      mov	rdi,[sjtulcinputBuffer]
      mov	rsi,[rbp-280]
      call	sha1
      mov	[rbp -  336],rax
      mov	r10,[rbp - 336]
      mov	[rbp - 328],r10
      mov	rdi,[rbp-328]
      mov	rsi,[rbp-16]
      call	array_equal
      mov	[rbp -  416],rax
      mov	 r10,[rbp-416]
      cmp	 r10,0
      je	_18else
_18if:
      mov	qword[rbp - 72],0
      jmp	_17whilecheck
_17for:
      mov	r10,[rbp - 72]
      add	r10,1
      mov	[rbp - 360],r10
      mov	r10,[rbp - 360]
      imul	r10,8
      mov	[rbp - 360],r10
      mov	r10,[sjtulcinputBuffer]
      add	r10,[rbp - 360]
      mov	rdi,[r10]
      call	int2chr
      mov	[rbp -  368],rax
      mov	rdi,[rbp-368]
      mov	rax,0
      call	print
      mov	[rbp -  376],rax
_17while:
      mov	r10,[rbp - 72]
      mov	[rbp - 384],r10
      mov	r10,[rbp - 72]
      add	r10,1
      mov	[rbp - 72],r10
_17whilecheck:
      mov	r10,[rbp - 72]
      cmp	r10,[rbp - 280]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 392],r10
      mov	r10,[rbp -  392]
      cmp	r10,1
      je	_17for
_17forback:
      mov	rdi,256
      call	malloc
      mov	byte[rax + 0],0
      mov	[rbp - 400],rax
      mov	rdi,[rbp-400]
      mov	rax,0
      call	println
      mov	[rbp -  408],rax
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_18ifback
_18else:
_18ifback:
      mov	rdi,[sjtulcinputBuffer]
      mov	rsi,[rbp-280]
      call	nextText
      mov	[rbp -  424],rax
      mov	r10,[rbp -  424]
      xor	r10,1
      mov	[rbp - 432],r10
      mov	 r10,[rbp-432]
      cmp	 r10,0
      je	_19else
_19if:
      jmp	_16forback
      jmp	_19ifback
_19else:
_19ifback:
_16while:
      mov	r10,1
      cmp	r10,1
      je	_16for
_16forback:
_14while:
      mov	r10,[rbp - 280]
      mov	[rbp - 440],r10
      mov	r10,[rbp - 280]
      add	r10,1
      mov	[rbp - 280],r10
_14whilecheck:
      mov	r10,[rbp - 280]
      cmp	r10,[rbp - 272]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 448],r10
      mov	r10,[rbp -  448]
      cmp	r10,1
      je	_14for
_14forback:
      mov	rdi,256
      call	malloc
      mov	byte[rax + 0],'N'
      mov	byte[rax + 1],'o'
      mov	byte[rax + 2],'t'
      mov	byte[rax + 3],' '
      mov	byte[rax + 4],'F'
      mov	byte[rax + 5],'o'
      mov	byte[rax + 6],'u'
      mov	byte[rax + 7],'n'
      mov	byte[rax + 8],'d'
      mov	byte[rax + 9],'!'
      mov	byte[rax + 10],0
      mov	[rbp - 456],rax
      mov	rdi,[rbp-456]
      mov	rax,0
      call	println
      mov	[rbp -  464],rax
      mov	rsp,rbp
      pop rbp
      ret
main:
      push	rbp
      mov	rbp,rsp
      sub	rsp,88
      mov	rdi,256
      call	malloc
      mov	byte[rax + 0],' '
      mov	byte[rax + 1],'!'
      mov	byte[rax + 2],34
      mov	byte[rax + 3],'#'
      mov	byte[rax + 4],'$'
      mov	byte[rax + 5],'%'
      mov	byte[rax + 6],'&'
      mov	byte[rax + 7],39
      mov	byte[rax + 8],'('
      mov	byte[rax + 9],')'
      mov	byte[rax + 10],'*'
      mov	byte[rax + 11],'+'
      mov	byte[rax + 12],','
      mov	byte[rax + 13],'-'
      mov	byte[rax + 14],'.'
      mov	byte[rax + 15],'/'
      mov	byte[rax + 16],'0'
      mov	byte[rax + 17],'1'
      mov	byte[rax + 18],'2'
      mov	byte[rax + 19],'3'
      mov	byte[rax + 20],'4'
      mov	byte[rax + 21],'5'
      mov	byte[rax + 22],'6'
      mov	byte[rax + 23],'7'
      mov	byte[rax + 24],'8'
      mov	byte[rax + 25],'9'
      mov	byte[rax + 26],':'
      mov	byte[rax + 27],';'
      mov	byte[rax + 28],'<'
      mov	byte[rax + 29],'='
      mov	byte[rax + 30],'>'
      mov	byte[rax + 31],'?'
      mov	byte[rax + 32],'@'
      mov	byte[rax + 33],'A'
      mov	byte[rax + 34],'B'
      mov	byte[rax + 35],'C'
      mov	byte[rax + 36],'D'
      mov	byte[rax + 37],'E'
      mov	byte[rax + 38],'F'
      mov	byte[rax + 39],'G'
      mov	byte[rax + 40],'H'
      mov	byte[rax + 41],'I'
      mov	byte[rax + 42],'J'
      mov	byte[rax + 43],'K'
      mov	byte[rax + 44],'L'
      mov	byte[rax + 45],'M'
      mov	byte[rax + 46],'N'
      mov	byte[rax + 47],'O'
      mov	byte[rax + 48],'P'
      mov	byte[rax + 49],'Q'
      mov	byte[rax + 50],'R'
      mov	byte[rax + 51],'S'
      mov	byte[rax + 52],'T'
      mov	byte[rax + 53],'U'
      mov	byte[rax + 54],'V'
      mov	byte[rax + 55],'W'
      mov	byte[rax + 56],'X'
      mov	byte[rax + 57],'Y'
      mov	byte[rax + 58],'Z'
      mov	byte[rax + 59],'['
      mov	byte[rax + 60],92
      mov	byte[rax + 61],']'
      mov	byte[rax + 62],'^'
      mov	byte[rax + 63],'_'
      mov	byte[rax + 64],'`'
      mov	byte[rax + 65],'a'
      mov	byte[rax + 66],'b'
      mov	byte[rax + 67],'c'
      mov	byte[rax + 68],'d'
      mov	byte[rax + 69],'e'
      mov	byte[rax + 70],'f'
      mov	byte[rax + 71],'g'
      mov	byte[rax + 72],'h'
      mov	byte[rax + 73],'i'
      mov	byte[rax + 74],'j'
      mov	byte[rax + 75],'k'
      mov	byte[rax + 76],'l'
      mov	byte[rax + 77],'m'
      mov	byte[rax + 78],'n'
      mov	byte[rax + 79],'o'
      mov	byte[rax + 80],'p'
      mov	byte[rax + 81],'q'
      mov	byte[rax + 82],'r'
      mov	byte[rax + 83],'s'
      mov	byte[rax + 84],'t'
      mov	byte[rax + 85],'u'
      mov	byte[rax + 86],'v'
      mov	byte[rax + 87],'w'
      mov	byte[rax + 88],'x'
      mov	byte[rax + 89],'y'
      mov	byte[rax + 90],'z'
      mov	byte[rax + 91],'{'
      mov	byte[rax + 92],'|'
      mov	byte[rax + 93],'}'
      mov	byte[rax + 94],'~'
      mov	byte[rax + 95],0
      mov	[rbp - 8],rax
      mov	r10,[rbp - 8]
      mov	[sjtulcasciiTable],r10
      mov	qword[sjtulcMAXCHUNK],100
      mov	r10,[sjtulcMAXCHUNK]
      sub	r10,1
      mov	[rbp - 8],r10
      mov	r10,[rbp - 8]
      imul	r10,64
      mov	[rbp - 16],r10
      mov	r10,[rbp - 16]
      sub	r10,16
      mov	[rbp - 24],r10
      mov	r10,[rbp - 24]
      mov	[sjtulcMAXLENGTH],r10
      mov	r10,[sjtulcMAXCHUNK]
      add	r10,1
      mov	[rbp - 32],r10
      mov	r10,[rbp - 32]
      imul	r10,8
      mov	[rbp - 32],r10
      mov	rdi,[rbp-32]
      call	malloc
      mov	[rbp -  40],rax
      mov	r11,[rbp - 40]
      add	r11,0
      mov	r10,[sjtulcMAXCHUNK]
      mov	qword[r11],r10
      mov	r10,[rbp - 40]
      mov	[rbp - 56],r10
      mov	qword[rbp - 48],0
_0arr:
      mov	r10,[rbp - 48]
      add	r10,1
      mov	[rbp - 48],r10
      mov	r10,[rbp - 40]
      add	r10,8
      mov	[rbp - 40],r10
      mov	r10,80
      add	r10,1
      mov	[rbp - 64],r10
      mov	r10,[rbp - 64]
      imul	r10,8
      mov	[rbp - 64],r10
      mov	rdi,[rbp-64]
      call	malloc
      mov	[rbp -  72],rax
      mov	r11,[rbp - 72]
      add	r11,0
      mov	qword[r11],80
      mov	r10,[rbp - 72]
      mov	r11,[rbp - 40]
      add	r11,0
      mov	[r11],r10
      mov	r10,[rbp - 48]
      cmp	r10,[sjtulcMAXCHUNK]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 80],r10
      mov	r10,[rbp - 80]
      cmp	r10,1
      je	_0arr
      mov	r10,[rbp - 56]
      mov	[sjtulcchunks],r10
      mov	r10,[sjtulcMAXLENGTH]
      add	r10,1
      mov	[rbp - 88],r10
      mov	r10,[rbp - 88]
      imul	r10,8
      mov	[rbp - 88],r10
      mov	rdi,[rbp-88]
      call	malloc
      mov	[rbp -  96],rax
      mov	r11,[rbp - 96]
      add	r11,0
      mov	r10,[sjtulcMAXLENGTH]
      mov	qword[r11],r10
      mov	r10,[rbp - 96]
      mov	[sjtulcinputBuffer],r10
      mov	r10,5
      add	r10,1
      mov	[rbp - 104],r10
      mov	r10,[rbp - 104]
      imul	r10,8
      mov	[rbp - 104],r10
      mov	rdi,[rbp-104]
      call	malloc
      mov	[rbp -  112],rax
      mov	r11,[rbp - 112]
      add	r11,0
      mov	qword[r11],5
      mov	r10,[rbp - 112]
      mov	[sjtulcoutputBuffer],r10
      jmp	_18while
_18for:
      call	getInt
      mov	[rbp -  24],rax
      mov	r10,[rbp - 24]
      mov	[rbp - 8],r10
      mov	r10,[rbp - 8]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov	[rbp - 32],r10
      mov	 r10,[rbp-32]
      cmp	 r10,0
      je	_20else
_20if:
      jmp	_18forback
      jmp	_20ifback
_20else:
_20ifback:
      mov	r10,[rbp - 8]
      cmp	r10,1
      sete r10b
      movzx r10,r10b
      mov	[rbp - 80],r10
      mov	 r10,[rbp-80]
      cmp	 r10,0
      je	_21else
_21if:
      call	getString
      mov	[rbp -  40],rax
      mov	r10,[rbp - 40]
      mov	[rbp - 16],r10
      mov	rdi,[rbp-16]
      call	computeSHA1
      mov	[rbp -  48],rax
      jmp	_21ifback
_21else:
      mov	r10,[rbp - 8]
      cmp	r10,2
      sete r10b
      movzx r10,r10b
      mov	[rbp - 72],r10
      mov	 r10,[rbp-72]
      cmp	 r10,0
      je	_22else
_22if:
      call	getString
      mov	[rbp -  56],rax
      mov	r10,[rbp - 56]
      mov	[rbp - 16],r10
      mov	rdi,[rbp-16]
      call	crackSHA1
      mov	[rbp -  64],rax
      jmp	_22ifback
_22else:
_22ifback:
_21ifback:
_18while:
      mov	r10,1
      cmp	r10,1
      je	_18for
_18forback:
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

sjtulcasciiTable:
	dq 0
sjtulcMAXCHUNK:
	dq 0
sjtulcMAXLENGTH:
	dq 0
sjtulcchunks:
	dq 0
sjtulcinputBuffer:
	dq 0
sjtulcoutputBuffer:
	dq 0
section .bss
stringbuffer:
	resb 256

