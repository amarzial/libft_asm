section .text

global _ft_isspace

_ft_isspace:
	cmp dil, ' '
	jz true
	cmp dil, 10; \n
	jz true
	cmp dil, 9; \t
	jz true
	cmp dil, 11; \v
	jz true
	cmp dil, 12; \f
	jz true
	cmp dil, 13; \r
	jz true
	mov eax, 0
	jmp done
true:
	mov eax, 1
done:
	ret
