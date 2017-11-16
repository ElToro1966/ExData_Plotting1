library(dplyr)

# File pats and file-name for data. Replace with your paths.
elpowercons_file_path_output <- "//mnt/eric/Principal/Git/exploringdata_plottingassignment1"
elpowercons_file_path_input <- "//mnt/Principal/NextCloud/Workspace/R Projects/exploringdata/plotting_assignment1"
elpowercons_data_filename <- paste0(elpowercons_file_path_input,"/", "household_power_consumption.txt", collapse = "")

# Readthe text-file (a CSV)
elpowercons_data <- read.csv(elpowercons_data_filename, header = TRUE, sep = ";", dec = ".", na.strings = "?")

# Convert the Date-column from strings to dates
elpowercons_dates <- as.Date(paste(elpowercons_data$Date,elpowercons_data$Time), "%d/%m/%Y")
elpowercons_data$Date <- elpowercons_dates

# Subset to the dates 2007-02-01 and 2007-02-01
elpowercons_data_subset <- subset(elpowercons_data, as.Date(Date) >= "2007-02-01" & as.Date(Date) <= "2007-02-02")

