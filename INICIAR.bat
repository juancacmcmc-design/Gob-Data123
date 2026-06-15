@echo off
chcp 65001 > nul
echo ========================================
echo   GOB DATA 360 - PLATAFORMA EDUCATIVA
echo ========================================
echo.

cd backend

echo [Paso 1] Verificando Node.js...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Node.js no está instalado!
    echo Descarga e instala Node.js desde https://nodejs.org/
    pause
    exit /b 1
)
echo OK: Node.js está instalado.
echo.

echo [Paso 2] Instalando dependencias...
if not exist "node_modules" (
    call npm.cmd install
    if %errorlevel% neq 0 (
        echo ERROR: No se pudieron instalar las dependencias!
        pause
        exit /b 1
    )
)
echo OK: Dependencias listas.
echo.

echo [Paso 3] Inicializando base de datos...
if not exist "gobdata360.db" (
    echo Creando base de datos y datos de prueba...
    node config/seed.js
)
echo OK: Base de datos lista.
echo.

echo ========================================
echo ¡LISTO! El servidor se está iniciando...
echo Abre tu navegador en: http://localhost:3000
echo.
echo Presiona Ctrl+C para detener el servidor.
echo ========================================
echo.

call npm.cmd start
pause
