@echo off
setlocal enabledelayedexpansion

REM Obtenir le chemin complet du dossier contenant le script batch
set "currentDir=%~dp0"

REM Enlever le dernier caractère "\" s'il existe
set "currentDir=%currentDir:~0,-1%"

REM Obtenir le nom du dossier parent immédiat
for %%i in ("%currentDir%") do set "parentFolderName=%%~nxi"

REM Demander à l'utilisateur de saisir un nom pour le fichier
set "fileNameOutput="
set /p "fileNameOutput=Entrez le nom du Set (ou appuyez sur Entrée pour utiliser le nom du dossier parent '%parentFolderName%'): "

REM Utiliser le nom du dossier parent si l'utilisateur appuie simplement sur Entrée
if "%fileNameOutput%"=="" (
    set "fileNameOutput=%parentFolderName%"
)

set "extensionNameInput=jpg"

set "extensionOutputInput=js"

REM Ajouter du texte au fichier Output (modifier selon vos besoins)
echo let _!fileNameOutput! = [ > !parentFolderName!.!extensionOutputInput!

    REM Obtenir le chemin relatif
    set "path=/!fileNameOutput!/"

for /r %%i in (*.%extensionNameInput%) do (
    set "filePath=%%i"
    set "fileName=%%~nxi"

    set "width=0"
    set "height=0"

    REM Utiliser ImageMagick pour obtenir la taille de l'image
    for /f "tokens=2 delims==x " %%a in ('magick identify -format "%%w==%%h" "%%i"') do (
        set "width=%%a"
        set "height=%%b"
    )

	set "fileSizeKB=0"
	
    REM Utiliser forfiles pour obtenir la taille du fichier en kilooctets
    for /f %%a in ('forfiles /m "%%~nxi" /c "cmd /c echo @fsize"') do (
        set "fileSize=%%a"
        set /a fileSizeKB=fileSize/1024
    )

    REM Ajouter du texte au fichier Output (modifier selon vos besoins)
    echo { set: '!fileNameOutput!', name: '%%~ni', file: '!path!%%~nxi', sizes:{ width: !width!, height: !height!, ko: !fileSizeKB! } }, >> !fileNameOutput!.!extensionOutputInput!
)

REM Ajouter du texte au fichier Output (modifier selon vos besoins)
echo ] >> !fileNameOutput!.!extensionOutputInput!
echo export { _!fileNameOutput! } >> !fileNameOutput!.!extensionOutputInput!
pause
