include ../Makefile.shared

SOURCES=fft.ml

all: fft

fft: $(SOURCES)
	$(OCAML) $(SOURCES) -o $@

clean:
	rm -f *.cm? *.o fft
