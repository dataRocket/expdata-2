library(ggplot2)
library(dplyr)
library(plyr)
## Libraries needed:
library(plyr)
library(ggplot2)

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")


coalcomb1 <- subset(SCC, EI.Sector %in% c("Fuel Comb - Comm/Instutional - Coal", 
                                             "Fuel Comb - Electric Generation - Coal", "Fuel Comb - Industrial Boilers, ICEs - 
  Coal"))
coalcomb2 <- subset(SCC, grepl("Comb", Short.Name) & grepl("Coal", Short.Name))

coalcomb.codes <- union(coalcomb1$SCC, coalcomb2$SCC)
coal.comb <- subset(NEI, SCC %in% coalcomb.codes)
coalcomb.pm25year <- ddply(coal.comb, .(year, type), function(x) sum(x$Emissions))
colnames(coalcomb.pm25year)[3] <- "Emissions"
View(coalcomb.pm25year)
png("plot4.png")
qplot(year, Emissions, data=coalcomb.pm25year, color=type, geom="line") 
dev.off()