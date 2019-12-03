# Answers to Quiz 3

# Make sure that environment is empty
rm(list=ls())

# Load configuration
source("Config.R")

# Load NextTerm function
source("NextTerms.R")

# Load data
load(paste(outputDir ,"05-CreateTermFrequencies.RData", sep = ""))



res <- NextTerms("When you breathe, I want to be the air for you. I'll be there for you, I'd live and I'd ") %>%
  filter(term %in% c("give", "sleep", "die", "eat"))

res <- NextTerms("Guy at my table's wife got up to go to the bathroom and I asked about dessert and he started telling me about his ") %>%
  filter(term %in% c("marital", "spiritual", "financial", "horticultural"))

