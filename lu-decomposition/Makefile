include ../Makefile.shared

SOURCES=lu.ml

test: $(SOURCES)
	$(OCAMLOPT) -o $@ $^

clean:
	rm -f ./test
	rm -f ./*.cm?
