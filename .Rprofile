## necessary for renv1.0.11 because of #2017 https://github.com/rstudio/renv/issues/2017
Sys.setenv(RENV_EXT_ENABLED = FALSE)

source("renv/activate.R")
if (Sys.info()["sysname"] == "Linux") {
  Sys.setenv("RENV_CONFIG_REPOS_OVERRIDE" = "https://packagemanager.posit.co/cran/__linux__/noble/latest")
  options(pkgType = "both")
}
