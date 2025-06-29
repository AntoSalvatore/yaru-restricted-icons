import os

# Configura aquí la carpeta raíz
carpeta_raiz = "."  # Cambia si es necesario

# Línea original y nueva
linea_original = '<svg viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">'
linea_nueva = '<svg width="16" height="16" version="1.1" xmlns="http://www.w3.org/2000/svg">'

# Recorrer archivos SVG en todas las subcarpetas
for carpeta_actual, _, archivos in os.walk(carpeta_raiz):
    for archivo in archivos:
        if archivo.endswith(".svg"):
            ruta_archivo = os.path.join(carpeta_actual, archivo)

            try:
                with open(ruta_archivo, "r", encoding="utf-8") as f:
                    contenido = f.read()

                if linea_original in contenido:
                    contenido_modificado = contenido.replace(linea_original, linea_nueva)
                    with open(ruta_archivo, "w", encoding="utf-8") as f:
                        f.write(contenido_modificado)
                    print(f"✅ Modificado: {ruta_archivo}")
                else:
                    print(f"⏭️  Sin cambios: {ruta_archivo}")

            except Exception as e:
                print(f"⚠️  Error con {ruta_archivo}: {e}")
