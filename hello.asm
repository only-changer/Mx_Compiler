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
      sub	rsp,40
      mov 	r12,rdi
      mov 	rax,r12
      mov	r10d,[sjtulcp]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r13,rdx
      mov 	rax,r12
      mov	r10d,[sjtulcp]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov 	r10,r13
      imul 	r10,r12
      mov 	r12,r10
      mov 	rax,r12
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
gcd:
      push	rbp
      mov	rbp,rsp
      sub	rsp,64
      mov 	r14,rdi
      mov 	r13,rsi
      mov 	r10,r13
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_0else
_0if:
      mov 	rax,r14
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_0ifback
_0else:
_0ifback:
      mov 	r10,r14
      cmp 	r10,r13
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_1else
_1if:
      mov 	rdi,r13
      mov 	rsi,r14
      push	r12
      push	r13
      push	r14
      push	r15
      call	gcd
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	rax,r12
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_1ifback
_1else:
      mov 	rax,r14
      mov 	r10,r13
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov 	rdi,r13
      mov 	rsi,r12
      push	r12
      push	r13
      push	r14
      push	r15
      call	gcd
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	rax,r12
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
      sub	rsp,48
      mov 	r12,rdi
      mov 	r13,rsi
      mov 	rdi,r12
      mov 	rsi,r13
      push	r12
      push	r13
      push	r14
      push	r15
      call	gcd
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r14,rax
      mov 	rax,r12
      mov 	r10,r14
      cdq
      idiv r10d
      movsx	rax,eax
      mov	r12,rax
      mov 	r10,r12
      imul 	r10,r13
      mov 	r12,r10
      mov 	rax,r12
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
Rand:
      push	rbp
      mov	rbp,rsp
      sub	rsp,72
      mov 	r13,1
      mov 	r13,1
      jmp	_0whilecheck
_0for:
      mov	r10,[sjtulcno]
      imul	r10,[sjtulcaa]
      mov 	r12,r10
      mov 	r10,r12
      add	r10,[sjtulcbb]
      mov 	r12,r10
      mov 	rax,r12
      mov	r10d,[sjtulcMOD]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov 	r10,r12
      mov	[sjtulcno],r10
_0while:
      mov 	r10,r13
      mov 	r12,r10
      mov 	r10,r13
      add	r10,1
      mov 	r13,r10
_0whilecheck:
      mov 	r10,r13
      cmp	r10,3
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_0for
_0forback:
      mov	r10,[sjtulcno]
      cmp	r10,0
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_2else
_2if:
      mov	r10,[sjtulcno]
      not	r10
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
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
      sub	rsp,72
      mov 	r14,rdi
      mov 	r12,rsi
      push	r12
      push	r13
      push	r14
      push	r15
      call	Rand
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r13,rax
      mov 	r10,r12
      sub 	r10,r14
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	rax,r13
      mov 	r10,r12
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov 	r10,r14
      add 	r10,r12
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	rax,r12
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
init:
      push	rbp
      mov	rbp,rsp
      sub	rsp,336
      mov 	r13,1120048
      mov 	rdi,r13
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
      mov	qword[r11],140005
      mov 	r10,r12
      mov 	r15,r10
      mov	qword[rbp - 32],0
      mov 	r14,0
      mov	qword[rbp - 32],2
      jmp	_1whilecheck
_1for:
      mov	r10,[rbp - 32]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[rbp - 32]
      mov	r11,r15
      add	r11,r12
      mov	[r11],r10
_1while:
      mov	r10,[rbp - 32]
      add	r10,1
      mov	[rbp - 32],r10
_1whilecheck:
      mov	r10,[rbp - 32]
      cmp	r10,[sjtulcp]
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_1for
_1forback:
      mov	qword[rbp - 32],2
      jmp	_2whilecheck
_2for:
      mov 	r14,1
      jmp	_3whilecheck
_3for:
      mov	r10,[rbp - 32]
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov	r10,[rbp - 32]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,r15
      add	r10,r12
      mov	rdi,[r10]
      push	r12
      push	r13
      push	r14
      push	r15
      call	square
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	rax,r12
      mov	r10d,[sjtulcp]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov 	r10,r12
      mov	r11,r15
      add	r11,r13
      mov	[r11],r10
_3while:
      mov 	r10,r14
      add	r10,1
      mov 	r14,r10
_3whilecheck:
      mov 	r10,r14
      cmp	r10,15
      setle r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_3for
_3forback:
_2while:
      mov	r10,[rbp - 32]
      add	r10,1
      mov	[rbp - 32],r10
_2whilecheck:
      mov	r10,[rbp - 32]
      cmp	r10,[sjtulcp]
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_2for
_2forback:
      mov	qword[rbp - 32],2
      jmp	_4whilecheck
_4for:
      mov	r10,[rbp - 32]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,r15
      add	r10,r12
      mov	r10,[r10]
      mov 	r14,r10
      mov 	r13,1
      jmp	_5whilecheck
_5for:
      mov 	rdi,r14
      push	r12
      push	r13
      push	r14
      push	r15
      call	square
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	rax,r12
      mov	r10d,[sjtulcp]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov 	r10,r12
      mov 	r14,r10
      mov 	r10,r14
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulcb]
      add	r11,r12
      mov	qword[r11],1
      mov	r10,[rbp - 32]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov 	r10,r14
      mov	r11,r15
      add	r11,r12
      cmp	r10,[r11]
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_3else
_3if:
      jmp	_5forback
      jmp	_3ifback
