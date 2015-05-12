LATEX      = pdflatex
LATEX_OPTS = -halt-on-error -file-line-error

DEBUG ?= 0
ifeq ($(DEBUG),0)
	LATEX_OPTS += -interaction batchmode
endif

RERUN = "^LaTeX Warning: .* Rerun to get"

BOOK        = plack-handbook
BUILD_DIR   = build
MASTER_FILE = main.tex
IMG_FILES   = images/pylons_as_onion.svg images/cc-by-nc.eps
TEX_FILES   = $(shell find -type f -name '*.tex')
PERL_FILES  = $(wildcard codes/*.pl)

.PHONY: clean distclean pdf

help:
	@echo "Usage: make [options] [targets]"
	@echo "Compile the Plack Handbook."
	@echo ""
	@echo "Available targets:"
	@echo ""
	@echo "       help: That usage information"
	@echo "        pdf: Build the book"
	@echo "      clean: Remove all intermediate files"
	@echo "  distclean: Remove all intermediate and target files"

pdf: $(BOOK).pdf

$(BOOK).pdf: $(TEX_FILES) $(PERL_FILES) $(IMG_FILES)
	mkdir -p $(BUILD_DIR)
	$(LATEX) $(LATEX_OPTS) --shell-escape -jobname $(basename $@) $(MASTER_FILE)
	@while grep -q $(RERUN) $(basename $@).log; \
	do \
		$(LATEX) $(LATEX_OPTS) -jobname $(basename $@) $(MASTER_FILE); \
	done

clean:
	rm -fr $(BUILD_DIR)
	rm -f chapters/*.aux *.aux *.toc *.log *.out images/*.pdf

distclean: clean
	rm -f *.pdf 
