if(!exists("NEI")){
  NEI <- readRDS("../exdata-data-NEI_data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("../exdata-data-NEI_data/Source_Classification_Code.rds")
}
# merge the two data sets 
if(!exists("NEISCC")){
  NEISCC <- merge(NEI, SCC, by="SCC")
}

library(ggplot2)

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# Searching for ON-ROAD type in NEI to indicate "motor vehicles"
# Subsetting by Baltimore
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)



png("plot5.png", width=840, height=480)
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicles in Baltimore City, MD 1999-2008')
print(g)
dev.off()