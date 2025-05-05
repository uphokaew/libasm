section .text

%ifdef __APPLE__
	%define M_FT_ISDIGIT _ft_isdigit
%else
	%define M_FT_ISDIGIT ft_isdigit
%endif

	global M_FT_ISDIGIT

M_FT_ISDIGIT:
	cmp edi, 0x30	; '0'
	jl .false
	cmp edi, 0x39	; '9'
	jg .false

	mov eax, 1
	jmp .re

.false:
	mov eax, 0

.re:
	ret