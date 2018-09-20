section .text

global _ft_puts

_ft_puts:
	push rbp
	mov rbp, rsp
	push rdx
	mov rdx, 0
l1:
	cmp [rdi + rdx], byte 0
	jz l2
	inc rdx
	jmp l1
l2:
	push rdi
	push rsi
	mov rsi, rdi
	mov rdi, 1
	mov rax, 0x2000004
	syscall
	mov [rbp-8], byte 10
	mov rdx, 1
	lea rsi, [rbp-8]
	mov rax, 0x2000004
	syscall
	pop rsi
	pop rdi
	pop rdx
	pop rbp
	ret
