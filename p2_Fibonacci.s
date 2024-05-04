.arm
.global main

X: .word 6  // Definir el número máximo de Fibonacci a calcular

// Define la función principal
main:
    // Inicializar el contador de bucle y los primeros dos números de Fibonacci
    mov r0, #0      // r0 se utilizará como contador de bucle
    ldr r1, =X      // r1 apunta a la constante X
    ldr r2, [r1]    // r2 contiene el valor de la constante X
    mov r3, #0      // r3 contiene el primer número de Fibonacci (r3 = 0)
    mov r4, #1      // r4 contiene el segundo número de Fibonacci (r4 = 1)

// Iterar sobre la secuencia de Fibonacci
loop:
    // Comprobar si hemos alcanzado el número deseado de números de Fibonacci
    cmp r0, r2
    beq end         // Si es igual, terminar el programa

    // Calcular el siguiente número de Fibonacci
    add r5, r3, r4  // r5 contiene el siguiente número de Fibonacci

    // Actualizar el contador de bucle y los números de Fibonacci
    add r0, r0, #1  // Incrementar el contador de bucle
    mov r3, r4      // El segundo número se convierte en el primero (número actual)
    mov r4, r5      // El siguiente número se convierte en el segundo

    // Volver al inicio del bucle
    b loop

// El programa ha terminado, detener aquí
end:
    b .
