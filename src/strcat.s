section .text

global _ft_strcat

_ft_strcat:
	push rdi
	push rsi
l1:
	cmp byte [rdi], 0
	jz l2
	inc rdi
	jmp l1
l2:
	cmp byte [rsi], 0
	jz done
	movsb
	jmp l2
done:
	mov byte [rdi], 0
	pop rsi
	pop rdi
	mov rax, rdi
	ret
