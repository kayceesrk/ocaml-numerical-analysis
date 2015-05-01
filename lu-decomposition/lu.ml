(** lu.ml --- LU decompisition by Crout's method

    [MIT License] Copyright (C) 2015 Akinori ABE
*)

open Format

module Array = struct
  include Array

  let init_matrix m n f = init m (fun i -> init n (f i))

  let matrix_size a =
    let m = length a in
    let n = if m = 0 then 0 else length a.(0) in
    (m, n)

  (** [swap x i j] swaps [x.(i)] and [x.(j)]. *)
  let swap x i j =
    let tmp = x.(i) in
    x.(i) <- x.(j);
    x.(j) <- tmp
end

(** [foldi f init i j] is [f (... (f (f init i) (i+1)) ...) j]. *)
let foldi f init i j =
  let acc = ref init in
  for k = i to j do acc := f !acc k done;
  !acc

(** [sumi f i j] is [f i +. f (i+1) +. ... +. f j] *)
let sumi f i j = foldi (fun acc k -> acc +. f k) 0.0 i j

(** [maxi f i j] computes the index of the maximum in [f i, f (i+1), ..., f j].
*)
let maxi f i j =
  foldi
    (fun (k0, v0) k -> let v = f k in if v0 < v then (k, v) else (k0, v0))
    (-1, ~-. max_float) i j
  |> fst

(** [lup a] computes LUP decomposition of square matrix [a] by Crout's method.
    @return [(p, lu)] where [p] is an array of permutation indices and [lu] is
    a matrix containing lower and upper triangular matrices.
*)
let lup a0 =
  let a = Array.copy a0 in
  let m, n = Array.matrix_size a in
  let r = min m n in
  let p = Array.init m (fun i -> i) in (* permutation indices *)
  let lu = Array.make_matrix m n 0.0 in
  let aux i j q = a.(i).(j) -. sumi (fun k -> lu.(i).(k) *. lu.(k).(j)) 0 q in
  let get_pivot j =
    maxi (fun i -> abs_float (aux i j (min (i-1) (r-1)))) j (m-1)
  in
  for j = 0 to r - 1 do
    (* pivot selection (swapping rows) *)
    let j' = get_pivot j in
    if j <> j' then Array.(swap p j j' ; swap a j j' ; swap lu j j');
    (* Compute LU decomposition *)
    for i = 0 to j do lu.(i).(j) <- aux i j (i-1) done;
    for i = j+1 to m-1 do lu.(i).(j) <- aux i j (j-1) /. lu.(j).(j) done
  done;
  (* Compute the right block in the upper trapezoidal matrix *)
  for j = r to n-1 do
    for i = 0 to r-1 do lu.(i).(j) <- aux i j (i-1) done
  done;
  (p, lu)

let main () =
  let n = 500 in
  let a = Array.init_matrix n n (fun _ _ -> Random.float 20.0 -. 10.0) in
  ignore (lup a);
  print_endline "finished."

let () = main ()
