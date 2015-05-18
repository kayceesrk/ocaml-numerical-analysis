include ../Makefile.shared

SOURCES=dataset.ml kmeans.ml

test: vanilla my
	./vanilla
	./my

my: $(SOURCES)
	$(mycaml) -dclambda -o $@ unix.cmxa $(SOURCES) 2> ./my.clam

vanilla: $(SOURCES)
	$(vanilla) -dclambda -o $@ unix.cmxa $(SOURCES) 2> ./vanilla.clam

clean:
	rm -f *.cm? *.o *.annot my vanilla
