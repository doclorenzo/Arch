# [5,4,7] valori nel vettore , 0x120 indirizzo di partenza

addi x10, x0, 0x120 #indirizzo di partenza
addi x11, x0, 3 #lughezza del vettore

addi x12, x0, 5 #scrivo in un registro temporaneo il primo valore da inserire in memoria
sw x12, 0(x10)
addi x12, x0, 4
sw x12, 4(x10)
addi x12, x0, 7
sw x12, 8(x10)


lw x5, 0(x10) #registro che contiene il massimo (inizia a v[0])

loop:
    beq x11, x0, end_loop
    lw x6, 0(x10)
    bge x5, x6, no_change #semplicemente salta l'istruzione successiva di aggiornamento del max
    add x5, x0, x6  #aggiorno il massimo x5=x6
no_change:
    addi x11, x11, -1  #abbasaa il comtatore
    addi x10, x10, 4  #punta x10 al valore successivo in mem
    jal x0, loop

end_loop:
    ret