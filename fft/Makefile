include ../Makefile.shared

test: ./my ./vanilla
	./my
	./vanilla

my: fft.ml
	$(mycaml) -o $@ unix.cmxa fft.ml

vanilla: fft.ml
	$(vanilla) -o $@ unix.cmxa fft.ml

clean:
	rm ./my ./vanilla -f
	rm ./*.cm?
