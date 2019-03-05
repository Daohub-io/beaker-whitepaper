TEX = latexmk -pdf

IMGS = media/BeakerKernelOverview.pdf media/NormalKernelOverview.pdf \
	media/EntryProcedure.pdf media/ProcedureCreation.pdf media/Separation.pdf \
	media/SystemCalls.pdf

.PHONY: all clean

all : Whitepaper.pdf BeakerSpec.pdf

BeakerSpec.pdf : BeakerSpec.tex $(IMGS)
	$(TEX) BeakerSpec.tex

Whitepaper.pdf : Whitepaper.tex $(IMGS)
	$(TEX) Whitepaper.tex

%.pdf: %.svg
	inkscape --file=$< --export-area-page --without-gui --export-pdf=$@

clean:
	rm -f *.pdf *.aux *.toc *.dvi *.fdb_latexmk *.fls *.log *.out media/*.pdf
