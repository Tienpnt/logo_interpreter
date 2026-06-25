(*-----------------------------------------------------------------*)
(* Le module Repl_logo pour la gestion de la boucle d'interaction  *)
(* VERSION GRAPHIQUE                                               *)
(*-----------------------------------------------------------------*)

open Env
open Turtle

(* Version graphique : on ouvre Turtle_graphic qui fournit         *)
(* les fonctions de déplacement avec rendu visuel                  *)
open Turtle_graphic
;;

open Logo_ast
open Logo_lexer

let mem = ref (Env.init())

let turtle = ref (init())

let () =
  print_string (string_of_turtle !turtle) ;
  print_string ":> " ; flush stdout ;
  let lexbuf = Lexing.from_channel stdin in
  try
    while true do
      (try
         let pgm = Logo_parser.main Logo_lexer.read_lexeme lexbuf
         in
         print_string "Voilà j'ai analysé ! " ;
         print_newline () ;
         let (e, t) = interp_instr pgm (!mem, !turtle)
         in
         mem := e ;
         turtle := t ;
         print_string (string_of_turtle !turtle) ;
         print_string "l'environnement est : \n" ;
         print_string (string_of_env !mem) ;
         print_newline() ;
       with
       | Not_recognized ->
          print_string "Lexème non reconnu, on reprend" ;
          print_newline () ;
          Lexing.flush_input lexbuf
       | Stdlib.Parsing.Parse_error ->
          print_string "Erreur de syntaxe, on reprend" ;
          print_newline () ;
          Lexing.flush_input lexbuf
      ) ;
      print_string ":> " ; flush stdout
    done
  with
  | Quit ->
     print_string "À bientôt !" ;
     print_newline () ;
     close_turtle () ;
     exit 0
