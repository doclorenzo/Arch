# somma tutt i numeri pari in arrey di interi a 32 bit (signed) 
#il vettore parte a x10 e la lunghezza è in x11

#x10 inizio vettore e x11 lunghezza

addi x10, x0, 0x120
addi x12, x0, 1
sw x12, 0(x10)
addi x12, x0, 2
sw x12, 4(x10)
addi x12, x0, 3
sw x12, 8(x10)
addi x12, x0, 4
sw x12, 12(x10)
add x11, x0, x12

#x12 avrà la somma, lo metto inizialmente = 0 
add x12, x0, x0


loop:
    beq x11, x0, end_loop     #controllo se il contatore è = 0
    lw x13, 0(x10)            #carico in x13 il valore dell array
    andi x14, x13, 1          # x13 & 1, per avere solo il bit meno significativo e lo metto in x14
    bne x14, x0, dispari      # se x14!=0 non sommare il numero (perchè è dispari)
    add x12, x13, x12         # se è pari lo sommo a x12
dispari:
    addi x11, x11, -1         #deceremento il contatore
    addi x10, x10, 4          #mando l'indirizzo di x10 al prossimo elemento
    jal x0, loop              #salto a loop

end_loop:
    ret

