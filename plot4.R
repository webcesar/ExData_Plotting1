# Function that constructs plot4 and saves it to a PNG file 
drawplot4 <- function()
{
        # Read the data from the dataset
        data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors =FALSE)
        
        # Examine energy usage over the 2-day period in February, 2007
        subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
        
        # Convert the Date and Time columns to one Date/Time class
        data_Date <- as.character(as.Date(subdata$Date, "%d/%m/%Y"))
        data2_DateTime <- paste(data_Date, subdata$Time)
        data2_DateTimeFormat <- strptime(data2_DateTime, "%Y-%m-%d %H:%M:%S")
        
        # Launch the png device
        png("plot4.png", width = 480, height = 480)
        
        # The plot contains 2 rows and 2 columns
        par(mfrow = c(2, 2)) 
        
        # The 4 plots to draw that appear in the correct order 
        
        # First plot showing the Global active power usage against the Date/Time variable
        plot(data2_DateTimeFormat, as.numeric(subdata$Global_active_power), type="l", ylab="Global Active Power", 
             xlab="", cex=0.2)
        
        # Second plot showing the voltage usage against the Date/Time variable
        plot(data2_DateTimeFormat, as.numeric(subdata$Voltage), type="l", ylab="Voltage", xlab="datetime")
        
        # Third plot showing Sub_metering_1, Sub_metering_2, and Sub_metering_3 usage against the Date/Time variable
        plot(data2_DateTimeFormat, as.numeric(subdata$Sub_metering_1), type="l",ylab="Energy sub metering", xlab="")
        lines(data2_DateTimeFormat, as.numeric(subdata$Sub_metering_2), type="l", col="red")
        lines(data2_DateTimeFormat, as.numeric(subdata$Sub_metering_3), type="l", col="blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd =2.5,
               col=c("black", "red", "blue"), bty = "n")
        
        # Fourth plot showing the Global reactive power usage against the Date/Time variable
        plot(data2_DateTimeFormat, as.numeric(subdata$Global_reactive_power), type="l", xlab="datetime",
             ylab="Global_reactive_power")
        
        # Close the graphic device
        dev.off()
}