##Question 3: 

## Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable,
## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a 
## plot answer this question.

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

## load packages
library(ggplot2)
library(plyr)

## aggregate data by year and fips = 24510
NEI.24510 <- NEI[which(NEI$fips == "24510"), ]
totBaltemm <- with(NEI.24510, aggregate(Emissions, by = list(year), 
                                                       sum))
colnames(totBaltemm) <- c("year", "Emissions")


## include type and county into the aggregate total filter
totBaltemmType <- ddply(NEI.24510, .(type, year), summarize, 
                                        Emissions = sum(Emissions))
totBaltemmType$Pollutant_Type <- totBaltemmType$type

## Plot emissions grouped by source type per year using ggplot2 + create PNG file
png("plot3.png", width = 480, height = 480, units = "px")
qplot(year, Emissions, data = totBaltemmType, group = Pollutant_Type, 
color = Pollutant_Type, geom = c("point", "line"), 
ylab = expression("Total Emissions"), 
xlab = "Year", main = "Total Emissions in U.S. by Type")
dev.off()

