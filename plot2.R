data <- read.table(".//exdata_data_household_power_consumption//household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
data1 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
rm(data)

data1$Time <- strptime(paste(data1$Date, data1$Time), "%d/%m/%Y %H:%M:%S")
data1$Date <- as.Date(data1$Date, "%d/%m/%Y")

par(mar = c(4,4,2,2), font.main = 2,
    ps = 11, lwd = 1 )

Sys.setlocale("LC_ALL","C")

with(data1, 
     plot(Time,Global_active_power,
          type = "l",
          xlab = "",
          #col = "dark grey",
          ylab = "Global Active Power (kilowatts)"
          ))
dev.copy(png, file = "plot2.png", units = "px", width = 480, height = 480)
dev.off()