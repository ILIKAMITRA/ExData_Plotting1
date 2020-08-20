
#set to directory with power consumption data
setwd("C:/.../Exploratory Data Week 1")

input_data <- read.table('household_power_consumption.txt', header=TRUE, sep=";", stringsAsFactors = FALSE)

#subset the data to days of interest
sub_data <- input_data[input_data$Date %in% c('1/2/2007', '2/2/2007'),]


sub_data$Global_active_power <- as.numeric(sub_data$Global_active_power)

break_points <- seq(0, ceiling(max(sub_data$Global_active_power)), by = 0.5)


png('Plot 1.png')
hist(sub_data$Global_active_power, col = 'red', breaks = break_points,
     main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)')
dev.off()