_3else:
_3ifback:
_5while:
      mov 	r10,r13
      add	r10,1
      mov 	r13,r10
_5whilecheck:
      mov	r10,1
      cmp	r10,1
      je	_5for
_5forback:
      mov	rdi,[sjtulcL]
      mov 	rsi,r13
      push	r12
      push	r13
      push	r14
      push	r15
      call	lcm
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	r10,r12
      mov	[sjtulcL],r10
_4while:
      mov	r10,[rbp - 32]
      add	r10,1
      mov	[rbp - 32],r10
_4whilecheck:
      mov	r10,[rbp - 32]
      cmp	r10,[sjtulcp]
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_4for
_4forback:
      mov	r11,[sjtulcb]
      add	r11,8
      mov	qword[r11],1
      mov	r11,[sjtulcb]
      add	r11,16
      mov	qword[r11],1
      mov	rsp,rbp
      pop rbp
      ret
build:
      push	rbp
      mov	rbp,rsp
      sub	rsp,856
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	[rbp - 24],rdx
      mov	qword[rbp - 32],0
      mov	r10,[rbp - 16]
      cmp	r10,[rbp - 24]
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_5else
_5if:
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
      mov	r10,[sjtulca]
      add	r10,r12
      mov	r10,[r10]
      mov	r11,[sjtulcsum]
      add	r11,r13
      mov	[r11],r10
      mov	r10,[rbp - 16]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulca]
      add	r11,r12
      mov	r10,[r11]
      cmp	r10,[sjtulcp]
      setl r10b
      movzx r10,r10b
      mov 	r13,r10
      mov 	r10,r13
      cmp	r10,0
      je	_0check
      mov	r10,[rbp - 16]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulca]
      add	r11,r12
      mov	r10,[r11]
      cmp	r10,0
      setge r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r13
      and 	r10,r12
_0check:
      mov 	r13,r10
      mov 	r10,r13
      cmp	r10,0
      je	_1check
      mov	r10,[rbp - 16]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[sjtulca]
      add	r10,r12
      mov	eax,[r10]
      mov	r10d,[sjtulcp]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulcb]
      add	r11,r12
      mov	r10,[r11]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r13
      and 	r10,r12
_1check:
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_4else
_4if:
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulcflag]
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
      mov	r10,[sjtulca]
      add	r10,r13
      mov	r10,[r10]
      mov	r11,[sjtulcs]
      add	r11,r12
      mov	r11,[r11]
      add	r11,8
      mov	[r11],r10
      mov	qword[rbp - 32],1
      jmp	_6whilecheck
_6for:
      mov	r10,[rbp - 8]
      add	r10,1
      mov	[rbp - 184],r10
      mov	r10,[rbp - 184]
      imul	r10,8
      mov	[rbp - 184],r10
      mov	r10,[rbp - 32]
      add	r10,1
      mov	[rbp - 192],r10
      mov	r10,[rbp - 192]
      imul	r10,8
      mov	[rbp - 192],r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov	[rbp - 216],r10
      mov	r10,[rbp - 216]
      imul	r10,8
      mov	[rbp - 216],r10
      mov	r10,[rbp - 32]
      sub	r10,1
      mov	[rbp - 224],r10
      mov	r10,[rbp - 224]
      add	r10,1
      mov	[rbp - 232],r10
      mov	r10,[rbp - 232]
      imul	r10,8
      mov	[rbp - 232],r10
      mov	r10,[sjtulcs]
      add	r10,[rbp - 216]
      mov	r10,[r10]
      add	r10,[rbp - 232]
      mov	rdi,[r10]
      push	r12
      push	r13
      push	r14
      push	r15
      call	square
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov	[rbp -  240],rax
      mov	eax,[rbp - 240]
      mov	r10d,[sjtulcp]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 248],rdx
      mov	r10,[rbp - 248]
      mov	r11,[sjtulcs]
      add	r11,[rbp - 184]
      mov	r11,[r11]
      add	r11,[rbp - 192]
      mov	[r11],r10
_6while:
      mov	r10,[rbp - 32]
      add	r10,1
      mov	[rbp - 32],r10
_6whilecheck:
      mov	r10,[rbp - 32]
      cmp	r10,[sjtulcL]
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_6for
_6forback:
      jmp	_4ifback
_4else:
_4ifback:
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulcnow]
      add	r11,r12
      mov	qword[r11],0
      jmp	_5ifback
