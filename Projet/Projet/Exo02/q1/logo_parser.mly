/*-------------------------------------------------*/
/* Analyseur syntaxique version 2                  */
/* Construit l'arbre de syntaxe abstraite (AST)    */
/*   Exo01 - Q3 - logo_parser.mly                  */
/*-------------------------------------------------*/

%{
  open Logo_ast
%}

/*-------------------------------------------------*/
/* Déclaration des tokens                          */
/*-------------------------------------------------*/

/* Tokens avec valeur associée */
%token <int>    INT
%token <string> IDENT
%token <string> VAR

/* Mots-clés des commandes de la tortue */
%token AVANCE RECULE GAUCHE DROITE EFFACE DESSINE DEPLACE

/* Mot-clé de définition */
%token DEF

/* Ponctuation */
%token SEMICOLON   /* ; */
%token DOT         /* . */

/*-------------------------------------------------*/
/* Symbole de départ et type de retour             */
/* main retourne un t_instr (le programme entier)  */
/*-------------------------------------------------*/
%start main
%type <Logo_ast.t_instr> main

%%

/*=================================================*/
/* Règles de grammaire avec construction de l'AST */
/*=================================================*/

/*-------------------------------------------------*/
/* main : une phrase complète                      */
/* Retourne l'instruction correspondant au         */
/* programme entier                                */
/*-------------------------------------------------*/
main :
  | instr DOT   { $1 }
;

/*-------------------------------------------------*/
/* instr : une instruction ou une séquence         */
/* $1, $2, $3... désignent les éléments de la règle*/
/*-------------------------------------------------*/
instr :

  /* Def x expr  →  Define("x", expr) */
  | DEF IDENT expr
      { Define ($2, $3) }

  /* Def x expr ; instr  →  Seq(Define(...), instr) */
  | DEF IDENT expr SEMICOLON instr
      { Seq (Define ($2, $3), $5) }

  /* cmd seule  →  Cmd(cmd) */
  | cmd
      { Cmd $1 }

  /* cmd ; instr  →  Seq(Cmd(...), instr) */
  | cmd SEMICOLON instr
      { Seq (Cmd $1, $3) }
;

/*-------------------------------------------------*/
/* cmd : une commande de la tortue                 */
/* Retourne une valeur de type t_cmd               */
/*-------------------------------------------------*/
cmd :
  | AVANCE  expr   { Forward  $2 }
  | RECULE  expr   { Backward $2 }
  | GAUCHE  expr   { Left     $2 }
  | DROITE  expr   { Right    $2 }
  | EFFACE         { Clear       }   /* efface l'écran et réinitialise */
  | DESSINE        { PenDown     }   /* laisse une trace               */
  | DEPLACE        { PenUp       }   /* se déplace sans laisser trace  */
;

/*-------------------------------------------------*/
/* expr : une expression simple                    */
/* INT  →  Cst(n)                                  */
/* VAR  →  Var("nom")                              */
/*-------------------------------------------------*/
expr :
  | INT   { Cst $1 }
  | VAR   { Var $1 }
;
