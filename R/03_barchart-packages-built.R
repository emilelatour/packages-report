## remember to restart R here!

## make a barchart from the frequency table in data/add-on-packages-freqtable.csv

## read that csv into a data frame
## hint: readr::read_csv() or read.csv()
## idea: try using here::here() to create the file path

## if you use ggplot2, code like this will work:
ggplot(apt_freqtable, aes(x = Built, y = n)) +
  geom_col()

## write this barchart to figs/built-barchart.png
## if you use ggplot2, ggsave() will help
## idea: try using here::here() to create the file path

## YES overwrite the file that is there now
## that's old output from me (Jenny)


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

#### Load fonts --------------------------------
# extrafont::fonts()  # Vector of font family names
# extrafont::fonttable()  # Show entire table
# extrafont::font_import()  # imports fonts installed on the system
extrafont::loadfonts(device = "win", quiet = TRUE)



#### Read in the data --------------------------------

apt_freqtable <- readr::read_csv(
  file = here::here("data",
                    "add-on-packages-freqtable.csv")
)

dplyr::glimpse(apt_freqtable)


#### Plot it --------------------------------

built_barchart <- ggplot(data = apt_freqtable,
       aes(x = Built,
           y = n)) +
  geom_bar(stat = "identity",
           width = 0.5) +
  scale_y_continuous(limits = c(0, 500),
                     breaks = pretty(c(0, 500)),
                     expand = c(0, 0)) +
  hrbrthemes::theme_ipsum(grid = "none",
                          axis_title_just = "mc") +
  theme(axis.line.x = element_line(color = "black")) +
  labs(title = "Number of installed packages",
       subtitle = "By version built under",
       y = "Number of packages",
       x = "")

built_barchart

#### Write to file --------------------------------

ggplot2::ggsave(filename = here::here("figs",
                                      "built-barchart.png"),
                plot = built_barchart,
                width = 6,
                height = 6 * 0.618
)
