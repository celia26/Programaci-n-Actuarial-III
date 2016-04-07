mediacontaminante <- function(directorio, contaminante, id = 1:332) {
    data <-numeric()
    
    for(i in id) {
        dirFinal<- read.csv(paste(directorio, "/", formatC(i, width = 3, flag = "0"), 
                                  ".csv", sep = "")) #ejemplo: specdata/001.csv
        data <-c(data, dirFinal[[contaminante]]) #vector de tamaño uno que indica
        #el nombre del contaminante
    }
    return(mean(data, na.rm = TRUE)) #regresa la media del contaminante ignorando Na
}

mediacontaminante("specdata", "nitrate", 70:72)    
mediacontaminante("specdata", "sulfate", 1:10)    

