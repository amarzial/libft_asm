section .text

global _ft_isascii

_ft_isascii:
	cmp rdi, byte 0
	jl bad
	cmp rdi, byte 177o
	jg bad
	mov rax, 1
	jmp done
bad:
	mov rax, 0
done:
	ret
