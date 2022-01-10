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
		jmp .not_found

    .found:
        mov rax, rsi 		; move key pointer to rax for returning
        ret     

		.not_found:
				mov rsi, [rsi]
				cmp [rsi], word 0 		; check if a pointer to the next dict. element is 0 
   		  jne find_word 			; next element
  		  xor rax, rax 			; if a point to the next dict. element is 0 that means we are on a last element
  		  ret 
