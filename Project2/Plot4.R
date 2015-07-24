> plot_4 <- subset(NEI_SCC, grepl('Coal',NEI_SCC$Short.Name, fixed=TRUE), c("Emissions", "Year","type", "Short.Name"))
> plot_4 <- aggregate(Emissions ~ Year, plot_4, sum)
> ggplot(data=plot_4, aes(x=Year, y=Emissions)) + geom_line() + geom_point( size=4, shape=21, fill="white") + xlab("Year") + ylab("Emissions (thousands of tons)") + ggtitle("Total United States PM2.5 Coal Emissions")
> ggsave(file="plot_4.png")