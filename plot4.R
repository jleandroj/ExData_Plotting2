#firstly, we need to use unzip function to get two .rds files: 1) summarySCC_PM25.rds; 2)Source_Classification_Code.rds
#Second, Using readRDS function that is a function to write a single R object to a file, and to restore it.
#Primeramente, tenemos que usar la funcion unzip para obtener 2 archivos .rds: 1) summarySCC_PM25.rds; 2)Source_Classification_Code.rds
#segundo, Usando la funcion readRDSq que es una funcion que escribe a un objeto R para un archivo e para restaurarlo.
#primeiramente, temos que unsar a função unzip para ter dois archivos .rds: 1) summarySCC_PM25.rds; 2)Source_Classification_Code.rds
#segundo, usando a função readRDS que é uma função que escreve um objeto R como um archivo e para restituri.
#In primo, abbiamo bisogno di usare la funzione di decompressione per ottenere due file .rds: 1) summarySCC_PM25.rds; 2)Source_Classification_Code.rds
unzip("exdata-data-NEI_data.zip")
NEI <- readRDS("summarySCC_PM25.rds")             #PM2.5 Emissions Data
SCC <- readRDS("Source_Classification_Code.rds")  #Source Classification Code
library(ggplot2)
greps1<-unique(grep("coal", SCC$EI.Sector, ignore.case=TRUE, value=TRUE))  
#Isolate instances of "coal" in SCC column EI.Sector

data1<-subset(SCC, EI.Sector %in% greps1)    #Subset SCC by coal labels
coal<-subset(NEI, SCC %in% data1$SCC)        #Subset NEI by data1 overlaps

ggplot(data=coal, aes(x=year, y=Emissions, fill = type)) + 
  geom_bar(stat="identity", position=position_dodge()) + 
  ggtitle("U.S. Coal Combustion-Related Emissions: 1999-2008")