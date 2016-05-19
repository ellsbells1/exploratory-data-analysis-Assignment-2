##Question 2: 

## Have total emissions from PM2.5 decreased in the Baltimore City, 
## Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base
## plotting system to make a plot answering this question.

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

##get aggregate totals Baltimore emmissions
baltNEI <- NEI[NEI$fips=="24510",]
aggTotBalt <- aggregate(Emissions ~ year, baltNEI,sum)


## using the base plotting system, create a barchart to show the data + making the PNG file
png("plot2.png", width = 480, height = 480, units = "px")
barplot(aggTotBalt$Emissions, names.arg=aggTotBalt$year, xlab="Year",
  ylab="PM2.5 Emissions", main="Total PM2.5 Emissions for Baltimore")
dev.off()
