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
set /p "extensionNameInput=Entrez le nom l'extension (ou appuyez sur Entrée pour utiliser 'jpg'): "

REM Utiliser le nom du dossier parent si l'utilisateur appuie simplement sur Entrée
if "%extensionNameInput%"=="" (
    set "extensionNameInput=jpg"
)

REM Demander à l'utilisateur de saisir une extension de fichier pour le fichier final
set "extensionOutputInput="
set /p "extensionOutputInput=Entrez le nom l'extension pour votre fichier final (ou appuyez sur Entrée pour utiliser 'html'): "

REM Utiliser l'extension par défaut si l'utilisateur appuie simplement sur Entrée
if "%extensionOutputInput%"=="" (
    set "extensionOutputInput=html"
)

REM Nom du fichier de sortie
set "outputFileName=%fileNameOutput%.%extensionOutputInput%"

echo ^<!DOCTYPE html^> > "%outputFileName%"
echo ^<html lang="en"^> >> "%outputFileName%"
echo ^<head^> >> "%outputFileName%"
echo ^<meta charset="UTF-8"^> >> "%outputFileName%"
echo ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^> >> "%outputFileName%"
echo ^<title^>Galerie d'images^</title^> >> "%outputFileName%"
echo ^</head^> >> "%outputFileName%"
echo ^<body^> >> "%outputFileName%"

for /r %%i in (*.%extensionNameInput%) do (
    set "filePath=%%i"
    set "fileName=%%~nxi"
	
	REM Ajouter du texte au fichier Output (modifier selon vos besoins)
    echo ^<img src="../!parentFolderName!/!fileName!" title="(!parentFolderName! !fileName!)" width="150px" height="auto" alt="!fileName!"^> >> "%outputFileName%"
)

echo ^</body^> >> "%outputFileName%"
echo ^</html^> >> "%outputFileName%"

endlocal
