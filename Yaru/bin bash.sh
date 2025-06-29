#!/bin/sh

# Obtener la ruta del script de forma compatible con sh
SCRIPT_PATH="$0"
# Convertir a ruta absoluta y obtener el directorio
CARPETA=/home/antoniosalvatore/Projects/yaru-restricted-icons/Yaru/scalable/

# Líneas a reemplazar
LINEA_ORIGINAL='<svg version="1.1" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">'
LINEA_NUEVA='<svg width="16" height="16" version="1.1" xmlns="http://www.w3.org/2000/svg">'

# Buscar solo archivos .svg en la misma carpeta que el script (no subcarpetas)
find "$CARPETA" -maxdepth 1 -type f -name "*.svg" | while read archivo; do
    if grep -qF "$LINEA_ORIGINAL" "$archivo"; then
        # Usar sed de forma portátil (funciona con GNU y BSD sed)
        sed "s|$LINEA_ORIGINAL|$LINEA_NUEVA|" "$archivo" > "$archivo.tmp" && mv "$archivo.tmp" "$archivo"
        echo "✅ Modificado: $archivo"
    else
        echo "⏭️  Sin cambios: $archivo"
    fi
done