_5else:
      mov	r10,[rbp - 8]
      imul	r10,2
      mov 	r12,r10
      mov 	r10,r12
      mov	[rbp - 432],r10
      mov	r10,[rbp - 8]
      imul	r10,2
      mov	[rbp - 456],r10
      mov	r10,[rbp - 456]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      mov	[rbp - 448],r10
      mov	r10,[rbp - 16]
      add	r10,[rbp - 24]
      mov	[rbp - 480],r10
      mov	eax,[rbp - 480]
      mov	r10d,2
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 488],rax
      mov	r10,[rbp - 488]
      mov	[rbp - 472],r10
      mov	rdi,[rbp-432]
      mov	rsi,[rbp-16]
      mov	rdx,[rbp-472]
      push	r12
      push	r13
      push	r14
      push	r15
      call	build
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov	[rbp -  496],rax
      mov	r10,[rbp - 472]
      add	r10,1
      mov	[rbp - 504],r10
      mov	rdi,[rbp-448]
      mov	rsi,[rbp-504]
      mov	rdx,[rbp-24]
      push	r12
      push	r13
      push	r14
      push	r15
      call	build
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov	r10,[rbp - 8]
      add	r10,1
      mov	[rbp - 536],r10
      mov	r10,[rbp - 536]
      imul	r10,8
      mov	[rbp - 536],r10
      mov	r10,[rbp - 432]
      add	r10,1
      mov	[rbp - 560],r10
      mov	r10,[rbp - 560]
      imul	r10,8
      mov	[rbp - 560],r10
      mov	r10,[rbp - 448]
      add	r10,1
      mov	[rbp - 584],r10
      mov	r10,[rbp - 584]
      imul	r10,8
      mov	[rbp - 584],r10
      mov	r10,[sjtulcsum]
      add	r10,[rbp - 560]
      mov	r10,[r10]
      mov	r11,[sjtulcsum]
      add	r11,[rbp - 584]
      add	r10,[r11]
      mov	[rbp - 592],r10
      mov	r10,[rbp - 592]
      mov	r11,[sjtulcsum]
      add	r11,[rbp - 536]
      mov	[r11],r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov	[rbp - 616],r10
      mov	r10,[rbp - 616]
      imul	r10,8
      mov	[rbp - 616],r10
      mov	r10,[rbp - 432]
      add	r10,1
      mov	[rbp - 640],r10
      mov	r10,[rbp - 640]
      imul	r10,8
      mov	[rbp - 640],r10
      mov	r10,[rbp - 448]
      add	r10,1
      mov	[rbp - 664],r10
      mov	r10,[rbp - 664]
      imul	r10,8
      mov	[rbp - 664],r10
      mov	r11,[sjtulcflag]
      add	r11,[rbp - 640]
      mov	r10,[r11]
      mov	r11,[sjtulcflag]
      add	r11,[rbp - 664]
      and	r10,[r11]
_2check:
      mov 	r12,r10
      mov 	r10,r12
      mov	r11,[sjtulcflag]
      add	r11,[rbp - 616]
      mov	[r11],r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulcflag]
      add	r11,r12
      mov	r10,[r11]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_6else
_6if:
      mov	qword[rbp - 32],0
      jmp	_7whilecheck
_7for:
      mov	r10,[rbp - 8]
      add	r10,1
      mov	[rbp - 696],r10
      mov	r10,[rbp - 696]
      imul	r10,8
      mov	[rbp - 696],r10
      mov	r10,[rbp - 32]
      add	r10,1
      mov	[rbp - 704],r10
      mov	r10,[rbp - 704]
      imul	r10,8
      mov	[rbp - 704],r10
      mov	r10,[rbp - 432]
      add	r10,1
      mov	[rbp - 728],r10
      mov	r10,[rbp - 728]
      imul	r10,8
      mov	[rbp - 728],r10
      mov	r10,[rbp - 32]
      add	r10,1
      mov	[rbp - 736],r10
      mov	r10,[rbp - 736]
      imul	r10,8
      mov	[rbp - 736],r10
      mov	r10,[rbp - 448]
      add	r10,1
      mov	[rbp - 760],r10
      mov	r10,[rbp - 760]
      imul	r10,8
      mov	[rbp - 760],r10
      mov	r10,[rbp - 32]
      add	r10,1
      mov	[rbp - 768],r10
      mov	r10,[rbp - 768]
      imul	r10,8
      mov	[rbp - 768],r10
      mov	r10,[sjtulcs]
      add	r10,[rbp - 728]
      mov	r10,[r10]
      add	r10,[rbp - 736]
      mov	r10,[r10]
      mov	r11,[sjtulcs]
      add	r11,[rbp - 760]
      mov	r11,[r11]
      add	r11,[rbp - 768]
      add	r10,[r11]
      mov	[rbp - 776],r10
      mov	r10,[rbp - 776]
      mov	r11,[sjtulcs]
      add	r11,[rbp - 696]
      mov	r11,[r11]
      add	r11,[rbp - 704]
      mov	[r11],r10
_7while:
      mov	r10,[rbp - 32]
      add	r10,1
      mov	[rbp - 32],r10
_7whilecheck:
      mov	r10,[rbp - 32]
      cmp	r10,[sjtulcL]
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_7for
_7forback:
      mov	r11,[sjtulcnow]
      add	r11,8
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
      sub	rsp,624
      mov	[rbp - 8],rdi
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulct]
      add	r11,r12
      mov	r10,[r11]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_7else
