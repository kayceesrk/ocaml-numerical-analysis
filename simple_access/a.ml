let get a i = a.(i - 1)

let sum a =
  get a 1 +. get a 2 +. get a 3 +.
  get a 4 +. get a 5 +. get a 6 +.
  get a 7 +. get a 8 +. get a 9

let arr () =
  Array.init 10000 (fun i -> Array.make 9 (float_of_int i))

let arr = arr ()

let main () =
  let r = ref 0. in
  for i = 1 to Array.length arr do
    r := !r +. sum (get arr i);
  done; !r
