nlist 0.5.0

## Cran Repository Policy

- [x] Reviewed CRP last edited 2024-08-27.

## Test environments

- local macOS, R 4.6, `R CMD check --as-cran`: 0 errors | 0 warnings | 0 notes
- GitHub Actions: macOS, Windows, Ubuntu (release, devel, oldrel-1)

<!-- TODO: run win-builder (devel and release) and rhub, then list them here. -->

## R CMD check results

0 errors | 0 warnings | 0 notes

## Reverse dependencies

This release changes the default of `simplify` in `tidy()` from `FALSE` to `TRUE` and makes previously warn-deprecated functions and arguments defunct.

We checked 4 reverse dependencies (mcmcderive, mcmcr, sims and universals), comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 0 new problems
 * We failed to check 0 packages

## CRAN Notes

Previous submissions produced the following note on r-devel-linux-x86_64-debian-clang and r-devel-linux-x86_64-debian-gcc:

>Package has help file(s) containing later-stage \Sexpr{} expressions
but no 'build/stage23.rdb' file.

The later-stage `\Sexpr{}` expressions come from inheriting documentation from `generics::tidy()`, which lists its methods via `\Sexpr[stage=render,results=rd]{generics:::methods_rd("tidy")}`.
The tarball was built with a current release version of R so that 'build/stage23.rdb' is generated.

## Method References

There are no published references describing the methods in this package.
