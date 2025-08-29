#' Run a web app to customise Gantt charts
#'
#' Creates Gantt with `ganttrify` without coding.
#'
#' @return Nothing, used for its side effects.
#'
#' @examples
#' if (interactive) {
#'   shiny_ganttrify()
#' }
#'
#' @export
shiny_ganttrify <- function(config_file = NA) {
  packagedir <- system.file("", package = "shinyganttrify")

  dir.create(paste0(tempdir(), "/config"))
  outfile <- paste0(tempdir(), "/config/config.yaml")
  config_file <- normalizePath(config_file)

  if(!is.na(config_file) && file.exists(config_file)){
    file.copy(config_file, outfile, overwrite = TRUE)
  }else{
    file.copy(paste0(packagedir, "/extdata/config.yaml"), outfile,
              overwrite = TRUE)
  }
  shiny::runApp(
    appDir = paste0(packagedir, "/shiny"),
    display.mode = "normal"
  )
}
