include ../Makefile.shared

test: ./my ./vanilla
	./my
	./vanilla

my: dka.ml
	$(mycaml) -o $@ -dclambda unix.cmxa dka.ml 2> $@.clam

vanilla: dka.ml
	$(vanilla) -o $@ unix.cmxa dka.ml 2> $@.clam

clean:
	rm ./my ./vanilla -f
	rm ./*.cm?
