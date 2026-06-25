/*-------------------------------------------------*/
/* Analyseur syntaxique                            */
/* Exo02 - Q2 : ajout de Repete                   */
/*   logo_parser_exo02-2.mly                       */
/*-------------------------------------------------*/

%{ open Logo_ast %}

%token <int>    INT
%token <string> IDENT VAR
%token AVANCE RECULE GAUCHE DROITE EFFACE DESSINE DEPLACE DEF
%token REPETE
%token LBRACKET RBRACKET
%token SEMICOLON DOT

%start main
%type <Logo_ast.t_instr> main

%%

main:
  | instr DOT   { $1 }

instr:
  | DEF IDENT expr                    { Define ($2, $3)       }
  | DEF IDENT expr SEMICOLON instr    { Seq (Define ($2, $3), $5) }
  | cmd                               { Cmd $1                }
  | cmd SEMICOLON instr               { Seq (Cmd $1, $3)      }

  /*-------------------------------------------------*/
  /* Règle pour Repete N [ corps ]                   */
  /* $2 = l'entier N (nombre de répétitions)         */
  /* $4 = l'instruction corps entre crochets         */
  /*-------------------------------------------------*/
  | REPETE INT LBRACKET instr RBRACKET
      { Repete ($2, $4) }
  | REPETE INT LBRACKET instr RBRACKET SEMICOLON instr
      { Seq (Repete ($2, $4), $7) }

cmd:
  | AVANCE  expr  { Forward  $2 }
  | RECULE  expr  { Backward $2 }
  | GAUCHE  expr  { Left     $2 }
  | DROITE  expr  { Right    $2 }
  | EFFACE        { Clear       }
  | DESSINE       { PenDown     }
  | DEPLACE       { PenUp       }

expr:
  | INT   { Cst $1 }
  | VAR   { Var $1 }
