type token =
  | INT of (
# 9 "logo_parser.mly"
        int
# 6 "logo_parser.ml"
)
  | IDENT of (
# 10 "logo_parser.mly"
        string
# 11 "logo_parser.ml"
)
  | VAR of (
# 10 "logo_parser.mly"
        string
# 16 "logo_parser.ml"
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
  | SEMICOLON
  | DOT

open Parsing
let _ = parse_error;;
# 7 "logo_parser.mly"
 open Logo_ast 
# 36 "logo_parser.ml"
let yytransl_const = [|
  260 (* AVANCE *);
  261 (* RECULE *);
  262 (* GAUCHE *);
  263 (* DROITE *);
  264 (* EFFACE *);
  265 (* DESSINE *);
  266 (* DEPLACE *);
  267 (* DEF *);
  268 (* REPETE *);
  269 (* LBRACKET *);
  270 (* RBRACKET *);
  271 (* SEMICOLON *);
  272 (* DOT *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* IDENT *);
  259 (* VAR *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\002\000\002\000\004\000\
\004\000\004\000\004\000\004\000\004\000\004\000\003\000\003\000\
\000\000"

let yylen = "\002\000\
\002\000\003\000\005\000\001\000\003\000\005\000\007\000\002\000\
\002\000\002\000\002\000\001\000\001\000\001\000\001\000\001\000\
\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\012\000\013\000\
\014\000\000\000\000\000\017\000\000\000\000\000\015\000\016\000\
\008\000\009\000\010\000\011\000\000\000\000\000\001\000\000\000\
\000\000\000\000\005\000\000\000\000\000\003\000\000\000\000\000\
\007\000"

let yydgoto = "\002\000\
\012\000\013\000\017\000\014\000"

let yysindex = "\017\000\
\255\254\000\000\012\255\012\255\012\255\012\255\000\000\000\000\
\000\000\024\255\026\255\000\000\013\255\015\255\000\000\000\000\
\000\000\000\000\000\000\000\000\012\255\018\255\000\000\255\254\
\017\255\255\254\000\000\255\254\014\255\000\000\019\255\255\254\
\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\005\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\008\255\000\000\000\000\000\000\000\000\000\000\009\255\000\000\
\000\000"

let yygindex = "\000\000\
\000\000\244\255\252\255\000\000"

let yytablesize = 34
let yytable = "\018\000\
\019\000\020\000\003\000\004\000\005\000\006\000\007\000\008\000\
\009\000\010\000\011\000\027\000\015\000\029\000\016\000\030\000\
\025\000\001\000\004\000\033\000\004\000\002\000\006\000\002\000\
\006\000\021\000\022\000\031\000\023\000\024\000\026\000\028\000\
\000\000\032\000"

let yycheck = "\004\000\
\005\000\006\000\004\001\005\001\006\001\007\001\008\001\009\001\
\010\001\011\001\012\001\024\000\001\001\026\000\003\001\028\000\
\021\000\001\000\014\001\032\000\016\001\014\001\014\001\016\001\
\016\001\002\001\001\001\014\001\016\001\015\001\013\001\015\001\
\255\255\015\001"

let yynames_const = "\
  AVANCE\000\
  RECULE\000\
  GAUCHE\000\
  DROITE\000\
  EFFACE\000\
  DESSINE\000\
  DEPLACE\000\
  DEF\000\
  REPETE\000\
  LBRACKET\000\
  RBRACKET\000\
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
# 22 "logo_parser.mly"
                ( _1 )
# 140 "logo_parser.ml"
               : Logo_ast.t_instr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 25 "logo_parser.mly"
                                      ( Define (_2, _3)       )
# 148 "logo_parser.ml"
               : 'instr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'instr) in
    Obj.repr(
# 26 "logo_parser.mly"
                                      ( Seq (Define (_2, _3), _5) )
# 157 "logo_parser.ml"
               : 'instr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'cmd) in
    Obj.repr(
# 27 "logo_parser.mly"
                                      ( Cmd _1                )
# 164 "logo_parser.ml"
               : 'instr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cmd) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'instr) in
    Obj.repr(
# 28 "logo_parser.mly"
                                      ( Seq (Cmd _1, _3)      )
# 172 "logo_parser.ml"
               : 'instr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : int) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'instr) in
    Obj.repr(
# 36 "logo_parser.mly"
      ( Repete (_2, _4) )
# 180 "logo_parser.ml"
               : 'instr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : int) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : 'instr) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'instr) in
    Obj.repr(
# 38 "logo_parser.mly"
      ( Seq (Repete (_2, _4), _7) )
# 189 "logo_parser.ml"
               : 'instr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 41 "logo_parser.mly"
                  ( Forward  _2 )
# 196 "logo_parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 42 "logo_parser.mly"
                  ( Backward _2 )
# 203 "logo_parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 43 "logo_parser.mly"
                  ( Left     _2 )
# 210 "logo_parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 44 "logo_parser.mly"
                  ( Right    _2 )
# 217 "logo_parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    Obj.repr(
# 45 "logo_parser.mly"
                  ( Clear       )
# 223 "logo_parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    Obj.repr(
# 46 "logo_parser.mly"
                  ( PenDown     )
# 229 "logo_parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    Obj.repr(
# 47 "logo_parser.mly"
                  ( PenUp       )
# 235 "logo_parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 50 "logo_parser.mly"
          ( Cst _1 )
# 242 "logo_parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 51 "logo_parser.mly"
          ( Var _1 )
# 249 "logo_parser.ml"
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
   (Parsing.yyparse yytables 1 lexfun lexbuf : Logo_ast.t_instr)
