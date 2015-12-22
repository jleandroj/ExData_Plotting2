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
#For purposes of this study, I have defined motor vehicles sources as highway vehicles.  Included categories #are:

# - Mobile - On-road - Diesel Heavy Duty Vehicles
# - Mobile - On-road - Diesel Light Duty Vehicles
# - Mobile - On-road - Gasoline Heavy Duty Vehicles
# - Mobile - On-road - Gasoline Light Duty Vehicles

greps2<-unique(grep("mobile", SCC$EI.Sector, ignore.case=TRUE, value=TRUE))  
#only need greps2[1:4]

Gas_Heavy<-subset(SCC, EI.Sector %in% greps2[1])  #Subset SCC by Vehicle Type
Gas_Light<-subset(SCC, EI.Sector %in% greps2[2])
Diesel_Light<-subset(SCC, EI.Sector %in% greps2[3])
Diesel_Heavy<-subset(SCC, EI.Sector %in% greps2[4])

gasHeavy<-subset(baltimore, SCC %in% Gas_Heavy$SCC)   #Subset Baltimore by SCC retaining vehicle type 
gasLight<-subset(baltimore, SCC %in% Gas_Light$SCC)
dieselLight<-subset(baltimore, SCC %in% Diesel_Light$SCC)
dieselHeavy<-subset(baltimore, SCC %in% Diesel_Heavy$SCC)

cars1<-data.frame(gasHeavy, vehicle="Gas - Heavy Duty")      #Add vehicle type column to NEI 
cars2<-data.frame(gasLight, vehicle="Gas - Light Duty")
cars3<-data.frame(dieselLight, vehicle="Diesel - Light Duty")
cars4<-data.frame(dieselHeavy, vehicle="Diesel - Heavy Duty")
cars<-rbind(cars1, cars2, cars3, cars4) 

ggplot(data=cars, aes(x=year, y=Emissions, fill=vehicle)) +
  geom_bar(stat="identity", position=position_dodge()) +
  ggtitle("Motor Vehicle-Related Emissions in Baltimore, MD: 1999-2008")
