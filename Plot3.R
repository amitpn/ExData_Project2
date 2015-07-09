#setting to directory where the files are copied
setwd("C:/my files/Coursera Learning/R_Programming Files/Exploratory Data Analysis/Project2/exdata-data-NEI_data/")

#reading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Seperating particular city data
Baltimore <- na.omit(subset(NEI, NEI$fips=="24510"))
Baltimore_1 <- subset(Baltimore, Baltimore$type == "POINT")
Baltimore_2 <- subset(Baltimore, Baltimore$type == "NONPOINT")
Baltimore_3 <- subset(Baltimore, Baltimore$type == "ON-ROAD")
Baltimore_4 <- subset(Baltimore, Baltimore$type == "NON-ROAD")

#plotting to a png file
png(filename = "plot3.png",width = 650, height = 650)
library(ggplot2)
library(plyr)
library(grid)
library(gridExtra)
mm1 <- ddply(Baltimore_1, "year", summarise, TotEmmision = sum(Emissions))
p1 <- ggplot(mm1, aes(x = factor(year), y = TotEmmision)) + geom_bar(stat = "identity", main = "tt", fill = "blue")
p1 + xlab ("Year") + ylab("Emission") + ggtitle ("POINT")

mm2 <- ddply(Baltimore_2, "year", summarise, TotEmmision = sum(Emissions))
p2 <- ggplot(mm2, aes(x = factor(year), y = TotEmmision)) + geom_bar(stat = "identity", fill = "blue")
p2 + xlab ("Year") + ylab("Emission") + ggtitle ("NON-POINT")

mm3 <- ddply(Baltimore_3, "year", summarise, TotEmmision = sum(Emissions))
p3 <- ggplot(mm3, aes(x = factor(year), y = TotEmmision)) + geom_bar(stat = "identity", fill = "blue")
p3 + xlab ("Year") + ylab("Emission") + ggtitle ("ON-ROAD")

mm4 <- ddply(Baltimore_4, "year", summarise, TotEmmision = sum(Emissions))
p4 <- ggplot(mm4, aes(x = factor(year), y = TotEmmision)) + geom_bar(stat = "identity", fill = "blue")
p4 + xlab ("Year") + ylab("Emission") + ggtitle ("NON-ROAD")
grid.arrange(p1, p2, p3, p4, nrow=2, sub= textGrob("Emission sources (ON-ROAD, NON_ROAD) - Baltimore"), main = "Emission sources (POINT,NON-POINT) - Baltimore")

dev.off()