section .text

%ifdef __APPLE__
    %define M_FT_ISLOWER _ft_islower
%else
    %define M_FT_ISLOWER ft_islower
%endif

    global M_FT_ISLOWER

M_FT_ISLOWER:
	sub	edi, 0x61	; edi - 'a'
	xor eax, eax
	cmp edi, 0x1A	; edi - 26 check (edi <= 26)
	setbe al
	ret