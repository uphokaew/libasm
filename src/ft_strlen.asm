section .text

%ifdef __APPLE__
	%define M_FT_STRLEN _ft_strlen
	%ifidn __OUTPUT_FORMAT__, macho32
		BITS 32
		%define IS_32BIT 1
	%else
		BITS 64
		%define IS_64BIT 1
	%endif
%else
	%define M_FT_STRLEN ft_strlen
	%ifidn __OUTPUT_FORMAT__, elf32
		BITS 32
		%define IS_32BIT 1
	%else
		BITS 64
		%define IS_64BIT 1
	%endif
%endif

	global M_FT_STRLEN

M_FT_STRLEN:

%ifdef IS_32BIT
; Assumes CDECL: string pointer at [esp + 4]
	mov edi, [esp + 4]
	xor eax, eax	; reset eax = 0
	test edi, edi
	jz .L1
.L0:
	mov bl, [edi]	; load charecter of pointer
	test bl, bl		; check and set flag Zero bl = NULL
	jz .L1
	inc eax			; incement eax
	inc edi			; incement offset edi next char of pointer
	jmp .L0
.L1:
	add
	ret
%endif

%ifdef IS_64BIT
	xor rax, rax	; reset rax = 0
	test rdi, rdi       ; check for NULL pointer
	jz .L1              ; if NULL, return 0
.L0:
	mov bl, [rdi]	; load charecter of pointer
	test bl, bl		; check and set flag Zero bl = NULL
	jz .L1
	inc rax			; incement rax
	inc rdi			; incement offset rdi next char of pointer
	jmp .L0
.L1:
	ret
%endif
