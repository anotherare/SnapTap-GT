@echo off
setlocal
cd /d "%~dp0"
title Snap Tap - Build

REM ---------- 1. Buscar el codigo fuente ----------
set "SRC="
if exist "src\main.cpp" set "SRC=src\main.cpp"
if not defined SRC if exist "main.cpp" set "SRC=main.cpp"
if not defined SRC (
    echo [ERROR] No encuentro main.cpp.
    echo         Ponelo en la carpeta "src" ^(src\main.cpp^) junto a este archivo.
    goto :fin
)
echo Fuente: %SRC%

REM ---------- 2. Cargar el entorno de Visual Studio si cl no esta disponible ----------
where cl >nul 2>nul
if %errorlevel%==0 goto :compilar

set "VSWHERE=%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe"
if not exist "%VSWHERE%" (
    echo [ERROR] No encuentro Visual Studio.
    echo         Instala "Visual Studio Build Tools" con la carga de trabajo
    echo         "Desarrollo para el escritorio con C++":
    echo         https://visualstudio.microsoft.com/downloads/
    goto :fin
)

set "VSPATH="
for /f "usebackq delims=" %%i in (`"%VSWHERE%" -latest -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath`) do set "VSPATH=%%i"
if not defined VSPATH (
    echo [ERROR] Visual Studio esta instalado pero sin las herramientas de C++.
    echo         Abre "Visual Studio Installer" y agrega "Desarrollo para el escritorio con C++".
    goto :fin
)

echo Cargando entorno de Visual Studio...
call "%VSPATH%\VC\Auxiliary\Build\vcvars64.bat" >nul
if errorlevel 1 (
    echo [ERROR] No se pudo cargar vcvars64.bat
    goto :fin
)

REM ---------- 3. Compilar ----------
:compilar
echo Compilando...
cl /nologo /O2 /EHsc /utf-8 "%SRC%" /Fe:SnapTap.exe /link /SUBSYSTEM:WINDOWS
if errorlevel 1 (
    echo.
    echo [ERROR] Fallo la compilacion. Revisa los mensajes de arriba.
    goto :fin
)

del /q main.obj 2>nul
echo.
echo ===== Listo: SnapTap.exe =====

:fin
echo.
pause
endlocal
