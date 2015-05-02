(** Usage: ocaml profile.ml [command] *)

#load "str.cma";;
#load "unix.cma";;

open Format

let fold_lines f init ic =
  let rec aux acc =
    match input_line ic with
    | str -> aux (f acc str)
    | exception End_of_file -> acc
  in
  aux init

module NameSet = Set.Make(struct
    type t = string
    let compare = Pervasives.compare
  end)

let load_name_set filename =
  let ic = open_in filename in
  let s = fold_lines (fun acc line -> NameSet.add line acc) NameSet.empty ic in
  close_in ic;
  s

type gprof_entry =
  {
    time : float; (** percentage *)
    secs : float; (** seconds *)
    calls : int; (** the number of calls *)
    self_secs_per_call : float; (** self seconds/call *)
    total_secs_per_call : float; (** total seconds/call *)
    name : string; (** the name of function *)
  }

(** [parse_entry str] returns [Some entry] if [str] is well-formed. *)
let parse_entry =
  let re_ent = Str.regexp " *[0-9]+\\.[0-9]+" in
  let re_spc = Str.regexp " +" in
  let float = float_of_string in
  let int = int_of_string in
  fun str ->
    if Str.string_match re_ent str 0 then begin
      match Str.split re_spc str with
      | [t; _; ss; cl; sspc; tspc; nm] ->
        Some { time = float t;
               secs = float ss;
               calls = int cl;
               self_secs_per_call = float sspc;
               total_secs_per_call = float tspc;
               name = nm; }
      | _ -> None
    end else None

(** [load_profile arg] returns a list of gprof entries. *)
let load_profile arg =
  let aux acc str = match parse_entry str with
    | Some entry -> entry :: acc
    | None -> acc
  in
  let ic = Unix.open_process_in ("gprof --no-graph -b " ^ arg) in
  let entries = fold_lines aux [] ic in
  match Unix.close_process_in ic with
  | Unix.WEXITED 0 -> List.rev entries
  | _ -> failwith "gprof execution failure"

(** [total_secs entries] returns the sum of execution seconds. *)
let total_secs = List.fold_left (fun acc e -> acc +. e.secs) 0.

(** Print a given profile entries. *)
let print_profile entries =
  printf "self               self      total@\n\
          seconds      calls secs/call secs/call name@\n";
  List.iter (fun e ->
      printf "%7.2f %10d %9.2f %9.2f %s@."
        e.secs e.calls e.self_secs_per_call e.total_secs_per_call e.name)
    entries

let main arg =
  let gc_names = load_name_set "ocaml_gc" in
  let entries = load_profile arg in
  let gc_ents, user_ents =
    List.partition (fun entry -> NameSet.mem entry.name gc_names) entries in
  let user_secs = total_secs user_ents in
  let gc_secs = total_secs gc_ents in
  printf "User functions: %.2f secs@\n\
          OCaml GC      : %.2f secs@\n\
          Total         : %.2f secs@."
    user_secs gc_secs (user_secs +. gc_secs);
  print_endline "\nPROFILE [User]";
  print_profile user_ents;
  print_endline "\nPROFILE [OCaml GC]";
  print_profile gc_ents

let () =
  if Array.length Sys.argv < 2
  then eprintf "Usage: ocaml %s [command]@." Sys.argv.(0)
  else main Sys.argv.(1)
