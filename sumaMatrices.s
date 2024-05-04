.section .data
matriz1:
    .word 1, 2, 3, 4           @ Fila 0: elementos 1, 2, 3, 4
    .word 5, 6, 7, 8           @ Fila 1: elementos 5, 6, 7, 8
    .word 9, 10, 11, 12        @ Fila 2: elementos 9, 10, 11, 12
    .word 13, 14, 15, 16       @ Fila 3: elementos 13, 14, 15, 16

matriz2:
    .word 1, 3, 5, 7           @ Fila 0: elementos 1,3,5,7
    .word 9, 11, 13, 15        @ Fila 1: elementos 9,11,13,15
    .word 17, 2, 4, 6          @ Fila 2: elementos 17,2,4,6
    .word 8, 10, 12, 14        @ Fila 3: elementos 8,10,12,14

contador_filas:
    .word 4                    @ Número de filas de las matrices
contador_columnas:
    .word 4                    @ Número de columnas de las matrices

.section .bss
 matriz_resultado:
    .skip 64                   @ Espacio para la matriz resultado (4x4)

.section .text
.global _start
_start:
    ldr r0, =matriz1           @ Cargar la dirección base de la primera matriz en r0
    ldr r1, =matriz2           @ Cargar la dirección base de la segunda matriz en r1
    ldr r2, =matriz_resultado  @ Cargar la dirección base de la matriz resultado en r2
    ldr r3, =contador_filas    @ Cargar la dirección del número de filas en r3
    ldr r3, [r3]               @ Cargar el número de filas en r3
    ldr r4, =contador_columnas @ Cargar la dirección del número de columnas en r4
    ldr r4, [r4]               @ Cargar el número de columnas en r4
    mov r5, #0                 @ Inicializar el índice de fila a 0

outer_loop:
    mov r6, #0                 @ Inicializar el índice de columna a 0

inner_loop:
    mul r7, r5, r4             @ Calcular el desplazamiento de fila
    add r7, r7, r6             @ Calcular el desplazamiento de columna
    ldr r8, [r0, r7, lsl #2]   @ Cargar elemento de la primera matriz en r8
    ldr r9, [r1, r7, lsl #2]   @ Cargar elemento de la segunda matriz en r9
    add r10, r8, r9            @ Sumar los elementos
    str r10, [r2, r7, lsl #2]  @ Almacenar el resultado en la matriz resultado
    add r6, r6, #1             @ Incrementar el índice de columna
    cmp r6, r4                 @ Comprobar si se ha llegado al final de la fila
    blt inner_loop             @ Sino repetir
    add r5, r5, #1             @ Incrementar el índice de fila
    cmp r5, r3                 @ Comprobar si se ha llegado al final de la matriz
    blt outer_loop             @  Sino repetir
	
	
 

