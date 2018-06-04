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
origin:
      push	rbp
      mov	rbp,rsp
      sub	rsp,136
      mov 	r14,rdi
      mov 	r10,r14
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
      mov 	r12,rax
      mov 	r10,r14
      mov	r11,r12
      add	r11,0
      mov	[r11],r10
      mov 	r10,r12
      mov	[sjtulcmake],r10
      mov	qword[sjtulci],0
      jmp	_0whilecheck
_0for:
      mov	r10,[sjtulci]
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov 	r10,r14
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
      mov 	r12,rax
      mov 	r10,r14
      mov	r11,r12
      add	r11,0
      mov	[r11],r10
      mov 	r10,r12
      mov	r11,[sjtulcmake]
      add	r11,r13
      mov	[r11],r10
      mov	qword[sjtulcj],0
      jmp	_1whilecheck
_1for:
      mov	r10,[sjtulci]
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov	r10,[sjtulcj]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulcmake]
      add	r11,r13
      mov	r11,[r11]
      add	r11,r12
      mov	qword[r11],0
_1while:
      mov	r10,[sjtulcj]
      mov 	r12,r10
      mov	r10,[sjtulcj]
      add	r10,1
      mov	[sjtulcj],r10
_1whilecheck:
      mov	r10,[sjtulcj]
      cmp 	r10,r14
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_1for
_1forback:
_0while:
      mov	r10,[sjtulci]
      mov 	r12,r10
      mov	r10,[sjtulci]
      add	r10,1
      mov	[sjtulci],r10
_0whilecheck:
      mov	r10,[sjtulci]
      cmp 	r10,r14
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
search:
      push	rbp
      mov	rbp,rsp
      sub	rsp,2224
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	[rbp - 24],rdx
      mov	r10,[rbp - 16]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov 	r13,r10
      mov 	r10,r13
      cmp	r10,1
      je	_0check
      mov	r10,[rbp - 16]
      cmp	r10,0
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r13
      or 	r10,r12
_0check:
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_1check
      mov	r10,[rbp - 8]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov 	r13,r10
      mov 	r10,r12
      or 	r10,r13
_1check:
      mov 	r14,r10
      mov 	r10,r14
      cmp	r10,1
      je	_2check
      mov	r10,[rbp - 8]
      sub	r10,1
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov	r10,[rbp - 8]
      sub	r10,1
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[sjtulcmake]
      add	r10,r13
      mov	r10,[r10]
      add	r10,8
      mov	r10,[r10]
      mov	r11,[sjtulcmake]
      add	r11,r12
      mov	r11,[r11]
      add	r11,16
      add	r10,[r11]
      mov 	r13,r10
      mov	r10,[rbp - 8]
      sub	r10,1
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov 	r10,r13
      mov	r11,[sjtulcmake]
      add	r11,r12
      mov	r11,[r11]
      add	r11,24
      add	r10,[r11]
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,15
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r14
      or 	r10,r12
_2check:
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_7else
_7if:
      mov	r10,[rbp - 8]
      cmp	r10,2
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,0
      je	_3check
      mov	r10,[rbp - 16]
      cmp	r10,2
      sete r10b
      movzx r10,r10b
      mov 	r13,r10
      mov 	r10,r12
      and 	r10,r13
