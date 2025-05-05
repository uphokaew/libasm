section .text

%ifdef __APPLE__
	%define M_FT_ISASCII _ft_isascii
%else
	%define M_FT_ISASCII ft_isascii
%endif

	global M_FT_ISASCII

M_FT_ISASCII:
	cmp edi, 0x0	; NULL
	jl .false
	cmp edi, 0x7F	; DEL
	jg .false

	mov eax, 1
	jmp .re

.false:
	mov eax, 0	

.re:
	ret