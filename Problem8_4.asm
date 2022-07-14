.ORIG x3000

	
	;TRAP x25
	
PEEK	AND R5, R5, #0	; The PEEK function return the first element without removing
	LD R0, StackBase; 
	NOT R0, R0	; 
	ADD R0, R0, #-1	; 
	ADD R0, R0, R6	; 
	BRz UNDERFLOW	; 
	LDR R0, R6, #0	; 
	RET		; 
UNDERFLOW	ADD R5, R5, #1
	RET		; 
StackMax .BLKW #0, x8000; 	
StackBase .FILL x8000	; 





;	AND R5, R5, #0	; Initialie R5 to 0
	;NOT R2, R3	; 
	;ADD R2, R2, #1	; R2 contain negative of R3
	;ADD R2, R2, R4	; 
	;BRz UNDERFLOW	;
	;Code to remove the front queue return success
;UNDERFLOW	ADD R5, R5, #1
	;RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;LEA R0, a	; Get the address
	;ST R0, ab	; Store it into pointer variable
	;LDI R0, ab	; Get the value at the address store in pa
	;ST R0, b	; Store into b
	;LD R0, b	; Load the value in b
	;STI R0, ab	; Store the address stored in pa

;a	.FILL x8006	; 8006 store for a
;b	.FILL x8007	; 8007 store for b
;ab	.FILL x8008	; 8008 store for ab





.END