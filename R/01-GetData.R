# Filename "01-GetData.R"
# Loads the data into R

# Make sure that environment is empty
rm(list=ls())

# Load configuration
source("Config.R")

# Extract zipped input file
system(paste("unzip ", inputDir, inputfile, " -d ", outputDir, sep = ""))


locale <- "en_US"
contentSources <- c("blogs", "news", "twitter")
for (contentSource in contentSources) {
  fileConnection <- file(paste(outputDir, "final/", locale, "/", locale, ".", contentSource, ".txt", sep = ""))
  assign(contentSource, readLines(fileConnection))
  close(fileConnection)
}




# rbinom for creating a random sample of input

# Save data
save(blogs,
     news,
     twitter,
     file = paste(outputDir ,"01-GetData.RData", sep = ""))



######
# Interesting package: tm