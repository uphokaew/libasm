section .text

%ifdef __APPLE__
	%define M_FT_ISALPHA _ft_isalpha
%else
	%define M_FT_ISALPHA ft_isalpha
%endif

	global M_FT_ISALPHA

M_FT_ISALPHA:
	cmp edi, 0x41	; 'A'
	jl .or						; SF ≠ OF
	cmp edi, 0x5A	; 'Z'
	jle .true					; ZF=1 or SF ≠ OF

.or:
	cmp edi, 0x61	; 'a'
	jl .false					; SF ≠ OF
	cmp edi, 0x7A	; 'z'
	jg .false					; SF ≠ OF

.true:
	mov eax, 1
	jmp .re

.false:
	mov eax, 0

.re:
	ret