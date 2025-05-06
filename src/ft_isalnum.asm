section .text

%ifdef __APPLE__
	%define M_FT_ISDIGIT _ft_isdigit
	%define M_FT_ISALPHA _ft_isalpha
	%define M_FT_ISALNUM _ft_isalnum
%else
	%define M_FT_ISDIGIT ft_isdigit
	%define M_FT_ISALPHA ft_isalpha
	%define M_FT_ISALNUM ft_isalnum
%endif

	extern M_FT_ISDIGIT
	extern M_FT_ISALPHA
	global M_FT_ISALNUM

M_FT_ISALNUM:
	xor eax, eax
	call M_FT_ISDIGIT wrt ..plt
	cmp eax, 0x1
	sete al
	je .L2

; or condition
.L1:
	call M_FT_ISALPHA wrt ..plt
	cmp eax, 0x1
	sete al

; return
.L2:
	ret