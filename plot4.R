#Plot 4 - Exploratory Data Analysis Course - Week 1 Project

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

#Plot 4
par (mfrow=c(2,2),mar=c(4,4,4,4))

#Plot 4-1
plot(df[,10],df[,3],type="l",xlab="",ylab="Global Active Power")

#Plot 4-2
plot(df[,10],df[,5],type="l",xlab="datetime",ylab="Voltage")

#Plot 4-3
plot(df[,10],df[,7],type="l",xlab="",ylab="Energy sub metering")
lines (df[,10],df[,8],col="red")
lines (df[,10],df[,9],col="blue")
legend("topright", x.intersp=0.05, y.intersp=0.05, cex=1, bty="n",inset=-0.3,# places a legend at the appropriate place    
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), # puts text in the legend 
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       lwd=c(1.5,1.5,1.5),col=c("black","blue","red")) # gives the legend lines the correct color and width

#Plot 4-4
plot(df[,10],df[,4],type="l",xlab="datetime",ylab="Global_reactive_power")

dev.copy(png,file="plot4.png")
dev.off()
