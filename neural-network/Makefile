include ../Makefile.shared

SOURCES=dataset.ml neuralNetwork.ml

all: nn

nn: $(SOURCES)
	$(OCAML) $(SOURCES) -o $@

clean:
	rm -f *.cm? *.o nn
