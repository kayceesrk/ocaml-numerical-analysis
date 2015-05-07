include ../Makefile.shared

SOURCES=dataset.ml kmeans.ml

test: vanilla my
	./vanilla
	./my

my: $(SOURCES)
	$(mycaml) -o $@ unix.cmxa $(SOURCES)

vanilla: $(SOURCES)
	$(vanilla) -o $@ unix.cmxa $(SOURCES)

clean:
	rm -f *.cm? *.o *.annot my vanilla
