(***************************************)
(*                                     *)
(*  Syntaxe abstraite pour un langage  *)
(*  "à la Logo"                        *)
(*  Exo02 - Q2 : ajout de Repete       *)
(*                                     *)
(***************************************)

open Env
;;

open Turtle

(*--------------------------------------------*)
(* type pour représenter l'état de la mémoire *)
(*--------------------------------------------*)
type t_state =
  Env.t_env * Turtle.t_turtle
;;

(*---------------------------------------------*)
(* types pour représenter la syntaxe abstraite *)
(*---------------------------------------------*)

type t_expr =
  | Cst of int
  | Var of t_ident
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
(* Le type pour la syntaxe abstraite des instructions du langage     *)
(*                                                                   *)
(* NOUVEAU : Repete (n, body)                                        *)
(*   Répète l'instruction body exactement n fois                     *)
(*   Exemple Logo : Repete 4 [ Avance 100 ; Droite 90 ]              *)
(*-------------------------------------------------------------------*)
type t_instr =
  | Define of t_ident * t_expr
  | Cmd    of t_cmd
  | Seq    of t_instr * t_instr
  | Repete of int * t_instr        (* (nombre de répétitions, corps) *)
;;

(*------------------------------------------------------------------------*)
(* Fonctions d'interprétation                                             *)
(*------------------------------------------------------------------------*)

let rec interp_expr (env : t_env) (e : t_expr) : int =
  match e with
  | Cst n      -> n
  | Var ident  -> Env.value_of ident env
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

(*-----------------------------------------------------*)
(* Interprétation d'une instruction                    *)
(*                                                     *)
(* CAS Repete (n, body) :                              *)
(*   Si n <= 0 : on ne fait rien, l'état reste         *)
(*               inchangé                              *)
(*   Si n > 0  : on exécute body une fois, puis on     *)
(*               appelle récursivement Repete (n-1)    *)
(*               sur le nouvel état                    *)
(*-----------------------------------------------------*)
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
      then s                                     (* 0 répétitions : rien *)
      else
        let s' = interp_instr body s in          (* 1 exécution du corps *)
        interp_instr (Repete (n - 1, body)) s'   (* puis n-1 fois encore *)
;;
