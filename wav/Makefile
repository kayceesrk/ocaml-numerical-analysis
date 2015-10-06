include ../Makefile.shared

SOURCES=wav.mli wav.ml

all: wav

wav: $(SOURCES)
	$(OCAML) $(SOURCES) -o $@

clean:
	rm -f *.cm? *.o wav
