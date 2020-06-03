#' Load State Crosswalk
#'
#' This loads the geography crosswalk for the state file. This a relationship file
#' that establishes the hierarchical connection between each 2010 census tabulation
#' block and all higher level geographic entities supported by the OnTheMap system.
#'
#'
#' @param state Two letter state abreviation code
#'
#' @importFrom stringr str_to_lower
#' @importFrom readr read_csv
#'
#' @return data frame of the state meta data
#'
#' @export
#'
#' @examples
#' new_york_info <- state_xwalk('ny')
state_xwalk <- function(state){

  st <- stringr::str_to_lower(state)
  filename <- paste0(st, "_xwalk.csv.gz")
  url <- paste(sep = "/", "https://lehd.ces.census.gov/data/lodes/LODES7/", st, filename)

  data <- readr::read_csv(url)

  return(data)
}