_3check:
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_1else
_1if:
      mov	r10,45
      sub	r10,[rbp - 24]
      mov 	r12,r10
      mov 	r10,r12
      mov	r11,[sjtulcmake]
      add	r11,24
      mov	r11,[r11]
      add	r11,24
      mov	[r11],r10
      mov	r10,[sjtulcmake]
      add	r10,8
      mov	r10,[r10]
      add	r10,8
      mov	r10,[r10]
      mov	r11,[sjtulcmake]
      add	r11,8
      mov	r11,[r11]
      add	r11,16
      add	r10,[r11]
      mov 	r12,r10
      mov 	r10,r12
      mov	r11,[sjtulcmake]
      add	r11,8
      mov	r11,[r11]
      add	r11,24
      add	r10,[r11]
      mov 	r12,r10
      mov 	r10,r12
      mov 	r14,r10
      mov	r10,[sjtulcmake]
      add	r10,16
      mov	r10,[r10]
      add	r10,8
      mov	r10,[r10]
      mov	r11,[sjtulcmake]
      add	r11,16
      mov	r11,[r11]
      add	r11,16
      add	r10,[r11]
      mov 	r12,r10
      mov 	r10,r12
      mov	r11,[sjtulcmake]
      add	r11,16
      mov	r11,[r11]
      add	r11,24
      add	r10,[r11]
      mov 	r12,r10
      mov 	r10,r12
      cmp 	r10,r14
      sete r10b
      movzx r10,r10b
      mov 	r13,r10
      mov 	r10,r13
      cmp	r10,0
      je	_4check
      mov	r10,[sjtulcmake]
      add	r10,24
      mov	r10,[r10]
      add	r10,8
      mov	r10,[r10]
      mov	r11,[sjtulcmake]
      add	r11,24
      mov	r11,[r11]
      add	r11,16
      add	r10,[r11]
      mov 	r12,r10
      mov 	r10,r12
      mov	r11,[sjtulcmake]
      add	r11,24
      mov	r11,[r11]
      add	r11,24
      add	r10,[r11]
      mov 	r12,r10
      mov 	r10,r12
      cmp 	r10,r14
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r13
      and 	r10,r12
_4check:
      mov 	r13,r10
      mov 	r10,r13
      cmp	r10,0
      je	_5check
      mov	r10,[sjtulcmake]
      add	r10,8
      mov	r10,[r10]
      add	r10,8
      mov	r10,[r10]
      mov	r11,[sjtulcmake]
      add	r11,16
      mov	r11,[r11]
      add	r11,8
      add	r10,[r11]
      mov 	r12,r10
      mov 	r10,r12
      mov	r11,[sjtulcmake]
      add	r11,24
      mov	r11,[r11]
      add	r11,8
      add	r10,[r11]
      mov 	r12,r10
      mov 	r10,r12
      cmp 	r10,r14
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r13
      and 	r10,r12
_5check:
      mov 	r13,r10
      mov 	r10,r13
      cmp	r10,0
      je	_6check
      mov	r10,[sjtulcmake]
      add	r10,8
      mov	r10,[r10]
      add	r10,16
      mov	r10,[r10]
      mov	r11,[sjtulcmake]
      add	r11,16
      mov	r11,[r11]
      add	r11,16
      add	r10,[r11]
      mov 	r12,r10
      mov 	r10,r12
      mov	r11,[sjtulcmake]
      add	r11,24
      mov	r11,[r11]
      add	r11,16
      add	r10,[r11]
      mov 	r12,r10
      mov 	r10,r12
      cmp 	r10,r14
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r13
      and 	r10,r12
_6check:
      mov 	r13,r10
      mov 	r10,r13
      cmp	r10,0
      je	_7check
      mov	r10,[sjtulcmake]
      add	r10,8
      mov	r10,[r10]
      add	r10,24
      mov	r10,[r10]
      mov	r11,[sjtulcmake]
      add	r11,16
      mov	r11,[r11]
      add	r11,24
      add	r10,[r11]
      mov 	r12,r10
      mov 	r10,r12
      mov	r11,[sjtulcmake]
      add	r11,24
      mov	r11,[r11]
      add	r11,24
      add	r10,[r11]
      mov 	r12,r10
      mov 	r10,r12
      cmp 	r10,r14
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r13
      and 	r10,r12
_7check:
      mov 	r13,r10
      mov 	r10,r13
      cmp	r10,0
      je	_8check
      mov	r10,[sjtulcmake]
      add	r10,8
      mov	r10,[r10]
      add	r10,8
      mov	r10,[r10]
      mov	r11,[sjtulcmake]
      add	r11,16
      mov	r11,[r11]
      add	r11,16
      add	r10,[r11]
      mov 	r12,r10
      mov 	r10,r12
      mov	r11,[sjtulcmake]
      add	r11,24
      mov	r11,[r11]
      add	r11,24
      add	r10,[r11]
      mov 	r12,r10
      mov 	r10,r12
      cmp 	r10,r14
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r13
      and 	r10,r12
