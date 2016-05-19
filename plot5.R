
## Question 5:

## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}


## subset data for motor vehicles in Baltimore
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
baltVehicles <- vehiclesNEI[vehiclesNEI$fips==24510,]


## load packages ggplot2
library(ggplot2)

## plot using gplot2 + make PNG file

png("plot5.png", width = 480, height = 480, units = "px")
plotgg <- ggplot(baltVehicles,aes(factor(year),Emissions)) +
geom_bar(stat="identity",fill="grey",width=0.5) +
theme_bw() +  guides(fill=FALSE) +
labs(x="year", y=expression("Total PM Emissions")) + 
labs(title=expression("Motor Vehicle Emissions in Baltimore from 1999-2008"))
print(plotgg)
dev.off()

