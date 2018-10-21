EXTRN NEW_LINE: near

DataS   SEGMENT WORD 'DATA'
MENU_MESSAGE    DB   13
                DB   10
                DB   'MENU:'

				DB   13
				DB   10
				DB   '0 INPUT MENU NUMBER'

				DB   13
				DB   10
				DB   '1 INPUT VALUE'

				DB   13
				DB   10
				DB   '2 BIN UNSIGNED'

				DB   13
				DB   10
				DB   '3 BIN SIGNED'

				DB   13
				DB   10
				DB   '4 DEC UNSIGNED'

				DB   13
				DB   10
				DB   '5 DEC SIGNED'
	
				DB   13
				DB   10
				DB   '6 HEX UNSIGNED'
				
				DB   13
				DB   10
				DB   '7 HEX SIGNED'
		
				DB   13
				DB   10
				DB   '8 EXIT'
				DB   '$'	
DataS   ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
	ASSUME CS:CSEG, DS:DataS
	
	MENU_PRINT PROC NEAR
		PUSH BP		
		MOV BP, SP
		MOV AX, [BP + 4]
		PUSH DS
		
		MOV AX, DataS
		MOV DS, AX
		
		mov   AH,9
		
		; PRINTING MENU
		mov   DX, OFFSET MENU_MESSAGE        
        int   21h 	
		
		CALL NEW_LINE
		
		POP DS		
		POP BP
		RET 2
	MENU_PRINT ENDP
	
CSEG ENDS

PUBLIC MENU_PRINT

END