_8check:
      mov 	r13,r10
      mov 	r10,r13
      cmp	r10,0
      je	_9check
      mov	r10,[sjtulcmake]
      add	r10,24
      mov	r10,[r10]
      add	r10,8
      mov	r10,[r10]
      mov	r11,[sjtulcmake]
      add	r11,16
      mov	r11,[r11]
      add	r11,16
      add	r10,[r11]
      mov 	r12,r10
      mov 	r10,r12
      mov	r11,[sjtulcmake]
      add	r11,8
      mov	r11,[r11]
      add	r11,24
      add	r10,[r11]
      mov 	r12,r10
      mov 	r10,r12
      cmp 	r10,r14
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r13
      and 	r10,r12
_9check:
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_0else
_0if:
      mov	r10,[sjtulccount]
      add	r10,8
      mov	r10,[r10]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      mov	r11,[sjtulccount]
      add	r11,8
      mov	[r11],r10
      mov 	r14,0
      jmp	_2whilecheck
_2for:
      mov 	r13,0
      jmp	_3whilecheck
_3for:
      mov 	r10,r14
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov 	r10,r13
      add	r10,1
      mov 	r15,r10
      mov 	r10,r15
      imul	r10,8
      mov 	r15,r10
      mov	r10,[sjtulcmake]
      add	r10,r12
      mov	r10,[r10]
      add	r10,r15
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
      mov 	r12,lcstr0
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
_3while:
      mov 	r10,r13
      mov 	r12,r10
      mov 	r10,r13
      add	r10,1
      mov 	r13,r10
_3whilecheck:
      mov 	r10,r13
      cmp	r10,2
      setle r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_3for
_3forback:
      mov 	r12,lcstr1
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
_2while:
      mov 	r10,r14
      mov 	r12,r10
      mov 	r10,r14
      add	r10,1
      mov 	r14,r10
_2whilecheck:
      mov 	r10,r14
      cmp	r10,2
      setle r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_2for
_2forback:
      mov 	r12,lcstr2
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
      jmp	_0ifback
_0else:
_0ifback:
      jmp	_1ifback
_1else:
      mov	r10,[rbp - 16]
      cmp	r10,2
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_4else
_4if:
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r14,r10
      mov 	r10,r14
      imul	r10,8
      mov 	r14,r10
      mov	r10,[rbp - 16]
      add	r10,1
      mov 	r15,r10
      mov 	r10,r15
      imul	r10,8
      mov 	r15,r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,15
      mov	r11,[sjtulcmake]
      add	r11,r12
      mov	r11,[r11]
      add	r11,8
      sub	r10,[r11]
      mov 	r12,r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov 	r10,r12
      mov	r11,[sjtulcmake]
      add	r11,r13
      mov	r11,[r11]
      add	r11,16
      sub	r10,[r11]
      mov 	r12,r10
      mov 	r10,r12
      mov	r11,[sjtulcmake]
      add	r11,r14
      mov	r11,[r11]
      add	r11,r15
      mov	[r11],r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov	r10,[rbp - 16]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulcmake]
      add	r11,r13
      mov	r11,[r11]
      add	r11,r12
      mov	r10,[r11]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov 	r13,r10
      mov 	r10,r13
      cmp	r10,0
      je	_10check
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r14,r10
      mov 	r10,r14
      imul	r10,8
      mov 	r14,r10
      mov	r10,[rbp - 16]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulcmake]
      add	r11,r14
      mov	r11,[r11]
      add	r11,r12
      mov	r10,[r11]
      cmp	r10,10
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r13
      and 	r10,r12
_10check:
      mov 	r13,r10
      mov 	r10,r13
      cmp	r10,0
      je	_11check
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r14,r10
      mov 	r10,r14
      imul	r10,8
      mov 	r14,r10
      mov	r10,[rbp - 16]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[sjtulcmake]
      add	r10,r14
      mov	r10,[r10]
      add	r10,r12
      mov	r10,[r10]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulccolor]
      add	r11,r12
      mov	r10,[r11]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r13
      and 	r10,r12
