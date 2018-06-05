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
hilo:
      push	rbp
      mov	rbp,rsp
      sub	rsp,40
      mov 	r12,rdi
      mov 	r13,rsi
      mov 	r10,r12
      sal	r10,16
      mov 	r12,r10
      mov 	r10,r13
      or 	r10,r12
_0check:
      mov 	r12,r10
      mov 	rax,r12
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
shift_l:
      push	rbp
      mov	rbp,rsp
      sub	rsp,48
      mov 	r12,rdi
      mov 	r13,rsi
      mov 	r10,r12
      mov 	rcx,r13
      sal	r10,cl
      mov 	r12,r10
      mov	rdi,32767
      mov	rsi,65535
      push	r12
      call	hilo
      pop	r12
      mov 	r13,rax
      mov 	r10,r12
      and 	r10,r13
_1check:
      mov 	r12,r10
      mov 	rax,r12
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
shift_r:
      push	rbp
      mov	rbp,rsp
      sub	rsp,88
      mov 	r15,rdi
      mov 	r14,rsi
      mov	rdi,32767
      mov	rsi,65536
      push	r14
      push	r15
      call	hilo
      pop	r15
      pop	r14
      mov 	r12,rax
      mov 	r10,r12
      mov 	rcx,r14
      sar	r10,cl
      mov	r12,r10
      mov 	r10,r12
      sal	r10,2
      mov 	r12,r10
      mov 	r10,r12
      add	r10,1
      mov 	r13,r10
      mov 	r10,r15
      mov 	rcx,r14
      sar	r10,cl
      mov	r12,r10
      mov 	r10,r13
      and 	r10,r12
_2check:
      mov 	r13,r10
      mov	rdi,32767
      mov	rsi,65535
      push	r13
      call	hilo
      pop	r13
      mov 	r12,rax
      mov 	r10,r13
      and 	r10,r12
_3check:
      mov 	r12,r10
      mov 	rax,r12
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
xorshift:
      push	rbp
      mov	rbp,rsp
      sub	rsp,128
      mov 	r12,rdi
      mov 	r14,rsi
      mov 	r10,r12
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      mov 	r13,r10
      mov 	r15,0
      jmp	_0whilecheck
_0for:
      mov 	rdi,r13
      mov	rsi,13
      push	r13
      push	r14
      push	r15
      call	shift_l
      pop	r15
      pop	r14
      pop	r13
      mov 	r12,rax
      mov 	r10,r13
      xor 	r10,r12
      mov 	r12,r10
      mov 	r10,r12
      mov 	r13,r10
      mov 	rdi,r13
      mov	rsi,17
      push	r13
      push	r14
      push	r15
      call	shift_r
      pop	r15
      pop	r14
      pop	r13
      mov 	r12,rax
      mov 	r10,r13
      xor 	r10,r12
      mov 	r12,r10
      mov 	r10,r12
      mov 	r13,r10
      mov 	rdi,r13
      mov	rsi,5
      push	r13
      push	r14
      push	r15
      call	shift_l
      pop	r15
      pop	r14
      pop	r13
      mov 	r12,rax
      mov 	r10,r13
      xor 	r10,r12
      mov 	r12,r10
      mov 	r10,r12
      mov 	r13,r10
_0while:
      mov 	r10,r15
      mov 	r12,r10
      mov 	r10,r15
      add	r10,1
      mov 	r15,r10
_0whilecheck:
      mov 	r10,r14
      imul	r10,10
      mov 	r12,r10
      mov 	r10,r15
      cmp 	r10,r12
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_0for
_0forback:
      mov 	r10,r13
      xor	r10,123456789
      mov 	r12,r10
      mov 	rax,r12
      mov	rsp,rbp
      pop rbp
      ret
      mov	rsp,rbp
      pop rbp
      ret
main:
      push	rbp
      mov	rbp,rsp
      sub	rsp,744
      push	r13
      call	getInt
      pop	r13
      mov 	r12,rax
      mov 	r10,r12
      mov	[rbp - 280],r10
      mov	r10,[rbp - 280]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov 	rdi,r12
      push	r13
      call	malloc
      pop	r13
      mov	[rbp -  336],rax
      mov	r10,[rbp - 280]
      mov	r11,[rbp - 336]
      add	r11,0
      mov	[r11],r10
      mov	r10,[rbp - 336]
      mov 	r14,r10
      mov 	r15,0
