; extern printf

section .text

%ifdef __APPLE__
	%define M_FT_STRNCMP _ft_strncmp
%else
	%define M_FT_STRNCMP ft_strncmp
%endif

	global M_FT_STRNCMP
	; global main

M_FT_STRNCMP:
	xor rax, rax
	jmp .L1
.L0:
	inc	rdi
	inc rsi
	dec rdx
.L1:
	test rdx, rdx
	jz .L2
	mov bl, [rdi]
	test bl, bl
	jz .L2
	mov cl, [rsi]
	cmp bl, cl
	jz .L0

	test rdx, rdx
	jz .L2
	sub bl, cl
	movsx eax, bl
.L2:
	ret

; main:
; 	push rbp
; 	mov rbp, rsp
; 	mov rdi, str1
; 	mov rsi, str2
; 	mov rdx, 3
; 	call M_FT_STRNCMP

; 	mov rdi, fmt
; 	mov rsi, rax
; 	xor al, al
; 	call printf

; 	leave
; 	pop rbp

; .exit:
; 	mov rax, 60
; 	mov rdi, 0
; 	syscall

; section .data
; 	fmt db "result: %d", 10, 0

; section .rodata
; 	str1 db "ABC", 0 
; 	str2 db "ABD", 0