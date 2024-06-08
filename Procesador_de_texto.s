.data
texto:
    .ascii "Mariposa.\n"
fin_texto:

.text
.global _start

_start:
    
    ldr r1, =texto   @ carga la direccion de texto en r1
    ldr r2, =fin_texto  @ carga la longitud de texto en r2 
    bl contar_vocales_y_reemplazar @ Llama a la función para contar palabras con n vocales y reemplazar por +
    mov r0, #1
    
  
    ldr r1, =texto
    sub r2, r2, r1   @ Calcula la longitud del texto
    mov r7, #4       @ Numero para escribir
    swi 0           
    
	@ Salir
    mov r7, #1       @ Numero para salir
    mov r0, #0       @ Regresa al estado inicial
    swi 0            

contar_vocales_y_reemplazar:
                       @ Se inicializan los contadores
    mov r3, #0         @ Contador de palabras con n vocales
    mov r4, #0         @ Contador de vocales
    mov r5, #0         @ Contador de longitud de palabra
    ldr r6, =fin_texto @ Cargar el final de la dirección del texto, (para saber cuando termina)
      
    loop_inicio:
        @ Verifica si se llego al final del texto, si es asi salta al final del loop,
		@ sino carga un caracter de texto
        cmp r1, r6
        bge loop_final
        ldrb r7, [r1]  
        
        @ Revisa si el caracter es un signo de puntuacion o un espacio 
        cmp r7, #' '
        beq comprobar_fin_palabra
        cmp r7, #'.'
        beq comprobar_fin_palabra
        cmp r7, #','
        beq comprobar_fin_palabra

        @ Comprobar si el carácter es una vocal mayuscula o minuscula
        cmp r7, #'a'
        beq encontro_vocal
        cmp r7, #'e'
        beq encontro_vocal
        cmp r7, #'i'
        beq encontro_vocal
        cmp r7, #'o'
        beq encontro_vocal
        cmp r7, #'u'
        beq encontro_vocal
		cmp r7, #'A'
        beq encontro_vocal
        cmp r7, #'E'
        beq encontro_vocal
        cmp r7, #'I'
        beq encontro_vocal
        cmp r7, #'O'
        beq encontro_vocal
        cmp r7, #'U'
        beq encontro_vocal

        @Se mueve al siguiente caracter
        add r1, r1, #1
        add r5, r5, #1
        b loop_inicio

    comprobar_fin_palabra:
        @ Verifica si la palabra tiene la cantidad de vocales especificado
        cmp r4, #4 
        bne reiniciar_contadores

        @ Si es asi, se reemplazan las vocales en la palabra
        sub r0, r1, r5   @ Indica el inicio de la palabra actual
        loop_reemplazar_vocal:
            ldrb r7, [r0]
            cmp r7, #'a'
            beq reemplazar_vocal
            cmp r7, #'e'
            beq reemplazar_vocal
            cmp r7, #'i'
            beq reemplazar_vocal
            cmp r7, #'o'
            beq reemplazar_vocal
            cmp r7, #'u'
            beq reemplazar_vocal
			cmp r7, #'A'
            beq reemplazar_vocal
            cmp r7, #'E'
            beq reemplazar_vocal
            cmp r7, #'I'
            beq reemplazar_vocal
            cmp r7, #'O'
            beq reemplazar_vocal
            cmp r7, #'U'
            beq reemplazar_vocal

            b proximo_caracter_palabra

        reemplazar_vocal:
            mov r7, #'+'
            strb r7, [r0]

        proximo_caracter_palabra:
            add r0, r0, #1
            sub r5, r5, #1
            cmp r5, #0
            bne loop_reemplazar_vocal

        reiniciar_contadores:
        @ Se resetean el contador de vocales y longitud de palabra
        mov r4, #0
        mov r5, #0

        @ Movimiento del siguiente caracter
        add r1, r1, #1
        b loop_inicio

    encontro_vocal:
        @ Se aumenta en 1 el contador de vocales
        add r4, r4, #1

        @ Movimiento del siguiente caracter
        add r1, r1, #1
        add r5, r5, #1
        b loop_inicio

    loop_final:
        @ Regresar
        mov pc, lr