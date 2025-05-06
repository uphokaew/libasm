section .text

%ifdef __APPLE__
	%define M_FT_ISDIGIT _ft_isdigit
%else
	%define M_FT_ISDIGIT ft_isdigit
%endif

	global M_FT_ISDIGIT

M_FT_ISDIGIT:
	sub edi, 0x30	; edi - '0' = number digit
	xor eax, eax
	cmp edi, 0x39	; edi - 9
	setbe al
	ret
