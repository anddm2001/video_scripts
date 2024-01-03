@echo off
setlocal enabledelayedexpansion

:: Задаем пути к каталогам для импорта и экспорта
set "in=C:\path\to\import\directory"
set "out=C:\path\to\export\directory"

:: Указываем расширение файлов
set "extension=MP4"

:: Перебираем все файлы с указанным расширением в каталоге импорта
for %%f in ("%in%\*.%extension%") do (
    echo Processing file: %%f

    :: Формируем имя файла для экспорта
    set "filename=%%~nxf"
    set "exportFile=%out%\!filename!"

    :: Выполняем команду ffmpeg для удаления аудиопотока, видеопоток остается без изменений
    ffmpeg -hide_banner -i "%%f" -c:v copy -an "!exportFile!"

    echo Processed: !exportFile!
)

echo All files processed.