_7if:
      mov	r10,[rbp - 8]
      imul	r10,2
      mov 	r12,r10
      mov 	r10,r12
      mov	[rbp - 16],r10
      mov	r10,[rbp - 8]
      imul	r10,2
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      mov	[rbp - 32],r10
      mov	r10,[rbp - 16]
      add	r10,1
      mov	[rbp - 72],r10
      mov	r10,[rbp - 72]
      imul	r10,8
      mov	[rbp - 72],r10
      mov	r10,[rbp - 16]
      add	r10,1
      mov	[rbp - 96],r10
      mov	r10,[rbp - 96]
      imul	r10,8
      mov	[rbp - 96],r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov	[rbp - 120],r10
      mov	r10,[rbp - 120]
      imul	r10,8
      mov	[rbp - 120],r10
      mov	r10,[sjtulcnow]
      add	r10,[rbp - 96]
      mov	r10,[r10]
      mov	r11,[sjtulct]
      add	r11,[rbp - 120]
      add	r10,[r11]
      mov 	r12,r10
      mov 	rax,r12
      mov	r10d,[sjtulcL]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov 	r10,r12
      mov	r11,[sjtulcnow]
      add	r11,[rbp - 72]
      mov	[r11],r10
      mov	r10,[rbp - 16]
      add	r10,1
      mov	[rbp - 160],r10
      mov	r10,[rbp - 160]
      imul	r10,8
      mov	[rbp - 160],r10
      mov	r10,[rbp - 16]
      add	r10,1
      mov	[rbp - 184],r10
      mov	r10,[rbp - 184]
      imul	r10,8
      mov	[rbp - 184],r10
      mov	r10,[rbp - 16]
      add	r10,1
      mov	[rbp - 208],r10
      mov	r10,[rbp - 208]
      imul	r10,8
      mov	[rbp - 208],r10
      mov	r10,[sjtulcnow]
      add	r10,[rbp - 208]
      mov	r10,[r10]
      add	r10,1
      mov	[rbp - 216],r10
      mov	r10,[rbp - 216]
      imul	r10,8
      mov	[rbp - 216],r10
      mov	r10,[sjtulcs]
      add	r10,[rbp - 184]
      mov	r10,[r10]
      add	r10,[rbp - 216]
      mov	r10,[r10]
      mov	r11,[sjtulcsum]
      add	r11,[rbp - 160]
      mov	[r11],r10
      mov	r10,[rbp - 16]
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
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov	r10,[sjtulct]
      add	r10,r12
      mov	r10,[r10]
      mov	r11,[sjtulct]
      add	r11,r13
      add	r10,[r11]
      mov 	r12,r10
      mov 	rax,r12
      mov	r10d,[sjtulcL]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov 	r10,r12
      mov	r11,[sjtulct]
      add	r11,r14
      mov	[r11],r10
      mov	r10,[rbp - 32]
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov	r10,[rbp - 32]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r14,r10
      mov 	r10,r14
      imul	r10,8
      mov 	r14,r10
      mov	r10,[sjtulcnow]
      add	r10,r12
      mov	r10,[r10]
      mov	r11,[sjtulct]
      add	r11,r14
      add	r10,[r11]
      mov 	r12,r10
      mov 	rax,r12
      mov	r10d,[sjtulcL]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov 	r10,r12
      mov	r11,[sjtulcnow]
      add	r11,r13
      mov	[r11],r10
      mov	r10,[rbp - 32]
      add	r10,1
      mov 	r14,r10
      mov 	r10,r14
      imul	r10,8
      mov 	r14,r10
      mov	r10,[rbp - 32]
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov	r10,[rbp - 32]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[sjtulcnow]
      add	r10,r12
      mov	r10,[r10]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[sjtulcs]
      add	r10,r13
      mov	r10,[r10]
      add	r10,r12
      mov	r10,[r10]
      mov	r11,[sjtulcsum]
      add	r11,r14
      mov	[r11],r10
      mov	r10,[rbp - 32]
      add	r10,1
      mov 	r14,r10
      mov 	r10,r14
      imul	r10,8
      mov 	r14,r10
      mov	r10,[rbp - 32]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov	r10,[sjtulct]
      add	r10,r12
      mov	r10,[r10]
      mov	r11,[sjtulct]
      add	r11,r13
      add	r10,[r11]
      mov 	r12,r10
      mov 	rax,r12
      mov	r10d,[sjtulcL]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov 	r10,r12
      mov	r11,[sjtulct]
      add	r11,r14
      mov	[r11],r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulct]
      add	r11,r12
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
      sub	rsp,1184
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	[rbp - 24],rdx
      mov	r10,[sjtulcpl]
      cmp	r10,[rbp - 16]
      setle r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,0
      je	_3check
      mov	r10,[sjtulcpr]
      cmp	r10,[rbp - 24]
      setge r10b
      movzx r10,r10b
      mov 	r13,r10
      mov 	r10,r12
      and 	r10,r13
_3check:
      mov 	r13,r10
      mov 	r10,r13
      cmp	r10,0
      je	_4check
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulcflag]
      add	r11,r12
      mov	r10,[r11]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r13
      and 	r10,r12
_4check:
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_8else
_8if:
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[sjtulcnow]
      add	r10,r12
      mov	r10,[r10]
      add	r10,1
      mov 	r12,r10
      mov 	rax,r12
      mov	r10d,[sjtulcL]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov 	r10,r12
      mov	r11,[sjtulcnow]
      add	r11,r13
      mov	[r11],r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r14,r10
      mov 	r10,r14
      imul	r10,8
      mov 	r14,r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[sjtulcnow]
      add	r10,r12
      mov	r10,[r10]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[sjtulcs]
      add	r10,r14
      mov	r10,[r10]
      add	r10,r12
      mov	r10,[r10]
      mov	r11,[sjtulcsum]
      add	r11,r13
      mov	[r11],r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[sjtulct]
      add	r10,r12
      mov	r10,[r10]
      add	r10,1
      mov 	r12,r10
      mov 	rax,r12
      mov	r10d,[sjtulcL]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov 	r10,r12
      mov	r11,[sjtulct]
      add	r11,r13
      mov	[r11],r10
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_8ifback
_8else:
_8ifback:
      mov	r10,[rbp - 16]
      cmp	r10,[rbp - 24]
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_10else
_10if:
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[sjtulcsum]
      add	r10,r12
      mov	rdi,[r10]
      push	r12
      push	r13
      push	r14
      push	r15
      call	square
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	rax,r12
      mov	r10d,[sjtulcp]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov 	r10,r12
      mov	r11,[sjtulcsum]
      add	r11,r13
      mov	[r11],r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[sjtulcsum]
      add	r10,r12
      mov	r10,[r10]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulcb]
      add	r11,r12
      mov	r10,[r11]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_9else
