get.sunlight.data <- function(){

library(googlesheets)

# google sheets link: https://docs.google.com/spreadsheets/d/1e4VMZ2zySEW4PK049WBlaJQJT8Y4KCZpBZK_8xDQ9Ng/edit?usp=sharing
sunlight <- "1e4VMZ2zySEW4PK049WBlaJQJT8Y4KCZpBZK_8xDQ9Ng" %>% gs_key()

sunlight.data <- data.frame()

# for each sheet in sunlight, append data to a data frame
for (i in 1:sunlight$n_ws){
     df <- gs_read(sunlight, ws = i)
     # Fix header row issues
     if(i == 7){
          names(df)[21] <- "Access.type"
     } else if (i %in% c(9,30)){
          names(df)[1] <- "State"
     }
     sunlight.data <- rbind(sunlight.data, df)
}

}
