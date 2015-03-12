a <- 1:5 ## list with 5 elements
b <- rnorm(10) ## list with 10

foo  <- list(a, b)
lapply(foo,mean)

length (a)
length (b)
## lapply returns a list, where a is still the 1st element, b still the 2nd.

bar <- 1:4
unif_x <- lapply(bar, runif)  

## runif takes each element of x as an argument, returning a list of 4 elements
## first element has length 1, second length 2, etc.
## which you can tell using lapply, 

## OR SAPPLY...

## sapply is like lapply, but better. If the elements of the list returned by 
## lapply are the same length, sapply makes a vector/matrix of it. If it can't, 
## just acts like lapply.

unif_lengths <- sapply(unif_x, length)
unif_lengths

## ANONYMOUS FUNCTIONS, to do things R can't do.

thing <- list(a = matrix(1:4, 2,2), b= matrix(1:6, 3,2))

## suppose you want to exract the first column from each matrix:

lapply(thing, funciton(elt) elt [,1])

## the function created here is defined within the funciton (notice no comma)
## it allows you to extract the first column ([,1]) of elt.
## lapply will take elt in your anonymous funciton to be the i's of the list in thing.


## GET READY FOR THIS SHIT:
## apply

x <- matrix(1:20, 20, 10)
dim(x)
MeanDim1 <- apply(x, 1, mean)
MeanDim1
## MeanDim1 gets the mean of each row and returns a vector of 20. (1st dimension)
MeanDim2 <- apply(x, 2, mean)
MeanDim2
## MeanDim2 gets the mean of each colum and returns a vector of 10 (2nd dimension)

## using apply and the predefined functions for sums/means of rows/cols is the same.

MeanDim1_1 <- rowMeans(x)
MeanDim2_2 <- colMeans(x)
MeanDim1_1==MeanDim1
MeanDim2_2==MeanDim2

norm_matrix <- matrix(rnorm(200), 20, 10)
quant_rows <- apply(norm_matrix, 1, quantile, probs=c(0.25, 0.75))
quant_cols <- apply(norm_matrix, 2, quantile, probs=c(0.25, 0.75))

## TAPPLY, if you want to execute a function on groups in a dataframe. (like min, max, mean, etc)
## tapply will return the same amount of elements as there are factors. 

medical.example <-
        data.frame(patient = 1:100,
                   age = rnorm(100, mean = 60, sd = 12),
                   treatment = gl(2, 50,
                                  labels = c("Treatment", "Control")))

Med_ex_summary <- summary(medical.example)
Med_ex_tapp <- tapply(medical.example$age, medical.example$treatment, mean)
Med_ex_summary
Med_ex_tapp ## class(medical.example$treatment) is factor.

baseball.example <-
        data.frame(team = gl(5, 5,
                             labels = paste("Team", LETTERS[1:5])),
                                player = sample(letters, 25),
                                batting.average = runif(25, .200, .400))

baseball_summary <- summary(baseball.example)
baseball_tapp <- tapply(baseball.example$batting.average, baseball.example$team,
                        max)

baseball_summary
baseball_tapp ## class(baseball.example$team) is factor

## Why is class(Med_ex_tapp) or class(baseball_app) an array?? DOES ANYONE KNOW???

