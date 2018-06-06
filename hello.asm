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
      mov 	r14,rdi
      mov 	r9,0
      mov 	r15,0
      jmp	_0whilecheck
_0for:
      mov 	rdi,r14
      mov 	rsi,r15
      push	r14
      push	r15
      push	r9
      call	string.ord
      pop	r9
      pop	r15
      pop	r14
      mov 	r12,rax
      mov 	r10,r12
      mov 	r8,r10
      mov 	r10,r8
      cmp	r10,48
      setge r10b
      movzx r10,r10b
      mov 	r13,r10
      mov 	r10,r13
      cmp	r10,0
      je	_0check
      mov 	r10,r8
      cmp	r10,57
      setle r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r13
      and 	r10,r12
_0check:
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_0else
_0if:
      mov 	r10,r9
      imul	r10,16
      mov 	r12,r10
      mov 	r10,r12
      add 	r10,r8
      mov 	r12,r10
      mov 	r10,r12
      sub	r10,48
      mov 	r12,r10
      mov 	r10,r12
      mov 	r9,r10
      jmp	_0ifback
_0else:
      mov 	r10,r8
      cmp	r10,65
      setge r10b
      movzx r10,r10b
      mov 	r13,r10
      mov 	r10,r13
      cmp	r10,0
      je	_1check
      mov 	r10,r8
      cmp	r10,70
      setle r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r13
      and 	r10,r12
_1check:
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_1else
_1if:
      mov 	r10,r9
      imul	r10,16
      mov 	r12,r10
      mov 	r10,r12
      add 	r10,r8
      mov 	r12,r10
      mov 	r10,r12
      sub	r10,65
      mov 	r12,r10
      mov 	r10,r12
      add	r10,10
      mov 	r12,r10
      mov 	r10,r12
      mov 	r9,r10
      jmp	_1ifback
_1else:
      mov 	r10,r8
      cmp	r10,97
      setge r10b
      movzx r10,r10b
      mov 	r13,r10
      mov 	r10,r13
      cmp	r10,0
      je	_2check
      mov 	r10,r8
      cmp	r10,102
      setle r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r13
      and 	r10,r12
_2check:
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_2else
_2if:
      mov 	r10,r9
      imul	r10,16
      mov 	r12,r10
      mov 	r10,r12
      add 	r10,r8
      mov 	r12,r10
      mov 	r10,r12
      sub	r10,97
      mov 	r12,r10
      mov 	r10,r12
      add	r10,10
      mov 	r12,r10
      mov 	r10,r12
      mov 	r9,r10
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
      mov 	r10,r15
      mov 	r12,r10
      mov 	r10,r15
      add	r10,1
      mov 	r15,r10
_0whilecheck:
      mov 	rdi,r14
      push	r14
      push	r15
      push	r9
      call	string.length
      pop	r9
      pop	r15
      pop	r14
      mov 	r12,rax
      mov 	r10,r15
      cmp 	r10,r12
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_0for
_0forback:
      mov 	rax,r9
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
int2chr:
      push	rbp
      mov	rbp,rsp
      sub	rsp,72
      mov 	r14,rdi
      mov 	r10,r14
      cmp	r10,32
      setge r10b
      movzx r10,r10b
      mov 	r13,r10
      mov 	r10,r13
      cmp	r10,0
      je	_3check
      mov 	r10,r14
      cmp	r10,126
      setle r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r13
      and 	r10,r12
_3check:
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_3else
_3if:
      mov 	r10,r14
      sub	r10,32
      mov 	r13,r10
      mov 	r10,r14
      sub	r10,32
      mov 	r12,r10
      mov	rdi,[sjtulcasciiTable]
      mov 	rsi,r13
      mov 	rdx,r12
      call	string.substring
      mov 	r12,rax
      mov 	rax,r12
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_3ifback
_3else:
_3ifback:
      mov 	r12,lcstr1
      mov 	rax,r12
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
      mov 	r14,rdi
      mov 	r12,lcstr2
      mov 	r10,r12
      mov 	r8,r10
      mov 	r15,28
      jmp	_1whilecheck
_1for:
      mov 	r10,r14
      mov 	rcx,r15
      sar	r10,cl
      mov	r12,r10
      mov 	r10,r12
      and	r10,15
_4check:
      mov 	r12,r10
      mov 	r10,r12
      mov 	r13,r10
      mov 	r10,r13
      cmp	r10,10
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_4else
_4if:
      mov	r10,48
      add 	r10,r13
      mov 	r12,r10
      mov 	rdi,r12
      push	r13
      push	r14
      push	r15
      push	r8
      call	int2chr
      pop	r8
      pop	r15
      pop	r14
      pop	r13
      mov 	r12,rax
      mov 	rdi,r8
      mov 	rsi,r12
      push	r13
      push	r14
      push	r15
      call	string.add
      pop	r15
      pop	r14
      pop	r13
      mov 	r12,rax
      mov 	r10,r12
      mov 	r8,r10
      jmp	_4ifback
_4else:
      mov	r10,65
      add 	r10,r13
      mov 	r12,r10
      mov 	r10,r12
      sub	r10,10
      mov 	r12,r10
      mov 	rdi,r12
      push	r14
      push	r15
      push	r8
      call	int2chr
      pop	r8
      pop	r15
      pop	r14
      mov 	r12,rax
      mov 	rdi,r8
      mov 	rsi,r12
      push	r14
      push	r15
      call	string.add
      pop	r15
      pop	r14
      mov 	r12,rax
      mov 	r10,r12
      mov 	r8,r10