_11check:
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_3else
_3if:
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov	r10,[rbp - 16]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[sjtulcmake]
      add	r10,r13
      mov	r10,[r10]
      add	r10,r12
      mov	r10,[r10]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulccolor]
      add	r11,r12
      mov	qword[r11],1
      mov	r10,[rbp - 16]
      cmp	r10,2
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_2else
_2if:
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r13,r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r14,r10
      mov 	r10,r14
      imul	r10,8
      mov 	r14,r10
      mov	r10,[rbp - 16]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[rbp - 24]
      mov	r11,[sjtulcmake]
      add	r11,r14
      mov	r11,[r11]
      add	r11,r12
      add	r10,[r11]
      mov 	r12,r10
      mov 	rdi,r13
      mov	rsi,0
      mov 	rdx,r12
      push	r12
      push	r13
      push	r14
      push	r15
      call	search
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      jmp	_2ifback
_2else:
      mov	r10,[rbp - 16]
      add	r10,1
      mov 	r13,r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[rbp - 16]
      add	r10,1
      mov 	r14,r10
      mov 	r10,r14
      imul	r10,8
      mov 	r14,r10
      mov	r10,[rbp - 24]
      mov	r11,[sjtulcmake]
      add	r11,r12
      mov	r11,[r11]
      add	r11,r14
      add	r10,[r11]
      mov 	r12,r10
      mov	rdi,[rbp-8]
      mov 	rsi,r13
      mov 	rdx,r12
      push	r12
      push	r13
      push	r14
      push	r15
      call	search
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
_2ifback:
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[rbp - 16]
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov	r10,[sjtulcmake]
      add	r10,r12
      mov	r10,[r10]
      add	r10,r13
      mov	r10,[r10]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulccolor]
      add	r11,r12
      mov	qword[r11],0
      jmp	_3ifback
_3else:
_3ifback:
      jmp	_4ifback
_4else:
      mov 	r14,1
      jmp	_4whilecheck
_4for:
      mov 	r10,r14
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulccolor]
      add	r11,r12
      mov	r10,[r11]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_6else
_6if:
      mov 	r10,r14
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulccolor]
      add	r11,r12
      mov	qword[r11],1
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[rbp - 16]
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov 	r10,r14
      mov	r11,[sjtulcmake]
      add	r11,r12
      mov	r11,[r11]
      add	r11,r13
      mov	[r11],r10
      mov	r10,[rbp - 16]
      cmp	r10,2
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_5else
_5if:
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r12,r10
      mov	r10,[rbp - 24]
      add 	r10,r14
      mov 	r13,r10
      mov 	rdi,r12
      mov	rsi,0
      mov 	rdx,r13
      push	r12
      push	r13
      push	r14
      push	r15
      call	search
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      jmp	_5ifback
_5else:
      mov	r10,[rbp - 16]
      add	r10,1
      mov 	r13,r10
      mov	r10,[rbp - 24]
      add 	r10,r14
      mov 	r12,r10
      mov	rdi,[rbp-8]
      mov 	rsi,r13
      mov 	rdx,r12
      push	r12
      push	r13
      push	r14
      push	r15
      call	search
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
_5ifback:
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[rbp - 16]
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov	r11,[sjtulcmake]
      add	r11,r12
      mov	r11,[r11]
      add	r11,r13
      mov	qword[r11],0
      mov 	r10,r14
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulccolor]
      add	r11,r12
      mov	qword[r11],0
      jmp	_6ifback
_6else:
_6ifback:
_4while:
      mov 	r10,r14
      mov 	r12,r10
      mov 	r10,r14
      add	r10,1
      mov 	r14,r10
_4whilecheck:
      mov 	r10,r14
      cmp	r10,9
      setle r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
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
      sub	rsp,64
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
      mov 	r12,rax
      mov	r11,r12
      add	r11,0
      mov	qword[r11],10
      mov 	r10,r12
      mov	[sjtulccolor],r10
      mov 	r12,16
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
      mov 	r12,rax
      mov	r11,r12
      add	r11,0
      mov	qword[r11],1
      mov 	r10,r12
      mov	[sjtulccount],r10
      mov	rdi,3
      push	r12
      push	r13
      push	r14
      push	r15
      call	origin
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov	rdi,0
      mov	rsi,0
      mov	rdx,0
      push	r12
      push	r13
      push	r14
      push	r15
      call	search
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov	r10,[sjtulccount]
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

sjtulcmake:
	dq 0
sjtulccolor:
	dq 0
sjtulccount:
	dq 0
sjtulci:
	dq 0
sjtulcj:
	dq 0
	dq 1
lcstr0:
	db	32,0
	dq 1
lcstr1:
	db	10,0
	dq 1
lcstr2:
	db	10,0
section .bss
stringbuffer:
	resb 256

