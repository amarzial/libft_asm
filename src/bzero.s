section .text

global _ft_bzero

_ft_bzero:
	;rdi, rsi
	push rcx
	push rax
	mov rcx, rsi
	test rcx, rcx
	jz end
	mov rax, rdi
l1:
	mov byte [rax], 0
	add rax, 1
	loop l1
end:
	pop rax
	pop rcx
	ret
