---
output: 
  html_document: 
    theme: journal
---
# Benem�rita Universidad Aut�noma de Puebla
## Facultad de Ciencias F�sico Matem�ticas
### Licenciatura en Actuaria
#### Programaci�n Actuarial III
#### Caso: Reconocimiento de Actividad Humana con Celulares

El prop�sito de este proyecto es demostrar tu habilidad para recolectar, trabajar y limpiar base de datos. 

## Acerca de la base de datos

Una mayor descripci�n de la base de datos y su recopilaci�n puede ser hallada en la siguiente liga: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Archivos en el proyecto

El proyecto contiene los siguintes archivos:

* `./datasets/UCI HAR Dataset`
* `README.md`: Descripci�n de los pasos para hacer el an�lisis. 
* `CodeBook.md`: Aparecen todas las variables, la base de datos y las transformaciones se realizaron.
* `run_analysis.R`: C�digo que hace el an�lisis.

## Correr el an�lisis de la base de datos

Para realizar el an�lisis se debe de correr el c�digo `coreer_analisis.R`. El an�lisis har� lo siguinete:

1. Une los datos de test con los de training, para crear un solo conjunto de datos.
2. Extrae �nicamente las medidas de media y desviaci�n est�ndar de cada medici�n. 
3. Usa nombres de actividad para describir los nombres de las actividades en la base de datos.
4.Coloca etiquetas apropiadas en la base de datos con nombres de variables que las describan. 
5. Con los datos del paso 4, crea una segunda base de datos independiente con el promedio de cada variable para cada actividad y cada sujeto. 

### Paquetes Adicionales

Se utiliz� el paquete `dplyr`

```r
library(dplyr)
```

### Funcionamiento del c�digo

El c�digo `correr_analisis.R` hace lo siguiente:

#### Declarar las direcciones
1. Une los datos de test con los de training, para crear un solo conjunto de datos

Primero, todas las direcciones de los archivos que tienen que unirse deben de declararse. Esto se encuentra en la primera parte del c�digo.

Donde primero declaramos el directorio donde vamos a estar trabajando, para posteriormente ingresar a los datos de `test` y a los de `training`. 

```r
 setwd("~/test-repo/Caso 3/UCI HAR Dataset")    
    g<-getwd()
    #Cargar los datos
        training_set <- read.table(paste(g,"train/X_train.txt",sep = "/"),quote ="\"")
        test_set <- read.table(paste(g,"test/X_test.txt",sep = "/"),quote ="\"")
```
Despu�s, creamos un solo conjunto de datos, al cual llamaremos `data_set` que es con el que estaremos trabajando a lo largo del c�digo.

```r
        data_set <- rbind(training_set,test_set) #Toma los argumentos y combina por filas
        #data_set[1:4,1:5]
    
    #Quitar data que no se usa
        rm(test_set,training_set)

```
#### Extracci�n de medidas
2. Extrae �nicamente las medidas de media y desviaci�n est�ndar de cada medici�n.

En esta parte ingresamos al archivo `features.txt` para obtener los encabezados de `data_set`.

```r
        features_name <- read.table(paste(g,"features.txt",sep = "/"),quote ="\"")[,2]
        colnames(data_set) <- features_name
```

Como nos interesa extraer �nicamente las medidas de media y desviaci�n est�ndar de cada medici�n utilizaremos `grepl` que se encarga de buscar coincidencias respecto a un argumento o patr�n, en este caso nuestro patr�n es `'-(mean|std)\\('`. 

```r
        Medidas_Seleccionadas <- grepl('-(mean|std)\\(',features_name) #Busca coincidencias en el vector
```

Para finalizar con este paso, actualizamos estas medidas seleccionadas para que aparezcan en `data_set`.

```r
        data_set <- subset(data_set,select=Medidas_Seleccionadas) #Devuelve subsets 
        #data_set[1:4,1:5]
```

#### Etiquetas apropiadas
4. Coloca etiquetas apropiadas en la base de datos con nombres de variables que las describan 

Nos saltamos al paso 4 porque primero necesitamos nombrar cada columna en nuestra base de datos.

```r
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
```

#### Nombres de Actividades
3. Usa nombres de actividad para describir los nombres de las actividades en la base de datos

Primero, declaramos la direcci�n para obtener `actividades_train` y `actividades_test`, despu�s tomamos los argumentos y combinamos por filas.

```r
        actividades_train <- read.table(paste(g,"train/y_train.txt",sep = "/"),quote ="\"")
        actividades_test <- read.table(paste(g,"test/y_test.txt",sep = "/"),quote ="\"")
        actividades <- rbind(actividades_train,actividades_test)[,1]
```

Notemos que en el experimento se vieron 6 diferentes actividades, las cuales utilizaremos para describir los nombres en la base de datos.

```r
        labels <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS",
                "SITTING", "STANDING", "LAYING")
        actividades <- labels[actividades]
        data_set <- cbind(Actividad = actividades,data_set)
        #data_set[1:4,1:5]
```

#### Promedio de cada Variable
5. Con los datos del paso 4, crea una segunda base de datos independiente con el promedio de cada variable para cada actividad y cada sujeto.

Ahora nos interesamos en la direcci�n que nos lleva a los voluntarios, los cuales son 30 en total. Combinamos por filas y despu�s actualizamos `data_set` para que aparezcan los voluntarios como columna.

```r
        voluntario_train <- read.table(paste(g,"train/subject_train.txt",sep = "/"),quote ="\"")
        voluntario_test <- read.table(paste(g,"test/subject_test.txt",sep = "/"),quote ="\"")
        voluntarios <- rbind(voluntario_train,voluntario_test)[,1]
        data_set <- cbind(Voluntario = voluntarios,data_set) 
        #data_set[1:4,1:5]
```

Por �ltimo, utilizamos el paquete `dplyr` que nos ayudara a manipular nuesta data facilmente. Creamos nuestra segunda base de datos donde vendr�n los promedios de cada variable para cada actividad y cada voluntario.

```r
        library(dplyr) #paquete que ayuda a manipular data facilmente
        prom_data_set <- data_set %>% group_by(Voluntario,Actividad) %>% summarise_each(funs(mean))
        #%>% encadena operaciones
```

Y creamos un archivo llamado `"tidy_data_set.txt"` donde aparecer� la base de datos ordenada.

```r
        write.table(prom_data_set,row.name = FALSE,file = "tidy_data_set.txt") 
```
***
Rangel Sevilla Celia Alejandra