#' Aggregate Origin Destination Flow
#'
#' @param data The output from get commuter flow
#' @param level Specified aggregation level.
#' @import dplyr
#' @return A tibble
#' @export
#'
#'
aggregate_flow <- function(data){

  data <- data %>%
    mutate_at(vars(ends_with("geocode")), ~str_sub(as.character(.), end = 5)) %>%
    group_by_at(vars(ends_with("geocode"))) %>%
    summarize_each(sum) %>%
    select(ends_with("geocode"),
           total = S000,
           age_under29 = SA01, age_30to54 = SA02, age_over54 = SA03,
           earn_under1250 = SE01, earn_1250to3333 = SE02, earn_over3333 = SE03,
           industry_mfg = SI01, industry_trans = SI02, industry_svcs = SI03)%>%
    rename_all(str_replace, pattern = "geocode", replacement = "fips")

  return(data)
}
