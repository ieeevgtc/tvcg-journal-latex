# IEEE TVCG Journal-Style LaTeX Template

This distribution provides a document class for formatting papers according to the specifications for submission to conferences sponsored by the IEEE Visualization & Graphics Technical Committee (VGTC).

Please make sure that your paper adheres to the [VGTC journal publication guidelines](https://tc.computer.org/vgtc/publications/journal/).

Conferences that use the `journal` document option:

- IEEE Visualization Conference (VIS)
- IEEE Virtual Reality (VR)
- IEEE International Symposium on Mixed and Augmented Reality (ISMAR)

## Contents

| File | Description |
| --- | --- |
| `README.md` | this file |
| `diamondrule.pdf` | abstract and body separator |
| `vgtc.cls` | the VGTC class file, which should be placed somewhere in the TeX search path (or in the local directory) |
| `template.tex` | an example paper |
| `template.bib` | a small bibliography file used by the example |
| `template.pdf` | an example proper PDF output in default journal mode |
| `abbrv-doi*.bst` | four different versions to generate the bibliography including DOI output, with and without hyperref support, with and without narrow rendering of DOIs |
| `makefile` | makefile for compiling the example with latexmk |
| `figs/` | subdirectory with sample images |

## Usage

The template can be used with any established LaTeX environment by compiling with pdfLaTeX (plus BibTeX). For online collaborative editing or without a local LaTeX installation, you can use the [IEEE TVCG journal-style template on Overleaf](https://www.overleaf.com/latex/templates/ieee-tvcg-journal-style-template/gpptdvctxtgb). For local installations, please use your favorite LaTeX distribution (e.g., [TeX Live](https://www.tug.org/texlive/), [MacTeX](https://www.tug.org/mactex/), or [MiKTeX](https://miktex.org/)) and editing environment, or use the makefile following the instructions below.

## Compiling

To compile the example, run

```sh
make
```

which uses [latexmk](https://ctan.org/pkg/latexmk) (included in all modern LaTeX distributions) to run pdfLaTeX and BibTeX as often as needed. The makefile automatically detects the main file (the `.tex` file containing `\documentclass`), so it keeps working if you rename `template.tex` for your own paper. Alternatively, run the steps manually:

```sh
pdflatex template
bibtex template
pdflatex template
pdflatex template
```

A successful compilation will create a file called `template.pdf`. Please make sure that its layout is identical to the `template.pdf` provided with this package.

Other available make targets:

- `make clean` — removes all files that can be generated automatically. We suggest running this before each fresh compilation.
- `make watch` — recompiles automatically whenever a source file changes (`latexmk -pvc`).

## Notes on proper PDF output

Please make sure that all fonts are embedded in the resulting PDF. You can check this with `pdffonts template.pdf` (included in all modern LaTeX distributions). Fonts are embedded by default when compiling with pdfLaTeX from a current distribution.

Use PDF, PNG, or JPG figures. If you have EPS figures (e.g., from R or gnuplot), convert them to PDF with `epstopdf`.

If you have problems with the makefile please notify us with the output of the errors produced when running make and we will work to figure out the resolution.
