open Unix

let arr = A.arr ()

let main () =
  let r = ref 0. in
  for i = 1 to Array.length arr do
    r := !r +. A.sum (A.get arr i);
  done
