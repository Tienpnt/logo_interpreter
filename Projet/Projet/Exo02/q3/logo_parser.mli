type token =
  | INT of (
# 9 "logo_parser.mly"
        int
# 6 "logo_parser.mli"
)
  | IDENT of (
# 10 "logo_parser.mly"
        string
# 11 "logo_parser.mli"
)
  | VAR of (
# 10 "logo_parser.mly"
        string
# 16 "logo_parser.mli"
)
  | AVANCE
  | RECULE
  | GAUCHE
  | DROITE
  | EFFACE
  | DESSINE
  | DEPLACE
  | DEF
  | REPETE
  | LBRACKET
  | RBRACKET
  | LPAREN
  | RPAREN
  | PLUS
  | MINUS
  | TIMES
  | DIV
  | SEMICOLON
  | DOT

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Logo_ast.t_instr
