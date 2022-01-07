#q8 - second edition of ISLR

#read dataset "college"
college <- read.csv("college.csv", header=T, na.strings = "NA",stringsAsFactors = T)
View(college)

#give each row a name
rownames(college) <- college[, 1]
View(college)

#delete the first row that was Uni names
college <- college[, -1] #all rows but no column 1
View(college)

#it's still col 1 because "rownames" isn't treated as data

#dimension of dataset
dim(college) #777 x 18

#summary stats 
summary(college)

#scatter plot of pairs for the first 10 cols 
pairs(college[,2:11])

#plot side-by-side boxplots of outstate and private
plot(college$Private, college$Outstate)

#ran into error about NA values
#seeing how NA's look in dataset
# college <- na.omit(college)
# dim(college)
# sum(is.na())

#add a new column called Elite
#fill it with all "No"
Elite <- rep("No", nrow(college))
#elite schools have more than 50% of the class from top10% of highschoolers
Elite[college$Top10perc > 50] <- "Yes"
Elite <- as.factor(Elite)
#add Elite to dataframe 
college <- data.frame(college,Elite)
View(college)

#how many are elite schools
summary(college)
#78 are elite, 699 are not

#boxplots of Outstate vs Elite 
plot(college$Elite,college$Outstate)


#look at some histograms
attach(college)
par(mfrow=c(2,2)) #partition plots so all 4 fit
hist(Apps, breaks = 50)
hist(Room.Board, breaks = 50)
hist(Books, breaks = 50)
hist(Personal, breaks = 50)




