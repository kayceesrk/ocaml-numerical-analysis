include Makefile.shared

TESTS = neural-network/naive-multilayer durand-kerner-aberth fft k-means \
	levinson-durbin lu-decomposition qr-decomposition

RESULTS=$(foreach ITEM, $(TESTS), $(ITEM)/my.result $(ITEM)/vanilla.result)

all: $(foreach ITEM, $(TESTS), $(ITEM)/my $(ITEM)/vanilla)

do_test: $(RESULTS)

%/my: %/*.ml
	cd $(dir $@) && make my

%/vanilla: %/*.ml
	cd $(dir $@) && make vanilla

%.result: %
	for i in `seq 1 99 `; do $(basename ./$@) >> ./$@; done

clean:
	rm -f */my */vanilla */*.cm? */*.o */*.annot
