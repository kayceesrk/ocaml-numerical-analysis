include ../../Makefile.shared

SOURCES=dataset.ml neuralNetwork.ml

test: ./my ./vanilla
	$(time) ./my
	$(time) ./vanilla

my: $(SOURCES)
	$(mycaml) -o $@ -dclambda $(SOURCES) 2> $@.clam

vanilla: $(SOURCES)
	$(vanilla) -o $@ -dclambda $(SOURCES) 2> $@.clam

clean:
	rm ./my ./vanilla -f
	rm ./*.cm?
