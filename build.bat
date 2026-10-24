@echo off
REM Snap Tap - build con MSVC. Ejecutar desde "Developer Command Prompt for VS".
cl /nologo /O2 /EHsc /utf-8 src\main.cpp /Fe:SnapTap.exe /link /SUBSYSTEM:WINDOWS
if errorlevel 1 (
    echo.
    echo Fallo la compilacion.
    exit /b 1
)
echo.
echo Listo: SnapTap.exe
