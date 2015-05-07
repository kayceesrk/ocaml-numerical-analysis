include ../Makefile.shared

test: ./my ./vanilla
	./my
	./vanilla

my: fft.ml
	$(mycaml) -o $@ -dclambda unix.cmxa fft.ml 2> $@.clam

vanilla: fft.ml
	$(vanilla) -o $@ -dclambda unix.cmxa fft.ml 2> $@.clam

clean:
	rm ./my ./vanilla -f
	rm ./*.cm?
