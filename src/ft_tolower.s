section .text

global _ft_tolower

_ft_tolower:
	mov eax, edi
	cmp rax, byte 'A'
	jl done
	cmp rax, byte 'Z'
	jg done
	add rax, 32
done:
	ret
