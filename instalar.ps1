# Script de Instalación Automática - GOB DATA 360
# Versión 1.0
# Creado por Jutlis Vestigios

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  GOB DATA 360 - Instalador Automático" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Verificar si Node.js está instalado
Write-Host "[1/5] Verificando Node.js..." -ForegroundColor Yellow
try {
    $nodeVersion = node --version
    Write-Host "✓ Node.js encontrado: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Node.js no está instalado!" -ForegroundColor Red
    Write-Host "Por favor, instala Node.js desde https://nodejs.org/" -ForegroundColor Red
    Read-Host "Presiona Enter para salir"
    exit 1
}

Write-Host ""

# Verificar si npm está disponible
Write-Host "[2/5] Verificando npm..." -ForegroundColor Yellow
try {
    $npmVersion = & npm.cmd --version
    Write-Host "✓ npm encontrado: $npmVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ npm no está disponible!" -ForegroundColor Red
    Read-Host "Presiona Enter para salir"
    exit 1
}

Write-Host ""

# Navegar al directorio del backend
$backendPath = Join-Path $PSScriptRoot "backend"
if (-not (Test-Path $backendPath)) {
    Write-Host "✗ No se encontró el directorio del backend!" -ForegroundColor Red
    Read-Host "Presiona Enter para salir"
    exit 1
}

Set-Location $backendPath

# Instalar dependencias
Write-Host "[3/5] Instalando dependencias..." -ForegroundColor Yellow
Write-Host "Esto puede tomar un momento..." -ForegroundColor Gray
& npm.cmd install
if ($LASTEXITCODE -ne 0) {
    Write-Host "✗ Error al instalar dependencias!" -ForegroundColor Red
    Read-Host "Presiona Enter para salir"
    exit 1
}
Write-Host "✓ Dependencias instaladas correctamente!" -ForegroundColor Green

Write-Host ""

# Inicializar la base de datos
Write-Host "[4/5] Inicializando base de datos..." -ForegroundColor Yellow
& npm.cmd run seed
Write-Host "✓ Base de datos inicializada con datos de prueba!" -ForegroundColor Green

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  ¡Instalación completada con éxito!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "La instalación base terminó correctamente." -ForegroundColor White
Write-Host "Si necesitas sembrar usuarios iniciales, revísalo desde la configuración del proyecto." -ForegroundColor Gray
Write-Host ""
Write-Host "¿Deseas iniciar el servidor ahora? (S/N)" -ForegroundColor Cyan
$respuesta = Read-Host

if ($respuesta -eq "S" -or $respuesta -eq "s") {
    Write-Host ""
    Write-Host "Iniciando servidor en http://localhost:3000..." -ForegroundColor Green
    Write-Host "Presiona Ctrl+C para detener el servidor" -ForegroundColor Gray
    Write-Host ""
    & npm.cmd start
} else {
    Write-Host ""
    Write-Host "Para iniciar el servidor manualmente:" -ForegroundColor Yellow
    Write-Host "  1. Abre una terminal en la carpeta 'backend'" -ForegroundColor Gray
    Write-Host "  2. Ejecuta: npm.cmd start" -ForegroundColor Gray
    Write-Host "  3. Abre tu navegador y visita: http://localhost:3000" -ForegroundColor Gray
    Write-Host ""
    Read-Host "Presiona Enter para salir"
}
