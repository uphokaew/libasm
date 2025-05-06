section .text

%ifdef __APPLE__
	%define M_FT_ISUPPER _ft_isupper
%else
	%define M_FT_ISUPPER ft_isupper
%endif

	global M_FT_ISUPPER

M_FT_ISUPPER:
	sub edi, 0x41	; edi - 'A'
	xor eax, eax
	cmp edi, 0x1A	; edi - 26 check (edi <= 26)
	setbe al
	ret