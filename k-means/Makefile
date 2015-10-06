include ../Makefile.shared

SOURCES=dataset.ml kmeans.ml


all: k-means

k-means: $(SOURCES)
	$(OCAML) $(SOURCES) -o $@

clean:
	rm -f *.cm? *.o k-means