_9if:
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulcflag]
      add	r11,r12
      mov	qword[r11],1
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r13,r10
      mov 	r10,r13
      imul	r10,8
      mov 	r13,r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[sjtulcsum]
      add	r10,r12
      mov	r10,[r10]
      mov	r11,[sjtulcs]
      add	r11,r13
      mov	r11,[r11]
      add	r11,8
      mov	[r11],r10
      mov	qword[rbp - 448],0
      mov	qword[rbp - 448],1
      jmp	_8whilecheck
_8for:
      mov	r10,[rbp - 8]
      add	r10,1
      mov	[rbp - 472],r10
      mov	r10,[rbp - 472]
      imul	r10,8
      mov	[rbp - 472],r10
      mov	r10,[rbp - 448]
      add	r10,1
      mov	[rbp - 480],r10
      mov	r10,[rbp - 480]
      imul	r10,8
      mov	[rbp - 480],r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov	[rbp - 504],r10
      mov	r10,[rbp - 504]
      imul	r10,8
      mov	[rbp - 504],r10
      mov	r10,[rbp - 448]
      sub	r10,1
      mov	[rbp - 512],r10
      mov	r10,[rbp - 512]
      add	r10,1
      mov	[rbp - 520],r10
      mov	r10,[rbp - 520]
      imul	r10,8
      mov	[rbp - 520],r10
      mov	r10,[sjtulcs]
      add	r10,[rbp - 504]
      mov	r10,[r10]
      add	r10,[rbp - 520]
      mov	rdi,[r10]
      push	r12
      push	r13
      push	r14
      push	r15
      call	square
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	rax,r12
      mov	r10d,[sjtulcp]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov 	r10,r12
      mov	r11,[sjtulcs]
      add	r11,[rbp - 472]
      mov	r11,[r11]
      add	r11,[rbp - 480]
      mov	[r11],r10
_8while:
      mov	r10,[rbp - 448]
      add	r10,1
      mov	[rbp - 448],r10
_8whilecheck:
      mov	r10,[rbp - 448]
      cmp	r10,[sjtulcL]
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
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
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulct]
      add	r11,r12
      mov	r10,[r11]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_11else
_11if:
      mov	rdi,[rbp-8]
      push	r12
      push	r13
      push	r14
      push	r15
      call	pushdown
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      jmp	_11ifback
_11else:
_11ifback:
      mov	r10,[rbp - 8]
      imul	r10,2
      mov 	r12,r10
      mov 	r10,r12
      mov	[rbp - 656],r10
      mov	r10,[rbp - 8]
      imul	r10,2
      mov	[rbp - 680],r10
      mov	r10,[rbp - 680]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      mov	[rbp - 672],r10
      mov	r10,[rbp - 16]
      add	r10,[rbp - 24]
      mov	[rbp - 704],r10
      mov	eax,[rbp - 704]
      mov	r10d,2
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 712],rax
      mov	r10,[rbp - 712]
      mov	[rbp - 696],r10
      mov	r10,[sjtulcpl]
      cmp	r10,[rbp - 696]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 728],r10
      mov	 r10,[rbp-728]
      cmp	 r10,0
      je	_12else
_12if:
      mov	rdi,[rbp-656]
      mov	rsi,[rbp-16]
      mov	rdx,[rbp-696]
      push	r12
      push	r13
      push	r14
      push	r15
      call	update
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov	[rbp -  720],rax
      jmp	_12ifback
_12else:
_12ifback:
      mov	r10,[rbp - 696]
      add	r10,1
      mov	[rbp - 752],r10
      mov	r10,[sjtulcpr]
      cmp	r10,[rbp - 752]
      setge r10b
      movzx r10,r10b
      mov	[rbp - 760],r10
      mov	 r10,[rbp-760]
      cmp	 r10,0
      je	_13else
