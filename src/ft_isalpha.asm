section .text

%ifdef __APPLE__
	%define M_FT_ISALPHA _ft_isalpha
%else
	%define M_FT_ISALPHA ft_isalpha
%endif

	global M_FT_ISALPHA

M_FT_ISALPHA:
	sub	edi, 0x41
	xor eax, eax
	cmp edi, 0x1A
	setbe al
	jbe .L3

.L2:
	add edi, 0x20	; 'A' + 32 = 'a'
	cmp edi, 0x1A
	setbe al

; return
.L3:
	ret