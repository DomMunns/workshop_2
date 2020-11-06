library(tidyverse)
# read in the first few lines to check what is in the first bit of the file 
file <- "http://www.ndbc.noaa.gov/view_text_file.php?filename=44025h2011.txt.gz&dir=data/historical/stdmet/"
readLines(file, n = 4)

# skip the first 2 lines are they are not needed 
buoy44025 <- read_table(file, 
                        col_names = FALSE,
                        skip = 2)

# read in the first 2 lines of the file to process them 
measure <-  scan(file,
                 nlines = 1,
                 what = character()) %>%
  str_remove("#")

units <-  scan(file,
               skip = 1,
                 nlines = 1,
                 what = character()) %>%
  str_remove("#") %>%
  str_replace("/", "_per_")
# want to remove hashes and slashes 
names(buoy44025) <- paste(measure, units, sep = "_")
