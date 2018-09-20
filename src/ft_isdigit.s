section .text

global _ft_isdigit

_ft_isdigit:
	cmp rdi, byte '0'
	jl bad
	cmp rdi, byte '9'
	jg bad
	mov rax, 1
	jmp done
bad:
	mov rax, 0
done:
	ret
