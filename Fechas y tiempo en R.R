#POSIXct o POSIXlt
#Las fechass se representan con la clase Date

#Dates and Times
x<-as.Date("1970-01-01")
x
unclass(x)
unclass(as.Date("1970-01-02"))
unclass(as.Date("1970-01-03"))


x<-Sys.time()
x
p<-as.POSIXlt(x)
p
names(unclass(p))
p$yday
p$mday
p$wday
p$isdst
p$zone
p$gmtoff
x
unclass(x)
x$sec


#Funciones de ciclo
lapply
x<-list(a=1:100,b=c(1,3,5,7),c=50:1)
x
lapply(x,mean) #Esta función pudo servir para el caso del contaminante
#lapply es una lista

sapply(x,mean) #sapply es un vector

lapply(1:4,runif)
set.seed(1)
lapply(1:4,runif)

sapply(1:4,runif) #Lo entrega igual que lapply porque no lo puede simplificar


