;Chapter 8 Data Structures - Stack - Figure 8.11 The stack protocol. 280 chapter 8 Data Structure
;01 ;
;02 ; Subroutines for carrying out the PUSH and POP functions. This
;03 ; program works with a stack consisting of memory locations x3FFF
;04 ; through x3FFB. R6 is the stack pointer.
;05 
           .ORIG   x3000
;     
POP         AND R5,R5,#0         ; R5 <-- success                    06
            ST R1,Save1          ; Save registers that               07
            ST R2,Save2          ; are needed by POP                 08
            LD R1,EMPTY          ; EMPTY contains -x4000             09
            ADD R2,R6,R1         ; Compare stack pointer to x4000    0B 
            BRz fail_exit        ; Branch if stack is empty          0C
;                                                                    0D 
            LDR R0,R6,#0         ; The actual "pop"                  0E 
            ADD R6,R6,#1         ; Adjust stack pointer              0F 
            BRnzp success_exit   ;                                   10 
;                                                                    11 
PUSH        AND R5,R5,#0         ;                                   12
            ST R1,Save1          ; Save registers that               13 
            ST R2,Save2          ; are needed by PUSH                14
            LD R1,FULL           ; FULL contains -x3FFB              15 
            ADD R2,R6,R1         ; Compare stack pointer to x3FFB    16
            BRz fail_exit        ; Branch if stack is full           17
;                                                                    18
              ADD R6,R6,#-1      ; Adjust stack pointer              19
              STR R0,R6,#0       ; The actual "push"                 1A
success_exit  LD R2,Save2        ; Restore original                  1B
              LD R1,Save1        ; register values                   1C
              RET                ;                                   1D
;                                                                    1E
fail_exit   LD R2,Save2          ; Restore original                  1F
            LD R1,Save1          ; register values                   20 
            ADD R5,R5,#1         ; R5 <-- failure                    21
            RET                  ;                                   22 
            HALT                 ; STOP
;
;Data Structure                                                      23                                                 
EMPTY .FILL xC000                ; EMPTY contains -x4000             24 
FULL  .FILL xC005                ; FULL contains -x3FFB              25 
Save1 .FILL x0000                ;                                   26 
Save2 .FILL x0000                ;                                   27 
;
            .END                 ; END PROGRAM