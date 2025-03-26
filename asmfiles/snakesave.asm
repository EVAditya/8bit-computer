
MATRIX_SIZE:  .word 8         
INIT_POS_X:   .word 3         
INIT_POS_Y:   .word 3         

; map C and D to X and Y co ordinates 

main:
    ldi C 3        
    ldi D 3      

loop:
    call update_display      ; add : led logic 
    call get_keyboard_input  ; add : io
    call delay
    jmp loop

delay:
    ldi A 500000
delay_loop:
    dec A
    jnz delay_loop
    ret

update_display:
    ; add update_display
    ret

get_keyboard_input:
    ; add io logic
    ; branch accordinly 
    ret

move_left:
    dec C                    
    jnc update_display       ; redraw
    ret

move_right:
    inc C                    ; X = X + 1
    cmp C MATRIX_SIZE
    jnc update_display
    ret

move_down:
    inc D                    ; Y = Y + 1
    cmp D MATRIX_SIZE
    jnc update_display
    ret

move_up:
    dec D                    ; Y = Y - 1
    jnc update_display
    ret
