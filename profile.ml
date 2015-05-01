(** Usage: ocaml profile.ml [command] *)

#load "str.cma";;
#load "unix.cma";;

open Format

type gprof_entry =
  {
    time : float; (** percentage *)
    cumulative_secs : float; (** cumulative seconds *)
    self_secs : float; (** self seconds *)
    calls : int; (** the number of calls *)
    self_secs_per_call : float; (** self seconds/call *)
    total_secs_per_call : float; (** total seconds/call *)
    name : string; (** the name of function *)
  }

let fold_lines f init ic =
  let rec aux acc =
    match input_line ic with
    | str -> aux (f acc str)
    | exception End_of_file -> acc
  in
  aux init

(** [parse_entry str] returns [Some entry] if [str] is well-formed. *)
let parse_entry =
  let re_ent = Str.regexp " *[0-9]+\\.[0-9]+" in
  let re_spc = Str.regexp " +" in
  let float = float_of_string in
  let int = int_of_string in
  fun str ->
    if Str.string_match re_ent str 0 then begin
      match Str.split re_spc str with
      | [t; cs; ss; cl; sspc; tspc; nm] ->
        Some { time = float t;
               cumulative_secs = float cs;
               self_secs = float ss;
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

let main () =
  if Array.length Sys.argv < 2
  then eprintf "Usage: ocaml %s [command]@." Sys.argv.(0)
  else begin
    let entries = load_profile Sys.argv.(1) in
    List.iter (fun e -> printf "%.2f: %s@." e.self_secs e.name) entries
  end

let () = main ()
