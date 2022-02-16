@echo off
if %1 == debug (
	build\raylib\Main-debug.exe
    pause
) else (
	build\raylib\Main.exe
)
