.ORIG x3000
	LD R1, Store_4000	; Pull the value from Store_4000 and put it into R1
	LDR R1, R1, #0		;
	ADD R0, R1, #0		; So we can Display what is in R0
	;OUT			; Display
	LD R3, Boundaryupper	; Pull the value from Boundaryupper and put it into R3
	LD R4, Boundarylower	; Same but this one is for the lower boundary
	ADD R2, R1, R3		; Add the value to the upper boundary
	BRp Greater		; If the value is greater than go to Greater
	ADD R2, R4, R1		; Add the value to the lower boundary 
	BRn Lower		; If the value is less then go to Lower
	ADD R0, R1, #0
	OUT
	AND R1, R1, #0
	ADD R1, R1, #10
	ADD R1, R1, #10
	ADD R0, R1, #12
	OUT
	LEA R0, VALIDATION	; Otherwise display validation message
	PUTS			; 
Greater TRAP x25		; 
Lower	TRAP x25		; 


Store_4000 .FILL x4000
Boundaryupper .FILL x-007E
Boundarylower .FILL x-0020
VALIDATION  .STRINGZ "Valid ASCII value"
;A .FILL x30
.END