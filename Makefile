include Makefile.shared

TESTS = naive-multilayer durand-kerner-aberth fft  \
	levinson-durbin \
	rnd_access simple_access \
#	lu-decomposition k-means

RESULTS=$(foreach ITEM, $(TESTS), $(ITEM)/test.result)

all: $(foreach ITEM, $(TESTS), $(ITEM)/test)

test:
	echo `which ocamlopt`
	make do_test

.PHONY: do_test clean clean_result average

do_test: $(RESULTS)

%/test: %/*.ml
	cd $(dir $@) && make test

%.result: % FORCE
	cd $(dir $@) && ./test -save -quota 1000 time gc alloc samples

FORCE:

clean:
	rm -f */test */*.cm? */*.o */*.clam

clean_result:
	find -name "*.result" -exec rm {} \;

average:
	find -name "*.result" -exec ./average {} \;
