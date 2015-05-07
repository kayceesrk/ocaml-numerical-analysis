include ../Makefile.shared

SOURCES=lu.ml

test: my vanilla
	./my
	./vanilla

my: $(SOURCES)
	$(mycaml) -o $@ -dclambda unix.cmxa $(SOURCES) 2> $@.clam

vanilla: $(SOURCES)
	$(vanilla) -o $@ -dclambda unix.cmxa $(SOURCES) 2> $@.clam

clean:
	rm -f *.cm? *.o *.annot my vanilla
