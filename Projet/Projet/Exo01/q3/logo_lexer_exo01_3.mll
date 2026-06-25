(*-------------------------------------------------*)
(* Analyseur lexical version 2                     *)
(* Envoie les tokens au parser                     *)
(*   Exo01 - Q2 - logo_lexer.mll                   *)
(*-------------------------------------------------*)

{
  

  (* Exception levée quand un lexème n'est pas reconnu *)
  exception Not_recognized
  exception Quit 
   
  open Logo_parser_exo01_3

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
  (* Syntaxe : :NomVariable            *)
  (*-----------------------------------*)
  | ':' (['A'-'Z' '_'] ['a'-'z' 'A'-'Z' '0'-'9' '_']* as id)
      { VAR id }

  (*-----------------------------------*)
  (* Noms de variables (pour Def)      *)
  (*-----------------------------------*)
  | ['A'-'Z' '_'] ['a'-'z' 'A'-'Z' '0'-'9' '_']*
      { IDENT (Lexing.lexeme lexbuf) }

  (*-----------------------------------*)
  (* Ponctuation                       *)
  (*-----------------------------------*)
  | ';'   { SEMICOLON }
  | '.'   { DOT       }

  (*-----------------------------------*)
  (* Fin de fichier                    *)
  (*-----------------------------------*)
  | eof   { raise Quit }

  (*-----------------------------------*)
  (* Lexème non reconnu : erreur       *)
  (*-----------------------------------*)
  | _     { raise Not_recognized }
