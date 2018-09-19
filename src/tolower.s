section .text

global _ft_tolower

_ft_tolower:
	mov eax, edi
	cmp rax, byte 'A'
	jl end
	cmp rax, byte 'Z'
	jg end
	add rax, 32
end:
	ret
