include ../Makefile.shared

test: ./my ./vanilla
	./my
	./vanilla

my: dka.ml
	$(mycaml) -o my unix.cmxa dka.ml

vanilla: dka.ml
	$(vanilla) -o vanilla unix.cmxa dka.ml

clean:
	rm ./my ./vanilla -f
	rm ./*.cm?
