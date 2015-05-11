let get a i = a.(i - 1)

let arr =
  Random.self_init ();
  Array.init 200000 (fun _ -> Random.bool ())

let a = [|1|]
let b = [|1.0|]

let main () =
  for i = 1 to Array.length arr do
    if get arr i then ignore (get a 1) else ignore (get b 1)
  done
