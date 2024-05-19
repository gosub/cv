all: build/cv.pdf build/cv_eng.pdf

outdir:
	mkdir -p build

clean:
	rm -rf build
	rm FLAG*

build/cv.pdf: outdir cv.tex
	tectonic cv.tex
	mv cv.pdf $@
	rm FLAG*

build/cv_eng.pdf: outdir cv.tex
	touch FLAGEN
	tectonic cv.tex
	mv cv.pdf $@
	rm FLAG*

.PHONY: all clean outdir
