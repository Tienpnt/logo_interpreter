type token =
  | INT of (
# 19 "logo_parser_exo01_3.mly"
        int
# 6 "logo_parser_exo01_3.ml"
)
  | IDENT of (
# 20 "logo_parser_exo01_3.mly"
        string
# 11 "logo_parser_exo01_3.ml"
)
  | VAR of (
# 21 "logo_parser_exo01_3.mly"
        string
# 16 "logo_parser_exo01_3.ml"
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

open Parsing
let _ = parse_error;;
# 9 "logo_parser_exo01_3.mly"
  (* En-tête OCaml : rien de spécial pour cette version *)
# 33 "logo_parser_exo01_3.ml"
let yytransl_const = [|
  260 (* AVANCE *);
  261 (* RECULE *);
  262 (* GAUCHE *);
  263 (* DROITE *);
  264 (* EFFACE *);
  265 (* DESSINE *);
  266 (* DEPLACE *);
  267 (* DEF *);
  268 (* SEMICOLON *);
  269 (* DOT *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* IDENT *);
  259 (* VAR *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\004\000\004\000\004\000\
\004\000\004\000\004\000\004\000\003\000\003\000\000\000"

let yylen = "\002\000\
\002\000\003\000\005\000\001\000\003\000\002\000\002\000\002\000\
\002\000\001\000\001\000\001\000\001\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\010\000\011\000\
\012\000\000\000\015\000\000\000\000\000\013\000\014\000\006\000\
\007\000\008\000\009\000\000\000\001\000\000\000\000\000\005\000\
\000\000\003\000"

let yydgoto = "\002\000\
\011\000\012\000\016\000\013\000"

let yysindex = "\011\000\
\255\254\000\000\012\255\012\255\012\255\012\255\000\000\000\000\
\000\000\015\255\000\000\005\255\007\255\000\000\000\000\000\000\
\000\000\000\000\000\000\012\255\000\000\255\254\008\255\000\000\
\255\254\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\009\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\010\255\000\000\
\000\000\000\000"

let yygindex = "\000\000\
\000\000\245\255\252\255\000\000"

let yytablesize = 23
let yytable = "\017\000\
\018\000\019\000\003\000\004\000\005\000\006\000\007\000\008\000\
\009\000\010\000\024\000\001\000\014\000\026\000\015\000\023\000\
\020\000\021\000\022\000\025\000\000\000\004\000\002\000"

let yycheck = "\004\000\
\005\000\006\000\004\001\005\001\006\001\007\001\008\001\009\001\
\010\001\011\001\022\000\001\000\001\001\025\000\003\001\020\000\
\002\001\013\001\012\001\012\001\255\255\013\001\013\001"

let yynames_const = "\
  AVANCE\000\
  RECULE\000\
  GAUCHE\000\
  DROITE\000\
  EFFACE\000\
  DESSINE\000\
  DEPLACE\000\
  DEF\000\
  SEMICOLON\000\
  DOT\000\
  "

let yynames_block = "\
  INT\000\
  IDENT\000\
  VAR\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'instr) in
    Obj.repr(
# 51 "logo_parser_exo01_3.mly"
      ( print_string "Règle : main -> instr .\n" )
# 122 "logo_parser_exo01_3.ml"
               : unit))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 61 "logo_parser_exo01_3.mly"
      ( print_string "Règle : instr -> Def IDENT expr\n" )
# 130 "logo_parser_exo01_3.ml"
               : 'instr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'instr) in
    Obj.repr(
# 65 "logo_parser_exo01_3.mly"
      ( print_string "Règle : instr -> Def IDENT expr ; instr\n" )
# 139 "logo_parser_exo01_3.ml"
               : 'instr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'cmd) in
    Obj.repr(
# 69 "logo_parser_exo01_3.mly"
      ( print_string "Règle : instr -> cmd\n" )
# 146 "logo_parser_exo01_3.ml"
               : 'instr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cmd) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'instr) in
    Obj.repr(
# 73 "logo_parser_exo01_3.mly"
      ( print_string "Règle : instr -> cmd ; instr\n" )
# 154 "logo_parser_exo01_3.ml"
               : 'instr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 80 "logo_parser_exo01_3.mly"
                   ( print_string "Règle : cmd -> Avance expr\n"  )
# 161 "logo_parser_exo01_3.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 81 "logo_parser_exo01_3.mly"
                   ( print_string "Règle : cmd -> Recule expr\n"  )
# 168 "logo_parser_exo01_3.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 82 "logo_parser_exo01_3.mly"
                   ( print_string "Règle : cmd -> Gauche expr\n"  )
# 175 "logo_parser_exo01_3.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 83 "logo_parser_exo01_3.mly"
                   ( print_string "Règle : cmd -> Droite expr\n"  )
# 182 "logo_parser_exo01_3.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    Obj.repr(
# 84 "logo_parser_exo01_3.mly"
                   ( print_string "Règle : cmd -> Efface\n"       )
# 188 "logo_parser_exo01_3.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    Obj.repr(
# 85 "logo_parser_exo01_3.mly"
                   ( print_string "Règle : cmd -> Dessine\n"      )
# 194 "logo_parser_exo01_3.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    Obj.repr(
# 86 "logo_parser_exo01_3.mly"
                   ( print_string "Règle : cmd -> Deplace\n"      )
# 200 "logo_parser_exo01_3.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 94 "logo_parser_exo01_3.mly"
          ( print_string ("Règle : expr -> INT(" ^ string_of_int _1 ^ ")\n") )
# 207 "logo_parser_exo01_3.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 95 "logo_parser_exo01_3.mly"
          ( print_string ("Règle : expr -> VAR(" ^ _1 ^ ")\n") )
# 214 "logo_parser_exo01_3.ml"
               : 'expr))
(* Entry main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : unit)
