addi x10, x0, 100
addi x11, x0, 0
addi x12, x0, 0
addi x5, x0, 32

loop:
    beq x5,x0, end_loop
    andi x6, x10, 1  #x6= x10 and 1
    beq x6, x0, zero_bit   # se l'and ha dato 0 salta a zero_bit
    addi x12, x12, 1
    jal x0, next_bit

zero_bit:
    addi x11, x11, 1

next_bit:
    srli x10, x10, 1 #shift a destra di una posizione
    addi x5, x5, -1
    jal x0, loop

end_loop:
    ret
