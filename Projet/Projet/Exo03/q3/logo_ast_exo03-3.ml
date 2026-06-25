(***************************************)
(*                                     *)
(*  Syntaxe abstraite pour un langage  *)
(*  "à la Logo"                        *)
(*  Exo03 - Q3 : ajout de la           *)
(*    conditionnelle If                *)
(*                                     *)
(***************************************)

open Env
;;
open Turtle

type t_state = Env.t_env * Turtle.t_turtle
;;

type t_expr =
  | Cst of int
  | Var of t_ident
  | Add of t_expr * t_expr
  | Sub of t_expr * t_expr
  | Mul of t_expr * t_expr
  | Div of t_expr * t_expr
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

type t_opcmp =
  | Eq
  | Gt
  | Lt
;;

type t_bexpr =
  | Cmp of t_expr * t_opcmp * t_expr
;;

(*-------------------------------------------------------------------*)
(* Le type pour la syntaxe abstraite des instructions                *)
(*                                                                   *)
(* NOUVEAU : If (bexpr, instr_alors, instr_sinon)                    *)
(*   Syntaxe Logo : Si (bexpr) Alors instr Sinon instr FinSi         *)
(*   Exemple :                                                        *)
(*     Si (:a > :b) Alors Avance 30 Sinon Recule 50 FinSi            *)
(*     --> If (Cmp(Var"a", Gt, Var"b"), Cmd(Forward 30),             *)
(*              Cmd(Backward 50))                                     *)
(*                                                                   *)
(* MODIFIÉ : Repete prend maintenant une t_expr comme compteur       *)
(*   (et non plus un int) pour accepter des variables                *)
(*   Exemple : Repete :cotes [...]                                   *)
(*-------------------------------------------------------------------*)
type t_instr =
  | Define of t_ident * t_expr
  | Cmd    of t_cmd
  | Seq    of t_instr * t_instr
  | Repete of t_expr  * t_instr   (* compteur = t_expr *)
  | If     of t_bexpr * t_instr * t_instr  (* (cond, alors, sinon) *)
;;

(*------------------------------------------------------------------------*)
(* Fonctions d'interprétation                                             *)
(*------------------------------------------------------------------------*)

let rec interp_expr (env : t_env) (e : t_expr) : int =
  match e with
  | Cst n        -> n
  | Var ident    -> Env.value_of ident env
  | Add (e1, e2) -> (interp_expr env e1) + (interp_expr env e2)
  | Sub (e1, e2) -> (interp_expr env e1) - (interp_expr env e2)
  | Mul (e1, e2) -> (interp_expr env e1) * (interp_expr env e2)
  | Div (e1, e2) -> (interp_expr env e1) / (interp_expr env e2)
;;

let interp_bexpr (env : t_env) (b : t_bexpr) : bool =
  match b with
  | Cmp (e1, op, e2) ->
      let v1 = interp_expr env e1 in
      let v2 = interp_expr env e2 in
      match op with
      | Eq -> v1 =  v2
      | Gt -> v1 >  v2
      | Lt -> v1 <  v2
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
(* interp_instr : interprète une instruction           *)
(*                                                     *)
(* CAS Repete (e, body) :                              *)
(*   On évalue e pour obtenir n (entier),              *)
(*   puis on exécute body n fois avec une              *)
(*   fonction récursive locale.                        *)
(*                                                     *)
(* CAS If (b, i1, i2) :                               *)
(*   On évalue la comparaison b.                       *)
(*   Si vraie  → on exécute i1 (branche Alors)         *)
(*   Si fausse → on exécute i2 (branche Sinon)         *)
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
  | Repete (e, body) ->
      let n = interp_expr env e in
      let rec loop k s_courant =
        if k <= 0 then s_courant
        else loop (k - 1) (interp_instr body s_courant)
      in
      loop n s
  | If (b, i1, i2) ->
      if interp_bexpr env b
      then interp_instr i1 s    (* condition vraie  → branche Alors *)
      else interp_instr i2 s    (* condition fausse → branche Sinon *)
;;
