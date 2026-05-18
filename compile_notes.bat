@echo off
:: Set console to UTF-8
chcp 65001 >nul

:: Safely set the variable without including quotes in the value itself
set "OUTPUT=_Compiled_Music_Theory_Notes.md"

:: Delete existing output file
if exist "%OUTPUT%" del "%OUTPUT%"

echo Compiling Markdown files...

for /R %%f in (*.md) do (
    :: /I ensures case-insensitive exact string match
    if /I not "%%~nxf"=="%OUTPUT%" (
        echo Adding: %%~nxf
        
        echo # %%~nxf >> "%OUTPUT%"
        echo. >> "%OUTPUT%"
        
        type "%%f" >> "%OUTPUT%"
        
        echo. >> "%OUTPUT%"
        echo --- >> "%OUTPUT%"
        echo. >> "%OUTPUT%"
    )
)

echo.
echo Compilation complete. Output saved to %OUTPUT%
pause