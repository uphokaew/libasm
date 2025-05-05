section .text

%ifdef __APPLE__
	%define M_FT_ISUPPER _ft_isupper
%else
	%define M_FT_ISUPPER ft_isupper
%endif

	global M_FT_ISUPPER

M_FT_ISUPPER:
	cmp edi, 0x41	; 'A'
	jl .false
	cmp edi, 0x5A	; 'Z'
	jg .false

	mov eax, 1
	jmp .re

.false:
	mov eax, 0

.re:
	ret