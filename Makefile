include Makefile.shared

TESTS=neural-network/naive-multilayer durand-kerner-aberth fft k-means \
	levinson-durbin lu-decomposition qr-decomposition

HOME=$(shell pwd)
RESULTS=$(foreach ITEM, $(TESTS), $(ITEM)/my.result $(ITEM)/vanilla.result)

do_test: $(RESULTS)

%/my: %/*.ml
	make my

%/vanilla: %/*.ml
	make vanilla

%.result: $(basename $@)
	for i in `seq 1 99 `; do $(basename ./$@) >> ./$@; done
