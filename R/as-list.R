# @export
# extras::as_list_unnamed

# @inherit extras::as_list
# @export
# @examples
# as_list(nlists(nlist(x = 1)))
# as_list(nlists(nlist(x = 1), nlist(x = 3)))
as_list_unnamed_nlists <- function(x, ...) {
  x <- lapply(x, as_list_unnamed_default)
  do.call("c", x)
}
