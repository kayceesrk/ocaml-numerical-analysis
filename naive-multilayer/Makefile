include ../Makefile.shared

SOURCES=dataset.ml neuralNetwork.ml

test: ./my ./vanilla
	./my
	./vanilla

my: $(SOURCES)
	$(mycaml) -o $@ unix.cmxa $(SOURCES)

vanilla: $(SOURCES)
	$(vanilla) -o $@ unix.cmxa $(SOURCES)

clean:
	rm -f *.cm? *.o my vanilla
