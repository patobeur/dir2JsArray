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
set /p "fileNameOutput=Entrez le nom du fichier (ou appuyez sur Entrée pour utiliser '%parentFolderName%'): "

REM Utiliser le nom du dossier parent si l'utilisateur appuie simplement sur Entrée
if "%fileNameOutput%"=="" (
    set "fileNameOutput=%parentFolderName%"
)

REM Demander à l'utilisateur de saisir une extension de fichier pour le choix des fichier à prendre
set "extensionNameInput="
set /p "extensionNameInput=Entrez le nom l'extension (ou appuyez sur Entrée pour utiliser 'gltf'): "

REM Utiliser le nom du dossier parent si l'utilisateur appuie simplement sur Entrée
if "%extensionNameInput%"=="" (
    set "extensionNameInput=gltf"
)

REM Demander à l'utilisateur de saisir une extension de fichier pour le fichier final
set "extensionOutputInput="
set /p "extensionOutputInput=Entrez le nom l'extension pour votre fichier final (ou appuyez sur Entrée pour utiliser 'js'): "

REM Utiliser l'extension par défaut si l'utilisateur appuie simplement sur Entrée
if "%extensionOutputInput%"=="" (
    set "extensionOutputInput=js"
)

echo let !fileNameOutput! = [ > !parentFolderName!.js

for /r %%i in (*.%extensionNameInput%) do (
    set "filePath=%%i"
    set "fileName=%%~nxi"
    echo { set: '!fileNameOutput!', name: '%%~ni', file: '%%~dpnxi', position: { x: 0, y: 0, z: 0 } }, >> !fileNameOutput!.!extensionOutputInput!
)

echo ] >> !fileNameOutput!.!extensionOutputInput!
echo export { '!fileNameOutput!' } >> !fileNameOutput!.!extensionOutputInput!

