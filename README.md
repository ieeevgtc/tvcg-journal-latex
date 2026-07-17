# IEEE TVCG Journal-Style LaTeX Template

LaTeX document class for papers submitted to conferences sponsored by the IEEE Visualization & Graphics Technical Committee (VGTC). You can use this template directly on Overleaf: [IEEE TVCG journal-style template](https://www.overleaf.com/latex/templates/ieee-tvcg-journal-style-template/gpptdvctxtgb).

Make sure your paper adheres to the [VGTC journal publication guidelines](https://tc.computer.org/vgtc/publications/journal/).

Conferences that use the `journal` document option:

- IEEE Visualization Conference (VIS)
- IEEE Virtual Reality (VR)
- IEEE International Symposium on Mixed and Augmented Reality (ISMAR)

## Contents

| File | Description |
| --- | --- |
| `vgtc.cls` | the VGTC class file (keep it next to your paper or in the TeX search path) |
| `template.tex` | an example paper |
| `template.bib` | its bibliography |
| `template.pdf` | the compiled example (journal mode) |
| `diamondrule.pdf` | abstract and body separator |
| `abbrv-doi*.bst` | bibliography styles with DOI output (with/without hyperref, with/without narrow DOIs) |
| `makefile` | compiles the example with latexmk |
| `figs/` | sample images |

## Compiling

Compile with pdfLaTeX and BibTeX — on [Overleaf](https://www.overleaf.com/latex/templates/ieee-tvcg-journal-style-template/gpptdvctxtgb) or locally with any LaTeX distribution (e.g., [TeX Live](https://www.tug.org/texlive/), [MacTeX](https://www.tug.org/mactex/), [MiKTeX](https://miktex.org/)):

```sh
make          # compile to PDF
make watch    # recompile on every change
make clean    # remove generated files
```

The makefile uses [latexmk](https://ctan.org/pkg/latexmk) and detects the main file (the `.tex` containing `\documentclass`), so renaming `template.tex` is fine. Without make, run `latexmk -pdf template`.

## Notes

- Use PDF, PNG, or JPG figures; convert EPS files with `epstopdf`.
- All fonts must be embedded in the final PDF — the default with pdfLaTeX; verify with `pdffonts template.pdf`.
- Problems or questions? Please [open an issue](https://github.com/ieeevgtc/tvcg-journal-latex/issues).
