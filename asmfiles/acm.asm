.text

init:
    ldi A 0x00
    ldi B 0x00

main:
    ldi A 0x00
    in 0
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
    out 0
    ldi A 0x18
    out 0
    ldi A 0x24
    out 0
    ldi A 0x42
    out 0
    ldi A 0x7e
    out 0
    ldi A 0x42
    out 0
    ldi A 0x42
    out 0
    ldi A 0x00
    out 0
    ldi B 0x01
    ret

display_c:
    ldi A 0x00
    out 0
    ldi A 0x0e
    out 0
    ldi A 0x10
    out 0
    ldi A 0x20
    out 0
    ldi A 0x20
    out 0
    ldi A 0x10
    out 0
    ldi A 0x0e
    out 0
    ldi A 0x00
    out 0
    ldi B 0x02
    ret

display_m:
    ldi A 0x00
    out 0
    ldi A 0x42
    out 0
    ldi A 0x66
    out 0
    ldi A 0x5a
    out 0
    ldi A 0x42
    out 0
    ldi A 0x42
    out 0
    ldi A 0x42
    out 0
    ldi A 0x00
    out 0
    ldi B 0x03
    ret