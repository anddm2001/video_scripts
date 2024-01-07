@echo off

:: Путь к каталогу с исходными видеофайлами
set "IN_DIR=C:\path\to\source\directory"

:: Путь к каталогу для сохранения конвертированных видеофайлов
set "OUT_DIR=C:\path\to\output\directory"

:: Исходное и целевое расширения файлов
set "SOURCE_EXT=mp4"
set "TARGET_EXT=y4m"

:: Перебираем все исходные видеофайлы
for %%f in ("%IN_DIR%\*.%SOURCE_EXT%") do (
    :: Определяем имя файла без расширения
    for /f "delims=." %%i in ("%%~nf") do set "base_name=%%i"

    :: Создаем соответствующий каталог в директории назначения
    if not exist "%OUT_DIR%\%base_name%" mkdir "%OUT_DIR%\%base_name%"

    :: Выполняем конвертацию
    ffmpeg -i "%%f" "%OUT_DIR%\%base_name%\%base_name%.%TARGET_EXT%"
)

echo Conversion completed.