_4ifback:
_1while:
      mov 	r10,r15
      sub	r10,4
      mov 	r12,r10
      mov 	r10,r12
      mov 	r15,r10
_1whilecheck:
      mov 	r10,r15
      cmp	r10,0
      setge r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_1for
_1forback:
      mov 	rax,r8
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
      mov 	r14,rdi
      mov 	r15,rsi
      mov 	r10,r15
      cmp	r10,1
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_5else
_5if:
      mov 	r10,r14
      and	r10,2147483647
_5check:
      mov 	r12,r10
      mov 	r10,r12
      sal	r10,1
      mov 	r13,r10
      mov 	r10,r14
      sar	r10,31
      mov	r12,r10
      mov 	r10,r12
      and	r10,1
_6check:
      mov 	r12,r10
      mov 	r10,r13
      or 	r10,r12
_7check:
      mov 	r12,r10
      mov 	rax,r12
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_5ifback
_5else:
_5ifback:
      mov 	r10,r15
      cmp	r10,31
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_6else
_6if:
      mov 	r10,r14
      and	r10,1
_8check:
      mov 	r12,r10
      mov 	r10,r12
      sal	r10,31
      mov 	r13,r10
      mov 	r10,r14
      sar	r10,1
      mov	r12,r10
      mov 	r10,r12
      and	r10,2147483647
_9check:
      mov 	r12,r10
      mov 	r10,r13
      or 	r10,r12
_10check:
      mov 	r12,r10
      mov 	rax,r12
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_6ifback
_6else:
_6ifback:
      mov	r10,32
      sub 	r10,r15
      mov 	r12,r10
      mov	r10,1
      mov 	rcx,r12
      sal	r10,cl
      mov 	r12,r10
      mov 	r10,r12
      sub	r10,1
      mov 	r12,r10
      mov 	r10,r14
      and 	r10,r12
_11check:
      mov 	r12,r10
      mov 	r10,r12
      mov 	rcx,r15
      sal	r10,cl
      mov 	r8,r10
      mov	r10,32
      sub 	r10,r15
      mov 	r12,r10
      mov 	r10,r14
      mov 	rcx,r12
      sar	r10,cl
      mov	r13,r10
      mov	r10,1
      mov 	rcx,r15
      sal	r10,cl
      mov 	r12,r10
      mov 	r10,r12
      sub	r10,1
      mov 	r12,r10
      mov 	r10,r13
      and 	r10,r12
_12check:
      mov 	r12,r10
      mov 	r10,r8
      or 	r10,r12
_13check:
      mov 	r12,r10
      mov 	rax,r12
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
      mov 	r13,rdi
      mov 	r15,rsi
      mov 	r10,r13
      and	r10,65535
_14check:
      mov 	r12,r10
      mov 	r10,r15
      and	r10,65535
_15check:
      mov 	r14,r10
      mov 	r10,r12
      add 	r10,r14
      mov 	r12,r10
      mov 	r10,r12
      mov 	r14,r10
      mov 	r10,r13
      sar	r10,16
      mov	r12,r10
      mov 	r10,r12
      and	r10,65535
_16check:
      mov 	r13,r10
      mov 	r10,r15
      sar	r10,16
      mov	r12,r10
      mov 	r10,r12
      and	r10,65535
_17check:
      mov 	r12,r10
      mov 	r10,r13
      add 	r10,r12
      mov 	r13,r10
      mov 	r10,r14
      sar	r10,16
      mov	r12,r10
      mov 	r10,r13
      add 	r10,r12
      mov 	r12,r10
      mov 	r10,r12
      and	r10,65535
_18check:
      mov 	r12,r10
      mov 	r10,r12
      mov 	r12,r10
      mov 	r10,r12
      sal	r10,16
      mov 	r13,r10
      mov 	r10,r14
      and	r10,65535
_19check:
      mov 	r12,r10
      mov 	r10,r13
      or 	r10,r12
_20check:
      mov 	r12,r10
      mov 	rax,r12
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
      mov 	r13,rdi
      mov 	r12,rsi
      mov 	r10,r12
      sal	r10,16
      mov 	r12,r10
      mov 	r10,r13
      or 	r10,r12
_21check:
      mov 	r12,r10
      mov 	rax,r12
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
sha1:
      push	rbp
      mov	rbp,rsp
      sub	rsp,1400
      mov 	rcx,rdi
      mov 	rbx,rsi
      mov 	r10,rbx
      add	r10,64
      mov 	r12,r10
      mov 	r10,r12
      sub	r10,56
      mov 	r12,r10
      mov 	rax,r12
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rax,eax
      mov	r12,rax
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      mov	[rbp - 24],r10
      mov	r10,[rbp - 24]
      cmp	r10,[sjtulcMAXCHUNK]
      setg r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_7else
_7if:
      mov 	r12,lcstr3
      mov 	rdi,r12
      mov	rax,0
      call	println
      mov 	r12,rax
      mov	rax,0
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_7ifback
_7else:
_7ifback:
      mov	qword[rbp - 88],0
      jmp	_2whilecheck
