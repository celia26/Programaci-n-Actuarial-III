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
    
    moneda <- rbinom(1,1,0.5)
    
    if (moneda==1){
        z <- z+1
        g[k]<-z
        
    } else {
        z <- z-1
        g[k]<- z
    }
    
    k <- k+1
}

print(g)