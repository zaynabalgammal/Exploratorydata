#loading Packages
> library(plyr)
> library(reshape2)
> library(ggplot2)
> if(!file.exists("Project2data")) {
+     temp <- tempfile()
+     download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",temp)
+     unzip(temp)
+     unlink(temp)
+ }

#Reading data
> NEI <- readRDS("summarySCC_PM25.rds")
> SCC <- readRDS("Source_Classification_Code.rds")
> df <- subset(SCC, select = c("SCC", "Short.Name"))

# Merge data
> NEI_SCC <- merge(NEI, df, by.x="SCC", by.y="SCC", all=TRUE)
> NEI_SCC$Emissions <- NEI_SCC$Emissions/1000
> NEI_SCC <- rename(NEI_SCC, c("year"="Year"))

#Plotting data
> plot_1 <- aggregate(Emissions ~ Year, NEI_SCC, sum)
> plot(plot_1$Year,plot_1$Emissions, main="Total US PM2.5 Emissions", "b", xlab="Year", ylab="Emissions (thousands of tons)",xaxt="n")
> axis(side=1, at=c("1999", "2002", "2005", "2008"))
> par(mar=c(5.1,5.1,4.1,2.1))

#save as image
> dev.copy(png, file="plot_1.png", width=720, height=480)
> dev.off()