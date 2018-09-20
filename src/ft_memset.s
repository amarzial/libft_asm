section .text

global _ft_memset

_ft_memset:
	push rdi
	push rcx
	mov rax, rsi
	mov rcx, rdx
	rep stosb
	pop rcx
	pop rdi
	mov rax, rdi
	ret
