include ../Makefile.shared

SOURCES=dataset.ml neuralNetwork.ml

test: $(SOURCES)
	$(OCAMLOPT) -o $@ $^

clean:
	rm -f ./test
	rm -f ./*.cm?
