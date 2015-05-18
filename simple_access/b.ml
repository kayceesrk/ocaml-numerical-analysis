open Unix

let gather t =
  t.Unix.tms_utime +. t.tms_stime +. t.tms_cutime +. t.tms_cstime

let arr = A.arr ()

let main () =
  let r = ref 0. in
  for i = 1 to Array.length arr do
    r := !r +. A.sum (A.get arr i);
  done

let () =
  Gc.minor ();
  let control = Gc.get () in
  Gc.set
    { control
      with Gc.minor_heap_size = 320000;
           Gc.space_overhead = max_int };
  let t1 = Unix.times () in
  main ();
  let t2 = Unix.times () in
  Format.printf "%f %d\n" (gather t2 -. gather t1) (Must.get ())
