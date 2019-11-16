# Filename "02-ExploreData.R"
# Explore data and create datasets to support presentation

# Make sure that environment is empty
rm(list=ls())

# Load configuration
source("Config.R")

# Load data
load(paste(outputDir, "01-GetData.RData", sep = ""))


contentSources <- c("blogs", "news", "twitter")
for (contentSource in contentSources) {
  assign(paste("frequencyAll", contentSource, sep = ""), termFreq(eval(as.name(contentSource)), control = list(wordLengths = c(2, Inf))))
  assign(paste("frequencyReduced", contentSource, sep = ""), termFreq(eval(as.name(contentSource)), control = list(wordLengths = c(2, Inf),
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
     frequencyReducedblogs,
     frequencyReducednews,
     frequencyReducedtwitter,
     file = paste(outputDir ,"02-ExploreData.RData", sep = ""))


