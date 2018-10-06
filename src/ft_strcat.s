section .text

global _ft_strcat

_ft_strcat:
	mov rax, 0
	mov rcx, 0
	dec rcx
	repne scasb
	dec rdi
l2:
	cmp byte [rsi], al
	jz done
	movsb
	jmp l2
done:
	mov byte [rdi], al
	mov rax, rdi
	ret
