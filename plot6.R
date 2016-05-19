## Question 6:

## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
## vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city
## has seen greater changes over time in motor vehicle emissions?

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}


## subset Baltimore and LA data and merge
vehiclesBalt1 <- vehiclesNEI[vehiclesNEI$fips == 24510,]
vehiclesBalt1$city <- "Baltimore City"
vehiclesLA <- vehiclesNEI[vehiclesNEI$fips=="06037",]
vehiclesLA$city <- "Los Angeles County"
BaltLA <- rbind(vehiclesBalt1,vehiclesLA)

## load ggplot package
library(ggplot2)

## plot data and make PNG file

png("plot6.png", width = 480, height = 480, units = "px")
plotgg1 <- ggplot(BaltLA, aes(x=factor(year), y=Emissions, fill=city)) +
geom_bar(aes(fill=year),stat="identity") +
facet_grid(scales="free", space="free", .~city) +
guides(fill=FALSE) + theme_bw() +
labs(x="year", y=expression("Total Emissions")) + 
labs(title=expression("Motor Vehicle Emissions in Baltimore & LA 1999-2008"))
print(plotgg1)

dev.off()
