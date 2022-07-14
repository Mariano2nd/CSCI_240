.ORIG x04A0

	START JSR SaveReg	; We are starting at our subroutine SaveReg
	LD R2,Newline		; Load local data to register 2 from Newline
	JSR WriteChar		; Jump to subroutine WriteChar
	LEA R1,PROMPT		; Load the address from register 1 to PROMPT
	
	
	Loop LDR R2,R1,#0 	; Get next prompt char
	BRz Input		; Conditional for zeros and goes to Input

	JSR WriteChar		; Jump to Subroutine WriteChar
	ADD R1,R1,#1		; Add the value of register 1 from registeer 1 with 1
	BRnzp Loop		; Conditional for negatives, zeros, and positives brings it to Loop
	

Input 	JSR ReadChar		; Jump to Subroutine ReadChar
	ADD R2,R0,#0 		; Move char to R2 for writing
	JSR WriteChar 		; Echo to monitor


	LD R2, Newline		; Load local data from Register 2 to Newline
	JSR WriteChar		; Jump to subroutine WriteChar
	JSR RestoreReg		; Jump to subroutine RestoreReg
	RTI 			; RTI terminates the trap routine

Newline .FILL x000A

PROMPT .STRINGZ "Type a character."



WriteChar 	LDI R3,DSR	; Indirectly load and read the data from Register 3 to DSR
		BRzp WriteChar	; Conditional for zeros and positive if the condition is true go to WriteChar
		STI R2,DDR	; Indirectly store data from register 2 to DDR
		RET 		; JMP R7 terminates subroutine
	
DSR .FILL xFE04			; DSR fills xFE04
DDR .FILL xFE06			; This one also fills xFE06


ReadChar 	LDI R3,KBSR	; Indirectly load and read data from Register 3 to KBSR
		BRzp ReadChar	; Conditional for zeros and positives if true go to ReadChar
		LDI R0,KBDR	; Indirectly load and read data from Register 0 to KBDR

	RET			; Return
KBSR .FILL xFE00		; Fills the loaded data into xFE00
KBDR .FILL xFE02		; Fills the loaded data into xFE02


SaveReg ST R1,SaveR1		; Locally store the data into SaveR1 to SaveR6
	ST R2,SaveR2		; 
	ST R3,SaveR3		; 
	ST R4,SaveR4		; 
	ST R5,SaveR5		; 
	ST R6,SaveR6		; 

	RET			; Return

RestoreReg 	LD R1,SaveR1	; Locally load and read the data into SaveR1 to SaveR6
		LD R2,SaveR2	; 
		LD R3,SaveR3	; 
		LD R4,SaveR4	; 
		LD R5,SaveR5	; 
		LD R6,SaveR6	; 

	RET			; Return

	SaveR1 .FILL x0000	; Fills the x0000 from what is from SaveR1 to SaveR6
	SaveR2 .FILL x0000	; 
	SaveR3 .FILL x0000	; 
	SaveR4 .FILL x0000	; 
	SaveR5 .FILL x0000	; 
	SaveR6 .FILL x0000	; 

 .END 