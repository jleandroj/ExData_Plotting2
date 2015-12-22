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
LA<-subset(NEI, NEI$fips=="06037") 

LAgasHeavy<-subset(LA, SCC %in% Gas_Heavy$SCC)   #Subset Baltimore by SCC retaining vehicle type 
LAgasLight<-subset(LA, SCC %in% Gas_Light$SCC)
LAdieselLight<-subset(LA, SCC %in% Diesel_Light$SCC)
LAdieselHeavy<-subset(LA, SCC %in% Diesel_Heavy$SCC)

LAcars1<-data.frame(LAgasHeavy, vehicle="Gas - Heavy Duty")      #Add vehicle type column to NEI 
LAcars2<-data.frame(LAgasLight, vehicle="Gas - Light Duty")
LAcars3<-data.frame(LAdieselLight, vehicle="Diesel - Light Duty")
LAcars4<-data.frame(LAdieselHeavy, vehicle="Diesel - Heavy Duty")
carsALL<-rbind(cars, LAcars1, LAcars2, LAcars3, LAcars4) 
carsALL$fips<-gsub("24510", "Baltimore", carsALL$fips)     #Replace fips with city names
carsALL$fips<-gsub("06037", "Los Angeles", carsALL$fips)

ggplot(data=carsALL, aes(x=year, y=Emissions, fill=vehicle)) + facet_grid(.~fips) +
  geom_bar(stat="identity", position=position_dodge()) +
  ggtitle(expression(atop("Two City Motor-Vehicle Emission Comparison", 
                          atop(italic("Baltimore, MD and Los Angeles, CA: 1999-2008")))))