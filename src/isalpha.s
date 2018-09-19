section .text

global _ft_isalpha

_ft_isalpha:
	cmp rdi, byte 'A'
	jl lower
	cmp rdi, byte 'Z'
	jle good
lower:
	cmp rdi, byte 'a'
	jl bad
	cmp rdi, byte 'z'
	jg bad
good:
	mov rax, 1
	jmp end
bad:
	mov rax, 0
end:
	ret
