## JHU Data Science Course - Exploratory Data Analysis
## Course Project No.1
## Electric Power Consumption (epc_)
## Plot 3

library(dplyr)

Sys.setlocale("LC_TIME", 'en_GB.UTF-8')

# File pats and file-name for data. OBS: Replace with your paths.
epc_file_path_output <- "//mnt/Principal/Git/exploringdata_plottingassignment1/"
epc_file_path_input <- 
  "//mnt/Principal/NextCloud/Workspace/R Projects/exploringdata/plotting_assignment1/"
epc_data_filename <- paste0(epc_file_path_input, 
                            "household_power_consumption.txt", collapse = "")

# Read the text-file (a CSV)
epc_data <- read.csv(epc_data_filename, header = TRUE, 
                     sep = ";", dec = ".", na.strings = "?")

# Convert the Date-column from strings to dates
epc_dates <- as.Date(epc_data$Date, 
                     "%d/%m/%Y")
epc_data$Date <- epc_dates

# Subset to the dates 2007-02-01 and 2007-02-01
epc_data_subset <- subset(epc_data, as.Date(Date) >= "2007-02-01" 
                          & as.Date(Date) <= "2007-02-02")
dates <- epc_data_subset$Date
times <- as.vector(epc_data_subset$Time)
x <- as.POSIXct(strptime(paste(dates,times), "%Y-%m-%d %H:%M:%S"))
epc_data_subset <- mutate(epc_data_subset, DateTime = x)
epc_data_subset <- arrange(epc_data_subset, DateTime)

# Set window to 1 tile and plot to screen
par(mfcol = c(1,1))
with(epc_data_subset, plot(Sub_metering_1 ~ DateTime, xaxt = "n", 
     type = "l", xlab = "", ylab = "Global sub-metering"))
with(epc_data_subset, lines(Sub_metering_2 ~ DateTime, type = "l", col = "red"))
with(epc_data_subset, lines(Sub_metering_3 ~ DateTime, type = "l", col = "blue"))
axis.POSIXct(side=1, x=epc_data_subset$DateTime, format="%a", labels = TRUE)
legend("topright", lty = c(1,1,1), col = c("black","red","blue"), 
       legend = c("Sub-metering 1","Sub-metering 2","Sub-metering 3"))

# Set device to png and plot to file
png(filename = paste0(epc_file_path_output, "plot3.png"), width = 480, 
    height = 480, units = "px")
with(epc_data_subset, plot(Sub_metering_1 ~ DateTime, xaxt = "n", 
                           type = "l", xlab = "", ylab = "Global sub-metering"))
with(epc_data_subset, lines(Sub_metering_2 ~ DateTime, type = "l", col = "red"))
with(epc_data_subset, lines(Sub_metering_3 ~ DateTime, type = "l", col = "blue"))
axis.POSIXct(side=1, x=epc_data_subset$DateTime, format="%a", labels = TRUE)
legend("topright", lty = c(1,1,1), col = c("black","red","blue"), 
       legend = c("Sub-metering 1","Sub-metering 2","Sub-metering 3"))
dev.off()