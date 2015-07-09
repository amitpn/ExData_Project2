#seting to directory where the files are copied
setwd("C:/my files/Coursera Learning/R_Programming Files/Exploratory Data Analysis/Project2/exdata-data-NEI_data/")

#reading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#finding emissions per each year
emis_yr <- tapply(NEI$Emissions,NEI$year,sum)

#plotting to a png file
png(filename = "plot1.png",width = 480, height = 480)
barplot(emis_yr, col = 'blue', main = "Total PM2.5 emission - Year", ylab = "Total emission", xlab = "Year")
lines(x = emis_yr,lwd=2,col="red")

dev.off()