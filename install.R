#!/usr/bin/env r

# Install devtools so we can install versioned packages
install.packages("devtools")

source("/tmp/class-libs.R")

# install ottr, needs to go first issue #3216
# install ottr, 1.4.0, issue #5314
# install ottr, 1.5.0 https://github.com/berkeley-dsep-infra/datahub/issues/5498
devtools::install_version("ottr", version = "1.5.0", repos = "https://cran.r-project.org", upgrade = "never", quiet = FALSE)

# dplyr package + backends
# From https://github.com/rocker-org/rocker-versioned2/blob/b8d23396468c5dc73115cce6c5716424d80ffcb0/scripts/install_tidyverse.sh#L30
dplyr_packages = c(
  "dplyr", "1.0.2",
  "arrow", "2.0.0",
  "dbplyr", "2.0.0",
  "DBI", "1.1.0",
  "dtplyr", "1.0.1",
  "nycflights13", "1.0.2",
  "Lahman", "8.0-0",
  "RMariaDB", "1.1.0",
  "RPostgres", "1.3.0",
  "RSQLite", "2.2.1",
  "fst", "0.9.4"
)

# From https://github.com/rocker-org/rocker-versioned2/blob/b8d23396468c5dc73115cce6c5716424d80ffcb0/scripts/install_verse.sh#L82
publishing_packages = c(
  "tinytex", "0.28",
  "blogdown", "0.21",
  "bookdown", "0.21",
  "rticles", "0.18",
  "rmdshower", "2.1.1",
  "rJava", "0.9-13",
  "xaringan", "0.19"
)

# R packages to be installed that aren't from apt
# Combination of informal requests & rocker image suggestions
# Some of these were already in datahub image
cran_packages = c(
  "AER", "1.2-9",
  "BH", "1.72.0-3",
  "BiocManager", "1.30.10",
  "DBI", "1.1.0",
  "FNN", "1.1.3",
  "IRkernel", "1.1.1",
  "Matrix", "1.3-0",
  "R.methodsS3", "1.8.1",
  "R.oo", "1.24.0",
  "R.utils", "2.10.1",
  "RCSF", "1.0.2",
  "RColorBrewer", "1.1-2",
  "RCurl", "1.98-1.2",
  "RNetCDF", "2.4-2",
  "RandomFields", "3.3.8",
  "RandomFieldsUtils", "0.5.3",
  "Rcpp", "1.0.5",
  "RcppProgress", "0.4.2",
  "assertthat", "0.2.1",
  "base64enc", "0.1-3",
  "bibtex", "0.4.2.3",
  "bindrcpp", "0.2.2",
  "broom", "0.7.3",
  "checkr", "0.5.0",
  "clipr", "0.7.1",
  "crayon", "1.3.4",
  "crosstalk", "1.1.0.1",
  "curl", "4.3",
  "data.table", "1.13.6",
  "dichromat", "2.0-0",
  "digest", "0.6.27",
  "docopt", "0.7.1",
  "e1071", "1.7-4",
  "evaluate", "0.14",
  "forcats", "0.5.0",
  "future", "1.21.0",
  "gdalUtils", "2.0.3.2",
  "gdtools", "0.2.3",
  "geoR", "1.8-1",
  "geometry", "0.4.5",
  "geosphere", "1.5-10",
  "gert", "1.0.2",
  "ggplot2", "3.3.3",
  "git2r", "0.27.1",
  "globals", "0.14.0",
  "glue", "1.4.2",
  "gstat", "2.0-6",
  "haven", "2.3.1",
  "hdf5r", "1.3.3",
  "here", "1.0.1",
  "highr", "0.8",
  "hms", "0.5.3",
  "htmlwidgets", "1.5.3",
  "httpuv", "1.5.4",
  "httr", "1.4.2",
  "intervals", "0.15.2",
  "ivpack", "1.2",
  "jsonlite", "1.7.2",
  "knitr", "1.30",
  "units", "0.6-7",
  "leafem", "0.1.3",
  "leaflet", "2.0.3",
  "leafpop", "0.0.6",
  "leafsync", "0.1.0",
  "learnr", "0.11.2",
  "lfe", "3.0-0",
  "linprog", "0.9-2",
  "listenv", "0.8.0",
  "lpSolve", "5.6.15",
  "lubridate", "1.7.9.2",
  "lwgeom", "0.2-13",
  "magic", "1.5-9",
  "manipulateWidget", "0.10.1",
  "mapdata", "2.3.0",
  "mapproj", "1.2.7",
  "maptools", "1.0-2",
  "mapview", "2.9.0",
  "markdown", "1.1",
  "matrixStats", "0.57.0",
  "memoise", "1.1.0",
  "miniUI", "0.1.1.1",
  "modelr", "0.1.8",
  "ncdf4", "1.17",
  "ncmeta", "0.3.0",
  "nlme", "3.1-151",
  "openssl", "1.4.3",
  "packrat", "0.5.0",
  "pander", "0.6.3",
  "pbdZMQ", "0.3-4",
  "pillar", "1.4.7",
  "png", "0.1-7",
  "praise", "1.0.0",
  "proj4", "1.0-10",
  "proto", "1.0.0",
  "pryr", "0.1.4",
  "rapportools", "1.0",
  "raster", "3.4-5",
  "rdrobust", "2.0.2",
  "readr", "1.4.0",
  "readxl", "1.3.1",
  "redland", "1.0.17-14",
  "rematch", "1.0.1",
  "repr", "1.1.0",
  "reprex", "0.3.0",
  "reshape", "0.8.8",
  "reticulate", "1.34.0",
  "rgeos", "0.5-5",
  "rgl", "0.103.5",
  "rjson", "0.2.20",
  "rlang", "0.4.10",
  "rlas", "1.3.8",
  "rlist", "0.4.6.1",
  "rmarkdown", "2.6",
  "rpart", "4.1-15",
  "rprojroot", "2.0.2",
  "rsconnect", "0.8.16",
  "satellite", "1.0.2",
  "selectr", "0.4-2",
  "shiny", "1.5.0",
  "sp", "1.4-4",
  "spacetime", "1.2-3",
  "spatialreg", "1.1-5",
  "spatstat", "1.64-1",
  "spatstat.data", "1.7-0",
  "spdep", "1.1-5",
  "splancs", "2.01-40",
  "stargazer", "5.2.3",
  "stars", "0.4-3",
  "stringi", "1.5.3",
  "stringr", "1.4.0",
  "summarytools", "0.9.8",
  "svglite", "1.2.3.2",
  "systemfonts", "0.3.2",
  "testit", "0.12",
  "testthat", "3.0.4",
  "tibble", "3.0.4",
  "tidync", "0.2.4",
  "tidyr", "1.1.2",
  "tidyverse", "1.3.0",
  "tmap", "3.2",
  "tmaptools", "3.1",
  "tufte", "0.9",
  "utf8", "1.1.4",
  "uuid", "0.1-4",
  "viridis", "0.5.1",
  "vroom", "1.3.2",
  "whoami", "1.3.0",
  "widgetframe", "0.3.1",
  "withr", "2.3.0",
  "xfun", "0.19",
  "xml2", "1.3.2",
  "xts", "0.12.1",
  "yaml", "2.2.1"
  )

class_libs_install_version("Base packages", cran_packages)
class_libs_install_version("dplyr packages", dplyr_packages)
class_libs_install_version("publishing packages", publishing_packages)

# Bioconductor packages present in rocker images
# FIXME: Find a way to version these?
# FIXME: Make sure these are binary installs?
BiocManager::install('rhdf5')
BiocManager::install('Rhdf5lib')
