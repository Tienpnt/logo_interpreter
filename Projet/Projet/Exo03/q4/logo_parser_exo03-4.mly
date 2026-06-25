/*-------------------------------------------------*/
/* Analyseur syntaxique                            */
/* Exo03 - Q4 : ajout de la conditionnelle        */
/*   logo_parser_exo03-4.mly                       */
/*-------------------------------------------------*/

%{ open Logo_ast %}

%token <int>    INT
%token <string> IDENT VAR
%token AVANCE RECULE GAUCHE DROITE EFFACE DESSINE DEPLACE DEF
%token REPETE
%token SI ALORS SINON FINSI
%token LBRACKET RBRACKET
%token LPAREN RPAREN
%token PLUS MINUS TIMES DIV
%token EQ GT LT
%token SEMICOLON DOT

%start main
%type <Logo_ast.t_instr> main

%%

main:
  | instr DOT   { $1 }

instr:
  | DEF IDENT expr                          { Define ($2, $3)           }
  | DEF IDENT expr SEMICOLON instr          { Seq (Define ($2, $3), $5) }
  | cmd                                     { Cmd $1                    }
  | cmd SEMICOLON instr                     { Seq (Cmd $1, $3)          }
  | REPETE expr LBRACKET instr RBRACKET
      { Repete ($2, $4) }
  | REPETE expr LBRACKET instr RBRACKET SEMICOLON instr
      { Seq (Repete ($2, $4), $7) }

  /*-------------------------------------------------*/
  /* Conditionnelle :                                */
  /*   Si ( expr opcmp expr ) Alors instr            */
  /*                          Sinon instr FinSi      */
  /* $3 = expr gauche                                */
  /* $4 = opérateur de comparaison                   */
  /* $5 = expr droite                                */
  /* $8 = instruction branche Alors                  */
  /* $10 = instruction branche Sinon                 */
  /*-------------------------------------------------*/
  | SI LPAREN expr opcmp expr RPAREN ALORS instr SINON instr FINSI
      { If (Cmp ($3, $4, $5), $8, $10) }
  | SI LPAREN expr opcmp expr RPAREN ALORS instr SINON instr FINSI SEMICOLON instr
      { Seq (If (Cmp ($3, $4, $5), $8, $10), $13) }

cmd:
  | AVANCE  expr  { Forward  $2 }
  | RECULE  expr  { Backward $2 }
  | GAUCHE  expr  { Left     $2 }
  | DROITE  expr  { Right    $2 }
  | EFFACE        { Clear       }
  | DESSINE       { PenDown     }
  | DEPLACE       { PenUp       }

expr:
  | INT                              { Cst $1       }
  | VAR                              { Var $1       }
  | LPAREN expr PLUS  expr RPAREN    { Add ($2, $4) }
  | LPAREN expr MINUS expr RPAREN    { Sub ($2, $4) }
  | LPAREN expr TIMES expr RPAREN    { Mul ($2, $4) }
  | LPAREN expr DIV   expr RPAREN    { Div ($2, $4) }

/*-------------------------------------------------*/
/* Opérateur de comparaison                        */
/*-------------------------------------------------*/
opcmp:
  | EQ  { Eq }
  | GT  { Gt }
  | LT  { Lt }
