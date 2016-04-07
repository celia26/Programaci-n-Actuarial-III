completos <- function(directorio, id = 1:332) {
    nobs <- numeric()
    for(i in id) {
        dirFinal<- read.csv(paste(directorio, "/", formatC(i, width = 3, flag = "0"), 
                                  ".csv", sep = "")) #ejemplo: specdata/001.csv
        nobs <-c(nobs, sum(complete.cases(dirFinal))) #numero de casos completos
    }
    return(data.frame(id, nobs)) 
}
completos("specdata",30:25)
completos("specdata",c(2,4,8,10,12))
