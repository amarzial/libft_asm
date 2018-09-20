section .text

global _ft_toupper

_ft_toupper:
	mov eax, edi
	cmp rax, byte 'a'
	jl done
	cmp rax, byte 'z'
	jg done
	sub rax, 32
done:
	ret
