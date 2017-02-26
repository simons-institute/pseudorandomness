# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
SPHINXPROJ    = Pseudorandomness
SOURCEDIR     = source
BUILDDIR      = build

.PHONY: help
help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  html       to make standalone HTML files"
	@echo "  latex      to make LaTeX files, you can set PAPER=a4 or PAPER=letter"
	@echo "  latexpdf   to make LaTeX files and run them through pdflatex"
	@echo "  github     to upload the web site via gh-pages"

.PHONY: clean
clean:
	rm -rf $(BUILDDIR)/*

.PHONY: html
html:
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
	@echo
	@echo "Build finished. The HTML pages are in $(BUILDDIR)/html."

.PHONY: latex
latex:
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
	@echo
	@echo "Build finished; the LaTeX files are in $(BUILDDIR)/latex."
	@echo "Run \`make' in that directory to run these through (pdf)latex" \
	      "(use \`make latexpdf' here to do that automatically)."

.PHONY: latexpdf
latexpdf: latex
	touch source/open_problems/zreferences.rst
	cd build/latex/ && pdflatex pseudorandomness
	touch source/open_problems/zreferences.rst
	cd build/latex/ && pdflatex pseudorandomness
	@echo "Running LaTeX files through pdflatex..."
	@echo "pdflatex finished; the PDF files are in $(BUILDDIR)/latex."

.PHONY: pdf
pdf: latexpdf
	make latexpdf

.PHONY: github
github: pdf html
	cp $(BUILDDIR)/latex/pseudorandomness.pdf $(BUILDDIR)/html/.
	cp -a pdfs $(BUILDDIR)/html/.
	ghp-import $(BUILDDIR)/html
	git push origin gh-pages --force
