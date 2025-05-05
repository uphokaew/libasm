section .text

%ifdef __APPLE__
    %define M_FT_ISLOWER _ft_islower
%else
    %define M_FT_ISLOWER ft_islower
%endif

    global M_FT_ISLOWER

M_FT_ISLOWER:
	cmp edi, 0x61	; 'a'
	jl .false
	cmp edi, 0x7A	; 'z'
	jg .false

	mov eax, 1
	jmp .re

.false:
	mov eax, 0

.re:
	ret