_0arr:
      mov 	r10,r15
      add	r10,1
      mov 	r15,r10
      mov	r10,[rbp - 336]
      add	r10,8
      mov	[rbp - 336],r10
      mov	r10,[rbp - 280]
      add	r10,1
      mov 	r12,r10
      mov 	r10,r12
      imul	r10,8
      mov 	r12,r10
      mov 	rdi,r12
      push	r14
      push	r15
      call	malloc
      pop	r15
      pop	r14
      mov 	r13,rax
      mov	r10,[rbp - 280]
      mov	r11,r13
      add	r11,0
      mov	[r11],r10
      mov 	r10,r13
      mov	r11,[rbp - 336]
      add	r11,0
      mov	[r11],r10
      mov 	r10,r15
      cmp	r10,[rbp - 280]
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_0arr
      mov 	r10,r14
      mov	[rbp - 320],r10
      mov	qword[rbp - 296],0
      jmp	_1whilecheck
_1for:
      mov	qword[rbp - 304],0
      jmp	_2whilecheck
_2for:
      mov	qword[rbp - 312],0
      jmp	_3whilecheck
_3for:
      mov	r10,[rbp - 296]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov	[rbp - 544],r10
      mov	r10,[rbp - 544]
      cmp	r10,0
      je	_4check
      mov	r10,[rbp - 304]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov	[rbp - 552],r10
      mov	r10,[rbp - 544]
      and	r10,[rbp - 552]
_4check:
      mov	[rbp - 560],r10
      mov	r10,[rbp - 560]
      cmp	r10,0
      je	_5check
      mov	r10,[rbp - 312]
      cmp	r10,0
      setg r10b
      movzx r10,r10b
      mov	[rbp - 568],r10
      mov	r10,[rbp - 560]
      and	r10,[rbp - 568]
_5check:
      mov	[rbp - 576],r10
      mov	 r10,[rbp-576]
      cmp	 r10,0
      je	_1else
_1if:
      mov	eax,[rbp - 296]
      mov	r10d,[rbp - 304]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 456],rdx
      mov	eax,[rbp - 304]
      mov	r10d,[rbp - 312]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 464],rdx
      mov	r10,[rbp - 456]
      cmp	r10,[rbp - 464]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 472],r10
      mov	r10,[rbp - 472]
      cmp	r10,0
      je	_6check
      mov	eax,[rbp - 304]
      mov	r10d,[rbp - 312]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 480],rdx
      mov	eax,[rbp - 312]
      mov	r10d,[rbp - 296]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 488],rdx
      mov	r10,[rbp - 480]
      cmp	r10,[rbp - 488]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 496],r10
      mov	r10,[rbp - 472]
      and	r10,[rbp - 496]
_6check:
      mov	[rbp - 504],r10
      mov	r10,[rbp - 504]
      cmp	r10,0
      je	_7check
      mov	eax,[rbp - 296]
      mov	r10d,[rbp - 304]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 512],rdx
      mov	eax,[rbp - 312]
      mov	r10d,[rbp - 296]
      cdq
      idiv r10d
      movsx	rdx,edx
      mov	[rbp - 520],rdx
      mov	r10,[rbp - 512]
      cmp	r10,[rbp - 520]
      setne r10b
      movzx r10,r10b
      mov	[rbp - 528],r10
      mov	r10,[rbp - 504]
      and	r10,[rbp - 528]
_7check:
      mov	[rbp - 536],r10
      mov	 r10,[rbp-536]
      cmp	 r10,0
      je	_0else
_0if:
      mov	r10,[rbp - 296]
      add	r10,1
      mov	[rbp - 400],r10
      mov	r10,[rbp - 400]
      imul	r10,8
      mov	[rbp - 400],r10
      mov	r10,[rbp - 304]
      add	r10,1
      mov	[rbp - 408],r10
      mov	r10,[rbp - 408]
      imul	r10,8
      mov	[rbp - 408],r10
      mov	r10,[rbp - 296]
      and	r10,[rbp - 304]
_8check:
      mov	[rbp - 416],r10
      mov	r10,[rbp - 416]
      and	r10,[rbp - 312]
_9check:
      mov	[rbp - 424],r10
      mov	r10,[rbp - 296]
      add	r10,[rbp - 304]
      mov	[rbp - 432],r10
      mov	r10,[rbp - 432]
      add	r10,[rbp - 312]
      mov	[rbp - 440],r10
      mov	rdi,[rbp-424]
      mov	rsi,[rbp-440]
      call	xorshift
      mov	[rbp -  448],rax
      mov	r10,[rbp - 448]
      mov	r11,[rbp - 320]
      add	r11,[rbp - 400]
      mov	r11,[r11]
      add	r11,[rbp - 408]
      mov	[r11],r10
      jmp	_0ifback
