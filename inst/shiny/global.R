outfile <- paste0(tempdir(), "/config/config.yaml")

if (file.exists(outfile)) {
  config <- yaml::read_yaml(outfile)
} else {
  config <- yaml::read_yaml(paste0(system.file("", package = "shinyganttrify"),
                                   "/extdata/config.yaml"))
}
