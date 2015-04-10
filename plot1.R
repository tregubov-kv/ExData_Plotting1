data <- read.table(".//exdata_data_household_power_consumption//household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
data1 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
rm(data)

data1$Time <- strptime(paste(data1$Date, data1$Time), "%d/%m/%Y %H:%M:%S")
data1$Date <- as.Date(data1$Date, "%d/%m/%Y")
str(data1)

par(mar = c(4,4,2,2), font.main = 2,
    ps = 11)
hist(data1$Global_active_power, 
     breaks = 11, col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     axes = F)
axis(side = 1, at = c(0,2,4,6), font = 1)
axis(side = 2, at = c(0,200,400,600,800,1000,1200), font = 1)
dev.copy(png, file = "plot1.png", units = "px", width = 480, height = 480)
dev.off()