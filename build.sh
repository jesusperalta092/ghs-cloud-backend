#!/bin/bash
set -e

# 1. Instalar dependencias de Python
pip install -r requirements.txt

# 2. Instalar SOLO el navegador Chromium (sin pedir permisos de root)
playwright install chromium

echo "Build completado exitosamente"