_0else:
_0ifback:
      jmp	_1ifback
_1else:
_1ifback:
_3while:
      mov	r10,[rbp - 312]
      add	r10,1
      mov	[rbp - 312],r10
_3whilecheck:
      mov	r10,[rbp - 312]
      cmp	r10,[rbp - 280]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 584],r10
      mov	r10,[rbp -  584]
      cmp	r10,1
      je	_3for
_3forback:
_2while:
      mov	r10,[rbp - 304]
      add	r10,1
      mov	[rbp - 304],r10
_2whilecheck:
      mov	r10,[rbp - 304]
      cmp	r10,[rbp - 280]
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_2for
_2forback:
_1while:
      mov	r10,[rbp - 296]
      add	r10,1
      mov	[rbp - 296],r10
_1whilecheck:
      mov	r10,[rbp - 296]
      cmp	r10,[rbp - 280]
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_1for
_1forback:
      mov	qword[rbp - 608],0
      mov	qword[rbp - 296],0
      jmp	_4whilecheck
_4for:
      mov	qword[rbp - 304],0
      jmp	_5whilecheck
_5for:
      mov	qword[rbp - 312],0
      jmp	_6whilecheck
_6for:
      mov	r10,[rbp - 296]
      cmp	r10,[rbp - 304]
      setge r10b
      movzx r10,r10b
      mov	[rbp - 664],r10
      mov	r10,[rbp - 664]
      cmp	r10,0
      je	_10check
      mov	r10,[rbp - 304]
      cmp	r10,[rbp - 312]
      setge r10b
      movzx r10,r10b
      mov	[rbp - 672],r10
      mov	r10,[rbp - 664]
      and	r10,[rbp - 672]
_10check:
      mov	[rbp - 680],r10
      mov	 r10,[rbp-680]
      cmp	 r10,0
      je	_2else
_2if:
      mov	r10,[rbp - 296]
      add	r10,1
      mov	[rbp - 632],r10
      mov	r10,[rbp - 632]
      imul	r10,8
      mov	[rbp - 632],r10
      mov	r10,[rbp - 304]
      add	r10,1
      mov	[rbp - 640],r10
      mov	r10,[rbp - 640]
      imul	r10,8
      mov	[rbp - 640],r10
      mov	r10,[rbp - 608]
      mov	r11,[rbp - 320]
      add	r11,[rbp - 632]
      mov	r11,[r11]
      add	r11,[rbp - 640]
      add	r10,[r11]
      mov	[rbp - 648],r10
      mov	r10,[rbp - 648]
      and	r10,1073741823
_11check:
      mov	[rbp - 656],r10
      mov	r10,[rbp - 656]
      mov	[rbp - 608],r10
      jmp	_2ifback
_2else:
_2ifback:
_6while:
      mov	r10,[rbp - 312]
      add	r10,1
      mov	[rbp - 312],r10
_6whilecheck:
      mov	r10,[rbp - 312]
      cmp	r10,[rbp - 280]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 688],r10
      mov	r10,[rbp -  688]
      cmp	r10,1
      je	_6for
_6forback:
_5while:
      mov	r10,[rbp - 304]
      add	r10,1
      mov	[rbp - 304],r10
_5whilecheck:
      mov	r10,[rbp - 304]
      cmp	r10,[rbp - 280]
      setl r10b
      movzx r10,r10b
      mov	[rbp - 696],r10
      mov	r10,[rbp -  696]
      cmp	r10,1
      je	_5for
_5forback:
_4while:
      mov	r10,[rbp - 296]
      add	r10,1
      mov	[rbp - 296],r10
_4whilecheck:
      mov	r10,[rbp - 296]
      cmp	r10,[rbp - 280]
      setl r10b
      movzx r10,r10b
      mov 	r12,r10
      mov 	r10,r12
      cmp	r10,1
      je	_4for
_4forback:
      mov 	r13,lcstr0
      mov	rdi,[rbp-608]
      push	r13
      call	toString
      pop	r13
      mov 	r12,rax
      mov 	rdi,r13
      mov 	rsi,r12
      call	string.add
      mov 	r12,rax
      mov 	rdi,r12
      mov	rax,0
      call	println
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

	dq 7
lcstr0:
	db	65,110,115,32,105,115,32,0
section .bss
stringbuffer:
	resb 256

