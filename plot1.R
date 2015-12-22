#firstly, we need to use unzip function to get two .rds files: 1) summarySCC_PM25.rds; 2)Source_Classification_Code.rds
#Second, Using readRDS function that is a function to write a single R object to a file, and to restore it.
#Primeramente, tenemos que usar la funcion unzip para obtener 2 archivos .rds: 1) summarySCC_PM25.rds; 2)Source_Classification_Code.rds
#segundo, Usando la funcion readRDSq que es una funcion que escribe a un objeto R para un archivo e para restaurarlo.
#primeiramente, temos que unsar a função unzip para ter dois archivos .rds: 1) summarySCC_PM25.rds; 2)Source_Classification_Code.rds
#segundo, usando a função readRDS que é uma função que escreve um objeto R como um archivo e para restituri.
#In primo, abbiamo bisogno di usare la funzione di decompressione per ottenere due file .rds: 1) summarySCC_PM25.rds; 2)Source_Classification_Code.rds
#In secondo luogo, Utilizzando la funzione readRDS chè é una funzione per scrivere un singolo oggetto R in un file e di ripristinarlo
unzip("exdata-data-NEI_data.zip")
NEI <- readRDS("summarySCC_PM25.rds")             #PM2.5 Emissions Data
SCC <- readRDS("Source_Classification_Code.rds")  #Source Classification Code


totalNEI<-tapply(NEI$Emissions, INDEX=NEI$year, sum)     #Sum emissions per year
barplot(totalNEI, main = "Total Emissions by Year", xlab="Year", ylab="Emissions")