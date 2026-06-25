/*-------------------------------------------------*/
/* Analyseur syntaxique                            */
/* Exo02 - Q3 : ajout de l'arithmétique           */
/*   logo_parser_exo02-3.mly                       */
/*-------------------------------------------------*/

%{ open Logo_ast %}

%token <int>    INT
%token <string> IDENT VAR
%token AVANCE RECULE GAUCHE DROITE EFFACE DESSINE DEPLACE DEF
%token REPETE
%token LBRACKET RBRACKET
%token LPAREN RPAREN
%token PLUS MINUS TIMES DIV
%token SEMICOLON DOT

%start main
%type <Logo_ast.t_instr> main

%%

main:
  | instr DOT   { $1 }

instr:
  | DEF IDENT expr                      { Define ($2, $3)          }
  | DEF IDENT expr SEMICOLON instr      { Seq (Define ($2, $3), $5) }
  | cmd                                 { Cmd $1                   }
  | cmd SEMICOLON instr                 { Seq (Cmd $1, $3)         }
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

/*-------------------------------------------------*/
/* Règles des expressions                          */
/*                                                 */
/* Syntaxe Logo : toute opération est entourée     */
/* de parenthèses pour éviter toute ambiguïté      */
/* sur la priorité des opérateurs.                 */
/*                                                 */
/*   INT           -> Cst n                        */
/*   VAR           -> Var "x"                      */
/*   ( e1 + e2 )   -> Add (e1, e2)                 */
/*   ( e1 - e2 )   -> Sub (e1, e2)                 */
/*   ( e1 * e2 )   -> Mul (e1, e2)                 */
/*   ( e1 / e2 )   -> Div (e1, e2)                 */
/*-------------------------------------------------*/
expr:
  | INT                              { Cst $1            }
  | VAR                              { Var $1            }
  | LPAREN expr PLUS  expr RPAREN    { Add ($2, $4)      }
  | LPAREN expr MINUS expr RPAREN    { Sub ($2, $4)      }
  | LPAREN expr TIMES expr RPAREN    { Mul ($2, $4)      }
  | LPAREN expr DIV   expr RPAREN    { Div ($2, $4)      }
