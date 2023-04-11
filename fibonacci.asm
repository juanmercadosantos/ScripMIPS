.data
secuencia: .asciiz "Introduce el indice de secuencía \n"
resultado: .asciiz "El valor de fibonacci es: "
message: .asciiz "El valor de fibonacci es:\n0"

.text

# secuencia
li $v0, 4
la $a0, secuencia
syscall

# leer numero
li $v0, 5
syscall

beq $v0, 0, equalToZero

# Llammar fibonacci
move $a0, $v0
jal fibonacci
move $a1, $v0 # save return value to a1

# imprimir resultado
li $v0, 4
la $a0, resultado
syscall

# imprimir resultado
li $v0, 1
move $a0, $a1
syscall

# salida
li $v0, 10
syscall

# función fibonacci 
fibonacci:

addi $sp, $sp, -12
sw $ra, 8($sp)
sw $s0, 4($sp)
sw $s1, 0($sp)
move $s0, $a0
li $v0, 1 # valor devuelto
ble $s0, 0x2, fibonacciExit # comprobar el estado
addi $a0, $s0, -1 # establecer argumentos para llamada recursiva f(n-1)
jal fibonacci
move $s1, $v0 # almacenar el resultado de f(n-1) en s1
addi $a0, $s0, -2 # establecer argumentos para llamada recursiva a f(n-2)
jal fibonacci
add $v0, $s1, $v0 # agregarle el resultado de f(n-1)


fibonacciExit:

lw $ra, 8($sp)
lw $s0, 4($sp)
lw $s1, 0($sp)
addi $sp, $sp, 12
jr $ra
# Fin de la función fibonacci

equalToZero:
li $v0, 4
la $a0, message
syscall
