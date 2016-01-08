analyze.sunlight.data <- function(Access.summary){
  # Top 10 open data states
  Access.summary %>% select(State, Open) %>% top_n(10, Open) %>% arrange(desc(Open))
}
