#' get_lodes
#'
#' @description Retrieve LEHD Origin-Destination Employment Statistics. LEHD makes available several data products that may be used to research and characterize workforce dynamics for specific groups. More information can be found at \link{https://lehd.ces.census.gov/data/}
#'
#' @param state lowercase, 2-letter postal code for a chosen state
#' @param year Year of job data. Can have the value of 2002-2015 for most states.
#' @param part Part of the state file, can have a value of either “main” or “aux”. Complimentary parts of the state file, the main part includes jobs with both workplace and residence in the state and the aux part includes jobs with the workplace in the state and the residence outside of the state.
#' @param type Job Type, can have a value of “00” for All Jobs (default), “01” for Primary Jobs, “02” for All Private Jobs, “03” for Private Primary Jobs, “04” for All Federal Jobs, or “05” for Federal Primary Jobs.
#'
#' @return A tibble
#' @import readr
#' @export
#'
#'
get_lodes <- function(state, year, part = "main", type = "00") {
  if(!is.character(state) || length(state) != 2){
    stop("State parameter must be 2-character string")
  }
  if(as.integer(year) < 2002 && as.integer(year) > 2017)  {
    stop("year must be integer between 2002 and 2017")
  }

  base_url <- "https://lehd.ces.census.gov/data/lodes/LODES7/"
  url <- paste0(base_url, state, "/od/", state, "_od_", part, "_JT", part, "_", year, ".csv.gz")

  data <- readr::read_csv(url, col_types = paste(c(rep("c", 2), rep("d", 11)), collapse = ""))

  return(data)
}