_13if:
      mov	r10,[rbp - 696]
      add	r10,1
      mov	[rbp - 736],r10
      mov	rdi,[rbp-672]
      mov	rsi,[rbp-736]
      mov	rdx,[rbp-24]
      push	r12
      push	r13
      push	r14
      push	r15
      call	update
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      jmp	_13ifback
_13else:
_13ifback:
      mov	r10,[rbp - 8]
      add	r10,1
      mov	[rbp - 784],r10
      mov	r10,[rbp - 784]
      imul	r10,8
      mov	[rbp - 784],r10
      mov	r10,[rbp - 656]
      add	r10,1
      mov	[rbp - 808],r10
      mov	r10,[rbp - 808]
      imul	r10,8
      mov	[rbp - 808],r10
      mov	r10,[rbp - 672]
      add	r10,1
      mov	[rbp - 832],r10
      mov	r10,[rbp - 832]
      imul	r10,8
      mov	[rbp - 832],r10
      mov	r10,[sjtulcsum]
      add	r10,[rbp - 808]
      mov	r10,[r10]
      mov	r11,[sjtulcsum]
      add	r11,[rbp - 832]
      add	r10,[r11]
      mov 	r12,r10
      mov 	r10,r12
      mov	r11,[sjtulcsum]
      add	r11,[rbp - 784]
      mov	[r11],r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov	[rbp - 864],r10
      mov	r10,[rbp - 864]
      imul	r10,8
      mov	[rbp - 864],r10
      mov	r10,[rbp - 656]
      add	r10,1
      mov	[rbp - 888],r10
      mov	r10,[rbp - 888]
      imul	r10,8
      mov	[rbp - 888],r10
      mov	r10,[rbp - 672]
      add	r10,1
      mov	[rbp - 912],r10
      mov	r10,[rbp - 912]
      imul	r10,8
      mov	[rbp - 912],r10
      mov	r11,[sjtulcflag]
      add	r11,[rbp - 888]
      mov	r10,[r11]
      mov	r11,[sjtulcflag]
      add	r11,[rbp - 912]
      and	r10,[r11]
_5check:
      mov 	r12,r10
      mov 	r10,r12
      mov	r11,[sjtulcflag]
      add	r11,[rbp - 864]
      mov	[r11],r10
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulcflag]
      add	r11,r12
      mov	r10,[r11]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_14else
_14if:
      mov	qword[rbp - 928],0
      mov	qword[rbp - 928],0
      jmp	_9whilecheck
_9for:
      mov	r10,[rbp - 8]
      add	r10,1
      mov	[rbp - 952],r10
      mov	r10,[rbp - 952]
      imul	r10,8
      mov	[rbp - 952],r10
      mov	r10,[rbp - 928]
      add	r10,1
      mov	[rbp - 960],r10
      mov	r10,[rbp - 960]
      imul	r10,8
      mov	[rbp - 960],r10
      mov	r10,[rbp - 656]
      add	r10,1
      mov	[rbp - 984],r10
      mov	r10,[rbp - 984]
      imul	r10,8
      mov	[rbp - 984],r10
      mov	r10,[rbp - 656]
      add	r10,1
      mov	[rbp - 1008],r10
      mov	r10,[rbp - 1008]
      imul	r10,8
      mov	[rbp - 1008],r10
      mov	r10,[rbp - 928]
      mov	r11,[sjtulcnow]
      add	r11,[rbp - 1008]
      add	r10,[r11]
      mov	[rbp - 1016],r10
      mov	eax,[rbp - 1016]
      mov	r10d,[sjtulcL]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 1024],rdx
      mov	r10,[rbp - 1024]
      add	r10,1
      mov	[rbp - 1032],r10
      mov	r10,[rbp - 1032]
      imul	r10,8
      mov	[rbp - 1032],r10
      mov	r10,[rbp - 672]
      add	r10,1
      mov	[rbp - 1056],r10
      mov	r10,[rbp - 1056]
      imul	r10,8
      mov	[rbp - 1056],r10
      mov	r10,[rbp - 672]
      add	r10,1
      mov	[rbp - 1080],r10
      mov	r10,[rbp - 1080]
      imul	r10,8
      mov	[rbp - 1080],r10
      mov	r10,[rbp - 928]
      mov	r11,[sjtulcnow]
      add	r11,[rbp - 1080]
      add	r10,[r11]
      mov	[rbp - 1088],r10
      mov	eax,[rbp - 1088]
      mov	r10d,[sjtulcL]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 1096],rdx
      mov	r10,[rbp - 1096]
      add	r10,1
      mov	[rbp - 1104],r10
      mov	r10,[rbp - 1104]
      imul	r10,8
      mov	[rbp - 1104],r10
      mov	r10,[sjtulcs]
      add	r10,[rbp - 984]
      mov	r10,[r10]
      add	r10,[rbp - 1032]
      mov	r10,[r10]
      mov	r11,[sjtulcs]
      add	r11,[rbp - 1056]
      mov	r11,[r11]
      add	r11,[rbp - 1104]
      add	r10,[r11]
      mov	[rbp - 1112],r10
      mov	r10,[rbp - 1112]
      mov	r11,[sjtulcs]
      add	r11,[rbp - 952]
      mov	r11,[r11]
      add	r11,[rbp - 960]
      mov	[r11],r10
_9while:
      mov	r10,[rbp - 928]
      add	r10,1
      mov	[rbp - 928],r10
_9whilecheck:
      mov	r10,[rbp - 928]
      cmp	r10,[sjtulcL]
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_9for
_9forback:
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r11,[sjtulcnow]
      add	r11,r12
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
      sub	rsp,272
      mov	[rbp - 8],rdi
      mov	[rbp - 16],rsi
      mov	[rbp - 24],rdx
      mov	r10,[sjtulcpl]
      cmp	r10,[rbp - 16]
      setle r10b
      movzx r10,r10b
      mov 	r13,r10
      mov 	r10,r13
      cmp	r10,0
      je	_6check
      mov	r10,[sjtulcpr]
      cmp	r10,[rbp - 24]
      setge r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r13
      and 	r10,r12
