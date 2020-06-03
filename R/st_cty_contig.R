#' st_cty_contig
#'
#' Gets neighbor list from state counties
#'
#' @param st 2 digit state abreviation
#'
#' @return A neighbor list with fips_o, fips_d,
#'
#' @importFrom tigris counties
#' @importFrom sf counties
#' @export
#'
#' @examples
#' ny_contig <- st_cty_contig("ny")
st_cty_contig <-
function(st){
  cty <- tigris::counties(st, class = "sf")

  contig <- sf::st_intersects(cty, sparse = F) %>%
  as.vector() %>%
  cbind(expand.grid(cty$GEOID, cty$GEOID), .) %>%
  set_names(c("geoid_o", "geoid_d", "contig"))

  return(contig)
}
