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
# plot 5
png(filename = "./plot5.png", 
    width = 480, height = 480, 
    units = "px")
motor <- grep("motor", SCC$Short.Name, ignore.case = T)
motor <- SCC[motor, ]
motor <- sub[sub$SCC %in% motor$SCC, ]
motorEmissions <- aggregate(motor$Emissions, list(motor$year), FUN = "sum")

plot(motorEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions From Motor Vehicle Sources\n from 1999 to 2008 in Baltimore City", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()
