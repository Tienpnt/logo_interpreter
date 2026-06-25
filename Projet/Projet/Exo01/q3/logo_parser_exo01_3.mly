/*-------------------------------------------------*/
/* Analyseur syntaxique version 1                  */
/* Affiche la règle utilisée pour chaque           */
/* reconnaissance                                  */
/*   Exo01 - Q3 - logo_parser_exo01-3.mly          */
/*-------------------------------------------------*/

%{
  (* En-tête OCaml : rien de spécial pour cette version *)
%}

/*-------------------------------------------------*/
/* Déclaration des tokens                          */
/* Ceux-ci doivent correspondre exactement à ce   */
/* que le lexer envoie                             */
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
/*-------------------------------------------------*/
%start main
%type <unit> main

%%

/*=================================================*/
/* Règles de grammaire                             */
/*=================================================*/

/*-------------------------------------------------*/
/* main : une phrase complète = instr terminée     */
/* par un point                                    */
/*-------------------------------------------------*/
main :
  | instr DOT
      { print_string "Règle : main -> instr .\n" }
;

/*-------------------------------------------------*/
/* instr : une instruction ou une séquence         */
/*-------------------------------------------------*/
instr :

  /* Définition d'une variable seule */
  | DEF IDENT expr
      { print_string "Règle : instr -> Def IDENT expr\n" }

  /* Définition d'une variable suivie d'autres instructions */
  | DEF IDENT expr SEMICOLON instr
      { print_string "Règle : instr -> Def IDENT expr ; instr\n" }

  /* Une commande seule */
  | cmd
      { print_string "Règle : instr -> cmd\n" }

  /* Une commande suivie d'autres instructions */
  | cmd SEMICOLON instr
      { print_string "Règle : instr -> cmd ; instr\n" }
;

/*-------------------------------------------------*/
/* cmd : une commande de la tortue                 */
/*-------------------------------------------------*/
cmd :
  | AVANCE  expr   { print_string "Règle : cmd -> Avance expr\n"  }
  | RECULE  expr   { print_string "Règle : cmd -> Recule expr\n"  }
  | GAUCHE  expr   { print_string "Règle : cmd -> Gauche expr\n"  }
  | DROITE  expr   { print_string "Règle : cmd -> Droite expr\n"  }
  | EFFACE         { print_string "Règle : cmd -> Efface\n"       }
  | DESSINE        { print_string "Règle : cmd -> Dessine\n"      }
  | DEPLACE        { print_string "Règle : cmd -> Deplace\n"      }
;

/*-------------------------------------------------*/
/* expr : une expression simple                    */
/* Soit un entier, soit la valeur d'une variable   */
/*-------------------------------------------------*/
expr :
  | INT   { print_string ("Règle : expr -> INT(" ^ string_of_int $1 ^ ")\n") }
  | VAR   { print_string ("Règle : expr -> VAR(" ^ $1 ^ ")\n") }
;
