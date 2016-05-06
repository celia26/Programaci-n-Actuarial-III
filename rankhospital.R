rankhospital <- function(estado, resultado, num = "mejor") {
#Lectura de datos 
    data <- read.csv("outcome-of-care-measures.csv")
    
#Revisión de la validez de estado y resultado 
    estados <- levels(data[, 7])[data[, 7]] #Columna de los codigos de estado
    CodigoEstado <- FALSE
    
    for (i in 1:length(estados)) {
        if (estado == estados[i]) {
            CodigoEstado <- TRUE
        }
    }
    
    if (!CodigoEstado) {
        stop ("estado invalido")
    }
    
    if (!((resultado == "ataque") | (resultado == "falla")
          | (resultado == "neumonia"))) {
        stop ("resultado invalido")
    }
    
#Regresa el nombre del hospital con el puesto dado de la tasa más  
#baja de mortalidad de 30 días 
    col <- if (resultado == "ataque") {
        11 #columna de Heart Attack
    } else if (resultado == "falla") {
        17 #columna de Heart Failure
    } else {
        23 #columna de pneumonia
    }    
    
    data[, col] <- suppressWarnings(as.numeric(levels(data[, col])[data[, col]]))
    data[, 2] <- as.character(data[, 2])
    
    DataEstado <- data[grep(estado, data$State), ]
    
    Ordenar_Data <- DataEstado[order(DataEstado[, col], DataEstado[, 2], na.last = NA), ]
    if(num == "mejor") {
        Ordenar_Data[1, 2]
    } else if(num == "peor") {
        Ordenar_Data[nrow(Ordenar_Data), 2]
    } else{
        Ordenar_Data[num, 2]
    }
}

rankhospital("TX", "falla", 4)
rankhospital("MD", "ataque", "peor") 
rankhospital("MN", "ataque", 5000)

