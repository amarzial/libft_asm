section .text

global _ft_isalnum
extern _ft_isalpha
extern _ft_isdigit

_ft_isalnum:
	push rdi
	call _ft_isalpha
	pop rdi
	test rax, rax
	jnz good
	call _ft_isdigit
	test rax, rax
	jnz good
	mov rax, 0
	jmp done
good:
	mov rax, 1
done:
	ret
