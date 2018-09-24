section .text

global _ft_isdigit

_ft_isdigit:
	cmp dil, byte '0'
	jl bad
	cmp dil, byte '9'
	jg bad
	mov eax, 1
	jmp done
bad:
	mov eax, 0
done:
	ret
