section .text

global _ft_bzero

_ft_bzero:
	push rcx
	push rax
	mov rcx, rsi
	test rcx, rcx
	jz end
	mov rax, rdi
l1:
	mov byte [rax], 0
	inc rax
	dec rcx
	jnz l1
end:
	pop rax
	pop rcx
	ret
