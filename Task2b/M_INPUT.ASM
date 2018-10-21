EXTRN NEW_LINE: NEAR

DataS   SEGMENT WORD 'DATA'
CHOOSE_MESSAGE   DB   13
                DB   10
                DB   'CHOOSE MENU ELEMENT: '
				DB '$'
				
DataS   ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
	ASSUME CS:CSEG, DS: DataS
	
	MENU_INPUT PROC NEAR
		PUSH BP
		MOV BP, SP
		MOV AX, [BP + 4] ; Возвращаемый параметр
		MOV BX, AX
		PUSH DS
		
		MOV AX, DataS
		MOV DS, AX
		
		; MESSAGE
		MOV AH, 9
		MOV DX, OFFSET CHOOSE_MESSAGE
		INT 21H
		POP DS
		
		MOV   AH,7    ; READING SYMBOL                 ;АН=07h ввести символ без эха
        INT   21h		
		
		SUB AL, 30H
		MOV [BX], AL
		
		CALL NEW_LINE
		
		POP BP
		RET 2
	MENU_INPUT ENDP
	
CSEG ENDS

PUBLIC MENU_INPUT

END