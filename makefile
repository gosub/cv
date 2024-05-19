NAME="Giampaolo_Guiducci"
OUT=build
CV=$(OUT)/CV_$(NAME)

all: $(CV)_ITA.pdf $(CV)_EN.pdf $(CV)_ITA_DOB.pdf $(CV)_EN_DOB.pdf

INFILE=cv.tex
OUTFILE=cv.pdf
OUTDIR=mkdir -p $(OUT)
CLEAN_FLAGS=rm -f FLAG*
COMPILE=tectonic $<
MOVE_TO_DEST=mv $(OUTFILE) $@

clean:
	rm -rf build
	$(CLEAN_FLAGS)

$(CV)_ITA.pdf: $(INFILE)
	$(OUTDIR)
	$(COMPILE)
	$(MOVE_TO_DEST)
	$(CLEAN_FLAGS)

$(CV)_EN.pdf: $(INFILE)
	touch FLAGEN
	$(OUTDIR)
	$(COMPILE)
	$(MOVE_TO_DEST)
	$(CLEAN_FLAGS)

$(CV)_ITA_DOB.pdf: $(INFILE)
	touch FLAGDOB
	$(OUTDIR)
	$(COMPILE)
	$(MOVE_TO_DEST)
	$(CLEAN_FLAGS)

$(CV)_EN_DOB.pdf: $(INFILE)
	touch FLAGEN
	touch FLAGDOB
	$(OUTDIR)
	$(COMPILE)
	$(MOVE_TO_DEST)
	$(CLEAN_FLAGS)

.PHONY: all clean
