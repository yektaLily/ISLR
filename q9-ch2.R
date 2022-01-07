#Auto dataset
#load data

auto <- read.table("Auto.data", header = T, na.strings = "?", stringsAsFactors = T)
View(auto)

#remove missing values 
auto <- na.omit(auto) #281 rows affected 
dim(auto)

#which predictors are quant which are qualitative?
str(auto)

#mpg, displacement, horsepower, weight, acceleration are nums
#cylinders, year, origin are integers (nums)
#name is a factor 

#what is the range of each quantitative factor? 
for(i in 1:ncol(auto)){
  print(typeof(auto[,i]))
}

for(i in 1:ncol(auto)){
  if(typeof(auto[,i]) == "double" | typeof(auto[,i]) == "integer"){
    print(paste(names(auto)[i]," 's range is: ",range(auto[,i])))
  }else{
    print("nope.")
  }
}

#result: 
# [1] "mpg  's range is:  9"   
# [2] "mpg  's range is:  46.6"
# [1] "cylinders  's range is:  3"
# [2] "cylinders  's range is:  8"
# [1] "displacement  's range is:  68" 
# [2] "displacement  's range is:  455"
# [1] "horsepower  's range is:  46" 
# [2] "horsepower  's range is:  230"
# [1] "weight  's range is:  1613"
# [2] "weight  's range is:  5140"
# [1] "acceleration  's range is:  8"   
# [2] "acceleration  's range is:  24.8"
# [1] "year  's range is:  70"
# [2] "year  's range is:  82"
# [1] "origin  's range is:  1"
# [2] "origin  's range is:  3"

#mean and std of quant values
summary(auto)

#remove 10th row, 85th observation
auto1 <- auto[-10,-85]

summary(auto1)

#plots 
attach(auto)
par(mfrow=c(2,2))
plot(cylinders, horsepower, col="red", xlab="cylinders", ylab="horsepower")
plot(year, horsepower, col="green", xlab="year", ylab="horsepower")
plot(acceleration, horsepower, xlab="acceleration", ylab="horsepower")

#ploting against mpg 
par(mfrow=c(3,3))
plot(cylinders, mpg)
plot(horsepower, mpg)
plot(year, mpg)
plot(acceleration, mpg)
plot(weight, mpg)
plot(displacement, mpg)