_2for:
      mov	qword[rbp - 96],0
      jmp	_3whilecheck
_3for:
      mov	r10,[rbp - 88]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[rbp - 96]
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov	r11,[sjtulcchunks]
      add	r11,r12
      mov	r11,[r11]
      add	r11,r13
      mov	qword[r11],0
_3while:
      mov	r10,[rbp - 96]
      mov 	r12,r10
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 96],r10
_3whilecheck:
      mov	r10,[rbp - 96]
      cmp	r10,80
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_3for
_3forback:
_2while:
      mov	r10,[rbp - 88]
      mov 	r12,r10
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 88],r10
_2whilecheck:
      mov	r10,[rbp - 88]
      cmp	r10,[rbp - 24]
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_2for
_2forback:
      mov	qword[rbp - 88],0
      jmp	_4whilecheck
_4for:
      mov	eax,[rbp - 88]
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rax,eax
      mov	r12,rax
      mov 	r10,r12
      add	r10,1
      mov 	r8,r10
      mov 	r10,r8
      imul	r10,8
      mov 	r8,r10
      mov	eax,[rbp - 88]
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov 	rax,r12
      mov	r10d,4
      cdq
      idiv r10d
      movsx	rax,eax
      mov	r12,rax
      mov 	r10,r12
      add	r10,1
      mov 	r15,r10
      mov 	r10,r15
      imul	r10,8
      mov 	r15,r10
      mov	eax,[rbp - 88]
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rax,eax
      mov	r12,rax
      mov 	r10,r12
      add	r10,1
      mov 	r14,r10
      mov 	r10,r14
      imul	r10,8
      mov 	r14,r10
      mov	eax,[rbp - 88]
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov 	rax,r12
      mov	r10d,4
      cdq
      idiv r10d
      movsx	rax,eax
      mov	r12,rax
      mov 	r10,r12
      add	r10,1
      mov 	r9,r10
      mov 	r10,r9
      imul	r10,8
      mov 	r9,r10
      mov	r10,[rbp - 88]
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov	eax,[rbp - 88]
      mov	r10d,4
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov	r10,3
      sub 	r10,r12
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,rcx
      add	r10,r13
      mov	r10,[r10]
      mov 	rcx,r12
      sal	r10,cl
      mov 	r12,r10
      mov	r11,[sjtulcchunks]
      add	r11,r14
      mov	r11,[r11]
      add	r11,r9
      mov	r10,[r11]
      or 	r10,r12
_22check:
      mov 	r12,r10
      mov 	r10,r12
      mov	r11,[sjtulcchunks]
      add	r11,r8
      mov	r11,[r11]
      add	r11,r15
      mov	[r11],r10
_4while:
      mov	r10,[rbp - 88]
      mov 	r12,r10
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 88],r10
_4whilecheck:
      mov	r10,[rbp - 88]
      cmp 	r10,rbx
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_4for
_4forback:
      mov	eax,[rbp - 88]
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rax,eax
      mov	r12,rax
      mov 	r10,r12
      add	r10,1
      mov 	r15,r10
      mov 	r10,r15
      imul	r10,8
      mov 	r15,r10
      mov	eax,[rbp - 88]
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov 	rax,r12
      mov	r10d,4
      cdq
      idiv r10d
      movsx	rax,eax
      mov	r12,rax
      mov 	r10,r12
      add	r10,1
      mov 	r8,r10
      mov 	r10,r8
      imul	r10,8
      mov 	r8,r10
      mov	eax,[rbp - 88]
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rax,eax
      mov	r12,rax
      mov 	r10,r12
      add	r10,1
      mov 	r14,r10
      mov 	r10,r14
      imul	r10,8
      mov 	r14,r10
      mov	eax,[rbp - 88]
      mov	r10d,64
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov 	rax,r12
      mov	r10d,4
      cdq
      idiv r10d
      movsx	rax,eax
      mov	r12,rax
      mov 	r10,r12
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov	eax,[rbp - 88]
      mov	r10d,4
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov	r10,3
      sub 	r10,r12
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,128
      mov 	rcx,r12
      sal	r10,cl
      mov 	r12,r10
      mov	r11,[sjtulcchunks]
      add	r11,r14
      mov	r11,[r11]
      add	r11,r13
      mov	r10,[r11]
      or 	r10,r12
_23check:
      mov 	r12,r10
      mov 	r10,r12
      mov	r11,[sjtulcchunks]
      add	r11,r15
      mov	r11,[r11]
      add	r11,r8
      mov	[r11],r10
      mov	r10,[rbp - 24]
      sub	r10,1
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov 	r10,rbx
      sal	r10,3
      mov 	r12,r10
      mov 	r10,r12
      mov	r11,[sjtulcchunks]
      add	r11,r13
      mov	r11,[r11]
      add	r11,128
      mov	[r11],r10
      mov	r10,[rbp - 24]
      sub	r10,1
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov 	r10,rbx
      sar	r10,29
      mov	r12,r10
      mov 	r10,r12
      and	r10,7
