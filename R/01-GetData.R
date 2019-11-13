# Filename "01-GetData.R"
# Loads the data into R

# Make sure that environment is empty
rm(list=ls())

# Load configuration
source("Config.R")

# Extract zipped input file
system(paste("unzip ", inputDir, inputfile, " -d ", outputDir, sep = ""))




# Load libraries
#save(allData, file = paste(subdir ,"/01-GetData-allData.RData", sep = ""))



