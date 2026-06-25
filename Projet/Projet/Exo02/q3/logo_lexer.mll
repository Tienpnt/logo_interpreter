(*-------------------------------------------------*)
(* Analyseur lexical                               *)
(* Exo02 - Q3 : ajout de l'arithmétique           *)
(*   logo_lexer_exo02-3.mll                        *)
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

  (*---------------------------------------------------*)
  (* Entiers : ATTENTION — on ne reconnaît plus les   *)
  (* entiers avec signe ici car '+' et '-' sont        *)
  (* maintenant des opérateurs séparés.                *)
  (* Un entier négatif s'écrit ( 0 - 5 ) en Logo.     *)
  (*---------------------------------------------------*)
  | ['0'-'9']+
      { INT (int_of_string (Lexing.lexeme lexbuf)) }

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
  | '['   { LBRACKET  }
  | ']'   { RBRACKET  }

  (*-----------------------------------*)
  (* Opérateurs arithmétiques          *)
  (*-----------------------------------*)
  | '+'   { PLUS   }
  | '-'   { MINUS  }
  | '*'   { TIMES  }
  | '/'   { DIV    }

  (*-----------------------------------*)
  (* Parenthèses pour les expressions  *)
  (* arithmétiques : ( e1 op e2 )      *)
  (*-----------------------------------*)
  | '('   { LPAREN }
  | ')'   { RPAREN }

  | eof   { raise Quit }
  | _     { raise Not_recognized }
