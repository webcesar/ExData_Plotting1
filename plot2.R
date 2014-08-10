# Function that constructs plot2 and saves it to a PNG file 
drawplot2 <- function()
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
        png("plot2.png", width = 480, height = 480)
        
        # Draw the plot corresponding to image2 in the project
        # The plot is constructed with lines which corresponds to type = "l"
        plot(data2_DateTimeFormat, as.numeric(subdata$Global_active_power), type="l", ylab="Global Active Power (kilowatts)", xlab="")
        
        # Close the graphic device
        dev.off()
}