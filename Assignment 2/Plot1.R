## Load Library
library(dplyr)

## Set the working directory

setwd("~/VINITA/GRAYDON/R scripts/Coursera---Exploratory-Data-Analysis/Assignment 2")

##Load the data

NEI <- readRDS("summarySCC_PM25.rds")

## Check the data

head(NEI)


## Transform data

emission = NEI %>%
    select(year, Emissions) %>% 
    group_by(year) %>% 
    summarise(total_emission = sum(Emissions))
emission

## Plot emissions from 1999 to 2008

barplot(emission$total_emission, emission$year,
        ylab = "Total Emission", xlab = "Year",
        main = "Total Emission decreased from 1999 to 2008",
        names.arg = emission$year,
        col = "Blue")

##Copy the plot
dev.copy(png, file = "plot1.png", width=480, height=480)

dev.off()
