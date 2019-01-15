## remember to restart R here!

## create a data frame by reading from data/installed-packages.csv
## hint: readr::read_csv() or read.csv()
## idea: try using here::here() to create the file path

## filter out the base and recommended packages
## keep the variables Package and Built
## if you use dplyr, code like this will work:
# apt <- ipt %>%
#   filter(is.na(Priority)) %>%
#   select(Package, Built)

## write this new, smaller data frame to data/add-on-packages.csv
## hint: readr::write_csv() or write.table()
## idea: try using here::here() to create the file path

## make a frequency table of package by the version in Built
## if you use dplyr, code like this will work:
# apt_freqtable <- apt %>%
#   count(Built) %>%
#   mutate(prop = n / sum(n))

## write this data frame to data/add-on-packages-freqtable.csv
## hint: readr::write_csv() or write.table()
## idea: try using here::here() to create the file path

## YES overwrite the files that are there now
## they are old output from me (Jenny)
## they are just examples


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


#### Read in the data --------------------------------

ipt <- readr::read_csv(
  here::here("data",
             "installed-packages.csv")
)

dplyr::glimpse(ipt)


#### Filter out the base and recommended packages --------------------------------

apt <- ipt %>%
  dplyr::filter(is.na(Priority)) %>%
  dplyr::select(Package, Built)


#### Make a frequnecy table of Package by version --------------------------------

apt_freqtable <- apt %>%
  dplyr::count(Built) %>%
  mutate(prop = n / sum(n))

apt_freqtable


#### Write to file --------------------------------

readr::write_csv(
  x = apt_freqtable,
  path = here::here("data",
                    "add-on-packages-freqtable.csv")
)
