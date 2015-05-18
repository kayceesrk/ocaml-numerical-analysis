include ../Makefile.shared

SOURCES= rnd.ml

test: vanilla my
	./vanilla
	./my

my: $(SOURCES)
	$(mycaml) -o $@ unix.cmxa $(SOURCES)

vanilla: $(SOURCES)
	$(vanilla) -o $@ unix.cmxa $(SOURCES)

clean:
	rm -f *.cm? *.o *.annot my vanilla
