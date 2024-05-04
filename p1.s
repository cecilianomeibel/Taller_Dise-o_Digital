.arm
.global main

// Definir el array y la constante
array:  .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
group:  .word 5

// Definir la función principal
main:
    // Inicializar el contador de bucle y el valor de y
    mov r0, #0          // r0 se utilizará como contador de bucle
    ldr r1, =group      // r1 apunta a la constante
    ldr r2, [r1]        // r2 contiene el valor de la constante

// Iterar sobre el array
loop:
    // Comprobar si el elemento actual es mayor o igual a y
    ldr r3, =array      // r3 apunta al inicio del array
    add r3, r3, r0, lsl #2  // r3 apunta al elemento actual (cada elemento es de 4 bytes)
    ldr r4, [r3]        // r4 contiene el elemento actual
    cmp r4, r2
    ble else            // Saltar a 'else' si el elemento es menor que la constante

// Si es mayor o igual, multiplicar el elemento actual por y
mul:
    mul r4, r4, r2     // Multiplicar el elemento actual por la constante
    str r4, [r3]       // Almacenar el resultado de la multiplicación de vuelta en el array
    b endif

// Si es menor, sumar y al elemento actual
else:
    add r4, r4, r2     // Sumar la constante al elemento actual
    str r4, [r3]       // Almacenar el resultado de la suma de vuelta en el array

endif:
    // Incrementar el contador de bucle
    add r0, r0, #1

    // Comprobar si hemos procesado todos los elementos del array (10 elementos)
    cmp r0, #10
    blt loop           // Saltar a 'loop' si no hemos procesado todos los elementos

    // El programa ha terminado, detener aquí
    b .
