(*-------------------------------------------------*)
(* Analyseur lexical                               *)
(* Exo03 - Q4 : ajout de la conditionnelle        *)
(*   logo_lexer_exo03-4.mll                        *)
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

  | ['0'-'9']+
      { INT (int_of_string (Lexing.lexeme lexbuf)) }

  (*-----------------------------------*)
  (* Mots-clés de la conditionnelle    *)
  (*-----------------------------------*)
  | "Si"      { SI    }
  | "Alors"   { ALORS }
  | "Sinon"   { SINON }
  | "FinSi"   { FINSI }

  | "Repete"  { REPETE  }
  | "Avance"  { AVANCE  }
  | "Recule"  { RECULE  }
  | "Gauche"  { GAUCHE  }
  | "Droite"  { DROITE  }
  | "Efface"  { EFFACE  }
  | "Dessine" { DESSINE }
  | "Deplace" { DEPLACE }
  | "Def"     { DEF     }

  | ':' (['a'-'z' '_'] ['a'-'z' 'A'-'Z' '0'-'9' '_']* as id)
      { VAR id }

  | ['a'-'z' '_'] ['a'-'z' 'A'-'Z' '0'-'9' '_']*
      { IDENT (Lexing.lexeme lexbuf) }

  | ';'  { SEMICOLON }
  | '.'  { DOT       }
  | '['  { LBRACKET  }
  | ']'  { RBRACKET  }
  | '('  { LPAREN    }
  | ')'  { RPAREN    }

  | '+'  { PLUS  }
  | '-'  { MINUS }
  | '*'  { TIMES }
  | '/'  { DIV   }

  (*-----------------------------------*)
  (* Opérateurs de comparaison         *)
  (*-----------------------------------*)
  | '='  { EQ }
  | '>'  { GT }
  | '<'  { LT }

  | eof  { raise Quit }
  | _    { raise Not_recognized }
