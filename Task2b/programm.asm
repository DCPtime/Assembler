EXTRN MENU_PRINT: NEAR
EXTRN MENU_INPUT: NEAR
EXTRN INPUT: NEAR
EXTRN BIN_SIGN: NEAR
EXTRN BIN_UNSIGN: NEAR
EXTRN DEC_SIGN: NEAR
EXTRN DEC_UNSIGN: NEAR
EXTRN HEX_SIGN: NEAR
EXTRN HEX_UNSIGN: NEAR
EXTRN EXIT: NEAR
EXTRN NEW_LINE: NEAR

FUNC_DATA SEGMENT PARA PUBLIC 'DATA'
	F0 DW MENU_PRINT
	F1 DW INPUT
	F2 DW BIN_UNSIGN
	F3 DW BIN_SIGN
	F4 DW DEC_UNSIGN
	F5 DW DEC_SIGN
	F6 DW HEX_UNSIGN
	F7 DW HEX_SIGN
	F_EXIT DW EXIT
	F_LINE DW NEW_LINE
	MENU_NUM DW 0
	X DW ?
FUNC_DATA ENDS

SSTACK SEGMENT PARA STACK 'STACK'
	db 100 dup(0)
SSTACK ENDS

SUBTTL MAIN PROGRAMM
PAGE

CSEG SEGMENT PARA PUBLIC 'CODE'
	ASSUME CS:CSEG, SS: SSTACK, DS: FUNC_DATA
	
MAIN:
	MOV AX, FUNC_DATA
	MOV DS, AX

READING:

	; READING MENU NUMBER
	MOV BX, OFFSET MENU_NUM
	PUSH BX
	CALL MENU_INPUT
	
	CMP MENU_NUM, 8
	JG READING
	
	; CALCULATING FUNCTION ADDRESS
	MOV AX, 2
	MUL MENU_NUM
	
	ADD AX, OFFSET F0
	MOV BX, AX
	
	; PUSHING POINTER AS ARGUMENT
	MOV AX, OFFSET X
	PUSH AX
	
	; CALL FUNCTION
	CALL [BX]
	
	; GO BACK TO READING FROM CONSOLE
	JMP READING
	
CSEG ENDS

END MAIN