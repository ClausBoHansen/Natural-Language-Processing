# Filename "02-ExploreData.R"
# Explore data and create datasets to support presentation

# Make sure that environment is empty
rm(list=ls())

# Load configuration
source("Config.R")

# Load libraries
library(tm)

# Load data
load(paste(outputDir, "01-GetData.RData", sep = ""))


contentSources <- c("blogs", "news", "twitter")
#prefixes <- c("uni", "bi", "tri")

for (contentSource in contentSources) {
  # Unigrams
  assign(paste("frequencyAll", contentSource, sep = ""), termFreq(eval(as.name(contentSource)), control = list(wordLengths = c(2, Inf))))
  assign(paste("frequencyAbove50", contentSource, sep = ""), termFreq(eval(as.name(contentSource)), control = list(wordLengths = c(2, Inf),
                                                                                                                   removeNumbers = TRUE,
                                                                                                                   removePunctuation = TRUE,
                                                                                                                   bounds = list(local = c(50, Inf)))))
}


# Save data
save(blogs,
     news,
     twitter,
     frequencyAllblogs,
     frequencyAllnews,
     frequencyAlltwitter,
     frequencyAbove50blogs,
     frequencyAbove50news,
     frequencyAbove50twitter,
     file = paste(outputDir ,"02-ExploreData.RData", sep = ""))


