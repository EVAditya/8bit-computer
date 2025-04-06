.text

init:
    ldi A 0x00
    ldi B 0x00

main:
    ldi A 0x00
    lda
    add
    ldi B 0x01
    cmp
    jz %display_a
    add
    ldi B 0x02
    cmp
    jz %display_c
    add
    ldi B 0x03
    cmp
    jz %display_m
    jmp %main

display_a:
    ldi A 0x00
    mov M A 1
    ldi A 0x18
    mov M A 2
    ldi A 0x24
    mov M A 3
    ldi A 0x42
    mov M A 4
    ldi A 0x7e
    mov M A 5
    ldi A 0x42
    mov M A 6
    ldi A 0x42
    mov M A 7
    ldi A 0x00
    mov M A 8
    ldi B 0x01
    ret

display_c:
    ldi A 0x00
    mov M A 1
    ldi A 0x0e
    mov M A 2
    ldi A 0x10
    mov M A 3
    ldi A 0x20
    mov M A 4
    ldi A 0x20
    mov M A 5
    ldi A 0x10
    mov M A 6
    ldi A 0x0e
    mov M A 7
    ldi A 0x00
    mov M A 8
    ldi B 0x02
    ret

display_m:
    ldi A 0x00
    mov M A 1
    ldi A 0x42
    mov M A 2
    ldi A 0x66
    mov M A 3
    ldi A 0x5a
    mov M A 4
    ldi A 0x42
    mov M A 5
    ldi A 0x42
    mov M A 6
    ldi A 0x42
    mov M A 7
    ldi A 0x00
    mov M A 8
    ldi B 0x03
    ret