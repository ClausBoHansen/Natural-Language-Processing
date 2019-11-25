
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
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation)


# Create Term-Document matrix
DocTermMat <- DocumentTermMatrix(testCorpus,
                                 control = list(wordLengths=c(2,Inf)))

DocTermMat

inspect(DocTermMat)



# Term frequency
colSums(as.matrix(DocTermMat))


# Now with bigrams
BigramTokenizer <- function(x) unlist(lapply(ngrams(words(x), 2), paste, collapse = " "), use.names = FALSE)

# Create Term-Document matrix
DocTermMat <- DocumentTermMatrix(testCorpus,
                                 control = list(wordLengths=c(2,Inf),
                                                tokenize = BigramTokenizer))

DocTermMat

inspect(DocTermMat)

