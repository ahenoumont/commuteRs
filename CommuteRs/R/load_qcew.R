load_qcew <-
function(year, destination=NULL) {  
  
  url <- paste0("https://data.bls.gov/cew/data/files/", year, "/xls/", year, "_all_county_high_level.zip")
  dest <- ifelse(str_sub(destination, -1) == "/", 
                 str_sub(destination, 1, -2),
                 destination) %>% 
    paste(sep = "/", getwd(), .) %>% str_replace_all("/", "\\\\")
  # download zip
  temp <- tempfile()
  download.file(url, temp)
  # unzip
  unzip(temp, exdir = dest)
  unlink(temp)
}
