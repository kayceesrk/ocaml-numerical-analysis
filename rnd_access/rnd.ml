open Unix
let get a i = a.(i - 1)

let gather t =
  t.Unix.tms_utime +. t.tms_stime +. t.tms_cutime +. t.tms_cstime

let arr =
  Random.self_init ();
  let len =
    if Array.length Sys.argv = 1
    then 200000000 else int_of_string Sys.argv.(1) in
  Array.init len (fun _ -> Random.bool ())

let a = [|1|]
let b = [|1.0|]

let main () =
  for i = 1 to Array.length arr do
    if get arr i then ignore (get a 1) else ignore (get b 1)
  done

let () =
  let t1 = Unix.times () in
  main ();
  let t2 = Unix.times () in
  Format.printf "%f %d %d\n" (gather t2 -. gather t1) (Must.get_gen ()) (Must.get_mono ())
