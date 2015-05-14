include ../Makefile.shared

test: dataset.ml kmeans.ml
	$(OCAMLOPT) -o $@ $^

clean:
	rm -f ./test
	rm -f ./*.cm?
