
; extern printf

section .text

%ifdef __APPLE__
	%define M_FT_SRTITERI _ft_striteri
%else
	%define M_FT_SRTITERI ft_striteri
%endif

	global M_FT_SRTITERI
	; global main

M_FT_SRTITERI:
	push rbp
	mov rbp, rsp
	sub rsp, 32

	mov qword [rbp - 32], rsi
	mov qword [rbp - 24], rdi
	mov qword [rbp - 16], 0
	cmp qword [rbp - 24], 0
	jz .L3
	jmp .L2
.L1:
	mov	rax, [rbp - 24]
	mov rdx, [rbp - 16]
	lea rcx, [rax + rdx]
	mov rdi, rdx
	mov rsi, rcx
	mov rcx, [rbp - 32]
	call rcx
	add qword [rbp - 16], 1
.L2:
	mov rax, [rbp - 24]
	mov rdx, [rbp - 16]
	add rax, rdx
	mov rax, [rax]
	test al, al
	jz .L4
	jmp .L1

.L3:
	nop

.L4:
	leave
	ret

; test in asm file

; fn_test:
; 	push rbp
; 	mov rbp, rsp
; 	push rsi

; 	mov rsi, rdi
; 	mov rdi, fmt
; 	mov rdx, [rbp - 8]
; 	xor al, al
; 	call printf

; 	pop rsi
; 	leave
; 	ret

; main:
; 	push rbp
; 	mov rbp, rsp
; 	mov rdi, string
; 	lea rsi, [fn_test]
; 	call M_FT_SRTITERI

; 	leave
; 	mov rax, 60
; 	mov rdi, 0
; 	syscall

; section .rodata
; 	fmt db "param 1: %u ", 9,"param 2: %s", 10, 0

; section .data
; 	string db "ABC", 0
