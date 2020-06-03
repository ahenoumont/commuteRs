#' Aggregate Xwalk to County
#'
#' Aggegates Crosswalk file by fips or county code.
#' @param data Crosswalk tibble
#'
#' @import dplyr
#'
#' @return  A tibble with:
#' \itemize{
#'   \item fips: county code
#'   \item county: county name
#'   \item state: state name
#'   \item cbsa: core based statistical area code
#'   \item cbsaname: core based statistical area name
#'  }
#'
#' @export
aggregate_county <- function(data){

  data <-  data %>%
    select(fips = cty,
           county = ctyname,
           state = stusps,
           cbsa, cbsaname) %>%
    distinct()

  return(data)
}
