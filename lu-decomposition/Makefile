include ../Makefile.shared

SOURCES=lu.ml

all: lu

lu: $(SOURCES)
	$(OCAML) $(SOURCES) -o $@

clean:
	rm -f *.cm? *.o lu
