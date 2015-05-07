include ../Makefile.shared

SOURCES=dataset.ml levinson.ml

test: vanilla my
	./vanilla
	./my

my: $(SOURCES)
	$(mycaml) -o $@ -dclambda unix.cmxa $(SOURCES) 2> $@.clam

vanilla: $(SOURCES)
	$(vanilla) -o $@ -dclambda unix.cmxa $(SOURCES) 2> $@.clam

clean:
	rm -f *.cm? *.o *.annot my vanilla
