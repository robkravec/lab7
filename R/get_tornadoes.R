# Function to read data by year
get_tornadoes <- function(year) {
  # Generate correct url, based on year
  url <- paste0("http://www.tornadohistoryproject.com/tornado/Oklahoma/",
                year, "/table")
  
  # Scrape web data and create table
  tor_table <- read_html(url) %>% 
    html_nodes("#results") %>% 
    html_table() %>% 
    .[[1]] %>% 
    row_to_names(row_number = 1) %>% 
    clean_names() %>% 
    select(spc_number:lift_lon) %>% 
    mutate(helper = ifelse(date == "Date", 1, 0)) %>% 
    filter(helper == 0) %>% 
    select(-c(helper))
  
  # Return data frame
  return(tor_table)
}

# Get data from relevant years
ok_tornadoes <- map_df(1998:2017, get_tornadoes)

# Save data
saveRDS(ok_tornadoes, file = "data/ok_tornadoes.rds")
