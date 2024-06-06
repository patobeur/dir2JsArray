
# Traitement de Fichiers par Lot 🚀
Pour faire du JavaScript, HTML ou autres ! 

## Description 📚

Cet outil est conçu pour aider les non-développeurs à traiter rapidement un lot de fichiers dans leurs projets. Les scripts batch génèrent des fichiers JavaScript ou HTML contenant des informations formatées sur chaque fichier, facilitant ainsi leur importation et utilisation. 

Bien qu'utile pour les projets utilisant Three.js, cet outil peut également être adapté pour d'autres utilisations nécessitant l'intégration et la gestion de lots de fichiers de différents types.

Voilà, c'est peut être pas grand chose mais c'est pas rien ;)

Autant que tout le monde en profite

## Fonctionnalités ✨

- Génère automatiquement des fichiers JavaScript ou HTML avec des informations sur les fichiers.
- Permet de spécifier le nom de l'objet/tableau et l'extension des fichiers à inclure.
- Utilise le nom du dossier parent comme valeur par défaut si aucun nom n'est spécifié.
- Flexible pour différents types de traitement, par exemple, la génération de balises HTML pour une galerie d'images.

## Avantages des scripts batch 🏆 

- **Gain de Temps** : Évite la saisie manuelle de longues listes de fichiers.
- **Réduction des Erreurs** : Minimise les erreurs de frappe et de syntaxe.
- **Automatisation** : Facilite le traitement en masse de fichiers, rendant le processus plus efficace.
- **Flexibilité** : Peut être adapté pour différents types de fichiers et différentes sorties (JavaScript, HTML, etc.).

## Utilisations Potentielles 💡

- **Intégration dans Three.js** : Ajoutez rapidement des modèles 3D à vos scènes pour le prototypage et les tests.
- **Galeries d'Images** : Générer des balises HTML `<img>` pour une galerie d'images à réutiliser dans vos projet front.
- **Automatisation de Tâches** : Automatisez la création de fichiers formatés pour tout projet nécessitant un grand nombre de fichiers.

## Utilisation 🛠️

1. Clonez ce dépôt ou téléchargez les fichiers.

```
bash
   git clone https://github.com/patobeur/dir2JsArray.git
   cd dir2JsArray
```

2. Placez les scripts batch (`dir2JsArray.bat` et `dir2Html.bat`) dans le dossier contenant vos fichiers (par exemple, `D:\testDir\`).

## Exemples 📦

### Exemple 1 : Génération de Fichier JavaScript (dir2JsArray.bat)

Ce script batch (`dir2JsArray.bat`) génère un fichier JavaScript contenant un tableau avec des informations sur chaque fichier d'un certain type dans le dossier. Il est particulièrement utile pour intégrer des modèles 3D dans des projets Three.js.

1. Exécutez le script batch `dir2JsArray.bat` en double-cliquant dessus ou via l'invite de commandes.

2. Suivez les instructions à l'écran pour saisir le nom de l'objet/tableau et l'extension des fichiers.

3. Le script génèrera un fichier JavaScript dans le même dossier (`D:\testDir\`), prêt à être utilisé dans vos projets.

#### Exemple de Résultat 📝

Supposons que vous ayez un dossier contenant les fichiers GLTF suivants :

```
D:\
└── testDir
    ├── model1.gltf
    ├── model2.gltf
    ├── model3.gltf
    ...
```

En exécutant le script batch `dir2JsArray.bat` avec l'extension de fichier `.gltf`, vous obtiendrez un fichier JavaScript comme suit :

```javascript
let testDir = [
    { set: 'testDir', name: 'model1', file: 'D:\testDir\model1.gltf', position: { x: 0, y: 0, z: 0 } },
    { set: 'testDir', name: 'model2', file: 'D:\testDir\model2.gltf', position: { x: 0, y: 0, z: 0 } },
    { set: 'testDir', name: 'model3', file: 'D:\testDir\model3.gltf', position: { x: 0, y: 0, z: 0 } },
    ...
]
export { testDir }
```

### Exemple 2 : Génération de Fichier HTML (dir2Html.bat)

Ce script batch (`dir2Html.bat`) génère un fichier HTML contenant des balises `<img>` pour chaque fichier d'un certain type dans le dossier. Il est particulièrement utile pour créer rapidement une galerie d'images.

1. Exécutez le script batch `dir2Html.bat` en double-cliquant dessus ou via l'invite de commandes.

2. Suivez les instructions à l'écran pour saisir le nom du fichier de sortie et l'extension des fichiers à prendre en compte.

3. Le script génèrera un fichier HTML dans le même dossier (`D:\testDir\`), prêt à être utilisé dans vos projets.

#### Exemple de Résultat 📝

Supposons que vous ayez un dossier contenant les fichiers JPG suivants :

```
D:\
└── testDir
    ├── image1.jpg
    ├── image2.jpg
    ├── image3.jpg
    ...
```

En exécutant le script batch `dir2Html.bat` avec l'extension de fichier `jpg`, vous obtiendrez un fichier HTML comme suit :

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Galerie d'images</title>
</head>
<body>
    <img src="../testDir/image1.jpg" title="(testDir image1.jpg)" width="150px" height="auto" alt="image1.jpg">
    <img src="../testDir/image2.jpg" title="(testDir image2.jpg)" width="150px" height="auto" alt="image2.jpg">
    <img src="../testDir/image3.jpg" title="(testDir image3.jpg)" width="150px" height="auto" alt="image3.jpg">
    ...
</body>
</html>
```

## Contributions 💬

Les contributions sont les bienvenues ! N'hésitez pas à soumettre des issues et des pull requests pour améliorer cet outil.

## License 📜
Ce projet est sous licence MQCEELEPEFCQTV. Voir le fichier [LICENSE](MaintenantQueCEstEnLigneEtPublicTEnFaitCQueTuVeux) pour plus de détails.
