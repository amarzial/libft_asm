default rel

section .data
	nullmsg:	db	"(null)"
	.len:		equ	$-nullmsg

section .text

global _ft_puts

_ft_puts:
	push rbp
	mov rbp, rsp
	sub rsp, 16

	test rdi, rdi	;if nullptr print "(null)"
	jnz length
	lea rdi, [nullmsg]
	mov [rsp], rdi
	mov	rcx, nullmsg.len
	jmp print

length:
	mov [rsp], rdi			;local variable char*

	mov rcx, 0				;strlen
	dec rcx
	mov al, 0
	repne scasb
	neg rcx
	sub rcx, 2

print:
	mov rdx, rcx
	mov rsi, [rsp]
	mov rdi, 1
	mov rax, 0x2000004
	syscall

	mov [rsp + 8], byte 10
	mov rdx, 1
	lea rsi, [rsp + 8]
	mov rax, 0x2000004
	syscall

	add rsp, 16
	pop rbp
	ret
