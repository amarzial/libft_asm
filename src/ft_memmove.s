section .text

global _ft_memmove

_ft_memmove:
	pushf
	sub rsp, 8
	mov [rsp], rdi
	test rdx, rdx
	jz done			;exit if size == 0
	mov rcx, rdi
	sub rcx, rsi
	test rcx, 0
	jle copy
	test rcx, rdx
	jge copy
	
	;if memory overlaps do a reverse copy
	add rdi, rdx
	dec rdi
	add rsi, rdx
	dec rsi
	std

copy:
	mov rcx, rdx
	rep movsb

done:
	mov rax, [rsp]
	add rsp, 8
	popf
	ret