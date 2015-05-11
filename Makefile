FLAG = -w -warn-error -unsafe -inline 1000000 -p -g

FINDOPT= -package core,core_bench -linkpkg -thread

SOURCES = k-means/k_dataset.ml k-means/kmeans.ml naive-multilayer/neuralNetwork.ml \
	naive-multilayer/n_dataset.ml lu-decomposition/lu.ml fft/fft.ml durand-kerner-aberth/dka.ml \
	rnd_access/rnd.ml simple_access/a.ml qr-decomposition/qr.ml \
	levinson-durbin/l_dataset.ml levinson-durbin/levinson.ml main.ml

OCAMLC= ocamlfind ocamlc
OCAMLOPT= ocamlfind ocamlopt

COMPFLAGS= $(FLAG) $(I-FLAG) $(FINDOPT)

DIRS= ./k-means ./naive-multilayer ./lu-decomposition ./fft ./durand-kerner-aberth ./rnd_access \
	./levinson-durbin ./simple_access ./qr-decomposition

VPATH = $(foreach DIR, $(DIRS), $(DIR):)

I-FLAG= $(foreach ITEM, $(DIRS), -I $(ITEM))

OBJS= $(patsubst %.ml, %.cmx, $(SOURCES))

test: $(OBJS)
	$(OCAMLOPT) $(COMPFLAGS) -o $@ $(OBJS)

# generic rules :
#################

.SUFFIXES: .mll .mly .ml .mli .cmo .cmi .cmx

%.cmo: %.ml
	$(OCAMLC) $(OCAMLPP) $(COMPFLAGS) -c $<

%.cmi: %.mli
	$(OCAMLC) $(OCAMLPP) $(COMPFLAGS) -c $<

%.cmx: %.ml
	$(OCAMLOPT) $(OCAMLPP) $(COMPFLAGS) -c $<


# beforedepend::

# depend: beforedepend
# 	ocamldep $(INCLUDES) *.mli *.ml > .depend

clean::
	rm -f */*.cm?
	rm -f */*.o
	rm -f test
	rm -f *.cm?
# include .depend
