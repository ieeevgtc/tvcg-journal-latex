# Makefile for the VGTC paper template.
#
# Requires latexmk, which is included in all modern LaTeX distributions
# (TeX Live, MacTeX, MiKTeX). It runs pdflatex and bibtex as often as
# needed to resolve all references and citations.

# The main file is detected automatically: it is the .tex file in this
# directory that contains a \documentclass line (files pulled in via
# \input or \include are found by latexmk on its own). You can also set
# it explicitly, e.g.: make MAINTEXFILE=mypaper.tex
MAINTEXFILE ?= $(shell grep -l '^[^%]*\\documentclass' *.tex)

all: pdf

# Compile the paper to PDF.
pdf:
	latexmk -pdf $(MAINTEXFILE)

# Recompile automatically whenever a source file changes.
watch:
	latexmk -pdf -pvc $(MAINTEXFILE)

# Remove all files that can be generated automatically.
clean:
	latexmk -C $(MAINTEXFILE)
	rm -f *.bbl *.brf *.out

.PHONY: all pdf watch clean
