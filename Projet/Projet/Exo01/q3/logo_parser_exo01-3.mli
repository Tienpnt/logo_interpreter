type token =
  | INT of (
# 19 "logo_parser_exo01-3.mly"
        int
# 6 "logo_parser_exo01-3.mli"
)
  | IDENT of (
# 20 "logo_parser_exo01-3.mly"
        string
# 11 "logo_parser_exo01-3.mli"
)
  | VAR of (
# 21 "logo_parser_exo01-3.mly"
        string
# 16 "logo_parser_exo01-3.mli"
)
  | AVANCE
  | RECULE
  | GAUCHE
  | DROITE
  | EFFACE
  | DESSINE
  | DEPLACE
  | DEF
  | SEMICOLON
  | DOT

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> unit
