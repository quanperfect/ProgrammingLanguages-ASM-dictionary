global find_word
%include "lib.inc"

section .text
; rdi - pointer to the the word (key) we are searching for
; rsi - pointer to the dictionary
find_word:
    push rdi 
    push rsi
    add rsi, 8 				; moving pointer to a key
    call string_equals 		; comparing input key & dictionary keys
    pop rsi 
    pop rdi 
    cmp rax, 1 				; if lines are equal
    je .found 				; if equal then .found else not found
    cmp [rsi], word 0 		; check if a pointer to the next dict. element is 0 
    jne .continue 			; next element
    xor rax, rax 			; if a point to the next dict. element is 0 that means we are on a last element
    ret 

    .found:
        call string_length
        add rsi, 8 			; moving pointer to key in dictionary
        add rsi, rax 		; moving pointer to key in dictionary + string_length = pointer to the end of dictionary key
        inc rsi 			; moving pointer to the end of dictionary key + 1 = pointer to the beginning of dictionary definition
        mov rax, rsi 		; move definition to rax
        ret     

    .continue:
        mov rsi, [rsi]		; pointer to the next dictionary element
        jmp find_word 		; continue for the next dictionary element
