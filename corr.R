corr <- function(directorio, horizonte = 0) {
    source("completos.R")
    gu <- completos(directorio)
    ids <- gu[gu["nobs"] > horizonte, ]$id
    corr2 <- numeric()
    
    for(i in ids) {
        dirFinal <- read.csv(paste(directorio, "/", formatC(i, width = 3, flag = "0"), 
                                   ".csv", sep = "")) #ejemplo: specdata/001.csv
        ce<- dirFinal[complete.cases(dirFinal), ] #casos completos del dirFinal
        corr2 <- c(corr2, cor(ce$sulfate, ce$nitrate)) #Vector de correlacion
    }
    return(corr2) #regresa el vector de correlacion
}
cr <- corr("specdata", 1)
cr
head(corr("specdata",400))
