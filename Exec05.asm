section .data
    variable_A db 0
    variable_B db 0
    variable_C db 0
    result db 0

section .text
    global _start

_start:
    ; Carrega as variáveis ​​da memória
    mov al, [0x58]
    mov bl, [0x59]
    mov cl, [0x60]

    ; Compara AB com 0
    mov ah, al
    sub ah, bl
    js ab_less_than_0

    ; AB >= 0, compara AC com 0
    mov ah, al
    sub ah, cl
    js ac_less_than_0
    jmp set_result_c

ab_less_than_0:
    ; AB < 0, compara BC com 0
    mov ah, bl
    sub ah, cl
    js bc_less_than_0
    jmp set_result_b

bc_less_than_0:
    ; BC < 0, maior é C
    jmp set_result_c

ac_less_than_0:
    ; AC < 0, maior é C
    jmp set_result_c

set_result_a:
    ; A é a maior variável
    mov [0x65], al
    jmp end_program

set_result_b:
    ; B é a maior variável
    mov [0x65], bl
    jmp end_program

set_result_c:
    ; C é a maior variável
    mov [0x65], cl
    jmp end_program

end_program:
    ; Finaliza o programa
    mov eax, 1
    xor ebx, ebx
    int 0x80