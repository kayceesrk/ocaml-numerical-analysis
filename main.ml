let c = Gc.get ()
let () = Gc.set
    { c with Gc.minor_heap_size = 32000000;
             Gc.space_overhead = max_int }

open Core.Std
open Core_bench.Std

let () =
  Command.run (Bench.make_command [
    Bench.Test.create ~name:"fft"
      (fun () -> Fft.main () |> ignore);
    Bench.Test.create ~name:"dka"
      (fun () -> ignore (Dka.main ()));
    Bench.Test.create ~name:"kmeans"
      (fun () -> ignore (Kmeans.main ()));
    Bench.Test.create ~name:"levinson"
      (fun () -> ignore (Levinson.main ()));
    Bench.Test.create ~name:"levinson"
      (fun () -> ignore (Levinson.main ()));
    Bench.Test.create ~name:"lu-decomposition"
      (fun () -> ignore (Lu.main ()));
    Bench.Test.create ~name:"neuralnetwork"
      (fun () -> ignore (NeuralNetwork.main N_dataset.samples));
    Bench.Test.create ~name:"qr-decomposition"
      (fun () -> ignore (Qr.main ()));
    Bench.Test.create ~name:"rnd-access"
      (fun () -> ignore (Rnd.main ()));
    Bench.Test.create ~name:"simple-access"
      (fun () -> ignore (A.main ()));
                 ])
