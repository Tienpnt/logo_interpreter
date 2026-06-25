# Mini Interpréteur du langage Logo
## Membres du groupe
NOORSABA SAFI
NGUYEN THUY TIEN PHAM 

## Description du projet
Ce projet consiste à développer un mini interpréteur du langage Logo en OCaml.

Le langage Logo est un langage pédagogique permettant de contrôler une tortue graphique afin de dessiner des figures géométriques.

L’objectif principal est de mettre en œuvre les notions de :
- Analyse lexicale (OCamllex)
- Analyse syntaxique (OCamlyacc)
- Interprétation d’un langage
- Manipulation d’un environnement de variables
- Structures de contrôle (boucles, conditions)

## Fonctionnalités du langage

Le langage supporte :

- Expressions
Entiers positifs et négatifs
Opérations arithmétiques : +, -, *, /, mod

- Variables
Déclaration : Def x 10
Accès : : x
 
- Commandes tortue
Avance n
Recule n
Gauche n
Droite n
Efface
Dessine
Deplace

- Boucles
Repete 4 [ Avance 100 ; Droite 90 ]

- Conditionnelles
Si (:x > 10) Alors
  Avance 50
Sinon
  Reculer 50
FinSi

- Commentaires
-- Ceci est un commentaire

Exemple de programme Logo
-- Dessin d’une maison simple

Efface ;
Avance 150 ; Gauche 90 ; Avance 100 ; Dessine ;
Def taille 100 ;
Repete 4 [ Avance :taille ; Droite 90 ] ;
Deplace ; Avance :taille ; Droite 90 ; Dessine ;
Repete 3 [ Avance :taille ; Gauche 120 ] .

## Exemple de résultat

## Ce programme permet de générer des figures graphiques via la tortue Logo.

## Architecture du projet
Le projet est organisé en plusieurs modules OCaml :
logo_ast.ml → Syntaxe abstraite + interprétation
logo_lexer.mll → Analyse lexicale (OCamllex)
logo_parser.mly → Analyse syntaxique (OCamlyacc)
env.ml → Gestion des variables
geometry.ml → Calculs géométriques
turtle.ml → Implémentation logique de la tortue
turtle_graphic.ml → Interface graphique
repl_logo.ml → Boucle interactive (REPL)
Makefile → Compilation du projet

### Compilation et exécution
- Compiler le projet
make
- Exécuter le REPL
./repl_logo
- Exécuter un fichier
./repl_logo < mon_programme.logo

## Objectifs pédagogiques
Ce projet permet de maîtriser :
- Construction d’un interpréteur complet
- Parsing de langage
- Gestion d’environnement de variables
- Conception de DSL (Domain Specific Language)
- Programmation fonctionnelle en OCaml
