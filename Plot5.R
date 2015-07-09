#setting to directory where the files are copied
setwd("C:/my files/Coursera Learning/R_Programming Files/Exploratory Data Analysis/Project2/exdata-data-NEI_data/")

#reading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subsetting the data - on road category - motor vehicle
motorvehicle <- subset(na.omit(NEI), NEI$type=="ON-ROAD")

# furthur subsetting the data on city basis
motorvehicle_BM <- subset(motorvehicle, motorvehicle$fips=="24510")

# emmisions by year - summing
emisMV_Baltimore <- tapply(motorvehicle_BM$Emissions,motorvehicle_BM$year,sum)

#plotting to a png file
png(filename = "plot5.png",width = 480, height = 480)
barplot(emisMV_Baltimore, col = 'blue', main = "Total Motor Vehicle emission in the Baltimore City, Maryland", ylab = "MV Emission(Baltimore city)", xlab = "Year")
lines(x = emisMV_Baltimore,lwd=2,col="red")

dev.off()
