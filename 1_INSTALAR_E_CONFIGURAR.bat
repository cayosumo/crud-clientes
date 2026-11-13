@echo off
chcp 65001 >nul
setlocal
cd /d "%~dp0"
title Preparar CRUD Clientes

where node >nul 2>nul
if errorlevel 1 (
    echo ERRO: Node.js nao esta instalado. Instale pelo site https://nodejs.org/
    pause
    exit /b 1
)
where npm >nul 2>nul
if errorlevel 1 (
    echo ERRO: npm nao foi encontrado. Reinstale o Node.js.
    pause
    exit /b 1
)

echo === Instalando backend ===
pushd "backend"
call npm install
if errorlevel 1 (
    echo ERRO durante a instalacao do backend.
    pause
    exit /b 1
)
popd

echo.
echo === Instalando frontend ===
pushd "frontend"
call npm install
if errorlevel 1 (
    echo ERRO durante a instalacao do frontend.
    pause
    exit /b 1
)
popd

if not exist "backend\.env" (
    copy /y "backend\.env.example" "backend\.env" >nul
    echo.
    echo IMPORTANTE: a senha do MySQL NAO foi colocada no arquivo.
    echo Vou abrir backend\.env no Bloco de Notas.
    echo Na linha BD_SENHA= coloque a senha que esta no slide 13 do PDF Atividade_CRUD_Clientes.
    echo Salve no Bloco de Notas com Ctrl+S e feche.
    start /wait "" notepad.exe "backend\.env"
)

echo.
echo Instalacao concluida. Agora execute 2_ABRIR_SISTEMA.bat
pause
