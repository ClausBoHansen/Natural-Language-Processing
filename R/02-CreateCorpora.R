# Filename "02-CreateCorpora.R"
# Explore data and create datasets to support presentation

# Make sure that environment is empty
rm(list=ls())

# Load libraries
library(tidyverse)
library(tm)


# Load configuration
source("Config.R")

# Load data
load(paste(outputDir, "01-GetData.RData", sep = ""))


# Running one at the time might be needed if memory is exhausted
#contentSources <- c("blogs", "news", "twitter")
contentSources <- c("twitter")
#contentSources <- c("blogs")

prefixes <- c("uni", "bi", "tri", "quad")

#test <- readLines("test.txt")


# For n-grams
for (contentSource in contentSources) {

  # Read to VCorpus
  inputCorpus <- VCorpus(VectorSource(eval(as.name(contentSource))))

    # Transformations
  inputCorpus <- inputCorpus %>%
    tm_map(stripWhitespace) %>%
    tm_map(content_transformer(tolower)) %>%
    tm_map(removeNumbers) %>%
    tm_map(removePunctuation)
  
  
  
  for (i in 1:4) {
    # Define tokenizer
    Tokenizer <- function(x) unlist(lapply(ngrams(words(x), i), paste, collapse = " "), use.names = FALSE)
    
    # Define name of resulting object
    outputFileName <- paste(outputDir, contentSource, "-", prefixes[i], "grams.RData", sep = "")
    
    # Calculate Document Term Matrix
    DocTerms <- DocumentTermMatrix(inputCorpus,
                                              control = list(wordLengths=c(2,Inf),
                                                             tokenize = Tokenizer))
    # Save Document Term Matrix to separate file
    save(DocTerms, file = outputFileName)
    

    gc()
    
  } # for (i in 1:4)
} # for (contentSource in contentSources)


rm(DocTerms)
