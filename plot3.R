if(!exists("NEI")){
  NEI <- readRDS("../exdata-data-NEI_data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("../exdata-data-NEI_data/Source_Classification_Code.rds")
}

library(ggplot2)

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999 2008 for Baltimore City? 
# Which have seen increases in emissions from 1999 2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# Sum emissions by year, subset by only Baltimore, Marlyand
aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, subset=fips=="24510", sum)



png("plot3.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, MD 1999-2008')
print(g)
dev.off()