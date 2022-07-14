.ORIG x3000

LD R1, FIRST

LD R2, SECOND

AND R0, R0, #0

LOOP LDR R3, R1, #0 ; Load the next character from each string

LDR R4, R2, #0

BRz NEXT

ADD R1, R1, #1

ADD R2, R2, #1

NOT R3, R3	    ; Compares one character to another 

ADD R3, R3, #1	    ; Add the value into register 3

ADD R3, R3, R4

BRz LOOP

AND R5, R5, #0

BRnzp DONE

NEXT AND R5, R5, #0

ADD R5, R5, #1

DONE TRAP x25

FIRST .FILL x4000
SECOND .FILL x4100

.END