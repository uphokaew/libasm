section .text

%ifdef __APPLE__
	%define M_FT_ISASCII _ft_isascii
%else
	%define M_FT_ISASCII ft_isascii
%endif

	global M_FT_ISASCII

M_FT_ISASCII:
	sub edi, 0x0	; edi - 0 (null) length 0 - 127 convert to a number
	xor eax, eax
	cmp edi, 0x7F	; DEL =	127 check (edi <= 127)
	setbe al
	ret