_24check:
      mov 	r12,r10
      mov 	r10,r12
      mov	r11,[sjtulcchunks]
      add	r11,r13
      mov	r11,[r11]
      add	r11,120
      mov	[r11],r10
      mov 	rbx,1732584193
      mov	rdi,43913
      mov	rsi,61389
      push	rbx
      call	lohi
      pop	rbx
      mov 	r12,rax
      mov 	r10,r12
      mov	[rbp - 624],r10
      mov	rdi,56574
      mov	rsi,39098
      push	rbx
      call	lohi
      pop	rbx
      mov 	r12,rax
      mov 	r10,r12
      mov 	rcx,r10
      mov	qword[rbp - 656],271733878
      mov	rdi,57840
      mov	rsi,50130
      push	rbx
      push	rcx
      call	lohi
      pop	rcx
      pop	rbx
      mov 	r12,rax
      mov 	r10,r12
      mov	[rbp - 664],r10
      mov	qword[rbp - 88],0
      jmp	_5whilecheck
_5for:
      mov	qword[rbp - 96],16
      jmp	_6whilecheck
_6for:
      mov	r10,[rbp - 88]
      add	r10,1
      mov 	r9,r10
      mov 	r10,r9
      imul	r10,8
      mov 	r9,r10
      mov	r10,[rbp - 96]
      add	r10,1
      mov 	r15,r10
      mov 	r10,r15
      imul	r10,8
      mov 	r15,r10
      mov	r10,[rbp - 88]
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov	r10,[rbp - 96]
      sub	r10,3
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r8,r10
      mov 	r10,r8
      imul	r10,8
      mov 	r8,r10
      mov	r10,[rbp - 88]
      add	r10,1
      mov 	r14,r10
      mov 	r10,r14
      imul	r10,8
      mov 	r14,r10
      mov	r10,[rbp - 96]
      sub	r10,8
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[sjtulcchunks]
      add	r10,r13
      mov	r10,[r10]
      add	r10,r8
      mov	r10,[r10]
      mov	r11,[sjtulcchunks]
      add	r11,r14
      mov	r11,[r11]
      add	r11,r12
      xor	r10,[r11]
      mov 	r13,r10
      mov	r10,[rbp - 88]
      add	r10,1
      mov 	r14,r10
      mov 	r10,r14
      imul	r10,8
      mov 	r14,r10
      mov	r10,[rbp - 96]
      sub	r10,14
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov 	r10,r13
      mov	r11,[sjtulcchunks]
      add	r11,r14
      mov	r11,[r11]
      add	r11,r12
      xor	r10,[r11]
      mov 	r13,r10
      mov	r10,[rbp - 88]
      add	r10,1
      mov 	r14,r10
      mov 	r10,r14
      imul	r10,8
      mov 	r14,r10
      mov	r10,[rbp - 96]
      sub	r10,16
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov 	r10,r13
      mov	r11,[sjtulcchunks]
      add	r11,r14
      mov	r11,[r11]
      add	r11,r12
      xor	r10,[r11]
      mov 	r12,r10
      mov 	rdi,r12
      mov	rsi,1
      push	r15
      push	r9
      push	rbx
      push	rcx
      call	rotate_left
      pop	rcx
      pop	rbx
      pop	r9
      pop	r15
      mov 	r12,rax
      mov 	r10,r12
      mov	r11,[sjtulcchunks]
      add	r11,r9
      mov	r11,[r11]
      add	r11,r15
      mov	[r11],r10
_6while:
      mov	r10,[rbp - 96]
      mov 	r12,r10
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 96],r10
_6whilecheck:
      mov	r10,[rbp - 96]
      cmp	r10,80
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_6for
_6forback:
      mov 	r10,rbx
      mov 	r8,r10
      mov	r10,[rbp - 624]
      mov 	r15,r10
      mov 	r10,rcx
      mov 	r9,r10
      mov	r10,[rbp - 656]
      mov	[rbp - 944],r10
      mov	r10,[rbp - 664]
      mov	[rbp - 952],r10
      mov	qword[rbp - 96],0
      jmp	_7whilecheck
_7for:
      mov	r10,[rbp - 96]
      cmp	r10,20
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_8else
_8if:
      mov 	r10,r15
      and 	r10,r9
_25check:
      mov 	r13,r10
      mov 	r10,r15
      not	r10
      mov 	r12,r10
      mov 	r10,r12
      and	r10,[rbp - 944]
_26check:
      mov 	r12,r10
      mov 	r10,r13
      or 	r10,r12
_27check:
      mov 	r12,r10
      mov 	r10,r12
      mov 	r14,r10
      mov 	r12,1518500249
      jmp	_8ifback
_8else:
      mov	r10,[rbp - 96]
      cmp	r10,40
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_9else
_9if:
      mov 	r10,r15
      xor 	r10,r9
      mov 	r12,r10
      mov 	r10,r12
      xor	r10,[rbp - 944]
      mov 	r12,r10
      mov 	r10,r12
      mov 	r14,r10
      mov 	r12,1859775393
      jmp	_9ifback
_9else:
      mov	r10,[rbp - 96]
      cmp	r10,60
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_10else
_10if:
      mov 	r10,r15
      and 	r10,r9
_28check:
      mov 	r12,r10
      mov 	r10,r15
      and	r10,[rbp - 944]
_29check:
      mov 	r13,r10
      mov 	r10,r12
      or 	r10,r13
_30check:
      mov 	r13,r10
      mov 	r10,r9
      and	r10,[rbp - 944]
_31check:
      mov 	r12,r10
      mov 	r10,r13
      or 	r10,r12
