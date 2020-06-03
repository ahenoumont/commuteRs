#' Aggregate Xwalk to Census Tract
#'
#' Aggegates Crosswalk file by Census Tract. 10-digit code for subdivision of county (Fips + 5-digit tract code)
#' @param data Crosswalk tibble
#'
#' @return  A tibble with:
#' \itemize{
#'   \item trct: tract code
#'   \item trctname: tract name
#'   \item fips: county code
#'   \item county: county name
#'   \item state: state name
#'   \item cbsa: core based statistical area code
#'   \item cbsaname: core based statistical area name
#' }
#'
#' @export
aggregate_tract <- function(data){

  data <-  data %>%
    select(trct, trctname,
           fips = cty,
           county = ctyname,
           state = stusps,
           cbsa, cbsaname) %>%
    distinct()

  return(data)
}
