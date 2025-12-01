# Simple Makefile for LaTeX thesis

MAIN=tesi
OUTDIR=build
LATEXMK=latexmk

.PHONY: all watch clean distclean open

all: $(OUTDIR)/$(MAIN).pdf

$(OUTDIR)/$(MAIN).pdf: $(MAIN).tex
	$(LATEXMK) -pdf -shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -outdir=$(OUTDIR) $(MAIN).tex

watch:
	$(LATEXMK) -pdf -pvc -shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -outdir=$(OUTDIR) $(MAIN).tex

clean:
	$(LATEXMK) -C -outdir=$(OUTDIR)
	@rm -rf _minted-$(MAIN)

open: all
	@xdg-open $(OUTDIR)/$(MAIN).pdf >/dev/null 2>&1 || true

# Remove all build artifacts, including the pdf
distclean: clean
	@rm -f $(OUTDIR)/$(MAIN).pdf
