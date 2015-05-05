flag=-unsafe -inline 1000000

mycaml=~/git_ocaml/ocamlopt -nostdlib -I ~/git_ocaml/stdlib $(flag)
# mycaml=ocamlopt -nostdlib -I ~/.opam/4.02.0/lib/ocaml $(flag)
vanilla=~/vcaml/bin/ocamlopt -nostdlib -I ~/vcaml/lib/ocaml $(flag)
time=time -f "%e %U %S"