_32check:
      mov 	r12,r10
      mov 	r10,r12
      mov 	r14,r10
      mov	rdi,48348
      mov	rsi,36635
      push	r14
      push	r15
      push	r8
      push	r9
      push	rbx
      push	rcx
      call	lohi
      pop	rcx
      pop	rbx
      pop	r9
      pop	r8
      pop	r15
      pop	r14
      mov 	r12,rax
      mov 	r10,r12
      mov 	r12,r10
      jmp	_10ifback
_10else:
      mov 	r10,r15
      xor 	r10,r9
      mov 	r12,r10
      mov 	r10,r12
      xor	r10,[rbp - 944]
      mov 	r12,r10
      mov 	r10,r12
      mov 	r14,r10
      mov	rdi,49622
      mov	rsi,51810
      push	r14
      push	r15
      push	r8
      push	r9
      push	rbx
      push	rcx
      call	lohi
      pop	rcx
      pop	rbx
      pop	r9
      pop	r8
      pop	r15
      pop	r14
      mov 	r12,rax
      mov 	r10,r12
      mov 	r12,r10
_10ifback:
_9ifback:
_8ifback:
      mov 	rdi,r8
      mov	rsi,5
      push	r12
      push	r14
      push	r15
      push	r8
      push	r9
      push	rbx
      push	rcx
      call	rotate_left
      pop	rcx
      pop	rbx
      pop	r9
      pop	r8
      pop	r15
      pop	r14
      pop	r12
      mov 	r13,rax
      mov 	rdi,r13
      mov	rsi,[rbp-952]
      push	r12
      push	r14
      push	r15
      push	r8
      push	r9
      push	rbx
      push	rcx
      call	add
      pop	rcx
      pop	rbx
      pop	r9
      pop	r8
      pop	r15
      pop	r14
      pop	r12
      mov 	r13,rax
      mov 	rdi,r14
      mov 	rsi,r12
      push	r13
      push	r15
      push	r8
      push	r9
      push	rbx
      push	rcx
      call	add
      pop	rcx
      pop	rbx
      pop	r9
      pop	r8
      pop	r15
      pop	r13
      mov 	r12,rax
      mov 	rdi,r13
      mov 	rsi,r12
      push	r15
      push	r8
      push	r9
      push	rbx
      push	rcx
      call	add
      pop	rcx
      pop	rbx
      pop	r9
      pop	r8
      pop	r15
      mov 	r12,rax
      mov	r10,[rbp - 88]
      add	r10,1
      mov 	r14,r10
      mov 	r10,r14
      imul	r10,8
      mov 	r14,r10
      mov	r10,[rbp - 96]
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov 	rdi,r12
      mov	r10,[sjtulcchunks]
      add	r10,r14
      mov	r10,[r10]
      add	r10,r13
      mov	rsi,[r10]
      push	r15
      push	r8
      push	r9
      push	rbx
      push	rcx
      call	add
      pop	rcx
      pop	rbx
      pop	r9
      pop	r8
      pop	r15
      mov 	r12,rax
      mov 	r10,r12
      mov 	r13,r10
      mov	r10,[rbp - 944]
      mov	[rbp - 952],r10
      mov 	r10,r9
      mov	[rbp - 944],r10
      mov 	rdi,r15
      mov	rsi,30
      push	r13
      push	r8
      push	rbx
      push	rcx
      call	rotate_left
      pop	rcx
      pop	rbx
      pop	r8
      pop	r13
      mov 	r12,rax
      mov 	r10,r12
      mov 	r9,r10
      mov 	r10,r8
      mov 	r15,r10
      mov 	r10,r13
      mov 	r8,r10
_7while:
      mov	r10,[rbp - 96]
      mov 	r12,r10
      mov	r10,[rbp - 96]
      add	r10,1
      mov	[rbp - 96],r10
_7whilecheck:
      mov	r10,[rbp - 96]
      cmp	r10,80
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_7for
_7forback:
      mov 	rdi,rbx
      mov 	rsi,r8
      push	r15
      push	r9
      push	rcx
      call	add
      pop	rcx
      pop	r9
      pop	r15
      mov 	r12,rax
      mov 	r10,r12
      mov 	rbx,r10
      mov	rdi,[rbp-624]
      mov 	rsi,r15
      push	r9
      push	rbx
      push	rcx
      call	add
      pop	rcx
      pop	rbx
      pop	r9
      mov 	r12,rax
      mov 	r10,r12
      mov	[rbp - 624],r10
      mov 	rdi,rcx
      mov 	rsi,r9
      push	rbx
      call	add
      pop	rbx
      mov 	r12,rax
      mov 	r10,r12
      mov 	rcx,r10
      mov	rdi,[rbp-656]
      mov	rsi,[rbp-944]
      push	rbx
      push	rcx
      call	add
      pop	rcx
      pop	rbx
      mov 	r12,rax
      mov 	r10,r12
      mov	[rbp - 656],r10
      mov	rdi,[rbp-664]
      mov	rsi,[rbp-952]
      push	rbx
      push	rcx
      call	add
      pop	rcx
      pop	rbx
      mov 	r12,rax
      mov 	r10,r12
      mov	[rbp - 664],r10
_5while:
      mov	r10,[rbp - 88]
      mov 	r12,r10
      mov	r10,[rbp - 88]
      add	r10,1
      mov	[rbp - 88],r10
