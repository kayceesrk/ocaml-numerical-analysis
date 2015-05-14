include ../Makefile.shared

SOURCES=dataset.ml levinson.ml

test: $(SOURCES)
	$(OCAMLOPT) -o $@ $^

clean:
	rm -f ./test
	rm -f ./*.cm?
