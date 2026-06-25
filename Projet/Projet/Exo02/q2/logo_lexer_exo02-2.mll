(*-------------------------------------------------*)
(* Analyseur lexical                               *)
(* Exo02 - Q2 : ajout de Repete                   *)
(*   logo_lexer_exo02-2.mll                        *)
(*-------------------------------------------------*)

{
  open Logo_parser
  exception Not_recognized
  exception Quit
}

rule read_lexeme = parse

  | [' ' '\t' '\n' '\r']
      { read_lexeme lexbuf }

  | "--" [^ '\n']*
      { read_lexeme lexbuf }

  | ['+' '-']? ['0'-'9']+
      { INT (int_of_string (Lexing.lexeme lexbuf)) }

  (*-----------------------------------*)
  (* Mots-clés — REPETE ajouté ici    *)
  (*-----------------------------------*)
  | "Repete"   { REPETE  }
  | "Avance"   { AVANCE  }
  | "Recule"   { RECULE  }
  | "Gauche"   { GAUCHE  }
  | "Droite"   { DROITE  }
  | "Efface"   { EFFACE  }
  | "Dessine"  { DESSINE }
  | "Deplace"  { DEPLACE }
  | "Def"      { DEF     }

  | ':' (['a'-'z' '_'] ['a'-'z' 'A'-'Z' '0'-'9' '_']* as id)
      { VAR id }

  | ['a'-'z' '_'] ['a'-'z' 'A'-'Z' '0'-'9' '_']*
      { IDENT (Lexing.lexeme lexbuf) }

  | ';'   { SEMICOLON }
  | '.'   { DOT       }

  (*-----------------------------------*)
  (* Crochets pour Repete N [ ... ]   *)
  (*-----------------------------------*)
  | '['   { LBRACKET }
  | ']'   { RBRACKET }

  | eof   { raise Quit }
  | _     { raise Not_recognized }
