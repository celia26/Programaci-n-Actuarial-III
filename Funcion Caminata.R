f<-function(x,y){
    g<- vector("numeric", x)
    
    for (i in 1:x) {
    g[i] <- y
    moneda <- runif(1)
    if (moneda<=0.5){
        y <- y+0.5
    } else {
        y <- y-0.5
    }
}
print(g)
plot(g, type = "l")
}   
f(500,20)