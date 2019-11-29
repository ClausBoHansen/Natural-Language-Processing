# Filename "05-CreateTermFrequencies.R"
# Combine document term matrices and reduce to term frequencies

# Make sure that environment is empty
rm(list=ls())

# Load libraries
library(tidyverse)
library(tm)

# Minimum occurences of term in each corpus (blogs, news, twitter) to be included in combined term frequency list
ngramThreshold <- c("uni" = 50,
                    "bi" = 50,
                    "tri" = 50,
                    "quad" = 50)

# Load configuration
source("Config.R")

# Load data
corpustypes <- c("uni", "bi", "tri", "quad")
#corpustypes <- c("tri")

contenttypes <- c("blogs", "news", "twitter")

for (corpustype in corpustypes) {
  
  varname <- paste(corpustype, "grams", sep = "")

  for (contenttype in contenttypes) {
    
    datafilename <- paste(contenttype, "-", corpustype, "grams.RData", sep = "")
    load(paste(outputDir, datafilename, sep = ""))
    termfreqs <- slam::col_sums(DocTerms)
    termfreqs <- termfreqs[which(termfreqs > ngramThreshold[corpustype])]
    termscol <- names(termfreqs)
    termfreqs <- as.data.frame(termfreqs)
    colnames(termfreqs) <- c("count")
    termfreqs$term <- termscol
    assign(contenttype, termfreqs)

  }
  
  combinedtermfreqs <- rbind(blogs, news, twitter) %>%
    group_by(term) %>%
    summarise(count = sum(count)) %>%
    filter(grepl("^[a-z ]*$", term))
  assign(varname, combinedtermfreqs)

}

# Save data
save(unigrams,
     bigrams,
     trigrams,
     quadgrams,
     file = paste(outputDir ,"05-CreateTermFrequencies.RData", sep = ""))



