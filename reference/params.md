# Parameter Descriptions

Parameter Descriptions

## Arguments

- x:

  An object.

- nthin:

  A positive integer of the thinning rate.

- ...:

  Unused.

- flesh:

  An atomic vector

- skeleton:

  An nlist object.

- scalar:

  A logical scalar specifying whether to include all parameters (NULL),
  only scalars (TRUE) or all parameters except scalars (FALSE).

- terms:

  A flag specifying whether to return the parameter name for each term
  element.

- chains:

  An integer vector of chains.

- iters:

  An integer vector of iterations.

- pars:

  A character vector of parameter names.

- fun:

  A function that given a numeric vector returns a numeric scalar.

- nas:

  A flag specifying whether to also fill missing values.

- parameters:

  A character vector (or NULL) of the parameters to subset by.

- iterations:

  An integer vector (or NULL) of the iterations to subset by.

- simplify:

  A flag specifying whether to drop the sd and zscore columns.
  `simplify = FALSE` is deprecated.

- directional_information:

  A flag specifying whether the svalue column should be calculated using
  [`extras::directional_information()`](https://poissonconsulting.github.io/extras/reference/directional-information.html)
  instead of
  [`extras::svalue()`](https://poissonconsulting.github.io/extras/reference/svalue.html).
  The default value will change from `FALSE` to `TRUE` in a future
  release; set the argument explicitly to avoid the deprecation warning.

- silent:

  A flag specifying whether to suppress warning messages.

- by_chain:

  A flag specifying whether to aggregate by chains.
