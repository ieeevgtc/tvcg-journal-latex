# Contributing

Contributions are welcome via issues and pull requests. When changing `vgtc.cls`, add an entry to the changelog comment at the top of the file and check that `make clean && make` still produces the expected layout.

## Making a release

1. Compile with `make clean && make`; commit the new `template.pdf` if the output changed.
2. Update the changelog and `\ProvidesClass` date in `vgtc.cls`.
3. Tag and push:

   ```sh
   git tag YYYY.MM.DD
   git push origin main --tags
   ```

4. In the [Overleaf project](https://www.overleaf.com/project/6a5923bde2c36273e9a78bd0) (maintainers only), open Integrations → GitHub in the sidebar, pull the GitHub changes, and republish the [template](https://www.overleaf.com/latex/templates/ieee-tvcg-journal-style-template/gpptdvctxtgb).
