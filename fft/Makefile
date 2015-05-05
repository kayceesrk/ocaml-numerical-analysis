include ../Makefile

test: ./my ./vanilla
	$(time) ./my
	$(time) ./vanilla

my: fft.ml
	$(mycaml) -o my fft.ml

vanilla: fft.ml
	$(vanilla) -o vanilla fft.ml

clean:
	rm ./my ./vanilla -f
	rm ./*.cm?
