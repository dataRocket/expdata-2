library(ggplot2)
library(dplyr)
library(plyr)
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
baltimore<-filter(NEI,fips=="24510")
emission_baltimore<-aggregate(baltimore$Emissions,list(baltimore$year),FUN="sum")

png(filename = "plot2.png")
plot(emission_baltimore, type = "l", xlab = "Year", 
     main = "Total Emissions in Baltimore City from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))
dev.off()