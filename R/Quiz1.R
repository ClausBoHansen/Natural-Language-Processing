# Answers to Quiz 1

# Make sure that environment is empty
rm(list=ls())

# Load configuration
source("Config.R")

# Load data
load(paste(outputDir ,"01-GetData.RData", sep = ""))


# The  en_US.blogs.txt \verb| en_US.blogs.txt |en_US.blogs.txt file is how many megabytes?
# Answer: 200

# The en_US.twitter.txt\verb|en_US.twitter.txt|en_US.twitter.txt has how many lines of text?
# Answer: Over 2 million

# What is the length of the longest line seen in any of the three en_US data sets? 
max(nchar(blogs))
max(nchar(news))
max(nchar(twitter))
# Answer: Over 40 thousand in the blogs data set


# In the en_US twitter data set, if you divide the number of lines where the word "love" (all lowercase)
# occurs by the number of lines the word "hate" (all lowercase) occurs, about what do you get?
length(twitter[which(grepl("love", twitter))]) / length(twitter[which(grepl("hate", twitter))])
# Answer : 4.108592


# The one tweet in the en_US twitter data set that matches the word "biostats" says what?
twitter[which(grepl("biostats", twitter))]
# Result: "i know how you feel.. i have biostats on tuesday and i have yet to study =/"
# which is not among the options
# Not correct: They just enrolled in a biostat program
# Correct: They haven't studied for their biostats exam



# How many tweets have the exact characters "A computer once beat me at chess, but it was no
# match for me at kickboxing". (I.e. the line matches those characters exactly.)
length(twitter[which(grepl("A computer once beat me at chess, but it was no match for me at kickboxing", twitter))])
# Answer: 3