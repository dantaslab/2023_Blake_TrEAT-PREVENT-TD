calc_mlst <- function(df, cohort = c("TrEAT", "Cusco")){
  
  df <- df %>%
    filter(cohort == cohort) %>%
    select(sample_seqID, mlst)
  
  num_sampl<- length(df$sample_seqID)
  
  output<- df %>% 
    dplyr::group_by(mlst) %>% 
    dplyr::summarise(Cnt = n(), 
                     prev = round(Cnt/num_sampl, 4)) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(desc(Cnt))
  
  return(output)
  
}
