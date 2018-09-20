section .text

global _ft_memchr

_ft_memchr:
	mov eax, esi
	mov rcx, rdx
	repne scasb
	je found
	mov rax, 0
	jmp done
found:
	dec rdi
	mov rax, rdi
done:
	ret
