#' Relists an unlist nlist Object
#'
#' Relists an nlist object that has been unlisted to a named numeric vector.
#' Ensures absent terms are included and preserves integer class.
#'
#' @param flesh An atomic vector
#' @param skeleton An nlist object.
#' @return An atomic numeric vector of the values in x.
#' @seealso [as.nlist.numeric()] and [unlist_nlist()]
#' @export
#' @examples
#' relist_nlist(c(`a[2]` = 5), nlist(a = 1:3))
relist_nlist <- function(flesh, skeleton) {
  chk_named(flesh)
  chk_not_any_na(names(flesh))
  chk_s3_class(skeleton, "nlist")

  if (!length(flesh) && !length(skeleton)) {
    return(nlist())
  }

  names(flesh) <- gsub(" ", "", names(flesh))
  names(flesh) <- sub("([^]])$", "\\1[1]", names(flesh))

  integer <- vapply(skeleton, is.integer, TRUE)
  integer <- names(integer[integer])
  skeleton <- unlist(skeleton)
  names(skeleton) <- sub("([^]])$", "\\1[1]", names(skeleton))

  not_in_skeleton <- names(flesh)[!names(flesh) %in% names(skeleton)]
  if (length(not_in_skeleton)) {
    abort_chk("The following `flesh` term%s %r not in `skeleton`: ",
      cc(not_in_skeleton, conj = " and "),
      n = length(not_in_skeleton)
    )
  }
  is.na(skeleton[!names(skeleton) %in% names(flesh)]) <- TRUE
  skeleton[names(flesh)] <- unname(flesh)
  skeleton <- as.nlist(skeleton)
  skeleton[names(skeleton) %in% integer] <-
    lapply(skeleton[names(skeleton) %in% integer], as.integer)
  skeleton
}
