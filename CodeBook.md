---
output: 
  html_document: 
    theme: journal
---
# Benemérita Universidad Autónoma de Puebla
## Facultad de Ciencias Físico Matemáticas
### Licenciatura en Actuaria
#### Programación Actuarial III
#### CodeBook :Reconocimiento de Actividad Humana con Celulares


## Despcipción de la base de datos

Los experimentos se han llevado a cabo con un grupo de 30 voluntarios dentro de un grupo de edad de 19-48 años. Cada persona lleva a cabo seis actividades (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) usando un teléfono inteligente (Samsung Galaxy S II) en la cintura. 

A través de su acelerómetro incorporado y giroscopio, hemos capturado aceleración lineal 3-axial y velocidad angular 3-axial a una velocidad constante de 50 Hz. Los experimentos han sido grabadas en vídeo para etiquetar los datos de forma manual. El conjunto de datos obtenidos se ha dividido aleatoriamente en dos grupos, en los que se seleccionó el 70% de los voluntarios para la generación de los datos de entrenamiento y 30% de los datos de prueba.

Las señales del sensor (acelerómetro y giroscopio) fueron pre-procesados mediante la aplicación de filtros de ruido y luego se muestrean en deslizamiento de ancho fijo ventanas de 2,56 seg y 50% de solapamiento (128 lecturas / ventana). La señal de aceleración del sensor, que tiene componentes gravitacionales y el movimiento del cuerpo, se separó usando un filtro de paso bajo Butterworth en aceleración cuerpo y la gravedad. La fuerza de la gravedad se supone que tiene sólo componentes de baja frecuencia, por lo tanto, se utilizó un filtro con 0,3 Hz frecuencia de corte. A partir de cada ventana, un vector de características se obtuvo mediante el cálculo de las variables de tiempo y el dominio de la frecuencia.

### Datos Originales

La base de datos contiene:

* Un vector de 561 variables de tiempo y el dominio de la frecuencia. 
* Sus etiquetas de actividades.
* Un identificador del voluntario que participó en el experimento.

Las señales fueron utilizadas para estimar variables del vector para cada patrón:
'-XYZ' es utilizado para denotar señales de 3 ejes en direcciones X, Y y Z.

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

El conjunto de variables que se estimaron a partir de estas señales son:

mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range   
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal   
kurtosis(): kurtosis of the frequency domain signal   
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window. 
angle(): Angle between to vectors.  

Vectores adicionales obtenidos mediante las señales en una muestra de ventana de señal. Son utilizados en la variable angle():

gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  

## Transformaciones

Las siguientes transformaciones son las que se han aplicado a la base de datos original:

### Une los datos de test con los de training, para crear un solo conjunto de datos

Los datos de test y los de training se juntaron. En la versión original se encuentran divididos en dos archivos.

### Extrae únicamente las medidas de media y desviación estándar de cada medición

Solo se dejaron las medidas de media y desviación estándar. Lo cual significa que de los 561 datos en el vector, se redujeron a 66.

### Usa nombres de actividad para describir los nombres de las actividades en la base de datos

Se agregaron a la base de datos los voluntarios y las actividades. El voluntario es un entero entre 1 - 30 y la actividad es el vector que describe 6 actividades:

1. WALKING   
2. WALKING_UPSTAIRS  
3. WALKING_DOWNSTAIRS  
4. SITTING  
5. STANDING  
6. LAYING  

### Coloca etiquetas apropiadas en la base de datos con nombres de variables que las describan

Las columnas se volvieron a nombrar para volverlas entendibles. Se utilizó el siguiente patrón:

* Nombre original: `tBodyGyroJerk-mean()-X`
* Nuevo nombre: `MeanOfTimeBodyGyroJearkMeanX`


### Con los datos del paso 4, crea una segunda base de datos independiente con el promedio de cada variable para cada actividad y cada sujeto.

Todos los valores son promedios, agregados 30 voluntarios y 6 actividades , por lo tanto, el conjunto de datos resultante es de 180 filas por 68 columnas .

***
Rangel Sevilla Celia Alejandra