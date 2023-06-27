
pathotypeR_process <- function(indir, suffix){
  
  filenames <- list.files(indir, full.names=TRUE)
  filenames2 <- list.files(indir)
  samplelist <- gsub(suffix,"",filenames2) 
  
  mydfs <- lapply(filenames, function(df){
    tryCatch(read.table(df,
                        sep="\t",
                        comment.char="",
                        check.names = FALSE,
                        quote="",
                        header=TRUE,
                        stringsAsFactors=FALSE),
             
             error=function(e) NULL)
  })
  
  names(mydfs) <- samplelist
  df <- plyr::ldply(mydfs,.id="sample")
  
  return(df)
  
}
