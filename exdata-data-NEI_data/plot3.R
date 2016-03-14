# download and unzip the file
setwd("/Users/tianyuan/mooc_dstb/r/exdata-data-NEI_data")
unzip("./data/exdata-data-NEI_data.zip", exdir = "./data/")
if (!"NEI" %in% ls()) {
        NEI <- readRDS("summarySCC_PM25.rds")
}
if (!"SCC" %in% ls()) {
        SCC <- readRDS("Source_Classification_Code.rds")
}
sub<-NEI[NEI$fips == "24510",]
# plot 3
library(ggplot2)

png(filename = "./plot3.png", 
    width = 480, height = 480, 
    units = "px")
g <- ggplot(sub, aes(year, Emissions, color = type))
g + geom_line(stat = "summary", fun.y = "sum") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle("Total Emissions in Baltimore City from 1999 to 2008")
dev.off()