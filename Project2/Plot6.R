> plot_6 <- subset(NEI_SCC, (fips == "24510" | fips == "06037") & type =="ON-ROAD", c("Emissions", "Year","type", "fips"))
> plot_6 <- rename(plot_6, c("fips"="City"))
> plot_6$City <- factor(plot_6$City, levels=c("06037", "24510"), labels=c("Los Angeles, CA", "Baltimore, MD"))
> plot_6 <- melt(plot_6, id=c("Year", "City"), measure.vars=c("Emissions"))
> plot_6 <- dcast(plot_6, City + Year ~ variable, sum)
> plot_6[2:8,"Change"] <- diff(plot_6$Emissions)
> plot_6[c(1,5),4] <- 0
> ggplot(data=plot_6, aes(x=Year, y=Change, group=City, color=City)) + geom_line() + geom_point( size=4, shape=21, fill="white") + xlab("Year") + ylab("Change in Emissions (tons)") + ggtitle("Motor Vehicle PM2.5 Emissions Changes: Baltimore vs. LA")
> ggsave(file="plot_6.png")