include ../Makefile.shared

SOURCES=qr.ml

all: qr

qr: $(SOURCES)
	$(OCAML) $(SOURCES) -o $@

clean:
	rm -f *.cm? *.o qr
