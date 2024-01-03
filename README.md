# Платформозависмые наборы скриптов для автоматизации групповой обработки видео файлов с помощтю инструмента ffmpeg

## В каталогах размещены скрипты для Windows и Unix систем

Важно, чтобы в операционной системе был установлен ffmpeg, а также прописан алиас для его вызова из командного процессора

### Установка ffmpeg для разных операционных систем:

#### Windows

Скачать из https://www.ffmpeg.org/download.html

Разархивируйте содержимое скачанного архива, например в Program Files/ffmpeg (или в другую папку, например, где у вас хранятся портативные программы).

В PowerShell выполните следующую команду.

c:\"program files"\ffmpeg\bin\ffmpeg.exe -version
Для cmd немного модифицированная команда.

"C:\Program Files\ffmpeg\bin\ffmpeg.exe" -version

Чтобы каждый раз не вводить длинный путь к программе C:\Program Files\ffmpeg\bin\ffmpeg.exe рекомендую добавить ее в системную переменную Path, для этого:

- перейдите в параметры Windows, в поиске введите Панель управления
- перейдите в Панель управления – Система и безопасность – Система;
- выберите пункт Дополнительные параметры системы;
- нажмите кнопку Переменные среды;
- в поле Системные переменные выберите значение Path и нажмите кнопку Изменить, чтобы добавить новое значение;
- укажите путь к папке с FFmpeg содержащую ffmpeg.exe;

#### MacOS

`brew install ffmpeg`

#### Linux (CentOS)

`yum install epel-release -y`
`yum update -y`

#### Linux (Debian)

`apt install ffmpeg`

#### Linux (Ubuntu)

`sudo apt-get install -y software-properties-common`
`add apt-repository ppa:mc3man/trusty-media`
`apt-get update`
`apt-get dist-upgrade`
`apt-get install ffmpeg`