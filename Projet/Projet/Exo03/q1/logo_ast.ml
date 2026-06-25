(***************************************)
(*                                     *)
(*  Syntaxe abstraite pour un langage  *)
(*  "à la Logo"                        *)
(*  Exo03 - Q1 : ajout des types       *)
(*    t_opcmp et t_bexpr               *)
(*                                     *)
(***************************************)
open Env
;;

open Turtle

type t_state =
  Env.t_env * Turtle.t_turtle
;;

(*-------------------------------------------------------------------*)
(* Le type des expressions                                           *)
(*                                                                   *)
(* NOUVEAU : Add, Sub, Mul, Div                                      *)
(*   Syntaxe Logo : ( expr op expr )                                 *)
(*   Exemples :                                                       *)
(*     ( :x + 10 )      --> Add (Var "x", Cst 10)                    *)
(*     ( :taille * 2 )  --> Mul (Var "taille", Cst 2)                *)
(*     ( 100 - :x )     --> Sub (Cst 100, Var "x")                   *)
(*-------------------------------------------------------------------*)
type t_expr =
  | Cst of int
  | Var of t_ident
  | Add of t_expr * t_expr    (* ( e1 + e2 ) *)
  | Sub of t_expr * t_expr    (* ( e1 - e2 ) *)
  | Mul of t_expr * t_expr    (* ( e1 * e2 ) *)
  | Div of t_expr * t_expr    (* ( e1 / e2 ) *)
;;

type t_cmd =
  | Forward  of t_expr
  | Backward of t_expr
  | Right    of t_expr
  | Left     of t_expr
  | PenUp
  | PenDown
  | Clear
;;

(*-------------------------------------------------------------------*)
(* Le type pour les opérateurs de comparaison                        *)
(*   Eq : égalité        =                                           *)
(*   Gt : plus grand que >                                           *)
(*   Lt : plus petit que <                                           *)
(*-------------------------------------------------------------------*)
type t_opcmp =
  | Eq   (* = *)
  | Gt   (* > *)
  | Lt   (* < *)
;;

(*-------------------------------------------------------------------*)
(* Le type pour la syntaxe abstraite d'une comparaison              *)
(*   On prend modèle sur t_expr :                                    *)
(*   Une comparaison = deux expressions + un opérateur              *)
(*   Exemple : Cmp (Var "a", Gt, Var "b")                            *)
(*             représente  :a > :b                                   *)
(*-------------------------------------------------------------------*)
type t_bexpr =
  | Cmp of t_expr * t_opcmp * t_expr
;;

type t_instr =
  | Define of t_ident * t_expr
  | Cmd    of t_cmd
  | Seq    of t_instr * t_instr
  | Repete of int * t_instr
;;


(*------------------------------------------------------------------------*)
(* Fonctions d'interprétation                                             *)
(*------------------------------------------------------------------------*)

(*-----------------------------------------------------*)
(* interp_expr : évalue une expression                 *)
(*                                                     *)
(* CAS NOUVEAUX :                                      *)
(*   Add (e1, e2) -> (interp e1) + (interp e2)         *)
(*   Sub (e1, e2) -> (interp e1) - (interp e2)         *)
(*   Mul (e1, e2) -> (interp e1) * (interp e2)         *)
(*   Div (e1, e2) -> (interp e1) / (interp e2)         *)
(*-----------------------------------------------------*)
let rec interp_expr (env : t_env) (e : t_expr) : int =
  match e with
  | Cst n        -> n
  | Var ident    -> Env.value_of ident env
  | Add (e1, e2) -> (interp_expr env e1) + (interp_expr env e2)
  | Sub (e1, e2) -> (interp_expr env e1) - (interp_expr env e2)
  | Mul (e1, e2) -> (interp_expr env e1) * (interp_expr env e2)
  | Div (e1, e2) -> (interp_expr env e1) / (interp_expr env e2)
;;

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
  | Repete (n, body) ->
      if n <= 0
      then s
      else
        let s' = interp_instr body s in
        interp_instr (Repete (n - 1, body)) s'
;;