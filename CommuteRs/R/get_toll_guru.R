get_toll_guru <-
function(lat_o, lng_o, lat_d, lng_d, return=FALSE){
#Inputs: geocoordinates for home and work county centroid
#Output: API body for tollguru API
  home <- list(lat=lat_o, lng=lng_o)
  work <- list(lat=lat_d, lng=lng_d)
  
  if(return == FALSE){
    return(
      toJSON(auto_unbox = TRUE,
             list(from=home, to=work,
                  vehicleType= '2AxlesAuto',
                  departure_time= '2020-03-04T08:00:00')
      ))  
  } 
  else {
    return(
      toJSON(auto_unbox = TRUE,
             list(from=work, to=home,
                  vehicleType= '2AxlesAuto',
                  departure_time= '2020-03-04T17:00:00')
      )
    )
  } 
}
