#' get_weighted_centers
#'
#' This function calculates the center of the population within the county. Collects
#' block code information in LODES data files and calulates geographic center. This is usefull to improve directions API calls.
#'
#' @param st 2-digit state abreviation
#' @param year year
#' @param rac TRUE (default) for residence center or FALSE for workplace center
#'
#' @return A tibble with fips, latitude, and longitude collumns
#' @export
#'
#' @examples
#' nj_cty_rac_centers <- get_weighted_centers("nj", 2017)
get_weighted_centers <-
function(st, year, rac = TRUE){

  place <- ifelse(rac == TRUE, "rac", "wac")

  area_characteristics <- get_area_characteristics(st, year, place) %>%
    select(geocode = contains("geocode"), C000)

  #Coords
  blocks <- state_xwalk(st) %>%
    select(geocode = tabblk2010, lat = blklatdd, lon = blklondd) %>%
    mutate(geocode = as.character(geocode))

  # Join
  data <- area_characteristics %>%
    left_join(blocks, by = "geocode") %>%
    mutate(fips = str_sub(geocode, end = 5)) %>%
    group_by(fips) %>%
    summarise(
      lat = weighted.mean(lat, C000),
      lon = weighted.mean(lon, C000)
      )
  return(data)
}
