include ../Makefile.shared

SOURCES=dataset.ml levinson.ml

all: levinson

levinson: $(SOURCES)
	$(OCAML) $(SOURCES) -o $@

clean:
	rm -f *.cm? *.o levinson
