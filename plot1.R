library(ggplot2)
library(dplyr)
library(plyr)
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
total_emissions<-aggregate(NEI$Emissions,list(NEI$year),FUN=sum)
plot(total_emissions,type="l")
png(filename = "plot1.png")
plot(total_emissions, type = "l", xlab = "Year", 
     main = "Total Emissions in the United States from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"),col="dark red")
dev.off()