_5whilecheck:
      mov	r10,[rbp - 88]
      cmp	r10,[rbp - 24]
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_5for
_5forback:
      mov 	r10,rbx
      mov	r11,[sjtulcoutputBuffer]
      add	r11,8
      mov	[r11],r10
      mov	r10,[rbp - 624]
      mov	r11,[sjtulcoutputBuffer]
      add	r11,16
      mov	[r11],r10
      mov 	r10,rcx
      mov	r11,[sjtulcoutputBuffer]
      add	r11,24
      mov	[r11],r10
      mov	r10,[rbp - 656]
      mov	r11,[sjtulcoutputBuffer]
      add	r11,32
      mov	[r11],r10
      mov	r10,[rbp - 664]
      mov	r11,[sjtulcoutputBuffer]
      add	r11,40
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
      mov 	r13,rdi
      mov 	r14,0
      jmp	_8whilecheck
_8for:
      mov 	r10,r14
      add	r10,1
      mov 	r15,r10
      mov 	r10,r15
      imul	r10,8
      mov 	r15,r10
      mov 	rdi,r13
      mov 	rsi,r14
      push	r13
      push	r14
      push	r15
      call	string.ord
      pop	r15
      pop	r14
      pop	r13
      mov 	r12,rax
      mov 	r10,r12
      mov	r11,[sjtulcinputBuffer]
      add	r11,r15
      mov	[r11],r10
_8while:
      mov 	r10,r14
      mov 	r12,r10
      mov 	r10,r14
      add	r10,1
      mov 	r14,r10
_8whilecheck:
      mov 	rdi,r13
      push	r13
      push	r14
      call	string.length
      pop	r14
      pop	r13
      mov 	r12,rax
      mov 	r10,r14
      cmp 	r10,r12
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_8for
_8forback:
      mov 	rdi,r13
      call	string.length
      mov 	r12,rax
      mov	rdi,[sjtulcinputBuffer]
      mov 	rsi,r12
      call	sha1
      mov 	r12,rax
      mov 	r10,r12
      mov 	r13,r10
      mov 	r14,0
      jmp	_9whilecheck
_9for:
      mov 	r10,r14
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,r13
      add	r10,r12
      mov	rdi,[r10]
      push	r13
      push	r14
      call	toStringHex
      pop	r14
      pop	r13
      mov 	r12,rax
      mov 	rdi,r12
      push	r13
      push	r14
      mov	rax,0
      call	print
      pop	r14
      pop	r13
      mov 	r12,rax
_9while:
      mov 	r10,r14
      mov 	r12,r10
      mov 	r10,r14
      add	r10,1
      mov 	r14,r10
_9whilecheck:
      mov	r10,r13
      add	r10,0
      mov	r10,[r10]
      add	r10,0
      mov 	r12,r10
      mov 	r10,r14
      cmp 	r10,r12
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_9for
_9forback:
      mov 	r12,lcstr4
      mov 	rdi,r12
      mov	rax,0
      call	println
      mov 	r12,rax
      mov	rsp,rbp
      pop rbp
      ret
nextLetter:
      push	rbp
      mov	rbp,rsp
      sub	rsp,56
      mov 	r13,rdi
      mov 	r10,r13
      cmp	r10,122
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_11else
_11if:
      mov	r10,1
      not	r10
      add	r10,1
      mov 	r12,r10
      mov 	rax,r12
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_11ifback
_11else:
_11ifback:
      mov 	r10,r13
      cmp	r10,90
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
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
      mov 	r10,r13
      cmp	r10,57
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
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
      mov 	r10,r13
      add	r10,1
      mov 	r12,r10
      mov 	rax,r12
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
      mov 	r14,rdi
      mov 	r12,rsi
      mov 	r10,r12
      sub	r10,1
      mov 	r12,r10
      mov 	r10,r12
      mov 	r15,r10
      jmp	_10whilecheck
_10for:
      mov 	r10,r15
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov 	r10,r15
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,r14
      add	r10,r12
      mov	rdi,[r10]
      push	r13
      push	r14
      push	r15
      call	nextLetter
      pop	r15
      pop	r14
      pop	r13
      mov 	r12,rax
      mov 	r10,r12
      mov	r11,r14
      add	r11,r13
      mov	[r11],r10
      mov 	r10,r15
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,1
      not	r10
      add	r10,1
      mov 	r13,r10
      mov	r11,r14
      add	r11,r12
      mov	r10,[r11]
      cmp 	r10,r13
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_14else
_14if:
      mov 	r10,r15
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,r14
      add	r11,r12
      mov	qword[r11],48
      jmp	_14ifback
_14else:
      mov	rax,1
      mov	rsp,rbp
      pop rbp
      ret
_14ifback:
_10while:
      mov 	r10,r15
      mov 	r12,r10
      mov 	r10,r15
      sub	r10,1
      mov 	r15,r10
_10whilecheck:
      mov 	r10,r15
      cmp	r10,0
      setge r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
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
      mov 	r8,rdi
      mov 	r14,rsi
      mov	r10,r8
      add	r10,0
      mov	r10,[r10]
      add	r10,0
      mov 	r13,r10
      mov	r10,r14
      add	r10,0
      mov	r10,[r10]
      add	r10,0
      mov 	r12,r10
      mov 	r10,r13
      cmp 	r10,r12
      setne r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
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
      mov 	r15,0
      jmp	_11whilecheck
