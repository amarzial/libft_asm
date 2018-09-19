section .text

global _ft_isprint

_ft_isprint:
	cmp rdi, byte 40o
	jl bad
	cmp rdi, byte 176o
	jg bad
	mov rax, 1
	jmp end
bad:
	mov rax, 0
end:
	ret
