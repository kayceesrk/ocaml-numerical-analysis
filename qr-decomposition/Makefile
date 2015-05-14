include ../Makefile.shared

SOURCES= qr.ml

test: $(SOURCES)
	$(OCAMLOPT) -o $@ $^

clean:
	rm -f ./test
	rm -f ./*.cm?
