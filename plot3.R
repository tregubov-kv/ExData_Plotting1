data <- read.table(".//exdata_data_household_power_consumption//household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
data1 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
rm(data)

data1$Time <- strptime(paste(data1$Date, data1$Time), "%d/%m/%Y %H:%M:%S")
data1$Date <- as.Date(data1$Date, "%d/%m/%Y")

par(mar = c(4,4,2,2), font.main = 2,cex = 0.6,
    ps = 18)

Sys.setlocale("LC_ALL","C")

with(data1, 
     plot(Time,Sub_metering_1,
          type = "l",
          xlab = "",
          ylab = "Energy sub metring"
     ))
with(data1, 
     lines(Time,Sub_metering_2,
          col = "red"
     ))
with(data1, 
     lines(Time,Sub_metering_3,

          col = "blue",
     ))
legend("topright", 
       lty = 1, 
       x.intersp = 0.7,
       y.intersp = 0.9,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       )
dev.copy(png, file = "plot3.png", units = "px", width = 480, height = 480)
dev.off()