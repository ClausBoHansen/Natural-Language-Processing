# Answers to Quiz 3

# Make sure that environment is empty
rm(list=ls())

# Load configuration
source("Config.R")

# Load NextTerm function
source("NextTerms.R")

# Load data
load(paste(outputDir ,"05-CreateTermFrequencies.RData", sep = ""))



# Not give
# Correct: die
NextTerms("When you breathe, I want to be the air for you. I'll be there for you, I'd live and I'd ") %>%
  filter(term %in% c("give", "sleep", "die", "eat"))


# Not financial
# Not spiritual
# Correct: maritial
NextTerms("Guy at my table's wife got up to go to the bathroom and I asked about dessert and he started telling me about his ") %>%
  filter(term %in% c("marital", "spiritual", "financial", "horticultural"))

# Not morning
# Correct: weekend
NextTerms("I'd give anything to see arctic monkeys this ") %>%
  filter(term %in% c("weekend", "month", "morning", "decade"))

# Correct: stress
NextTerms("Talking to your mom has the same effect as a hug and helps reduce your ") %>%
  filter(term %in% c("happiness", "sleepiness", "hunger", "stress"))

# Not look
# Correct: picture
NextTerms("When you were in Holland you were like 1 inch away from me but you hadn't time to take a ") %>%
  filter(term %in% c("look", "walk", "minute", "picture"))

# Not case
# Correct: matter
NextTerms("I'd just like all of these questions answered, a presentation of evidence, and a jury to settle the ") %>%
  filter(term %in% c("incident", "case", "account", "matter"))

# Correct: hand
NextTerms("I can't deal with unsymetrical things. I can't even hold an uneven number of bags of groceries in each ") %>%
  filter(term %in% c("hand", "arm", "finger", "toe"))

# Correct: top
NextTerms("Every inch of you is perfect from the bottom to the ") %>%
  filter(term %in% c("top", "center", "middle", "side"))

# Correct: outside
NextTerms("I’m thankful my childhood was filled with imagination and bruises from playing ") %>%
  filter(term %in% c("weekly", "daily", "outside", "inside"))

# Correct: movies
NextTerms("I like how the same people are in almost all of Adam Sandler ") %>%
  filter(term %in% c("novels", "stories", "movies", "pictures"))

