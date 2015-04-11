## Exploratory Data Analysis - Coursera/Johns Hopkins University
## https://class.coursera.org/exdata-013/human_grading/view/courses/973507/assessments/3/submissions

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip"
if(!file.exists("./data")){dir.create("data")}
if(!file.exists("./data/household_power_consumption.zip"))
{download.file(fileUrl,destfile="./data/household_power_consumption.zip",method="curl")}
if(!file.exists("./data/household_power_consumption.txt"))
{unzip("./data/household_power_consumption.zip", exdir = "./data/")}

hpc <- read.table("./data/household_power_consumption.txt",
                  sep=";", header = TRUE, na.strings = "?",
                  colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
)

## convert Date and Time columns into a datetime object
hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time,sep = " "),format = "%d/%m/%Y %H:%M:%S")

## subset rows to two dates and remove unneeded columns
hpc <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007", c(10,3:9)]

## define png output 
png("plot1.png", width = 640, height = 480, units = "px")

## create plot1 histogram
hist(hpc$Global_active_power,
   main = "Global Active Power",
   xlab = "Global Active Power (Kilowatts)",
   col = "red")

## close graphics device to release saved plot and close graphics
dev.off()
graphics.off()