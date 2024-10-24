# "ciao"

addi x10, x0, x120  #indirizzo di base
addi x12, x0, 'c'
sb x12, 0(x10)
addi x12, x0, 'i'
sb x12, 1(x10)
addi x12, x0, 'a'
sb x12, 2(x10)
addi x12, x0, 'o'
sb x12, 3(x10)
addi x12, x0, 0
sb x12, 4(x10)

#inizializzo i puntatori all'inizio e fine della stringa
addi x11, x10, 0
addi x12, x10, 0

find_end:    #metto x12 alla fine
    lb x5, 0(12)
    beq x5, x0, found
    addi x12,x12,1
    jal x0, find_end

found:
    addi x12, x12, -1

swap:
    bge x11, x12, end_swap   # se x11 >= x12 esci
    lb x5, 0(x11)  # qui fa lo swap
    lb x6, 0(x12)
    sb x5, 0(x12)
    sb x6, 0(x11)
    addi x11, x11, 1   # incrementa x11 e decerementa x12
    addi x12, x12, -1
    jal x0, swap

end_swap:
    ret
    