# Se ingresa el texto a procesar 
texto = list("Mariposa,leon,elefante,caballo.\n")
fin_texto = len(texto)
num_vocales = 4

# Función para contar vocales y reemplazar
def contar_vocales_y_reemplazar(texto):
    # Inicializar contadores
    contador_palabras_vocales = 0
    contador_vocales = 0
    contador_longitud_palabra = 0
    
    i = 0
    
    while i < len(texto):
        # Obtener el carácter actual
        caracter = texto[i]
        
        # Verificar si el carácter es un espacio o un signo de puntuación
        if caracter in [' ', '.', ',']:
            if contador_vocales == num_vocales:
                # Reemplazar vocales en la palabra
                start = i - contador_longitud_palabra
                end = i
                for j in range(start, end):
                    if texto[j].lower() in ['a', 'e', 'i', 'o', 'u', 'A','E','I','O','U']:
                        texto[j] = '+'  #se reemplaza por este caracter
            
            # Reiniciar contadores
            contador_vocales = 0
            contador_longitud_palabra = 0
        else:
            # Verificar si el carácter es una vocal
            if caracter.lower() in ['a', 'e', 'i', 'o', 'u','A','E','I','O','U']:
                contador_vocales += 1
            contador_longitud_palabra += 1
        
        # Mover al siguiente carácter
        i += 1

# Llamar a la función para contar vocales y reemplazar
contar_vocales_y_reemplazar(texto)

# Convertir la lista de nuevo a cadena de texto
texto_modificado = ''.join(texto)

# Imprimir el texto modificado
print(texto_modificado)

