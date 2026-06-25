(*-------------------------------------------------*)
(* Analyseur lexical version 1                     *)
(* Affiche les lexèmes reconnus                    *)
(*   Exo01 - Q2 - logo_lexr_exo01-2.mll            *)
(*-------------------------------------------------*)

{
  (* Exception levée quand un lexème n'est pas reconnu *)
  exception Not_recognized
  exception Quit 
}

(*-------------------------------------------------*)
(* Règle principale de lecture des lexèmes        *)
(*-------------------------------------------------*)
rule read_lexeme = parse

  (*-----------------------------------*)
  (* Espaces et retours à la ligne     *)
  (* On les ignore et on continue      *)
  (*-----------------------------------*)
  | [' ' '\t' '\n' '\r']
      { read_lexeme lexbuf }

  (*-----------------------------------*)
  (* Entiers : positifs ou négatifs    *)
  (* Exemples : 42, +23, -67           *)
  (*-----------------------------------*)
  | ['+' '-']? ['0'-'9']+
      { print_string ("Entier : " ^ (Lexing.lexeme lexbuf) ^ "\n") ;
        read_lexeme lexbuf }

  (*-----------------------------------*)
  (* Mots-clés des commandes           *)
  (*-----------------------------------*)
  | "Avance"
      { print_string "Mot-clé : Avance\n" ;
        read_lexeme lexbuf }

  | "Recule"
      { print_string "Mot-clé : Recule\n" ;
        read_lexeme lexbuf }

  | "Gauche"
      { print_string "Mot-clé : Gauche\n" ;
        read_lexeme lexbuf }

  | "Droite"
      { print_string "Mot-clé : Droite\n" ;
        read_lexeme lexbuf }

  | "Efface"
      { print_string "Mot-clé : Efface\n" ;
        read_lexeme lexbuf }

  | "Dessine"
      { print_string "Mot-clé : Dessine\n" ;
        read_lexeme lexbuf }

  | "Deplace"
      { print_string "Mot-clé : Deplace\n" ;
        read_lexeme lexbuf }

  (*-----------------------------------*)
  (* Mot-clé de définition de variable *)
  (*-----------------------------------*)
  | "Def"
      { print_string "Mot-clé : Def\n" ;
        read_lexeme lexbuf }

  (*-----------------------------------*)
  (* Accès à la valeur d'une variable  *)
  (* Syntaxe : :NomVariable            *)
  (* Le ':' est suivi du nom           *)
  (*-----------------------------------*)
  | ':' (['A'-'Z' '_'] ['a'-'z' 'A'-'Z' '0'-'9' '_']*)
      { print_string ("Variable : " ^ (Lexing.lexeme lexbuf) ^ "\n") ;
        read_lexeme lexbuf }

  (*-----------------------------------*)
  (* Noms de variables                 *)
  (* Commence par majuscule ou '_'     *)
  (* Exemple : Toto, _tutu14           *)
  (*-----------------------------------*)
  | ['A'-'Z' '_'] ['a'-'z' 'A'-'Z' '0'-'9' '_']*
      { print_string ("Identificateur : " ^ (Lexing.lexeme lexbuf) ^ "\n") ;
        read_lexeme lexbuf }

  (*-----------------------------------*)
  (* Point-virgule : sépare            *)
  (* les instructions                  *)
  (*-----------------------------------*)
  | ';'
      { print_string "Séparateur : ;\n" ;
        read_lexeme lexbuf }

  (*-----------------------------------*)
  (* Point : termine une phrase        *)
  (* C'est ici que l'on s'arrête       *)
  (*-----------------------------------*)
  | '.'
      { print_string "Fin de phrase : .\n" }

  (*-----------------------------------*)
  (* Fin de fichier                    *)
  (*-----------------------------------*)
  | eof
      { raise Quit }

  (*-----------------------------------*)
  (* Tout autre caractère : erreur     *)
  (*-----------------------------------*)
  | _
      { raise Not_recognized }
