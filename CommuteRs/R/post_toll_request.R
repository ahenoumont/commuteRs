post_toll_request <-
function(body){
#Toll guru POST call
  #Input: body
  #Output: Json file
  Tolls_Key = 'rV8CSuRCQG7LfdUqcKY2g628ABKPm5SD2L7C5G6x'
  Tolls_URL = 'https://dev.tollguru.com/v1/calc/here'
  
  POST(url = Tolls_URL, 
       body = body, 
       add_headers("", .headers = c(`x-api-key`=Tolls_Key))
  ) %>% 
    return()
  
}
