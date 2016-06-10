#1  Une los datos de test con los de training, para crear un solo conjunto de 
#   datos
    setwd("~/test-repo/Caso 3/UCI HAR Dataset")    
    g<-getwd()
    #Cargar los datos
        training_set <- read.table(paste(g,"train/X_train.txt",sep = "/"),quote ="\"")
        test_set <- read.table(paste(g,"test/X_test.txt",sep = "/"),quote ="\"")
        data_set <- rbind(training_set,test_set) #Toma los argumentos y combina por filas
        #data_set[1:4,1:5]
    
    #Quitar data que no se usa
        rm(test_set,training_set)
    
#2  Extrae únicamente las medidas de media y desviación estándar de cada 
#   medición 
    
        features_name <- read.table(paste(g,"features.txt",sep = "/"),quote ="\"")[,2]
        colnames(data_set) <- features_name
        Medidas_Seleccionadas <- grepl('-(mean|std)\\(',features_name) #Busca coincidencias en el vector
        data_set <- subset(data_set,select=Medidas_Seleccionadas) #Devuelve subsets 
        #data_set[1:4,1:5]
    
#4  Coloca etiquetas apropiadas en la base de datos con nombres de variables que
#   las describan 
    
        colnames(data_set) <- gsub("mean", "Mean", colnames(data_set))
        colnames(data_set) <- gsub("std", "Std", colnames(data_set))
        colnames(data_set) <- gsub("t", "Time", colnames(data_set))
        colnames(data_set) <- gsub("f", "Frequency", colnames(data_set))
        colnames(data_set) <- gsub("\\(\\)", "", colnames(data_set))
        colnames(data_set) <- gsub("-", "", colnames(data_set))
        colnames(data_set) <- gsub("BodyBody", "Body", colnames(data_set))
        colnames(data_set) <- gsub("^", "MeanOf", colnames(data_set))
        colnames(data_set)
        #data_set[1:4,1:5]
    
    
#3  Usa nombres de actividad para describir los nombres de las actividades en la
#   base de datos
    
        actividades_train <- read.table(paste(g,"train/y_train.txt",sep = "/"),quote ="\"")
        actividades_test <- read.table(paste(g,"test/y_test.txt",sep = "/"),quote ="\"")
        actividades <- rbind(actividades_train,actividades_test)[,1]
        labels <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS",
                "SITTING", "STANDING", "LAYING")
        actividades <- labels[actividades]
        data_set <- cbind(Actividad = actividades,data_set)
        #data_set[1:4,1:5]
    
    
#5. Con los datos del paso 4, crea una segunda base de datos independiente con 
#   el promedio de cada variable para cada actividad y cada sujeto.
    
        voluntario_train <- read.table(paste(g,"train/subject_train.txt",sep = "/"),quote ="\"")
        voluntario_test <- read.table(paste(g,"test/subject_test.txt",sep = "/"),quote ="\"")
        voluntarios <- rbind(voluntario_train,voluntario_test)[,1]
        data_set <- cbind(Voluntario = voluntarios,data_set) 
        #data_set[1:4,1:5]
    
        library(dplyr) #paquete que ayuda a manipular data facilmente
        prom_data_set <- data_set %>% group_by(Voluntario,Actividad) %>% summarise_each(funs(mean))
        #%>% encadena operaciones
        write.table(prom_data_set,row.name = FALSE,file = "tidy_data_set.txt")    
    
