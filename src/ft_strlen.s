section .text

global _ft_strlen

_ft_strlen:
	push rbp
	mov rbp, rsp
	sub rsp, 16

	mov [rbp-8], rdi
	mov al, 0
	mov rcx, 0
	dec rcx
	repne scasb
	dec rdi
	mov rax, rdi
	sub rax, [rbp-8]

	mov rsp, rbp
	pop rbp
	ret
