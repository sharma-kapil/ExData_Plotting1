#Plot 1 - Exploratory Data Analysis Course  - Week 1 Project

#Uses the sqldf library. Install the package if it not already loaded.

if (!require("sqldf")) {
  install.packages("sqldf")
}
require("sqldf")

fi <- file("household_power_consumption.txt")
df <- sqldf("select * from fi where Date in ('1/2/2007','2/2/2007')",
            file.format = list(header = TRUE, sep = ";"))
close(fi)

df[,1] <- as.Date (df[,1],format ="%d/%m/%Y")

df$DT<- strptime (paste(df[,1],df[,2], sep=" "),format ="%Y-%m-%d %H:%M:%S")


#Uses the datasets library. Install the package if it not already loaded.
if (!require("datasets")) {
     install.packages("datasets")
   }
require("datasets")

#Plot 1
hist (df[,3],freq=TRUE,main="Global Active Power",xlab="Global Active Power (killowatts)",col="orange")
dev.copy(png,file="plot1.png")
dev.off()
