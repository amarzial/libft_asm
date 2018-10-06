section .text

global _ft_bzero

_ft_bzero:
	test rsi, rsi			;zero size check
	jz done
	mov rcx, rsi
	mov rax, 0
	rep stosb
done:
	ret
