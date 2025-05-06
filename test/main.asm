section .text
	global _start

_start:

	mov al, 12
	mov rax, 60
	mov rdi, 0
	syscall
