section .text

global _ft_toupper

_ft_toupper:
	mov eax, edi
	cmp rax, byte 'a'
	jl end
	cmp rax, byte 'z'
	jg end
	sub rax, 32
end:
	ret
