> plot_5 <- subset(NEI_SCC, fips == "24510" & type =="ON-ROAD", c("Emissions", "Year","type"))
> plot_5 <- aggregate(Emissions ~ Year, plot_5, sum)
> ggplot(data=plot_5, aes(x=Year, y=Emissions)) + geom_line() + geom_point( size=4, shape=21, fill="white") + xlab("Year") + ylab("Emissions (tons)") + ggtitle("Motor Vehicle PM2.5 Emissions in Baltimore")
> ggsave(file="plot_5.png")