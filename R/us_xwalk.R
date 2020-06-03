#' United States FIPS Crosswalk File
#'
#' The lookup table can be used for a county level analysis within a core-based statistical
#' area (CBSA). This table combines the state crosswalk data files available in the LEHD Origin-Destination
#' Employment Statistics (LODES) from the US Census. Use this data set to quickly find the counties within
#' a metropolitan area.
#'
#' Metropolitan and Micropolitan Statistical Areas are collectively referred to as Core-Based Statistical Areas.
#' \itemize{
#'   \item{Metropolitan statistical areas have at least one urbanized area of 50,000 or more population, plus
#' adjacent territory that has a high degree of social and economic integration with the core as measured by
#' commuting ties.}
#'   \item{Micropolitan statistical areas are a new set of statistical areas that have at least one urban
#'   cluster of at least 10,000 but less than 50,000 population, plus adjacent territory that has a high degree
#'   of social and economic integration with the core as measured by commuting ties.}
#' }
#'
#' For a more detailed analysis see \code{state_xwalk()}. This function retrieves state-wide dataset down to the block level.
#'
#' @format A data frame with 3,215 rows and 5 variables:
#' \describe{
#'   \item{fips}{5-digit fips code}
#'   \item{county}{county name}
#'   \item{state}{state abbreviation}
#'   \item{cbsa}{Core-based statistical area code}
#'   \item{cbsaname}{Core-based statistical area name}
#'   ...
#' }
#' @source
#' ^[Core-Based Statistical Areas. US Census. \url{https://www.census.gov/topics/housing/housing-patterns/about/core-based-statistical-areas.html]}
#' \url{https://lehd.ces.census.gov/data/lodes/LODES7/}
"us_xwalk"
