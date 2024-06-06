@echo off
setlocal enabledelayedexpansion

REM Obtenir le chemin complet du dossier contenant le script batch
set "currentDir=%~dp0"
REM Enlever le dernier caractère "\" s'il existe
set "currentDir=%currentDir:~0,-1%"
REM Obtenir le nom du dossier parent immédiat
for %%i in ("%currentDir%") do set "parentFolderName=%%~nxi"

REM Demander à l'utilisateur de saisir un nom pour le fichier
set "fileNameInput="
set /p "fileNameInput=Entrez le nom du fichier (ou appuyez sur Entrée pour utiliser '%parentFolderName%'): "
REM Utiliser le nom du dossier parent si l'utilisateur appuie simplement sur Entrée
if "%fileNameInput%"=="" (
    set "fileNameInput=%parentFolderName%"
)

REM Demander à l'utilisateur de saisir une extension de fichier
set "extensionNameInput="
set /p "extensionNameInput=Entrez le nom l'extension (ou appuyez sur Entrée pour utiliser 'gltf'): "
REM Utiliser le nom du dossier parent si l'utilisateur appuie simplement sur Entrée
if "%extensionNameInput%"=="" (
    set "extensionNameInput=gltf"
)

echo let !fileNameInput! = [ > !parentFolderName!.js

for /r %%i in (*.%extensionNameInput%) do (
    set "filePath=%%i"
    set "fileName=%%~nxi"
    echo { set: '!fileNameInput!', name: '%%~ni', file: '%%~dpnxi', position: { x: 0, y: 0, z: 0 } }, >> !fileNameInput!.js
)

echo ] >> !fileNameInput!.js
echo export { '!fileNameInput!' } >> !fileNameInput!.js
