## read in the data from the unzipped file

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}


## Question 1:

## Have total emissions from PM2.5 decreased in the United States 
## from 1999 to 2008? Using the base plotting system, make a plot 
## showing the total PM2.5 emission from all sources for each of the 
## years 1999, 2002, 2005, and 2008.

## calculate the aggregate for the PM 2.5 for the years 1999, 2002, 2005, and 2008.
aggTot <- aggregate(Emissions ~ year,NEI, sum)

## using the base plotting system, create a barchart to show the data + making the PNG file

png("plot1.png", width = 480, height = 480, units = "px")
barplot((aggTot$Emissions)/10^6, names.arg=aggTot$year, xlab="Year",
ylab="PM2.5 Emissions", main="Total emissions in the United States")
dev.off()
