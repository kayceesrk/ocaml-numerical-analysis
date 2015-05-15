include Makefile.shared

TESTS = naive-multilayer durand-kerner-aberth fft k-means \
	levinson-durbin lu-decomposition qr-decomposition \
	rnd_access simple_access

RESULTS=$(foreach ITEM, $(TESTS), $(ITEM)/my.result $(ITEM)/vanilla.result)

all: $(foreach ITEM, $(TESTS), $(ITEM)/my $(ITEM)/vanilla)

.PHONY: clean clean_result average

.PRECIOUS: $(RESULTS)

do_test: $(RESULTS)

%/my: %/*.ml
	cd $(dir $@) && make my

%/vanilla: %/*.ml
	cd $(dir $@) && make vanilla

%.result: %
	for i in `seq 100`; do $(basename ./$@) >> ./$@; done

clean:
	rm -f */my */vanilla */*.cm? */*.o */*.clam

clean_result:
	find -name "*.result" -exec rm {} \;

average:
	find -name "*.result" -exec ./average {} \;
