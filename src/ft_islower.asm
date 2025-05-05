section .text

%ifdef __APPLE__
    %define M_FT_ISLOWER _ft_islower
%else
    %define M_FT_ISLOWER ft_islower
%endif

    global M_FT_ISLOWER

M_FT_ISLOWER:
    mov rax, rdi        ; รับพารามิเตอร์ c จาก edi
	xor rax, rax
.done:
    ret                 ; คืนค่าใน eax
