data <- read.table(".//exdata_data_household_power_consumption//household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
data1 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
rm(data)

data1$Time <- strptime(paste(data1$Date, data1$Time), "%d/%m/%Y %H:%M:%S")
data1$Date <- as.Date(data1$Date, "%d/%m/%Y")

par(mar = c(4,4,1,1), oma = c(0,0,0,0), font.main = 2,
    ps = 15, lwd = 1, mfrow = c (2,2), cex = 0.6)

Sys.setlocale("LC_ALL","C")

with(data1, 
     {
      plot(Time,Global_active_power,
          type = "l",
          xlab = "",
          ylab = "Global Active Power"
      )
      plot(Time,Voltage,
          type = "l",
          xlab = "datetime",
          ylab = "Voltage"
      )
      
       plot(Time,Sub_metering_1,
          type = "l",
          xlab = "",
          ylab = "Energy sub metring"
        )
       lines(Time,Sub_metering_2,
           col = "red"
        )
       lines(Time,Sub_metering_3,
           col = "blue"
        )
       legend("topright", 
       lty = 1, 
       cex = 0.7,
       bty = "n",
       x.intersp = 0.7,
       y.intersp = 0.9,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
        ) 
      plot(Time,Global_reactive_power,
           type = "l", 
           xlab = "datetime"
      )
       }
     )
dev.copy(png, file = "plot4.png", units = "px", width = 480, height = 480)
dev.off()