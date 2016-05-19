## Question 4:

## Across the United States, how have emissions from coal combustion-related sources 
## changed from 1999–2008?

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

## filter out data using "coal"
coal1<-unique(grep("coal", SCC$EI.Sector, ignore.case=TRUE, value=TRUE))  
data1<-subset(SCC, EI.Sector %in% coal1) 
coal<-subset(NEI, SCC %in% data1$SCC)        

## plotting coal combustion related pollution + making the PNG file 

png("plot4.png", width = 480, height = 480, units = "px")
ggplot(data=coal, aes(x=year, y=Emissions, fill = type)) + 
geom_bar(stat="identity", position=position_dodge()) + 
ggtitle("Coal Combustion-Related Emissions in the USA: 1999-2008") +
dev.off()
