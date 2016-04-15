a <- runif(10,50,100);hist(a)
a <- runif(100,50,100);hist(a)
a <- runif(1000,50,100);hist(a)
a <- runif(10000,50,100);hist(a)
a <- runif(100000,50,100);hist(a)
a <- runif(1000000,50,100);hist(a)

hist(rnorm(10,100,10))
hist(rnorm(100,100,10))
hist(rnorm(1000,100,10))
hist(rnorm(10000,100,10))
hist(rnorm(100000,100,10))
hist(rnorm(1000000,100,10))

hist(rexp(1000000,1))
hist(rexp(1000000,.011))

hist(rgamma(1000000,5,0.5))

n<-10000
sumas <- vector("numeric",n)
for (i in 1:n){
    sumas[i]<-sum(rexp(n),1)
}
hist(sumas)

#Suma de muchas variables aleatorias te crea una distribución normal 

n<-1000 #var por prueba
m<-1000 #cantidad de prueba
promedio<- sapply(lapply(rep(n,m),runif),mean)
promedio<- sapply(lapply(rep(n,m),runif,max=100,min=50),mean)
hist(promedio)

f<-function()