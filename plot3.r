#Plot 3 - Exploratory Data Analysis Course  - Week 1 Project
# NOTE: The data file household_power_consumption.txt should be in the current working directory.

#Uses the sqldf library. Install the package if it not already loaded.

if (!require("sqldf")) {
  install.packages("sqldf")
}
require("sqldf")

#Load the dataframe from the file for the specific dates
fi <- file("household_power_consumption.txt")
df <- sqldf("select * from fi where Date in ('1/2/2007','2/2/2007')",
            file.format = list(header = TRUE, sep = ";"))
close(fi)

#Convert the date field to the correct format
df[,1] <- as.Date (df[,1],format ="%d/%m/%Y")

#Add a Time field to help with the plotting
df$DT<- strptime (paste(df[,1],df[,2], sep=" "),format ="%Y-%m-%d %H:%M:%S")


#Uses the datasets library. Install the package if it not already loaded.
if (!require("datasets")) {
  install.packages("datasets")
}
require("datasets")

#Plot 3
plot(df[,10],df[,7],type="l",xlab="",ylab="Energy sub metering")
lines (df[,10],df[,8],col="red")
lines (df[,10],df[,9],col="blue")
legend("topright", x.intersp=0.25, y.intersp=0.25,cex=1, # places a legend at the appropriate place    
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), # puts text in the legend 
       lwd=c(1,1,1),
       col=c("black","blue","red")) # gives the legend lines the correct color and width

dev.copy(png,file="plot3.png")
dev.off()

#Clean up
rm (df,fi)
