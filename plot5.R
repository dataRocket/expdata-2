library(ggplot2)
library(dplyr)
library(plyr)
## Libraries needed:
library(plyr)
library(ggplot2)

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
mv.sourced <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))

motorv<- SCC[SCC$EI.Sector %in% mv.sourced, ]["SCC"]

emMV.ba <- NEI[NEI$SCC %in% motorv$SCC & NEI$fips == "24510",]

baltimore <- ddply(emMV.ba, .(year), function(x) sum(x$Emissions))
colnames(baltimore)[2] <- "Emissions"

png("plot5.png")
qplot(year, Emissions, data=baltimore, geom="line")
dev.off()