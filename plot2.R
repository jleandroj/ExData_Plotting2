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
baltimore<-subset(NEI, NEI$fips==24510)           #Subset Baltimore area
totalBaltimore<-tapply(baltimore$Emissions, INDEX=baltimore$year, sum)   #Sum emissions per year
barplot(totalBaltimore, main="Total Emissions in Baltimore, MD by Year", xlab="Year", ylab="Emissions")
