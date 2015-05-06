include ../Makefile

SOURCES=lu.ml

test: my vanilla
	./my
	./vanilla

my: $(SOURCES)
	$(mycaml) -o $@ unix.cmxa $(SOURCES)

vanilla: $(SOURCES)
	$(vanilla) -o $@ unix.cmxa $(SOURCES)

clean:
	rm -f *.cm? *.o *.annot my vanilla
