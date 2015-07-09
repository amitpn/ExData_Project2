#setting to directory where the files are copied
setwd("C:/my files/Coursera Learning/R_Programming Files/Exploratory Data Analysis/Project2/exdata-data-NEI_data/")

#reading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subsetting the data - on road category - motor vehicle
motorvehicle <- subset(na.omit(NEI), NEI$type=="ON-ROAD")

# furthur subsetting the data on city basis
motorvehicle_BM <- subset(motorvehicle, motorvehicle$fips=="24510")
motorvehicle_LA <- subset(motorvehicle, motorvehicle$fips=="06037")

# emmisions by year - summing
emisMV_Baltimore <- tapply(motorvehicle_BM$Emissions,motorvehicle_BM$year,sum)

# rate of change calculations using ROC function  
emis_BM <- c(t(emisMV_Baltimore)[1:4])
ROC_BM <- ROC(emis_BM); ROC_BM[1] <- 0 #initial value
emisMV_LosAngeles <- tapply(motorvehicle_LA$Emissions,motorvehicle_LA$year,sum)
emis_LA <- c(t(emisMV_LosAngeles)[1:4])
ROC_LA <- ROC(emis_LA); ROC_LA[1] <- 0 #initial value

#plotting to a png file
png(filename = "plot6.png",width = 750, height = 750)
layout(matrix(c(1,1,2,3), 2, 2, byrow = TRUE))

plot(unique(NEI$year),ROC_BM,type="b", lwd=3,pch=2, col="red", ylim = c(-1, 0.1),xlab = "year", ylab = "rate of change")
lines(unique(NEI$year),ROC_LA,pch=2, type = "b",lwd=3,col="green")
legend("topright", legend = c("Los Angeles","Baltimore"), 
       lty = 1, bty='n', col=c('green','red'))

barplot(emisMV_Baltimore, col = 'blue', main = "MV emission - Baltimore", ylab = "MV Emission(Baltimore city)", xlab = "Year")
lines(x = emisMV_Baltimore,lwd=2,col="red")

barplot(emisMV_LosAngeles, col = 'blue', main = "MV emission - Los Angeles", ylab = "MV Emission(Los Angeles)", xlab = "Year")
lines(x = emisMV_LosAngeles,lwd=2,col="red")

dev.off()
