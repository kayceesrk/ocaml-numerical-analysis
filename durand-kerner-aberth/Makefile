include ../Makefile.shared

SOURCES=dka.ml

all: dka

dka: $(SOURCES)
	$(OCAML) $(SOURCES) -o $@

clean:
	rm -f *.cm? *.o dka
