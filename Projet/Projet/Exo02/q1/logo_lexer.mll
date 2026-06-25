(*-------------------------------------------------*)
(* Analyseur lexical                               *)
(* Exo02 - Q1 : ajout des commentaires             *)
(*   logo_lexer.mll  (fichier de compilation)      *)
(*-------------------------------------------------*)

{
  open Logo_parser   (* pour avoir accès aux tokens définis dans le parser *)

  (* Exception levée quand un lexème n'est pas reconnu *)
  exception Not_recognized

  (* Exception levée pour quitter la boucle REPL              *)
  (* Utilisée par repl_logo.ml — sera déclenchée dans         *)
  (* les exercices suivants quand on ajoutera une commande     *)
  (* "Quitte" ou similaire. Pour l'instant elle est définie   *)
  (* ici pour que la compilation de repl_logo.ml fonctionne.  *)
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
  (* Commentaires : -- jusqu'à la fin  *)
  (* de la ligne                       *)
  (* On les ignore et on continue      *)
  (* Note : on ne consomme PAS le '\n' *)
  (* — il sera lu par la règle des     *)
  (* espaces au tour suivant.          *)
  (* Cela évite l'erreur si le         *)
  (* commentaire est sur la dernière   *)
  (* ligne sans '\n' final.            *)
  (*-----------------------------------*)
  | "--" [^ '\n']*
      { read_lexeme lexbuf }

  (*-----------------------------------*)
  (* Entiers : positifs ou négatifs    *)
  (*-----------------------------------*)
  | ['+' '-']? ['0'-'9']+
      { INT (int_of_string (Lexing.lexeme lexbuf)) }

  (*-----------------------------------*)
  (* Mots-clés des commandes           *)
  (* IMPORTANT : les mots-clés doivent *)
  (* apparaître AVANT la règle des     *)
  (* identificateurs                   *)
  (*-----------------------------------*)
  | "Avance"   { AVANCE  }
  | "Recule"   { RECULE  }
  | "Gauche"   { GAUCHE  }
  | "Droite"   { DROITE  }
  | "Efface"   { EFFACE  }
  | "Dessine"  { DESSINE }
  | "Deplace"  { DEPLACE }
  | "Def"      { DEF     }

  (*-----------------------------------*)
  (* Accès à la valeur d'une variable  *)
  (* Syntaxe : :nomVariable            *)
  (* Le nom peut commencer par une     *)
  (* minuscule, une majuscule ou '_'   *)
  (*-----------------------------------*)
  | ':' (['a'-'z' '_'] ['a'-'z' 'A'-'Z' '0'-'9' '_']* as id)
      { VAR id }

  (*-----------------------------------*)
  (* Noms de variables (pour Def)      *)
  (* Commence par minuscule, majuscule *)
  (* ou '_'                            *)
  (* IMPORTANT : cette règle vient     *)
  (* APRÈS les mots-clés pour qu'ils   *)
  (* soient reconnus en priorité       *)
  (*-----------------------------------*)
  | ['a'-'z' '_'] ['a'-'z' 'A'-'Z' '0'-'9' '_']*
      { IDENT (Lexing.lexeme lexbuf) }

  (*-----------------------------------*)
  (* Ponctuation                       *)
  (*-----------------------------------*)
  | ';'   { SEMICOLON }
  | '.'   { DOT       }

  (*-----------------------------------*)
  (* Fin de fichier                    *)
  (* On lève Quit pour sortir          *)
  (* proprement de la boucle REPL      *)
  (*-----------------------------------*)
  | eof   { raise Quit }

  (*-----------------------------------*)
  (* Lexème non reconnu : erreur       *)
  (*-----------------------------------*)
  | _     { raise Not_recognized }
