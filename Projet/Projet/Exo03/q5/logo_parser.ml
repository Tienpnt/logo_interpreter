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
  | SI
  | ALORS
  | SINON
  | FINSI
  | LBRACKET
  | RBRACKET
  | LPAREN
  | RPAREN
  | PLUS
  | MINUS
  | TIMES
  | DIV
  | EQ
  | GT
  | LT
  | SEMICOLON
  | DOT

open Parsing
let _ = parse_error;;
# 7 "logo_parser.mly"
 open Logo_ast 
# 49 "logo_parser.ml"
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
  269 (* SI *);
  270 (* ALORS *);
  271 (* SINON *);
  272 (* FINSI *);
  273 (* LBRACKET *);
  274 (* RBRACKET *);
  275 (* LPAREN *);
  276 (* RPAREN *);
  277 (* PLUS *);
  278 (* MINUS *);
  279 (* TIMES *);
  280 (* DIV *);
  281 (* EQ *);
  282 (* GT *);
  283 (* LT *);
  284 (* SEMICOLON *);
  285 (* DOT *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* IDENT *);
  259 (* VAR *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
\003\000\003\000\003\000\003\000\003\000\003\000\005\000\005\000\
\005\000\000\000"

let yylen = "\002\000\
\002\000\003\000\005\000\001\000\003\000\005\000\007\000\011\000\
\013\000\002\000\002\000\002\000\002\000\001\000\001\000\001\000\
\001\000\001\000\005\000\005\000\005\000\005\000\001\000\001\000\
\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\014\000\015\000\
\016\000\000\000\000\000\000\000\026\000\000\000\000\000\017\000\
\018\000\000\000\010\000\011\000\012\000\013\000\000\000\000\000\
\000\000\001\000\000\000\000\000\000\000\000\000\000\000\005\000\
\000\000\000\000\000\000\000\000\000\000\000\000\023\000\024\000\
\025\000\000\000\000\000\000\000\000\000\000\000\003\000\000\000\
\000\000\019\000\020\000\021\000\022\000\000\000\000\000\007\000\
\000\000\000\000\000\000\000\000\000\000\000\000\009\000"

let yydgoto = "\002\000\
\013\000\014\000\019\000\015\000\042\000"

let yysindex = "\002\000\
\059\255\000\000\003\255\003\255\003\255\003\255\000\000\000\000\
\000\000\006\255\003\255\242\254\000\000\236\254\239\254\000\000\
\000\000\003\255\000\000\000\000\000\000\000\000\003\255\251\254\
\003\255\000\000\059\255\250\254\252\254\059\255\027\255\000\000\
\003\255\003\255\003\255\003\255\059\255\005\255\000\000\000\000\
\000\000\003\255\007\255\015\255\021\255\030\255\000\000\031\255\
\035\255\000\000\000\000\000\000\000\000\059\255\042\255\000\000\
\059\255\043\255\059\255\044\255\045\255\059\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\010\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\018\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\028\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\033\255\000\000\000\000"

let yygindex = "\000\000\
\000\000\239\255\252\255\000\000\000\000"

let yytablesize = 73
let yytable = "\020\000\
\021\000\022\000\001\000\016\000\025\000\017\000\024\000\023\000\
\026\000\032\000\027\000\030\000\038\000\028\000\033\000\034\000\
\035\000\036\000\029\000\047\000\031\000\018\000\048\000\037\000\
\004\000\004\000\050\000\004\000\043\000\044\000\045\000\046\000\
\002\000\002\000\051\000\002\000\056\000\049\000\004\000\058\000\
\052\000\060\000\006\000\006\000\063\000\006\000\002\000\008\000\
\008\000\053\000\008\000\039\000\040\000\041\000\055\000\057\000\
\006\000\059\000\054\000\061\000\000\000\008\000\003\000\004\000\
\005\000\006\000\007\000\008\000\009\000\010\000\011\000\012\000\
\062\000"

let yycheck = "\004\000\
\005\000\006\000\001\000\001\001\019\001\003\001\011\000\002\001\
\029\001\027\000\028\001\017\001\030\000\018\000\021\001\022\001\
\023\001\024\001\023\000\037\000\025\000\019\001\018\001\028\001\
\015\001\016\001\020\001\018\001\033\000\034\000\035\000\036\000\
\015\001\016\001\020\001\018\001\054\000\042\000\029\001\057\000\
\020\001\059\000\015\001\016\001\062\000\018\001\029\001\015\001\
\016\001\020\001\018\001\025\001\026\001\027\001\020\001\014\001\
\029\001\015\001\028\001\016\001\255\255\029\001\004\001\005\001\
\006\001\007\001\008\001\009\001\010\001\011\001\012\001\013\001\
\028\001"

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
  SI\000\
  ALORS\000\
  SINON\000\
  FINSI\000\
  LBRACKET\000\
  RBRACKET\000\
  LPAREN\000\
  RPAREN\000\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIV\000\
  EQ\000\
  GT\000\
  LT\000\
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
# 26 "logo_parser.mly"
                ( _1 )
# 200 "logo_parser.ml"
               : Logo_ast.t_instr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 29 "logo_parser.mly"
                                            ( Define (_2, _3)           )
# 208 "logo_parser.ml"
               : 'instr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'instr) in
    Obj.repr(
# 30 "logo_parser.mly"
                                            ( Seq (Define (_2, _3), _5) )
# 217 "logo_parser.ml"
               : 'instr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'cmd) in
    Obj.repr(
# 31 "logo_parser.mly"
                                            ( Cmd _1                    )
# 224 "logo_parser.ml"
               : 'instr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cmd) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'instr) in
    Obj.repr(
# 32 "logo_parser.mly"
                                            ( Seq (Cmd _1, _3)          )
# 232 "logo_parser.ml"
               : 'instr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'instr) in
    Obj.repr(
# 34 "logo_parser.mly"
      ( Repete (_2, _4) )
# 240 "logo_parser.ml"
               : 'instr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : 'instr) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'instr) in
    Obj.repr(
# 36 "logo_parser.mly"
      ( Seq (Repete (_2, _4), _7) )
# 249 "logo_parser.ml"
               : 'instr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 8 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 7 : 'opcmp) in
    let _5 = (Parsing.peek_val __caml_parser_env 6 : 'expr) in
    let _8 = (Parsing.peek_val __caml_parser_env 3 : 'instr) in
    let _10 = (Parsing.peek_val __caml_parser_env 1 : 'instr) in
    Obj.repr(
# 49 "logo_parser.mly"
      ( If (Cmp (_3, _4, _5), _8, _10) )
# 260 "logo_parser.ml"
               : 'instr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 10 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 9 : 'opcmp) in
    let _5 = (Parsing.peek_val __caml_parser_env 8 : 'expr) in
    let _8 = (Parsing.peek_val __caml_parser_env 5 : 'instr) in
    let _10 = (Parsing.peek_val __caml_parser_env 3 : 'instr) in
    let _13 = (Parsing.peek_val __caml_parser_env 0 : 'instr) in
    Obj.repr(
# 51 "logo_parser.mly"
      ( Seq (If (Cmp (_3, _4, _5), _8, _10), _13) )
# 272 "logo_parser.ml"
               : 'instr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 54 "logo_parser.mly"
                  ( Forward  _2 )
# 279 "logo_parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 55 "logo_parser.mly"
                  ( Backward _2 )
# 286 "logo_parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 56 "logo_parser.mly"
                  ( Left     _2 )
# 293 "logo_parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 57 "logo_parser.mly"
                  ( Right    _2 )
# 300 "logo_parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    Obj.repr(
# 58 "logo_parser.mly"
                  ( Clear       )
# 306 "logo_parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    Obj.repr(
# 59 "logo_parser.mly"
                  ( PenDown     )
# 312 "logo_parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    Obj.repr(
# 60 "logo_parser.mly"
                  ( PenUp       )
# 318 "logo_parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 63 "logo_parser.mly"
                                     ( Cst _1       )
# 325 "logo_parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 64 "logo_parser.mly"
                                     ( Var _1       )
# 332 "logo_parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 65 "logo_parser.mly"
                                     ( Add (_2, _4) )
# 340 "logo_parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 66 "logo_parser.mly"
                                     ( Sub (_2, _4) )
# 348 "logo_parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 67 "logo_parser.mly"
                                     ( Mul (_2, _4) )
# 356 "logo_parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 68 "logo_parser.mly"
                                     ( Div (_2, _4) )
# 364 "logo_parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 74 "logo_parser.mly"
        ( Eq )
# 370 "logo_parser.ml"
               : 'opcmp))
; (fun __caml_parser_env ->
    Obj.repr(
# 75 "logo_parser.mly"
        ( Gt )
# 376 "logo_parser.ml"
               : 'opcmp))
; (fun __caml_parser_env ->
    Obj.repr(
# 76 "logo_parser.mly"
        ( Lt )
# 382 "logo_parser.ml"
               : 'opcmp))
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
