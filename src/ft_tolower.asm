section .text

; กำหนดชื่อฟังก์ชันตามระบบปฏิบัติการ
%ifdef __APPLE__
    %define M_FT_TOLOWER _ft_tolower
%else
    %define M_FT_TOLOWER ft_tolower
%endif

    global M_FT_TOLOWER

M_FT_TOLOWER:
    mov rax, rdi        ; รับพารามิเตอร์ c จาก edi
    cmp rax, 'A'        ; เปรียบเทียบกับ 'A'
    jl .done            ; ถ้า < 'A' คืนค่าเดิม
    cmp rax, 'Z'        ; เปรียบเทียบกับ 'Z'
    jg .done            ; ถ้า > 'Z' คืนค่าเดิม
    add rax, 32         ; แปลงเป็นตัวพิมพ์เล็ก (+32)
.done:
    ret                 ; คืนค่าใน eax
