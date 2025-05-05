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
	push rbp		; 8 byte
	mov rbp, rsp
	push rdi		; 8 byte

	call M_FT_ISDIGIT wrt ..plt
	cmp eax, 0x1	; 'rax == true'
	je .true
	
.or:
	mov rdi, [rbp - 8]
	call M_FT_ISALPHA wrt ..plt
	cmp eax, 0x1	; 'rax == false'
	je .true
	mov eax, 0
	pop rdi
	leave
	ret

.true:
	mov eax, 1
	pop rdi
	leave
	ret