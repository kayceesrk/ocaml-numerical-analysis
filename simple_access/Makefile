include ../Makefile.shared

SOURCES=a.ml b.ml

test: vanilla my
	./vanilla
	./my

my: $(SOURCES)
	$(mycaml) -o $@ -dclambda unix.cmxa a.ml b.ml  2> $@.clam

vanilla: $(SOURCES)
	$(vanilla) -o $@ -dclambda unix.cmxa a.ml b.ml  2> $@.clam

clean:
	rm -f *.cm? *.o *.annot my vanilla
