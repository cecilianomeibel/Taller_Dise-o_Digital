import cv2

# Carga el archivo de texto
archivo_texto = 'texto.txt'
nombre_archivo = 'RAM.mif'
linea_objetivo = 25
lineas = []

count = 0

# Lee el contenido del archivo de texto
with open(archivo_texto, 'r') as archivo:
    texto = archivo.read()

# Lee el archivo .cv existente hasta la línea objetivo
with open(nombre_archivo, 'r') as archivo:
    lineas = archivo.readlines()[0:linea_objetivo-1]
    lineas.append("END;\n")

# Inserta los caracteres del archivo de texto en el archivo .cv
if 1 <= linea_objetivo <= len(lineas) + 1:
    for char in texto:
        linea = f'\t{count} : {ord(char)};\n'
        lineas.insert(linea_objetivo + count - 1, linea)
        count += 1

# Escribe las líneas modificadas de nuevo en el archivo .cv
with open(nombre_archivo, 'w') as archivo:
    archivo.writelines(lineas)

print(f'Los caracteres del archivo de texto se han guardado en {nombre_archivo}')
print(f'Tamaño del archivo de texto: {len(texto)} caracteres')
