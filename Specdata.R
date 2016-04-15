mediacontaminante<-function(directorio,contaminante,id=1:332)
    
directorio <- getwd()
i <-"001.csv"
x<-paste(directorio,i,sep="/")

read.csv(x)
promedio<-function(column){
    l<-ncol(column)
    y<-vector("numeric",l)
    for(i in 1:l){
        y[i]<-mean(column[,i],na.rm = FALSE)
    }
    y
}
promedio(read.csv(x))

    
    
    
    
    