library(ISLR2)
Boston
?Boston

#how many rows and columns: 
dim(Boston) #506 rows, 13 columns 
na.omit(Boston)

attach(Boston)
#pairwise scatter plots 
par(mfrow=c(2,3))

plot(crim, medv, xlab='Crime')
plot(indus, medv, xlab='non-retail businesses')
plot(rm, medv, xlab='avg rooms')
plot(dis, medv, xlab='distance to BEC')
plot(tax, medv, xlab='tax')
plot(lstat, medv, xlab='% of low status pop')

#looks like when there is less crime, prices are higher 

#range of each predictor: 
print(paste("range of crime:", range(crim))) #0.006 to 89 % 
print(paste("range of teacher to student:", range(ptratio)))#12.6 to 22 
print(paste("range of tax:", range(tax))) #187 to 711 
print(paste("range of values:", range(medv))) #5 to 50


#how many bound the charles rivers? 
sum(chas)
#35 

#median teacher/pupil ration
median(ptratio)
#19.05

#which one has the lowest median value of owner occupied homes? 
which(medv == min(medv))
#census tract 399 has the lower median value at 406

Boston[which.min(medv),] # the whole row 

#how do the values for other things for this particular census tract 
#compare to the ranges? 

#crime seems to be around the middle 
#taxes are high
#teacher to student ratio is high 

#how many average more than 7 rooms? 
sum(which(rm > 7))
#14,337 

#more than 8 rooms 
sum(which(rm > 8))
#3020 

#comment on the ones that have more than 8 rooms: 
head(Boston[which(rm>8),])

#crimes are pretty low 
#median values are pretty high (max at 50, they're mostly over 40)
#most don't bound river 
#taxes are lower 

# crim zn indus chas    nox    rm  age    dis rad tax ptratio lstat
# 98  0.12083  0  2.89    0 0.4450 8.069 76.0 3.4952   2 276    18.0  4.21
# 164 1.51902  0 19.58    1 0.6050 8.375 93.9 2.1620   5 403    14.7  3.32
# 205 0.02009 95  2.68    0 0.4161 8.034 31.9 5.1180   4 224    14.7  2.88
# 225 0.31533  0  6.20    0 0.5040 8.266 78.3 2.8944   8 307    17.4  4.14
# 226 0.52693  0  6.20    0 0.5040 8.725 83.0 2.8944   8 307    17.4  4.63

# medv
# 98  38.7
# 164 50.0
# 205 50.0
# 225 44.8
# 226 50.0