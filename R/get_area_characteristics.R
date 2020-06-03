#' get_area_characteristics
#'
#' This loads either the Residence Area Characteristics or Workplace Area Characteristics data files. This is count data for jobs dissagregated down to census block.
#'
#'
#' @param st 2-digit state abreviation
#' @param seg Segment of the workforce, can have the values of “S000”, “SA01”, “SA02”, “SA03”, “SE01”, “SE02”, “SE03”, “SI01”, “SI02”, or “SI03”. These correspond to the same segments of the workforce as are listed in the OD file structure above.
#' @param type Job Type, can have a value of “JT00” for All Jobs, “JT01” for Primary Jobs, “JT02” for All Private Jobs, “JT03” for Private Primary Jobs, “JT04” for All Federal Jobs, or “JT05” for Federal Primary Jobs.
#' @param year Year of job data. Can have the value of 2002-2015 for most states.
#' @param dataset Either "rac" for residence or "wac" for workplace
#'
#' @import readr
#' @import dplyr
#' @return A tibble
#' @export
#'
#' @examples
#' nj_residence <- get_area_characteristics(st = "nj", year = 2017, dataset = "rac")
get_area_characteristics <-
function(st, year, dataset, seg = "S000", type = "JT00") {

  filename <- paste(sep = "_", st, dataset, seg, type, year) %>% paste0(".csv.gz")
  url <- paste(sep = "/", "https://lehd.ces.census.gov/data/lodes/LODES7", st, dataset, filename)
  data <- read_csv(file = url)
  data <- mutate_at(data, vars(contains("geocode")), as.character)
  return(data)
}
