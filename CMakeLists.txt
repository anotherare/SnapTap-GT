cmake_minimum_required(VERSION 3.15)
project(SnapTap LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(SnapTap WIN32 src/main.cpp)

target_link_libraries(SnapTap PRIVATE
    user32 gdi32 gdiplus msimg32 shell32 winmm dwmapi advapi32)

if(MSVC)
    target_compile_options(SnapTap PRIVATE /O2 /utf-8)
elseif(MINGW)
    target_link_options(SnapTap PRIVATE -municode -static)
endif()
