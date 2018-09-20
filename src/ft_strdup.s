section .text

global _ft_strdup
extern _ft_strlen
extern _malloc

_ft_strdup:
	push rbp
	mov rbp, rsp
	sub rsp, 16

	mov [rbp-8], rdi ;src address
	call _ft_strlen
	mov [rbp-16], rax ;len
	mov rdi, [rbp-16]
	inc rdi
	call _malloc
	test rax, rax
	jz failed
	mov rdi, rax
	mov rsi, [rbp-8]
	mov rcx, [rbp-16]
	rep movsb
	jmp done

failed:
	mov rax, 0
done:

	mov rsp, rbp
	pop rbp
	ret