_6check:
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_15else
_15if:
      mov	r10,[rbp - 8]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov	r10,[sjtulcsum]
      add	r10,r12
      mov	rax,[r10]
      mov	rsp,rbp
      pop rbp
      ret
      jmp	_15ifback
_15else:
_15ifback:
      mov	r10,[rbp - 8]
      imul	r10,2
      mov 	r12,r10
      mov 	r10,r12
      mov	[rbp - 80],r10
      mov	r10,[rbp - 8]
      imul	r10,2
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      mov	[rbp - 96],r10
      mov	r10,[rbp - 16]
      add	r10,[rbp - 24]
      mov	[rbp - 128],r10
      mov	eax,[rbp - 128]
      mov	r10d,2
      cdq
      idiv r10d
      movsx	rax,eax
      mov	[rbp - 136],rax
      mov	r10,[rbp - 136]
      mov	[rbp - 120],r10
      mov	qword[rbp - 144],0
      mov	r10,[rbp - 8]
      add	r10,1
      mov	[rbp - 176],r10
      mov	r10,[rbp - 176]
      imul	r10,8
      mov	[rbp - 176],r10
      mov	r11,[sjtulct]
      add	r11,[rbp - 176]
      mov	r10,[r11]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov	[rbp - 184],r10
      mov	 r10,[rbp-184]
      cmp	 r10,0
      je	_16else
_16if:
      mov	rdi,[rbp-8]
      push	r12
      push	r13
      push	r14
      push	r15
      call	pushdown
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov	[rbp -  152],rax
      jmp	_16ifback
_16else:
_16ifback:
      mov	r10,[sjtulcpl]
      cmp	r10,[rbp - 120]
      setle r10b
      movzx r10,r10b
      mov	[rbp - 216],r10
      mov	 r10,[rbp-216]
      cmp	 r10,0
      je	_17else
_17if:
      mov	rdi,[rbp-80]
      mov	rsi,[rbp-16]
      mov	rdx,[rbp-120]
      push	r12
      push	r13
      push	r14
      push	r15
      call	query
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov	[rbp -  192],rax
      mov	r10,[rbp - 144]
      add	r10,[rbp - 192]
      mov 	r12,r10
      mov 	rax,r12
      mov	r10d,[sjtulcMOD]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov 	r10,r12
      mov	[rbp - 144],r10
      jmp	_17ifback
_17else:
_17ifback:
      mov	r10,[rbp - 120]
      add	r10,1
      mov 	r12,r10
      mov	r10,[sjtulcpr]
      cmp 	r10,r12
      setge r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_18else
_18if:
      mov	r10,[rbp - 120]
      add	r10,1
      mov 	r12,r10
      mov	rdi,[rbp-96]
      mov 	rsi,r12
      mov	rdx,[rbp-24]
      push	r12
      push	r13
      push	r14
      push	r15
      call	query
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov	r10,[rbp - 144]
      add 	r10,r12
      mov 	r12,r10
      mov 	rax,r12
      mov	r10d,[sjtulcMOD]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov 	r10,r12
      mov	[rbp - 144],r10
      jmp	_18ifback
_18else:
_18ifback:
      mov	rax,[rbp -  144]
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
main:
      push	rbp
      mov	rbp,rsp
      sub	rsp,224
      mov	qword[rbp - -3632],4000048
      mov	rdi,[rbp--3632]
      push	r12
      push	r13
      push	r14
      push	r15
      call	malloc
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov	[rbp -  -3624],rax
      mov	r11,[rbp - -3624]
      add	r11,0
      mov	qword[r11],500005
      mov	r10,[rbp - -3624]
      mov	[sjtulcb],r10
      mov	qword[rbp - -3616],4000048
      mov	rdi,[rbp--3616]
      push	r12
      push	r13
      push	r14
      push	r15
      call	malloc
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov	[rbp -  -3608],rax
      mov	r11,[rbp - -3608]
      add	r11,0
      mov	qword[r11],500005
      mov	r10,[rbp - -3608]
      mov	[sjtulcnow],r10
      mov	qword[rbp - -3600],4000048
      mov	rdi,[rbp--3600]
      push	r12
      push	r13
      push	r14
      push	r15
      call	malloc
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov	[rbp -  -3592],rax
      mov	r11,[rbp - -3592]
      add	r11,0
      mov	qword[r11],500005
      mov	r10,[rbp - -3592]
      mov	[sjtulct],r10
      mov	qword[rbp - -3584],1600048
      mov	rdi,[rbp--3584]
      push	r12
      push	r13
      push	r14
      push	r15
      call	malloc
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov	[rbp -  -3576],rax
      mov	r11,[rbp - -3576]
      add	r11,0
      mov	qword[r11],200005
      mov	r10,[rbp - -3576]
      mov	[sjtulca],r10
      mov	qword[sjtulcL],1
      mov 	r12,4000048
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
      mov	[rbp -  -3560],rax
      mov	r11,[rbp - -3560]
      add	r11,0
      mov	qword[r11],500005
      mov	r10,[rbp - -3560]
      mov	[sjtulcflag],r10
      mov 	r12,4000048
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
      mov	[rbp -  -3544],rax
      mov	r11,[rbp - -3544]
      add	r11,0
      mov	qword[r11],500005
      mov	r10,[rbp - -3544]
      mov	[rbp - -3528],r10
      mov	qword[rbp - -3536],0
