.data
num1: .asciiz "Ingrese el primer n�mero: "
num2: .asciiz "Ingrese el segundo n�mero: "
num3: .asciiz "Ingrese el tercer n�mero: "
menor: .asciiz "El n�mero menor es: "

.text
.globl main

main:
# pedir primer numero
li $v0, 4    #li carga el dato inmediato en el registro $v0
la $a0, num1 #la carga la direcci�n asociada a la etiqueta num1
syscall

# Leer el primer n�mero
li $v0, 5
syscall
move $t0, $v0

# pedir segundo n�mero
li $v0, 4    #li carga el dato inmediato en el registro $v0
la $a0, num2 #la carga la direcci�n asociada a la etiqueta num2
syscall

# Leer el segundo n�mero
li $v0, 5
syscall
move $t1, $v0

# pedir tercer n�mero
li $v0, 4    #li carga el dato inmediato en el registro $v0
la $a0, num3 #la carga la direcci�n asociada a la etiqueta num3
syscall

# Leer el tercer n�mero
li $v0, 5
syscall
move $t2, $v0

# Encontrar el n�mero mayor
move $t3, $t0     # Inicialmente asume que el primer n�mero es el menor
bgt $t1, $t3, check_t1
move $t3, $t1     # Si el segundo n�mero es menor, actualiza el n�mero menor
check_t1:
bgt $t2, $t3, check_t2
move $t3, $t2     # Si el tercer n�mero es menor, actualiza el n�mero menor
check_t2:

# Imprimir el resultado
li $v0, 4
la $a0, menor
syscall

li $v0, 1
move $a0, $t3
syscall

# Salida del programa
li $v0, 10
syscall
