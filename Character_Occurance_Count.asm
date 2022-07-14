; Count occurance of input charcter in a file.
;
; 02 Program to count occurrences of a character in a file.
; 03 Character to be input from the keyboard.
; 04 Result to be displayed on the monitor.
; 05 Program works only if no more than 9 occurrences are found.
; 06 
; 07 
; 08 Initialization
; 09 
         .ORIG x3000  ;Coding strt at x3000.                 Line #0A
         AND R2,R2,#0 ; R2 is counter, initialize to 0.      Line #0B
         LD R3,PTR    ; R3 is pointer to characters.         Line #0C 
         TRAP x23     ; R0 gets character input.             Line #0D 
         LDR R1,R3,#0 ; R1 gets the next character.          Line #0E  
;                                                            Line #0F 
; Test character for end of file.                            Line #10 
;                                                            Line #11 
;                                                            Line #12 
TEST     ADD R4,R1,#-4; Test for EOT.                        Line #13 
         BRz OUTPUT   ; If done, prepare the output.         Line #14 
;                                                            Line #15 
; Test character for match. If a match, increment count.     Line #16 
;                                                            Line #17 
         NOT R1,R1    ; Negate R1                            Line #18 
         ADD R1,R1,#1 ; R1 <-- -R1.                          Line #19 
         ADD R1,R1,R0 ; R1 <-- R0-R1. If R1=0, a match!      Line #1A 
         BRnp GETCHAR ; If no match, do not increment.       Line #1B 
         ADD R2,R2,#1 ; else increment the count.            Line #1C                         
;                                                            Line #1D 
; Get next character from the file.                          Line #1E 
;                                                            Line #1F 
GETCHAR  ADD R3,R3,#1 ; Increment the pointer.               Line #20      
         LDR R1,R3,#0 ; R1 gets the next character to test.  Line #21
         BRnzp TEST   ; Continue to Test for EOT.            Line #22
;                                                            Line #23 
; Output the count.                                          Line #24 
;                                                            Line #25 
OUTPUT   LD R0,ASCII  ; Load the ASCII template.             Line #26 
         ADD R0,R0,R2 ; Convert binary to ASCII.             Line #27 
         TRAP x21     ; ASCII code in R0 is displayed.       Line #28 
         TRAP x25     ; Halt machine.                        Line #29 
;                                                            Line #2A 
; Storage for pointer and ASCII template.                    Line #2B 
;                                                            Line #2C 
ASCII   .FILL x0030     ; Charcter 0.                        Line #2D                                         
PTR     .FILL x4000     ; Data start here.                   Line #2E
        .END            ; STOP convert to machine code.      Line #2F  
; Figure 7.2 The assembly language program