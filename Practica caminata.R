#Estructuras de control
x<-11
if (x>3){
    y<-10
}else{
    y<-5
}
y

x<-2
y<-if(x>3){
    10
}else{
    5
}
y


a<-10*runif(1)

if (a[1]<3){
    x<-"Hola"
}else if(a[1]<5){
        x<-"que onda"
}else if(a[1]<6){
        x<- "que pedo"
}else if(a[1]<8){
        x<- "que pex"
}else if(a[1]<10){
        x<-"quiubo"
}
x

#Ejemplo for
for (i in c(2,55,9)){
    print(i)
}

for (i in 10:1){
    print(i)
}

x<-c("a","b","c","d")
for(i in 1:4){
    print(x[i])
}

for(i in seq_along(x)){
    print(x[i])
}

for(letra in x){
    print(letra)
}

for(i in 1:4)print(x[i])

x<-matrix(1:6,2,3)
x
for(i in seq_len(nrow(x))){
    for(j in seq_len(ncol(x))){
        print(x[i,j])
    }
}

x<-matrix(1:6,2,3,T)
x
for(i in seq_len(nrow(x))){
    for(j in seq_len(ncol(x))){
        print(x[i,j])
    }
}

#Prueba de Funcionamiento
n<-10000
mensajes <-vector("character",n)
for(i in 1:n){
    y<-runif(1)
    if(y<=0.30){
        mensajes[i]<-("Mensaje de 30%")
    }else if(y<=0.50){
        mensajes[i]<-("Mensaje del 20% a")
    }else if(y<=0.70){
        mensajes[i]<-("Mensaje del 20% b")
    }else if(y<=0.90){
        mensajes[i]<-("Mensaje del 20% c")
    }else{
        mensajes[i]<-("Mensaje del 10%")
    }
}
mensajes
table(mensajes)
plot(table(mensajes))

contador<-0
while(contador<=10){
    print(contador)
    contador<-contador+1
}

for(i in 1:10){
    j<-0
    while(j>10){
        j<-j+1
        if(j>10000){
            print(j)
            break
        }
    }
    print(i)
}

z<-5
k<-1
while(z>=3 && z<=10){
    print(z)
    moneda<-runif(1)
    if(moneda<=0.5){
        z<-z+1
    }else { 
        z<-1
    }
    k<-k+1
    if(k>=100000)break
}

z <- 5
k <- 1
g<- vector("numeric", 0)

while (z>=3 && z<=10) {
    length(g) <- length(g)+1
    g[k] <- z
    moneda <- runif(1)
    
    if (moneda<=0.5){
        z <- z+0.5
    } else {
        z <- z-0.5
    }
    k <- k+1
    if (k>5000) break
}
print(g)
plot(g, type = "l")

miSuma<-function(x,y){
    x+y
}
miSuma(1,3)
miSuma(1:5,3)
miSuma(1:5,5:1)

mayor10<-function(x){
    validos<-x>10
    x[validos]
}

mayor<-function(x,y){
    x[x>y]
}
mayor(1:100,50)

airquality
promedioCols<-function(x,na.rm=TRUE){
    l<-ncol(x)
    y<-vector("numeric", l)
    for(i in 1:l){
        y[i]<-mean(x[,i],na.rm =na.rm)
    }
    y
}
promedioCols(airquality)

library(ggplot2)

