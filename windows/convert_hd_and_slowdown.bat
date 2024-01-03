@echo off
setlocal enabledelayedexpansion

:: Задаем пути к каталогам для импорта и экспорта
set "in=C:\path\to\import\directory"
set "out=C:\path\to\export\directory"

:: Указываем расширение файлов и кодек для перекодирования
set "extension=MP4"
set "videoCodec=libx264"

:: Перебираем все файлы с указанным расширением в каталоге импорта
for %%f in ("%in%\*.%extension%") do (
    echo Processing file: %%f

    :: Формируем имя файла для экспорта
    set "filename=%%~nxf"
    set "exportFile=%out%\!filename!"

    :: Выполняем команду ffmpeg для изменения разрешения файла до HD и замедления видеопотока в 2 раза
    :: При этом аудио дорожка и кодек останутся без изменений
    ffmpeg -hide_banner -i "%%f" -vf "scale=1280:720,setpts=2.0*PTS" -c:a copy -c:v !videoCodec! "!exportFile!"

    echo Processed: !exportFile!
)

echo All files processed.
