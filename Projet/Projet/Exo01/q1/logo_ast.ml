(***************************************)
(*                                     *)
(*  Syntaxe abstraite pour un langage  *)
(*  "à la Logo"                        *)
(*                                     *)
(***************************************)

open Env
;;

open Turtle

(* Decommenter si tortue graphique *)
(*
open Turtle_graphic
;;
*)

(*--------------------------------------------*)
(* type pour représenter l'état de la mémoire *)
(* La mémoire est l'ensemble des liaisons     *)
(* (variable, valeur) et une tartue           *)
(*--------------------------------------------*)
type t_state =
  Env.t_env * Turtle.t_turtle
;;

(*---------------------------------------------*)
(* types pour représenter la syntaxe abstraite *)
(* du langage                                  *)
(*---------------------------------------------*)

(*--------------------------------------------------------------*)
(* Le type pour la syntaxe abstraite des expressions            *)
(* Pour le moment, il n'y a que les constantes et les variables *)
(*--------------------------------------------------------------*)
type t_expr =
  | Cst of int
  | Var of t_ident
;;

(*--------------------------------------------------------------*)
(* Le type pour la syntaxe abstraite des commandes de la tortue *)
(*--------------------------------------------------------------*)
type t_cmd =
  | Forward of t_expr
  | Backward of t_expr
  | Right of t_expr
  | Left of t_expr
  | PenUp
  | PenDown
  | Clear
;;

(*-------------------------------------------------------------------*)
(* Le type pour la syntaxe abstraite des instructions du langage     *)
(* Pour le moment, il y a la définition de la valeur d'une variable, *)
(* une commande pour la tartue et une suite d'instructions           *)
(*-------------------------------------------------------------------*)
type t_instr =
  | Define of t_ident * t_expr
  | Cmd of t_cmd
  | Seq of t_instr * t_instr
;;

(*------------------------------------------------------------------------*)
(* Fonctions d'interprétation                                             *)
(*------------------------------------------------------------------------*)

(*------------------------------------------------*)
(* Interprétation d'une expression                *)
(*   @param env : environnement qui contient les  *)
(*                valeurs des variables           *)
(*   @param e   : l'expression à interpéter       *)
(*                                                *)
(*   @return    : valeur de l'expression          *)
(*------------------------------------------------*)
(* écrivez ici votre fonction d'interprétation d'une expression *)

let rec interp_expr (env : t_env) (e : t_expr) : int =
  match e with
  | Cst n      -> n
  | Var ident  -> Env.value_of ident env

;;

(*-----------------------------------------------------*)
(* Interprétation d'une commande                       *)
(*   @param c   : la commande à interpéter             *)
(*   @param s   : un état composé d'un environnement   *) 
(*                et de la tortue courante             *)
(*                                                     *)
(*   @return    : la nouvelle tortue après l'exécution *)
(*                de la commande                       *)
(*-----------------------------------------------------*)

(* écrivez ici votre fonction d'interprétation d'une commande *)
let interp_cmd (c : t_cmd) (s : t_state) : t_turtle =
let (env, t) = s in
  match c with
  | Forward e  -> Turtle.move_fwd t (interp_expr env e)
  | Backward e -> Turtle.move_bck t (interp_expr env e)
  | Right e    -> Turtle.turn_right t (interp_expr env e)
  | Left e     -> Turtle.turn_left t (interp_expr env e)
  | PenDown    -> Turtle.draw t
  | PenUp      -> Turtle.nodraw t
  | Clear      -> Turtle.reset ()

;;


(*-----------------------------------------------------*)
(* Interprétation d'une instruction                    *)
(*   @param c   : l'instruction à interpéter           *)
(*   @param s   : un état composé d'un environnement   *) 
(*                et de la tortue courante             *)
(*                                                     *)
(*   @return    : le nouvel état après l'exécution     *)
(*                de l'instruction                     *)
(*-----------------------------------------------------*)
(* écrivez ici votre fonction d'interprétation d'une instruction *)

let rec interp_instr (i : t_instr) (s : t_state) : t_state =
  let (env, t) = s in
  match i with
  | Define (ident, e) ->
      let v = interp_expr env e in
      (Env.add_binding env ident v, t)
  | Cmd c ->
      (env, interp_cmd c s)
  | Seq (i1, i2) ->
      let s' = interp_instr i1 s in
      interp_instr i2 s'

;;
 
