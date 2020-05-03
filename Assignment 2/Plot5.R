## Load Library
library(dplyr)
library(ggplot2)

## Set the working directory

setwd("~/VINITA/GRAYDON/R scripts/Coursera---Exploratory-Data-Analysis/Assignment 2")

##Load the data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Check the data

head(NEI)


## Transform the data

emission = NEI %>%
    select(year, Emissions,type, fips) %>% 
    filter(type == "ON-ROAD" & fips == "24510" ) %>% 
    group_by(year) %>% 
    summarise(total_emission = sum(Emissions))

emission

## Plot emissions from 1999 to 2008

barplot(emission$total_emission, emission$year,
        ylab = "Total Motor Emission", xlab = "Year",
        main = "Total Motor Emission from 1999 to 2008",
        names.arg = emission$year,
        col = "grey")

##Copy the plot
dev.copy(png, file = "plot5.png", width=480, height=480)

dev.off()
