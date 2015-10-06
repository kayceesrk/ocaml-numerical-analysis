all:
	make -C durand-kerner-aberth all
	make -C fft all
	ulimit -s `expr 8000 "*" 16` && make -C k-means all
	make -C levinson-durbin all
	make -C lu-decomposition all
	make -C neural-network all
	make -C qr-decomposition all
	make -C wav all

.PHONY: all clean

clean:
	make -C durand-kerner-aberth clean
	make -C fft					 clean
	make -C k-means				 clean
	make -C levinson-durbin		 clean
	make -C lu-decomposition	 clean
	make -C neural-network		 clean
	make -C qr-decomposition	 clean
	make -C wav					 clean
