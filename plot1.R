# Function that constructs plot1 and saves it to a PNG file 
drawplot1 <- function()
{
        # Read the data from the dataset
        data <- read.table("household_power_consumption.txt",header=T,sep=";",
        colClasses=c("character","character","double","double","double","double","double","double","numeric"),
        na.strings="?")
        
        # Examine energy usage over the 2-day period in February, 2007
        subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
        
        # Launch the png device
        png("plot1.png", width = 480, height = 480)
        
        # Draw the plot corresponding to image1 in the project as a histogram
        hist(subdata$Global_active_power,main="Global Active Power",ylab="Frequency",
             xlab="Global Active Power (kilowatts)",col="red",ylim=c(0,1200))
        
        # Close the graphic device
        dev.off()
}