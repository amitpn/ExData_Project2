#setting to directory where the files are copied
setwd("C:/my files/Coursera Learning/R_Programming Files/Exploratory Data Analysis/Project2/exdata-data-NEI_data/")

#reading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Seperating particular city data
baltimore_data <- subset(NEI, NEI$fips=="24510")
#finding emissions per each year - city data
emis_baltimore <- tapply(baltimore_data$Emissions,baltimore_data$year,sum)

#plotting to a png file
png(filename = "plot2.png",width = 480, height = 480)
barplot(emis_baltimore, col = 'blue', main = "Total PM2.5 emission in the Baltimore City, Maryland", ylab = "Total emission(Baltimore city)", xlab = "Year")
lines(x = emis_baltimore,lwd=2,col="red")

dev.off()
