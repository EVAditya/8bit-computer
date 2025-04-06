



MATRIX_SIZE:  .word 8               

; register level bit mapping 
main:
    ldi C 10000000 
    ldi D 00010000 ; register number 
loop:
    call get_keyboard_input  
    call update_display      
    call delay
    jmp loop
delay:
    ldi A 500000
delay_loop:
    dec A
    jnz delay_loop
    ret
get_keyboard_input:
    ldi M 0x00
    mov A M ; mem location of keyboard input 
    ldi B 00000000
    cmp 
    jz loop
    ldi B 1000
    cmp
    jz move_left
    ldi B 0100
    cmp
    jz move_right
    ldi B 0010
    cmp
    jz move_down 
    ldi B 0001
    cmp
    jz move_up
    ret
move_left:
    mov A D
    ldi B 10000000
    cmp
    slz r1 
    cmp
    jz loop
    ldi B 01000000
    cmp
    slz r2 
    cmp
    jz loop
    ldi B 00100000
    cmp
    slz r3
    cmp
    jz loop
    ldi B 00010000
    cmp
    slz C
    cmp
    jz loop
    ldi B 00001000
    cmp
    slz D 
    cmp
    jz loop
    ldi B 00000100
    cmp
    slz r6
    cmp
    jz loop
    ldi B 10000010
    cmp
    slz r7
    cmp
    jz loop
    ret
move_right:  
    mov A D
    ldi B 10000000
    cmp
    srz r1 
    cmp
    jz loop
    ldi B 01000000
    cmp
    srz r2 
    cmp
    jz loop
    ldi B 00100000
    cmp
    srz r3
    cmp
    jz loop
    ldi B 00010000
    cmp
    srz C
    cmp
    jz loop
    ldi B 00001000
    cmp
    srz D 
    cmp
    jz loop
    ldi B 00000100
    cmp
    srz r6
    cmp
    jz loop
    ldi B 10000010
    cmp
    srz r7
    cmp
    jz loop   
    ret
move_down:
    sl D
    mov A D
    ldi B 10000000
    cmp
    mov r0 r1
    ldi r1 0 
    cmp
    jz loop
    ldi B 01000000
    cmp 
    mov r1 r2
    ldi r2 0 
    cmp
    jz loop
    ldi B 00100000
    cmp 
    mov r2 r3
    ldi r3 0 
    cmp
    jz loop
    ldi B 00010000
    cmp 
    mov r3 C
    ldi C 0 
    cmp
    jz loop
    ldi B 00001000
    cmp 
    mov C D
    ldi D 0 
    cmp
    jz loop
    ldi B 00000100
    cmp 
    mov D r6
    ldi r6 0 
    cmp
    jz loop
    ldi B 00000010
    cmp 
    mov r6 r7
    ldi r7 0 
    cmp
    jz loop   
    ret
move_up:
    sr D
    mov A D
    ldi B 10000000
    cmp
    mov r1 r0
    ldi r0 0 
    cmp
    jz loop
    ldi B 01000000
    cmp 
    mov r2 r1 
    ldi r1 0 
    cmp
    jz loop
    ldi B 00100000
    cmp 
    mov r3 r2
    ldi r2 0 
    cmp
    jz loop
    ldi B 00010000
    cmp 
    mov C r3
    ldi r3 0 
    cmp
    jz loop
    ldi B 00001000
    cmp 
    mov D C
    ldi C 0 
    cmp
    jz loop
    ldi B 00000100
    cmp 
    mov r6 D
    ldi D 0 
    cmp
    jz loop
    ldi B 00000010
    cmp 
    mov r7 r6
    ldi r6 0 
    cmp
    jz loop
    ret