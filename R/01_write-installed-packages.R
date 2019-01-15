## deja vu from earlier!

## create a data frame of your installed packages
## hint: installed.packages() is the function you need

## optional: select just some of the variables, such as
##   * Package
##   * LibPath
##   * Version
##   * Priority
##   * Built

## write this data frame to data/installed-packages.csv
## hint: readr::write_csv() or write.table()
## idea: try using here::here() to create the file path

## YES overwrite the file that is there now (or delete it first)
## that's a old result from me (Jenny)
## it an example of what yours should look like and where it should go


#### Load packages --------------------------------

pacman::p_load(
  tidyverse,     # packages ggplot2, dplyr, tidyr, readr, purrr, tibble,
                 # stringr, and forcats
  broom,         # functions tidy(), glance(), augment()
  fs,            # Cross-platform interface to file system operations
  glue,          # Glue strings to data in R
  here,          # Constructs paths to your project's files
  janitor,       # for working with dirty data
  mice,          # Multiple imputation using Fully Conditional Specification
  naniar,        # structures, summaries, and visualisations for missing data
  readxl         # read in excel files
)


#### Installed packages --------------------------------

ipt <- installed.packages() %>%
  tibble::as_tibble()

dplyr::glimpse(ipt)


#### Select certain columns --------------------------------

ipt <- ipt %>%
  dplyr::select(Package,
                LibPath,
                Version,
                Priority,
                Built)

dplyr::glimpse(ipt)


#### Write to file --------------------------------

readr::write_csv(
  x = ipt,
  path = here::here("data",
                    "installed-packages.csv")
)
