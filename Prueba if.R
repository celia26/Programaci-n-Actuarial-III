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