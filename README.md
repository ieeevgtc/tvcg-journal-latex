# IEEE TVCG Journal-Style LaTeX Template

This distribution provides a document class for formatting papers according to the specifications for submission to conferences sponsored by the IEEE Visualization & Graphics Technical Committee (VGTC).

Please make sure that your paper adheres to the [VGTC journal publication guidelines](https://tc.computer.org/vgtc/publications/journal/).

Conferences that use the `journal` document option:

- IEEE Visualization Conference (VIS)
- IEEE Virtual Reality (VR)
- IEEE International Symposium on Mixed and Augmented Reality (ISMAR)

## Contents

This distribution contains 13 files/directories:

| File | Description |
| --- | --- |
| `README.md` | this file |
| `diamondrule.eps` | abstract and body separator |
| `diamondrule.pdf` | its PDF version |
| `vgtc.cls` | the VGTC class file, which should be placed somewhere in the TeX search path (or in the local directory) |
| `template.tex` | an example paper |
| `template.bib` | a small bibliography file used by the example |
| `template.pdf` | an example proper PDF output in default journal mode |
| `abbrv-doi*.bst` | four different versions to generate the bibliography including DOI output, with and without hyperref support, with and without narrow rendering of DOIs |
| `makefile` | makefile including bibtex compilation and proper PDF generation |
| `figs/` | subdirectory with sample images, both in EPS and in direct pixel/vector format |

## Usage

The template can be used with an established LaTeX environment by calling pdfLaTeX or LaTeX. For online collaborative editing or without a local LaTeX installation, you can use the [IEEE TVCG journal-style template on Overleaf](https://www.overleaf.com/latex/templates/ieee-tvcg-journal-style-template/gpptdvctxtgb). For Windows-based LaTeX installations you can use, for example, the environment provided by [TeXnicCenter](http://www.texniccenter.org/) along with [MiKTeX](http://miktex.org/). For Unix-based installations, please use your favorite LaTeX distribution and editing environment or use the makefile following the instructions below.

## Use of the Makefile

Prior to "building" a paper please be sure to run

```sh
make clean
```

This will ensure that the paper is built cleanly each and every time. We suggest to run this command before each new compilation.

To compile the example, run

```sh
make
```

or manually, if the makefile does not work for you

```sh
latex template
bibtex template
latex template
latex template
```

If you run `make` for the first time, a successful compilation will create a file called `template.pdf`. Please make sure that its layout is identical to the file `template-journal.pdf` provided with this package.

The included makefile also allows you to run each step of the process manually. Below is a list of available options that may be passed to make:

- `make clean` — removes all files that can be generated automatically.
- `make gs7` — performs all functions to build a proper paper using GhostScript 7.
- `make gs8` — performs all functions to build a proper paper using GhostScript 8.
- `make dvi` — processes the `.tex` file and produces a DVI output file. This step may process the `.tex` file several times to process all references and citations.
- `make ps` — processes the `.tex` file and the DVI output and converts it to a PostScript file.
- `make pdf` — processes the `.tex` file using pdfTeX/pdflatex to produce a PDF file directly (not using a DVI and PostScript file). Please make sure that all fonts are embedded. You can use `pdffonts my_document.pdf` to check if they are. It is standard in all modern LaTeX distributions. If you use EPS figures (e.g., R or gnuplot figures) which you convert to PDF using epstopdf, do the following: use `GS_OPTIONS`, a global environment variable for GhostScript:

  ```sh
  export GS_OPTIONS="-dEmbedAllFonts=true -dPDFSETTINGS=/printer"
  # and run
  epstopdf myfile.eps
  ```

  See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=411651 for the origin of this solution.

If you have problems with the makefile please notify us with the output of the errors produced when running make and we will work to figure out the resolution.

## Producing Proper PDF Output Manually

To produce proper PDF output, please use:

```sh
dvips -t letter -Pdownload35 -Ppdf -G0 template.dvi -o template.ps
```

The `-Ppdf` and `-G0` flags should be specified in that order; reversing them does not work, and will result in unacceptable results.

The following information is an excerpt from the ACM SIGGRAPH Conference / Symposium / Workshop Content Formatting Instructions which can be found here:

http://www.siggraph.org/publications/instructions/author-instructions.pdf

If you are using version 7.x of GhostScript, please use the following method of invoking `ps2pdf`, in order to embed all typefaces and ensure that images are not downsampled or subsampled in the PDF creation process:

```sh
ps2pdf -dCompatibilityLevel=1.3 -dMaxSubsetPct=100 \
       -dSubsetFonts=true -dEmbedAllFonts=true \
       -dAutoFilterColorImages=false -dAutoFilterGrayImages=false \
       -dColorImageFilter=/FlateEncode -dGrayImageFilter=/FlateEncode \
       -dMonoImageFilter=/FlateEncode template.ps template.pdf
```

If you are using version 8.x of GhostScript, please use this method in place of the example above:

```sh
ps2pdf -dPDFSETTINGS=/prepress -dCompatibilityLevel=1.3 \
       -dAutoFilterColorImages=false -dAutoFilterGrayImages=false \
       -dColorImageFilter=/FlateEncode -dGrayImageFilter=/FlateEncode \
       -dMonoImageFilter=/FlateEncode template.ps template.pdf
```

This has been incorporated into the makefile and should no longer be needed unless you are building the PDF file manually.
