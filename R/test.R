
# Load libraries
library(tidyverse)
library(tm)

# Read input file to character vector
test <- readLines("test.txt")


# Use tm library

# Read to VCorpus
testCorpus <- VCorpus(VectorSource(test))


# Transformations
testCorpus <- testCorpus %>%
  tm_map(stripWhitespace) %>%
  tm_map(content_transformer(tolower)) %>%
  tm_map(removeNumbers)


# Create Term-Document matrix
DocTermMat <- DocumentTermMatrix(testCorpus,
                                 control = list(wordLengths=c(2,Inf)))

DocTermMat

inspect(DocTermMat)



# Term frequency
colSums(as.matrix(DocTermMat))
