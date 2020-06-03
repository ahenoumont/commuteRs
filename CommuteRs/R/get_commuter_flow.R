#' Load Commuter Flows from LEHD
#'
#' Loads commuter flow data by state from the LEHD program from the US Census. This dataset includes the home-to-workplace relationships disaggregated by Census Block code.
#' This data is very detailed and can take a little while. After downloading, you can aggregate to county, tract, block group, etc.
#'
#'
#' @param st 2-letter postal code for a chosen state
#' @param part  Part of the state file, can have a value of either __“main”__(default) or __“aux”__. Complimentary parts of the state file, the main part includes jobs with both workplace and residence in the state and the aux part includes jobs with the workplace in the state and the residence outside of the state.
#' @param type  Job Type, can have a value of __JT00__ (default) for All Jobs, __JT01__ for Primary Jobs, “JT02” for All Private Jobs, “JT03” for Private Primary Jobs, “JT04” for All Federal Jobs, or “JT05” for Federal Primary Jobs.
#' @param year  Year of job data. Can have the value of 2002-2017 for most states. Puerto Rico and U.S. Virgin Island not included.
#'
#' @return A tibble
#'
#' @details The Census Bureau produces the Longitudinal Employer-Household
#' Dynamics (LEHD) Origin-Destination Employment Statistics (LODES), which can be used to
#' answer questions about spatial, economic, and demographic questions relating to workplaces and home-to-work flows.
#' This dataset is count data of workers' residence (__h_geocode__) and workplace (__w_geocode__) by 15-digit block code.
#'
#' @export
#'
#' @examples
#' # The main OD file of Primary Jobs in 2007 for California would be the file
#' df <- get_commuter_flow(st = "ca", part = 'main', type = "JT01", year = 2007)
get_commuter_flow <- function(st, part = "main", type = "JT00", year = 2017) {
  filename <- paste(sep = "_", st, "od", part, type, year) %>% paste0(".csv.gz")
  url <- paste(sep = "/", "https://lehd.ces.census.gov/data/lodes/LODES7", st, "od", filename)
  data <- read_csv(file = url)
  return(data)
}
