rankingcompleto <- function(resultado, num = "mejor") {
# Lectura de datos 
    data <- read.csv("outcome-of-care-measures.csv")
    
# Revisión de la validez de estado y resultado  
    if (!((resultado == "ataque") | (resultado == "falla")
          | (resultado == "neumonia"))) {
        stop ("resultado invalido")
    }
    
# Para cada estado, encuentra el hospital con la posición dada.
    col <- if (resultado == "ataque") {
        11 #columna de Heart Attack
    } else if (resultado == "falla") {
        17 #columna de Heart Failure
    } else {
        23 #columna de pneumonia
    }
    
    data[, col] <- suppressWarnings(as.numeric(levels(data[, col])[data[, col]]))
    data[, 2] <- as.character(data[, 2])
    
    resultadoFin <- vector() #Vector vacío para llenar luego 
    estados <- levels(data[, 7])
    
    for(i in 1:length(estados)) {
        DataEstado <- data[grep(estados[i], data$State), ]
        Ordenar_Data <- DataEstado[order(DataEstado[, col], DataEstado[, 2], na.last = NA), ]
        
        hospital <- if(num == "mejor") {
            Ordenar_Data[1, 2]
        } else if(num == "peor") {
            Ordenar_Data[nrow(Ordenar_Data), 2]
        } else{
            Ordenar_Data[num, 2]
        }
        
        resultadoFin <- append(resultadoFin, c(hospital, estados[i])) 
        #append agrega elementos al vector que teniamos vacio al inincio
    }
    
# Regresa un data frame con el nombre del hospital y la abreviatura
# del nombre del estado al que pertenece.
    resultadoFin <- as.data.frame(matrix(resultadoFin, length(estados), 2, byrow = TRUE))
    colnames(resultadoFin) <- c("hospital", "estado")
    rownames(resultadoFin) <- estados
    
    resultadoFin
}


head(rankingcompleto("ataque", 20), 10) 
tail(rankingcompleto("neumonia", "peor"), 3) 
tail(rankingcompleto("falla"), 10) 

