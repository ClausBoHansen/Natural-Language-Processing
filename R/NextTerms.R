# Filename "NextTerms.R"
# Defines function NextTerms, which looks up most likely next words among commonStrings
# NextTerms requires unigrams, bigrams, trigrams and quadgrams to be defined in the environment


NextTerms <- function(inputText = "") {
  
  # Load libraries
  library(tidyverse)
  
  # Determine if last character in input string is a space, i.e. we have no letter from the word we are to predict
  partialWord <- (substr(inputText, nchar(inputText), nchar(inputText)) != " ")
  
  # Dictionaries
  dictionary <- c("unigrams", "bigrams", "trigrams", "quadgrams")
  
  cat("Starting NextTerms\n")
  inputText <- str_squish(inputText) # Remove excess blanks
  inputText <- str_replace_all(inputText, "[^[:alpha:] ]", "")
#  print(inputText)

  matchFound <- FALSE
  
    
  if (partialWord)
    # Part of word entered, predict the rest
    {
#    cat("Partial word\n")
    # Search for string, start with quadgrams, then trigrams, then bigrams lastly unigrams
    i <- 3
    while (!matchFound & i >= 0) {
      matchstring <- str_match(inputText, paste("([:alpha:]+ ){", i ,"}[:alpha:]+$", sep = ""))[1]
      if (!is.na(matchstring)) {
#        print(matchstring)
#        cat(paste("Searching in ", dictionary[i+1], "\n", sep = ""))
        matches <- eval(as.name(dictionary[i+1]))[which(startsWith(eval(as.name(dictionary[i+1]))$term, matchstring)),]
#        print(dim(matches))
        if (dim(matches)[1] > 1 | (dim(matches)[1] == 1 & nchar(matchstring) < nchar(matches[1]))) matchFound <- TRUE
        # Remove potential identical match
        if (dim(matches)[1] > 1) matches <- matches[which(nchar(matches$term) > nchar(matchstring)),]
#        print(matches)
      }
      i <- i -1
    }
    
    
  } else
    # Last character entered was a blank, i.e. no letters known from the word to predict
    {
#      cat("Not partial word\n")
      # Search for string, start with quadgrams, then trigrams and lastly bigrams
      i <- 3
#      matchFound <- FALSE
      while (!matchFound & i >= 1) {
        matchstring <- str_match(inputText, paste("([:alpha:]+ ){", i-1 ,"}[:alpha:]+$", sep = ""))[1]
        if (!is.na(matchstring)) {
#          print(matchstring)
#          cat(paste("Searching in ", dictionary[i+1], "\n", sep = ""))
          matches <- eval(as.name(dictionary[i+1]))[which(startsWith(eval(as.name(dictionary[i+1]))$term, paste(matchstring, " ", sep = ""))),]
#          print(dim(matches))
          if (dim(matches)[1] > 0) matchFound <- TRUE
#          print(matches)
        }
        i <- i -1
      }
    
    }
  
  if (matchFound)
  {
    result <- matches %>%
      arrange(desc(count)) %>%
      mutate(term = str_match(term, "[:alpha:]+$"))
    
  } else
  {
    result <- NA
  }

  
  result
  
}

