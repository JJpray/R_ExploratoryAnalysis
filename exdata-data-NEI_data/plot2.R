# download and unzip the file
setwd("/Users/tianyuan/mooc_dstb/r/exdata-data-NEI_data")
unzip("./data/exdata-data-NEI_data.zip", exdir = "./data/")
if (!"NEI" %in% ls()) {
        NEI <- readRDS("summarySCC_PM25.rds")
}
if (!"SCC" %in% ls()) {
        SCC <- readRDS("Source_Classification_Code.rds")
}

# plot 2
sub<-NEI[NEI$fips == "24510",]
png(filename = "./plot2.png", 
    width = 480, height = 480, 
    units = "px")
totalEmissions <- aggregate(sub$Emissions, list(sub$year), FUN = "sum")

plot(totalEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions in Baltimore City from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()