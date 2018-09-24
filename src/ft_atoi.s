section .text

global _ft_atoi
extern _ft_isdigit
extern _ft_isspace

_ft_atoi:
	mov rsi, rdi
	mov ebx, 0
	mov rcx, 0
	sub rsp, 0x8
	mov dword [rsp], 0
space:
	cmp byte [rsi + rcx], 0
	jz finish
	mov dil, [rsi + rcx]
	call _ft_isspace
	inc rcx
	test eax, eax
	jnz space
	dec rcx
	cmp byte [rsi + rcx], '+'
	jne minus
	inc rcx
	jmp i1
minus:
	cmp byte [rsi + rcx], '-'
	jne i1
	mov dword [rsp], 1
	inc rcx
	jmp i1

i1:
	mov dil, [rsi + rcx]
	test dil, dil
	jz finish
	call _ft_isdigit
	test eax, eax
	jz finish
	sub edi, '0'
	add ebx, edi
	inc rcx
	jmp i1

finish:
	cmp dword [rsp], 1
	jne no_negate
	neg ebx
no_negate:
	mov eax, ebx
	add rsp, 0x8
	ret
