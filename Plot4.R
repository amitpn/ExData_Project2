#setting to directory where the files are copied
setwd("C:/my files/Coursera Learning/R_Programming Files/Exploratory Data Analysis/Project2/exdata-data-NEI_data/")

#reading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subsetting the data - coal based
sccsubset <- subset(SCC, grepl("coal", EI.Sector, ignore.case=TRUE), select=c(SCC, EI.Sector))

#merging data with subset part
coalsourcedata <- merge(na.omit(NEI), sccsubset)

#finding emissions per each year
emiscoal_yr <- tapply(coalsourcedata$Emissions,coalsourcedata$year,sum)

#plotting to a png file
png(filename = "plot4.png",width = 480, height = 480)
barplot(emiscoal_yr, col = 'blue', main = "Emissions from Coal combustion-related sources", ylab = "Total emission", xlab = "Year")
lines(x = emiscoal_yr,lwd=2,col="red")

dev.off()