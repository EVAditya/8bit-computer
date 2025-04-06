
MATRIX_SIZE:  .word 8         
INIT_POS_X:   .word 3         
INIT_POS_Y:   .word 3         

; map C and D to X and Y co ordinates 

main:
    ldi C 3       ;1 
    ldi D 3      ;2

3:
    call 11      ; add : led logic  3
    call 13  ; add : io 4
     call 7   ;5
    jmp 3      ;6

7:
    ldi A 500000    ;7
8:
    dec            ;8
    jnz 8  ;9
    ret             ;10
11:     
    ; add 11        ;11
    ret             ;12

13:
    ; add io logic     ;13
    ; branch accordinly     ;14
    ret                 ;15

move_left:
    mov A C         
    dec            ;16       
    jnc 11       ; redraw  17
    ret             ;18
    mov C A

move_right:
    mov A C
    inc                    ; X = X + 1     19
    cmp A MATRIX_SIZE   ;20
    jnc 11              ;21
    ret                 ;22
    mov C A

move_down:
    mov A D
    inc                   ; Y = Y + 1  23
    cmp A MATRIX_SIZE           ;24
    jnc 11                      ;25
    ret                         ;26
    mov D A

move_up:
    mov A D
    dec                     ; Y = Y - 1 27
    jnc 11                      ;28
    ret                         ;29
    mov D A