# Format code from the terminal with: air format .

lintr::lint_package()

devtools::test()
devtools::document()

# Note: Only use pkgdown to build a documentation website for public facing packages
pkgdown::build_reference()
pkgdown::build_site()

devtools::check()
