mejor<-function(estado, resultado) {
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
    
#Regresa el nombre del hospital con la tasa más baja de mortalidad de 30 días 
    col <- if (resultado == "ataque") {
        11 #columna de Heart Attack
    } else if (resultado == "falla") {
        17 #columna de Heart Failure
    } else {
        23 #columna de pneumonia
    }
    
    data[, col] <- suppressWarnings(as.numeric(levels(data[, col])[data[, col]]))
    data[, 2] <- as.character(data[, 2]) #nombres Hospitales
    
    DataEstado <- data[grep(estado, data$State), ]
    #grep busca coincidencias con el argumento para cada elemento de un vector de 
    #caracteres
    
    Ordenar_Data <- DataEstado[order(DataEstado[, col], DataEstado[, 2], na.last = NA), ]
    Ordenar_Data[1, 2]
}

mejor("TX", "ataque") 
mejor("TX", "falla") 
mejor("MD", "ataque")
mejor("MD", "neumonia")
mejor("BB", "ataque")
mejor("NY", "atakue")

