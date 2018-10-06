section .text

global _ft_strlen

_ft_strlen:
	push rbp
	mov rbp, rsp
	sub rsp, 8

	mov [rsp], rdi
	mov al, 0
	mov rcx, 0
	dec rcx
	repne scasb
	dec rdi
	mov rax, rdi
	sub rax, [rsp]

	add rsp, 8
	pop rbp
	ret
