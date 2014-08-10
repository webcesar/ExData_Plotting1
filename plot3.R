# Function that constructs plot3 and saves it to a PNG file 
drawplot3 <- function()
{
        # Read the data from the dataset
        data <- read.table("household_power_consumption.txt",header=T,sep=";",
                colClasses=c("character","character","double","double","double","double","double","double","numeric"),
                na.strings="?")
        
        # Examine energy usage over the 2-day period in February, 2007
        subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
        
        # Convert the Date and Time columns to one Date/Time class
        data_Date <- as.character(as.Date(subdata$Date, "%d/%m/%Y"))
        data2_DateTime <- paste(data_Date, subdata$Time)
        data2_DateTimeFormat <- strptime(data2_DateTime, "%Y-%m-%d %H:%M:%S")
        
        # Launch the png device
        png("plot3.png", width = 480, height = 480)
        
        # Draw the plot corresponding to image3 in the project
        # The plot is constructed with lines which corresponds to type = "l"
        # The plot shows a first line corresponding to sub_metering_1 variable against the Data/Time data
        plot(data2_DateTimeFormat, as.numeric(subdata$Sub_metering_1), type="l",
             ylab="Energy sub metering", xlab="")
        
        # Then, the sub_metering_2 data is added to the plot by using the lines command
        lines(data2_DateTimeFormat, as.numeric(subdata$Sub_metering_2), type="l", col="red")
        
        # After that the sub_metering_3 data is added to the plot by using the lines command
        lines(data2_DateTimeFormat, as.numeric(subdata$Sub_metering_3), type="l", col="blue")
        
        # Finally the legend is added to give a clear description about the different lines on the plot
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd =2.5,
               col=c("black", "red", "blue"))
        
        # Close the graphic device
        dev.off()
}