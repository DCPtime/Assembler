CSEG SEGMENT PARA PUBLIC 'CODE'
	ASSUME CS:CSEG
	
	HEX_UNSIGN PROC NEAR
		PUSH BP
		MOV BP, SP
		MOV BX, [BP + 4]		
		MOV AX, [BX]
		
		MOV SI, 4
		
		NEXT:
		; READING FOUR DIGITS
		MOV DX, 0
		
		SHL AX, 1
		JNC SKIP_1
		ADD DX, 8

	SKIP_1:
		SHL AX, 1
		JNC SKIP_2
		ADD DX, 4

	SKIP_2:
		SHL AX, 1
		JNC SKIP_3
		ADD DX, 2

	SKIP_3:
		SHL AX, 1
		JNC SKIP_4
		ADD DX, 1

	SKIP_4:
		CMP DX, 9
		JG LETTER
		ADD DX, '0'
		JMP PRINT
		LETTER:
		ADD DX, 55

		PRINT:
		PUSH AX
		MOV AH, 2
		INT 21H
		POP AX
		
		DEC SI
		JNZ NEXT
		
		POP BP
		RET 2
	HEX_UNSIGN ENDP
	
CSEG ENDS

PUBLIC HEX_UNSIGN

END