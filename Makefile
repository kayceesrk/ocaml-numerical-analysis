BENCHES = $(wildcard */)

OCAMLOPT = ../ocaml-multicore/ocamlopt.opt -I ../ocaml-multicore/stdlib -I ../ocaml-multicore/otherlibs/unix
OCAMLDEP = ../ocaml-multicore/byterun/ocamlrun ../ocaml-multicore/tools/ocamldep
#OCAMLOPT = ocamlopt.opt
#OCAMLDEP = ocamldep.opt

ifdef GCSTATS
  MAINSRC = main_gcstats.ml
  LINK = unix.cmxa
else
  MAINSRC = main_nogcstats.ml
  LINK =
endif

all: $(BENCHES:/=.opt)


all-gcstats: $(BENCHES:/=-gcstats.opt)

%.opt: $(MAINSRC) %/*.ml
	ulimit -s 983040; OCAMLRUNPARAM="l=1073741824" $(OCAMLOPT) $(LINK) -I $* `$(OCAMLDEP) -sort $*/*.ml` $< -o $@
# Huge stack is required to compile k-means
# ulimit applies to trunk builds
# OCAMLRUNPARAM="l=*" applies to multicore

.PHONY: clean
clean:
	rm -f *.cm* *.o *.opt *-gcstats.opt */*.cm* */*.o
