<div align="center">

# Snap Tap

**SOCD cleaner para W/A/S/D con interfaz de cristal oscura**

![Windows](https://img.shields.io/badge/Windows-10%20%7C%2011-0078D4?logo=windows&logoColor=white)
![C++](https://img.shields.io/badge/C%2B%2B-17-00599C?logo=cplusplus&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-green)
![Build](https://img.shields.io/github/actions/workflow/status/TU-USUARIO/snap-tap/build.yml?label=build)

Hecho por **GT**

</div>

---

## ¿Qué hace?

Snap Tap resuelve los conflictos de teclas opuestas (SOCD): cuando mantenés **A y D** (o **W y S**) a la vez,
gana siempre **la última tecla que pulsaste**. Al soltarla, se reactiva la anterior si seguís manteniéndola.

Funciona con un hook de teclado de bajo nivel y envía las teclas por scancode, sin dependencias externas.

## Características

- **Pantalla de inicio** animada con el logo GT de cristal (se puede omitir).
- **Interfaz de cristal oscura** con fondo acrílico en Windows 11 (y fondo sólido en Windows 10).
- **Panel** con estado, interruptores por eje, visor de teclas en vivo y estadísticas.
- **6 temas** de color con transición suave: Violeta, Océano, Esmeralda, Carmesí, Ámbar y Neón.
- **Efectos visuales**: partículas, aurora, resplandor del cursor, ondas al hacer clic y slider de intensidad.
- **Ajustes**: siempre visible, iniciar con Windows, cerrar a la bandeja, notificaciones y atajo global
  configurable (F12, F11, F10 o Pausa).
- **Bandeja del sistema** con icono dinámico y menú para cambiar de tema.
- Los ajustes se guardan automáticamente en `HKCU\Software\GT\SnapTap`.

## Capturas

> Agregá tus capturas en `docs/` y enlazalas acá:
>
> `![Panel](docs/panel.png)`

## Uso

| Acción | Cómo |
|---|---|
| Pausar / reanudar | Atajo global (por defecto **F12**) o interruptor del panel |
| Cambiar de sección | Barra lateral o teclas **1** a **4** |
| Omitir la pantalla de inicio | Cualquier tecla o clic |
| Cambiar de tema | Sección **Temas** o menú de la bandeja |
| Salir | Menú de la bandeja → **Salir** (o desactivá *Cerrar a la bandeja*) |

## Compilar

Requiere Windows y un compilador C++ con el SDK de Windows (GDI+).

### Con MSVC

Abrí *Developer Command Prompt for VS* y ejecutá:

```bat
build.bat
```

O manualmente:

```bat
cl /O2 /EHsc /utf-8 src\main.cpp /Fe:SnapTap.exe /link /SUBSYSTEM:WINDOWS
```

### Con CMake

```bat
cmake -S . -B build -A x64
cmake --build build --config Release
```

El ejecutable queda en `build\Release\SnapTap.exe`.

### Con MinGW-w64

```bash
g++ -O2 -municode -mwindows src/main.cpp -o SnapTap.exe \
    -lgdiplus -lgdi32 -lmsimg32 -lwinmm -ldwmapi -ladvapi32 -lshell32 -luser32 -static
```

## Estructura

```
snap-tap/
├── src/main.cpp          # Código fuente (lógica, hook e interfaz GDI+)
├── CMakeLists.txt
├── build.bat
├── .github/workflows/    # Compilación automática en GitHub Actions
├── CHANGELOG.md
├── LICENSE
└── README.md
```

## Aviso

Algunos juegos, sistemas anti-trampas y torneos prohíben o restringen el uso de herramientas que
modifican las entradas del teclado. **Usalo bajo tu propia responsabilidad** y revisá las reglas de
cada juego o competencia antes de hacerlo.

## Licencia

[MIT](LICENSE) © 2026 GT
