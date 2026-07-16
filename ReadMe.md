# Quel Pokémon es-tu ?

Application web ludique développée en Go qui permet de découvrir quel Pokémon vous correspond en fonction de votre prénom. 

## 1. Le service rendu par l'application

L'application fournit une interface web minimaliste où l'utilisateur saisit son prénom. En retour, elle affiche l'illustration officielle et le nom d'un des 151 Pokémon de la première génération. 
L'algorithme utilisé est déterministe : un même prénom donnera toujours exactement le même Pokémon, ce qui permet de comparer ses résultats avec ses amis.

## 2. Le fonctionnement global

Le projet est composé d'un serveur backend écrit en **Go** et d'une vue rendue côté serveur via le package `html/template`. 

Voici les étapes techniques de l'application :
* **Réception de la requête :** L'application écoute sur une route unique (`GET /`). Le prénom est lu depuis les paramètres d'URL (`?name=`).
* **Détermination du Pokémon :** La fonction `pokemonID` prend le prénom en entrée, le hache avec l'algorithme cryptographique **SHA-1**, convertit ce hash en un entier (BigEndian), et applique un modulo 151 (le nombre de Pokémon de la première génération). 
* **Récupération des données :** * Le serveur effectue une requête HTTP à l'API publique **PokeAPI** (`https://pokeapi.co/api/v2/pokemon/{id}`) pour récupérer dynamiquement le nom officiel du Pokémon.
  * L'image est servie directement depuis le dépôt GitHub des sprites officiels de PokeAPI.
* **Rendu :** Les informations (Nom du Pokémon, ID, Prénom de l'utilisateur, Version de l'app) sont injectées dans le template HTML `index.tmpl.html` et renvoyées au client.

## 3. Comment lancer le service sur son poste

### Prérequis
Vous devez avoir [Go](https://go.dev/doc/install) (Golang) installé sur votre système.

### Lancement standard
1. Placez les fichiers `main.go` et `index.tmpl.html` dans un même dossier.
2. Ouvrez un terminal dans ce dossier.
3. Exécutez la commande suivante :
   ```bash
   go run main.go