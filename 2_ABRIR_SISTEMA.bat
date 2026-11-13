@echo off
chcp 65001 >nul
setlocal
cd /d "%~dp0"
title Abrir CRUD Clientes

if not exist "backend\node_modules" (
    echo Primeiro execute 1_INSTALAR_E_CONFIGURAR.bat
    pause
    exit /b 1
)
if not exist "frontend\node_modules" (
    echo Primeiro execute 1_INSTALAR_E_CONFIGURAR.bat
    pause
    exit /b 1
)
if not exist "backend\.env" (
    echo Falta backend\.env. Execute 1_INSTALAR_E_CONFIGURAR.bat
    pause
    exit /b 1
)
findstr /r /c:"^BD_SENHA=.$" "backend\.env" >nul
findstr /b /c:"BD_SENHA=" "backend\.env" | findstr /r "BD_SENHA=$" >nul
if not errorlevel 1 (
    echo A senha esta vazia no backend\.env. Abra o arquivo e preencha BD_SENHA= com a senha do slide 13.
    pause
    exit /b 1
)

start "API - CRUD Clientes" cmd /k "cd /d ""%~dp0backend"" && node src/server.js"
start "React - CRUD Clientes" cmd /k "cd /d ""%~dp0frontend"" && npm run dev -- --port 5173 --strictPort"
echo.
echo Iniciei duas janelas. Deixe as duas abertas enquanto usar o sistema.
echo Abra http://localhost:5173

timeout /t 5 /nobreak >nul
start "" "http://localhost:5173"
