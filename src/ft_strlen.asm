section .text

%ifdef __APPLE__
	%define M_FT_STRLEN _ft_strlen
%else
	%define M_FT_STRLEN ft_strlen
%endif

	global M_FT_STRLEN

M_FT_STRLEN:
	xor rax, rax	; reset rax = 0
.L0:
	mov bl, [rdi]	; load charecter of pointer
	test bl, bl		; check and set flag Zero bl = NULL
	jz .L1
	inc rax			; incement rax
	inc rdi			; incement offset rdi next char of pointer
	jmp .L0
.L1:
	ret