_0arr:
      mov	r10,[rbp - -3536]
      add	r10,1
      mov	[rbp - -3536],r10
      mov	r10,[rbp - -3544]
      add	r10,8
      mov	[rbp - -3544],r10
      mov	r10,80
      add	r10,1
      mov	[rbp - -3520],r10
      mov	r10,[rbp - -3520]
      imul	r10,8
      mov	[rbp - -3520],r10
      mov	rdi,[rbp--3520]
      push	r12
      push	r13
      push	r14
      push	r15
      call	malloc
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov	[rbp -  -3512],rax
      mov	r11,[rbp - -3512]
      add	r11,0
      mov	qword[r11],80
      mov	r10,[rbp - -3512]
      mov	r11,[rbp - -3544]
      add	r11,0
      mov	[r11],r10
      mov	r10,[rbp - -3536]
      cmp	r10,500005
      setl r10b
      movzx r10,r10b
      mov	[rbp - -3504],r10
      mov	r10,[rbp - -3504]
      cmp	r10,1
      je	_0arr
      mov	r10,[rbp - -3528]
      mov	[sjtulcs],r10
      mov 	r12,4000048
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
      mov	[rbp -  -3488],rax
      mov	r11,[rbp - -3488]
      add	r11,0
      mov	qword[r11],500005
      mov	r10,[rbp - -3488]
      mov	[sjtulcsum],r10
      mov	qword[sjtulcans],0
      mov	qword[sjtulcaa],13131
      mov	qword[sjtulcbb],5353
      mov	qword[sjtulcMOD],32761
      mov	qword[sjtulcno],1
      mov	qword[sjtulcpl],0
      mov	qword[sjtulcpr],0
      push	r12
      push	r13
      push	r14
      push	r15
      call	getInt
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	r10,r12
      mov	[sjtulcn],r10
      push	r12
      push	r13
      push	r14
      push	r15
      call	getInt
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	r10,r12
      mov	[sjtulcm],r10
      push	r12
      push	r13
      push	r14
      push	r15
      call	getInt
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	r10,r12
      mov	[sjtulcp],r10
      mov 	r13,1
      mov 	r13,1
      jmp	_10whilecheck
_10for:
      mov 	r10,r13
      add	r10,1
      mov 	r14,r10
      mov 	r10,r14
      imul	r10,8
      mov 	r14,r10
      mov	rdi,0
      mov	rsi,[sjtulcp]
      push	r12
      push	r13
      push	r14
      push	r15
      call	RandRange
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	r10,r12
      mov	r11,[sjtulca]
      add	r11,r14
      mov	[r11],r10
_10while:
      mov 	r10,r13
      add	r10,1
      mov 	r13,r10
_10whilecheck:
      mov 	r10,r13
      cmp	r10,[sjtulcn]
      setle r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_10for
_10forback:
      push	r12
      push	r13
      push	r14
      push	r15
      call	init
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov	rdi,1
      mov	rsi,1
      mov	rdx,[sjtulcn]
      push	r12
      push	r13
      push	r14
      push	r15
      call	build
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      jmp	_11while
_11for:
      push	r12
      push	r13
      push	r14
      push	r15
      call	Rand
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	rax,r12
      mov	r10d,2
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov 	r10,r12
      mov	[sjtulcop],r10
      mov	rdi,1
      mov	rsi,[sjtulcn]
      push	r12
      push	r13
      push	r14
      push	r15
      call	RandRange
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	r10,r12
      mov	[sjtulcpl],r10
      mov	rdi,1
      mov	rsi,[sjtulcn]
      push	r12
      push	r13
      push	r14
      push	r15
      call	RandRange
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	r10,r12
      mov	[sjtulcpr],r10
      jmp	_12while
_12for:
      mov	rdi,1
      mov	rsi,[sjtulcn]
      push	r12
      push	r13
      push	r14
      push	r15
      call	RandRange
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov 	r10,r12
      mov	[sjtulcpr],r10
_12while:
      mov	r10,[sjtulcpr]
      cmp	r10,[sjtulcpl]
      setle r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_12for
_12forback:
      mov	r10,[sjtulcop]
      cmp	r10,0
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_19else
_19if:
      mov	rdi,1
      mov	rsi,1
      mov	rdx,[sjtulcn]
      push	r12
      push	r13
      push	r14
      push	r15
      call	update
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      jmp	_19ifback
_19else:
_19ifback:
      mov	r10,[sjtulcop]
      cmp	r10,1
      sete r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	 r10,0
      je	_20else
_20if:
      mov	rdi,1
      mov	rsi,1
      mov	rdx,[sjtulcn]
      push	r12
      push	r13
      push	r14
      push	r15
      call	query
      pop	r15
      pop	r14
      pop	r13
      pop	r12
      mov 	r12,rax
      mov	r10,[sjtulcans]
      add 	r10,r12
      mov 	r12,r10
      mov 	rax,r12
      mov	r10d,[sjtulcMOD]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	r12,rdx
      mov 	r10,r12
      mov	[sjtulcans],r10
      jmp	_20ifback
_20else:
_20ifback:
      mov	r10,[sjtulcm]
      mov 	r12,r10
      mov	r10,[sjtulcm]
      sub	r10,1
      mov	[sjtulcm],r10
_11while:
      mov	r10,[sjtulcm]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_11for
_11forback:
      mov	rdi,[sjtulcans]
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

