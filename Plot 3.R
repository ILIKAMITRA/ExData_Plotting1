
#set to directory with power consumption data
setwd("C:/.../Exploratory Data Week 1")

input_data <- read.table('household_power_consumption.txt', header=TRUE, sep=";", stringsAsFactors = FALSE)

#subset the data to days of interest
sub_data <- input_data[input_data$Date %in% c('1/2/2007', '2/2/2007'),]


sub_data$datetime <- strptime(paste(sub_data$Date, sub_data$Time), "%d/%m/%Y %H:%M:%S")

png('Plot 3.png')
with(sub_data, plot(datetime, Sub_metering_1, type = 'l',
     ylab = 'Energy sub metering'))
with(sub_data, lines(datetime, Sub_metering_2, col = 'red'))
with(sub_data, lines(datetime, Sub_metering_3, col = 'blue'))
legend('topright', pch = 95, col = c('black', 'red', 'blue'),
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()