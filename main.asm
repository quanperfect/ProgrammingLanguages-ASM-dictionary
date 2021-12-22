global _start
%include "colon.inc"
%include "lib.inc"
%include "dict.inc"
section .rodata	
%include "words.inc"
greetings: db 'The greatest NASM dictionary about ITMO welcomes you, what would you like to search for?: ', 0
notvalidmsg: db 'ERROR: Your request is too long -> not valid (just like your grades)', 0
notfoundmsg: db 'FAIL: ITMO dictionary knows nothing about this requested word, are you trying to make ITMO look bad?!', 0

section .bss
buffer: resb 256

section .text
_start:
    mov rdi, greetings
    call print_string ; printing a greetings line

    mov rsi, 256 ; buffer size
    mov rdi, buffer ; 256 symbol buffer
    call read_word ; read user input word (key) into buffer with size 256

    cmp rax, 0 ; if rax is 0 then not_valid input
    jz .not_valid ; if ZF = 1 (means not valid) then jump .not_valid
    mov rdi, buffer ; right now this is a word for search
    mov rsi, element ; pointer to the dictionary

    call find_word
    cmp rax, 0 ; if rax is 0 then word (key) & definition not found
    jz .not_found ; if ZF = 1 (means not found) then jump .not_found
    mov rdi, rax ; copy definition from rax to rdi for future print_string call

    call print_string
	jmp .end

.not_found:
    mov rdi, notfoundmsg
    call print_err
    jmp .end

.not_valid:
    mov rdi, notvalidmsg
    call print_err
    jmp .end

.end:
	xor rdi, rdi
	call print_newline
	call exit