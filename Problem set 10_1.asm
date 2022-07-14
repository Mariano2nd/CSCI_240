.ORIG x3000
	TRAP x23	; Get user input
	ADD R2, R0, #0	; Putting the first value into R2
	LD R3, NEGASCII	; Load R3 with negative -30
	TRAP x23	; get the second input
	ADD R4, R0, #0	; Puts the second input into R4
	LD R5, negNine	; negative ascii 9
	ADD R1, R4, R3	; Adds and store the results of second input with -30
	ADD R1, R2, R1	; Taking the value in R1 adding that to the first input
	ADD R5, R1, R5	; hold remainder past 9
	BRp Greater	; Branching if the value would be greater than 9
	ADD R0, R1, #0	; 
	OUT		; Displaying the value
	BRnzp DONE	; Branching to end 
Greater LD R2, vA	; ascii value of 'A'
	ADD R2, R2, #-1	; Add -1 to R2
	ADD R0, R2, R5	; Add the value of R2 and R5 into R2
	OUT		; Display message
DONE TRAP x25

NEGASCII .FILL x-0030
ASCII .FILL x0030
vA .FILL #0065
negNine .FILL x-0039
.END