_11for:
      mov 	r10,r15
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov 	r10,r15
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,r8
      add	r11,r13
      mov	r10,[r11]
      mov	r11,r14
      add	r11,r12
      cmp	r10,[r11]
      setne r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
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
      mov 	r10,r15
      mov 	r12,r10
      mov 	r10,r15
      add	r10,1
      mov 	r15,r10
_11whilecheck:
      mov	r10,r8
      add	r10,0
      mov	r10,[r10]
      add	r10,0
      mov 	r12,r10
      mov 	r10,r15
      cmp 	r10,r12
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
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
      mov 	rbx,rdi
      mov 	r12,48
      mov 	rdi,r12
      push	rbx
      call	malloc
      pop	rbx
      mov 	r12,rax
      mov	r11,r12
      add	r11,0
      mov	qword[r11],5
      mov 	r10,r12
      mov 	r8,r10
      mov 	rdi,rbx
      push	r8
      push	rbx
      call	string.length
      pop	rbx
      pop	r8
      mov 	r12,rax
      mov 	r10,r12
      cmp	r10,40
      setne r10b
      movzx r10,r10b
      mov 	r13,r10
      mov 	r10,r13
      cmp	 r10,0
      je	_17else
_17if:
      mov 	r12,lcstr5
      mov 	rdi,r12
      mov	rax,0
      call	println
      mov 	r12,rax
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_17ifback
_17else:
_17ifback:
      mov 	r13,0
      jmp	_12whilecheck
_12for:
      mov 	r10,r13
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,r8
      add	r11,r12
      mov	qword[r11],0
_12while:
      mov 	r10,r13
      mov 	r12,r10
      mov 	r10,r13
      add	r10,1
      mov 	r13,r10
_12whilecheck:
      mov 	r10,r13
      cmp	r10,5
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_12for
_12forback:
      mov 	r13,0
      jmp	_13whilecheck
_13for:
      mov 	rax,r13
      mov	r10d,8
      cdq
      idiv r10d
      movsx	rax,eax
      mov	r12,rax
      mov 	r10,r12
      add	r10,1
      mov 	r14,r10
      mov 	r10,r14
      imul	r10,8
      mov 	r14,r10
      mov 	rax,r13
      mov	r10d,8
      cdq
      idiv r10d
      movsx	rax,eax
      mov	r12,rax
      mov 	r10,r12
      add	r10,1
      mov 	r9,r10
      mov 	r10,r9
      imul	r10,8
      mov 	r9,r10
      mov 	r10,r13
      add	r10,3
      mov 	r12,r10
      mov 	rdi,rbx
      mov 	rsi,r13
      mov 	rdx,r12
      push	r13
      push	r14
      push	r8
      push	r9
      push	rbx
      call	string.substring
      pop	rbx
      pop	r9
      pop	r8
      pop	r14
      pop	r13
      mov 	r12,rax
      mov 	rdi,r12
      push	r13
      push	r14
      push	r8
      push	r9
      push	rbx
      call	hex2int
      pop	rbx
      pop	r9
      pop	r8
      pop	r14
      pop	r13
      mov 	r15,rax
      mov 	rax,r13
      mov	r10d,4
      cdq
      idiv r10d
      movsx	rax,eax
      mov	r12,rax
      mov 	rax,r12
      mov	r10d,2
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov	r10,1
      sub 	r10,r12
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,16
      mov 	r12,r10
      mov 	r10,r15
      mov 	rcx,r12
      sal	r10,cl
      mov 	r12,r10
      mov	r11,r8
      add	r11,r9
      mov	r10,[r11]
      or 	r10,r12
_33check:
      mov 	r12,r10
      mov 	r10,r12
      mov	r11,r8
      add	r11,r14
      mov	[r11],r10
_13while:
      mov 	r10,r13
      add	r10,4
      mov 	r12,r10
      mov 	r10,r12
      mov 	r13,r10
_13whilecheck:
      mov 	r10,r13
      cmp	r10,40
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_13for
_13forback:
      mov 	r15,4
      mov 	r14,1
      jmp	_14whilecheck
_14for:
      mov 	r13,0
      jmp	_15whilecheck
_15for:
      mov 	r10,r13
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulcinputBuffer]
      add	r11,r12
      mov	qword[r11],48
_15while:
      mov 	r10,r13
      mov 	r12,r10
      mov 	r10,r13
      add	r10,1
      mov 	r13,r10
_15whilecheck:
      mov 	r10,r13
      cmp 	r10,r14
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_15for
_15forback:
      jmp	_16while
_16for:
      mov	rdi,[sjtulcinputBuffer]
      mov 	rsi,r14
      push	r14
      push	r15
      push	r8
      call	sha1
      pop	r8
      pop	r15
      pop	r14
      mov 	r12,rax
      mov 	r10,r12
      mov 	r12,r10
      mov 	rdi,r12
      mov 	rsi,r8
      push	r14
      push	r15
      push	r8
      call	array_equal
      pop	r8
      pop	r15
      pop	r14
      mov 	r12,rax
      mov 	r10,r12
      cmp	 r10,0
      je	_18else
_18if:
      mov 	r13,0
      jmp	_17whilecheck
