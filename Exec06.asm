ORG 0000H ; Endereço de início do progama

START:
	MOV A, 0AH ; Carrega o valor inicial (10) no registrador A
	MOV M, A ; Armazena o valor de A na posição de memória 0FFA
	
COUNTDOWN:
	MOV A, H ; Carrega o valor atual da contagem da posição de memória 0FFA
	SUB 01H ; Subtrai 1 do valor atual
	MOV M, A ; Armazena o novo valor da contagem na posição de memória 0FFA
	
	CMP 00H ; Compara o valor atual com 0
	JZ LAUNCH ; Se for igual a zero, pule para a etiqueta LAUNCH
	
	JMP COUNTDOWN ; Caso contrário, continue a contagem regressiva
	
LAUNCH:
	HLT ; Encerra a execução do progama
	
AND ; Fim do progama