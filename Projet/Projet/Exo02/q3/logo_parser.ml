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
  | LPAREN
  | RPAREN
  | PLUS
  | MINUS
  | TIMES
  | DIV
  | SEMICOLON
  | DOT

open Parsing
let _ = parse_error;;
# 7 "logo_parser.mly"
 open Logo_ast 
# 42 "logo_parser.ml"
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
  271 (* LPAREN *);
  272 (* RPAREN *);
  273 (* PLUS *);
  274 (* MINUS *);
  275 (* TIMES *);
  276 (* DIV *);
  277 (* SEMICOLON *);
  278 (* DOT *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* IDENT *);
  259 (* VAR *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\002\000\002\000\004\000\
\004\000\004\000\004\000\004\000\004\000\004\000\003\000\003\000\
\003\000\003\000\003\000\003\000\000\000"

let yylen = "\002\000\
\002\000\003\000\005\000\001\000\003\000\005\000\007\000\002\000\
\002\000\002\000\002\000\001\000\001\000\001\000\001\000\001\000\
\005\000\005\000\005\000\005\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\012\000\013\000\
\014\000\000\000\000\000\021\000\000\000\000\000\015\000\016\000\
\000\000\008\000\009\000\010\000\011\000\000\000\000\000\001\000\
\000\000\000\000\000\000\000\000\005\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\003\000\
\000\000\017\000\018\000\019\000\020\000\000\000\007\000"

let yydgoto = "\002\000\
\012\000\013\000\018\000\014\000"

let yysindex = "\003\000\
\026\255\000\000\004\255\004\255\004\255\004\255\000\000\000\000\
\000\000\008\255\010\255\000\000\249\254\255\254\000\000\000\000\
\004\255\000\000\000\000\000\000\000\000\004\255\012\255\000\000\
\026\255\022\255\002\255\026\255\000\000\004\255\004\255\004\255\
\004\255\026\255\007\255\027\255\028\255\029\255\030\255\000\000\
\031\255\000\000\000\000\000\000\000\000\026\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\250\254\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\251\254\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\255\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\234\255\252\255\000\000"

let yytablesize = 52
let yytable = "\019\000\
\020\000\021\000\029\000\001\000\015\000\035\000\016\000\004\000\
\002\000\022\000\023\000\040\000\026\000\006\000\024\000\004\000\
\002\000\027\000\017\000\025\000\041\000\006\000\034\000\047\000\
\028\000\036\000\037\000\038\000\039\000\003\000\004\000\005\000\
\006\000\007\000\008\000\009\000\010\000\011\000\030\000\031\000\
\032\000\033\000\042\000\043\000\044\000\045\000\000\000\000\000\
\000\000\000\000\000\000\046\000"

let yycheck = "\004\000\
\005\000\006\000\025\000\001\000\001\001\028\000\003\001\014\001\
\014\001\002\001\001\001\034\000\017\000\014\001\022\001\022\001\
\022\001\022\000\015\001\021\001\014\001\022\001\021\001\046\000\
\013\001\030\000\031\000\032\000\033\000\004\001\005\001\006\001\
\007\001\008\001\009\001\010\001\011\001\012\001\017\001\018\001\
\019\001\020\001\016\001\016\001\016\001\016\001\255\255\255\255\
\255\255\255\255\255\255\021\001"

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
  LPAREN\000\
  RPAREN\000\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIV\000\
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
# 24 "logo_parser.mly"
                ( _1 )
# 165 "logo_parser.ml"
               : Logo_ast.t_instr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 27 "logo_parser.mly"
                                        ( Define (_2, _3)          )
# 173 "logo_parser.ml"
               : 'instr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'instr) in
    Obj.repr(
# 28 "logo_parser.mly"
                                        ( Seq (Define (_2, _3), _5) )
# 182 "logo_parser.ml"
               : 'instr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'cmd) in
    Obj.repr(
# 29 "logo_parser.mly"
                                        ( Cmd _1                   )
# 189 "logo_parser.ml"
               : 'instr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cmd) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'instr) in
    Obj.repr(
# 30 "logo_parser.mly"
                                        ( Seq (Cmd _1, _3)         )
# 197 "logo_parser.ml"
               : 'instr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : int) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'instr) in
    Obj.repr(
# 32 "logo_parser.mly"
      ( Repete (_2, _4) )
# 205 "logo_parser.ml"
               : 'instr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : int) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : 'instr) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'instr) in
    Obj.repr(
# 34 "logo_parser.mly"
      ( Seq (Repete (_2, _4), _7) )
# 214 "logo_parser.ml"
               : 'instr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 37 "logo_parser.mly"
                  ( Forward  _2 )
# 221 "logo_parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 38 "logo_parser.mly"
                  ( Backward _2 )
# 228 "logo_parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 39 "logo_parser.mly"
                  ( Left     _2 )
# 235 "logo_parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 40 "logo_parser.mly"
                  ( Right    _2 )
# 242 "logo_parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    Obj.repr(
# 41 "logo_parser.mly"
                  ( Clear       )
# 248 "logo_parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    Obj.repr(
# 42 "logo_parser.mly"
                  ( PenDown     )
# 254 "logo_parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    Obj.repr(
# 43 "logo_parser.mly"
                  ( PenUp       )
# 260 "logo_parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 60 "logo_parser.mly"
                                     ( Cst _1            )
# 267 "logo_parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 61 "logo_parser.mly"
                                     ( Var _1            )
# 274 "logo_parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 62 "logo_parser.mly"
                                     ( Add (_2, _4)      )
# 282 "logo_parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 63 "logo_parser.mly"
                                     ( Sub (_2, _4)      )
# 290 "logo_parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 64 "logo_parser.mly"
                                     ( Mul (_2, _4)      )
# 298 "logo_parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 65 "logo_parser.mly"
                                     ( Div (_2, _4)      )
# 306 "logo_parser.ml"
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
