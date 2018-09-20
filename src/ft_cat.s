%define OSX_SYSCALL(x) 0x2000000 | x
%define READ 3
%define WRITE 4
%define BUFFSIZE 4096

section .text

global _ft_cat

_ft_cat:
	push rbp
	mov rbp, rsp
	sub rsp, BUFFSIZE+8

	mov [rbp-8], rdi
read:
	mov rdi, [rbp-8]
	mov eax, OSX_SYSCALL(READ)
	lea rsi, [rbp-BUFFSIZE-8]
	mov	rdx, BUFFSIZE
	syscall
	jc done
	cmp rax, 0
	jle done
	mov rdx, rax
	mov eax, OSX_SYSCALL(WRITE)
	mov rdi, 1
	lea rsi, [rbp-BUFFSIZE-8]
	syscall
	jmp read

done:
	mov rsp, rbp
	pop rbp
	ret
