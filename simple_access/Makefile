include ../Makefile.shared

SOURCES= a.ml

test: $(SOURCES)
	$(OCAMLOPT) -o $@ $^

clean:
	rm -f ./test
	rm -f ./*.cm?
