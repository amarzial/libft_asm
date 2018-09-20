section .text

global _ft_strchr

_ft_strchr:
	mov eax, 0
l1:
	cmp byte [rdi], sil
	je found
	scasb
	jne l1
	mov rax, 0
	jmp done
found:
	mov rax, rdi
	jmp done
done:
	ret
