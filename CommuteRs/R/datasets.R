# Datasets in package
library(devtools)

industry_codes <- readr::read_csv("https://data.bls.gov/cew/doc/titles/industry/industry_titles.csv", col_types = "cc")
names(industry_codes) <- c("code", "industry_title")
dplyr::glimpse(industry_codes)

us_xwalk <- readr::read_csv("data/us_xwalk.csv", col_types = 'ccccc')
dplyr::glimpse(us_xwalk)

use_data(us_xwalk, overwrite = TRUE)
use_data(industry_codes, overwrite = TRUE)
