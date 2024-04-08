#' Create a map allowing to switch project position
#'
#' This is a hacky way to make the `here` package think that we are in another
#' directory. Can be useful if you want to check snippets of code from multiple
#' projects, but it is not advised in the long term.
#'
#' @param maps Named list of filepath you want to be able to switch in.
#'
#' @return A named list of functions that can be called to switch to a project.
#' The names are the same as in `maps`.
#' @export
#'
#' @examples
#' \dontrun{
#' switch_proj <- build_switch_project(
#'   "path_a" = "C:/my_first_project/file_a.R",
#'   "path_b" = "C:/my_second_project/file_b.R"
#' )
#' # Switch to the first project
#' switch_proj$path_a()
#' # ...
#'
#' # Switch to the second project
#' switch_proj$path_b()
#' }
build_switch_project <- function(maps) {
  purrr::map(
    maps,
    \(filepath) \() {
      setwd(fs::path_dir(filepath))
      here::i_am(fs::path_file(filepath))
    }
  )
}
