n<-1000 #var por prueba
m<-100 #cantidad de prueba

promedio<- sapply(lapply(rep(n,m),runif),mean)
hist(promedio)

#Tarea 
gu <- function(VarPrueba,CantidadPrueba,Distribucion){
  promedio<- sapply(lapply(rep(VarPrueba,CantidadPrueba),Distribucion),mean)
  hist(promedio)
}
gu(1000,100,runif)
############################
gu <- function(VarPrueba,CantidadPrueba,Distribucion,Calcular){
  Calculo<- sapply(lapply(rep(VarPrueba,CantidadPrueba),Distribucion),Calcular)
  hist(Calculo)
}
gu(1000,100,runif,mean)
gu(1000,100,runif, sum)