_17for:
      mov 	r10,r13
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[sjtulcinputBuffer]
      add	r10,r12
      mov	rdi,[r10]
      push	r13
      push	r14
      call	int2chr
      pop	r14
      pop	r13
      mov 	r12,rax
      mov 	rdi,r12
      push	r13
      push	r14
      mov	rax,0
      call	print
      pop	r14
      pop	r13
      mov 	r12,rax
_17while:
      mov 	r10,r13
      mov 	r12,r10
      mov 	r10,r13
      add	r10,1
      mov 	r13,r10
_17whilecheck:
      mov 	r10,r13
      cmp 	r10,r14
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_17for
_17forback:
      mov 	r12,lcstr6
      mov 	rdi,r12
      mov	rax,0
      call	println
      mov 	r12,rax
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_18ifback
_18else:
_18ifback:
      mov	rdi,[sjtulcinputBuffer]
      mov 	rsi,r14
      push	r14
      push	r15
      push	r8
      call	nextText
      pop	r8
      pop	r15
      pop	r14
      mov 	r13,rax
      mov 	r10,r13
      xor	r10,1
      mov 	r12,r10
      mov 	r10,r12
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
      mov 	r10,r14
      mov 	r12,r10
      mov 	r10,r14
      add	r10,1
      mov 	r14,r10
_14whilecheck:
      mov 	r10,r14
      cmp 	r10,r15
      setle r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_14for
_14forback:
      mov 	r12,lcstr7
      mov 	rdi,r12
      mov	rax,0
      call	println
      mov 	r12,rax
      mov	rsp,rbp
      pop rbp
      ret
main:
      push	rbp
      mov	rbp,rsp
      sub	rsp,3384
      mov 	r12,lcstr0
      mov 	r10,r12
      mov	[sjtulcasciiTable],r10
      mov	qword[sjtulcMAXCHUNK],100
      mov	r10,[sjtulcMAXCHUNK]
      sub	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,64
      mov 	r12,r10
      mov 	r10,r12
      sub	r10,16
      mov 	r12,r10
      mov 	r10,r12
      mov	[sjtulcMAXLENGTH],r10
      mov	r10,[sjtulcMAXCHUNK]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov 	rdi,r12
      call	malloc
      mov 	r15,rax
      mov	r11,r15
      add	r11,0
      mov	r10,[sjtulcMAXCHUNK]
      mov	qword[r11],r10
      mov 	r10,r15
      mov 	r13,r10
      mov 	r14,0
_0arr:
      mov 	r10,r14
      add	r10,1
      mov 	r14,r10
      mov 	r10,r15
      add	r10,8
      mov 	r15,r10
      mov	r10,80
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov 	rdi,r12
      push	r13
      push	r14
      push	r15
      call	malloc
      pop	r15
      pop	r14
      pop	r13
      mov 	r12,rax
      mov	r11,r12
      add	r11,0
      mov	qword[r11],80
      mov 	r10,r12
      mov	r11,r15
      add	r11,0
      mov	[r11],r10
      mov 	r10,r14
      cmp	r10,[sjtulcMAXCHUNK]
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_0arr
      mov 	r10,r13
      mov	[sjtulcchunks],r10
      mov	r10,[sjtulcMAXLENGTH]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov 	rdi,r12
      call	malloc
      mov 	r12,rax
      mov	r11,r12
      add	r11,0
      mov	r10,[sjtulcMAXLENGTH]
      mov	qword[r11],r10
      mov 	r10,r12
      mov	[sjtulcinputBuffer],r10
      mov 	r12,48
      mov 	rdi,r12
      call	malloc
      mov 	r12,rax
      mov	r11,r12
      add	r11,0
      mov	qword[r11],5
      mov 	r10,r12
      mov	[sjtulcoutputBuffer],r10
      jmp	_18while
_18for:
      call	getInt
      mov 	r12,rax
      mov 	r10,r12
      mov 	r13,r10
      mov 	r10,r13
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_20else
_20if:
      jmp	_18forback
      jmp	_20ifback
_20else:
_20ifback:
      mov 	r10,r13
      cmp	r10,1
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_21else
_21if:
      push	r13
      call	getString
      pop	r13
      mov 	r12,rax
      mov 	r10,r12
      mov 	r12,r10
      mov 	rdi,r12
      push	r13
      call	computeSHA1
      pop	r13
      mov 	r12,rax
      jmp	_21ifback
_21else:
      mov 	r10,r13
      cmp	r10,2
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_22else
_22if:
      call	getString
      mov 	r12,rax
      mov 	r10,r12
      mov 	r12,r10
      mov 	rdi,r12
      call	crackSHA1
      mov 	r12,rax
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
	dq 95
lcstr0:
	db	32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,0
	dq 0
lcstr1:
	db	0
	dq 0
lcstr2:
	db	0
	dq 18
lcstr3:
	db	110,67,104,117,110,107,32,62,32,77,65,88,67,72,85,78,75,33,0
	dq 0
lcstr4:
	db	0
	dq 13
lcstr5:
	db	73,110,118,97,108,105,100,32,105,110,112,117,116,0
	dq 0
lcstr6:
	db	0
	dq 10
lcstr7:
	db	78,111,116,32,70,111,117,110,100,33,0
section .bss
stringbuffer:
	resb 256

