## Load Library
library(dplyr)
library(ggplot2)

## Set the working directory

setwd("~/VINITA/GRAYDON/R scripts/Coursera---Exploratory-Data-Analysis/Assignment 2")

##Load the data

NEI <- readRDS("summarySCC_PM25.rds")

## Check the data

head(NEI)

## Transform data

emission = NEI %>%
    select(year, Emissions, fips, type) %>% 
    filter(fips == "24510") %>% 
    group_by(year, type) %>% 
    summarise(total_emission = sum(Emissions))

emission

## Plot emissions from 1999 to 2008 for Baltimore

ggplot(emission,aes(year,total_emission, col = type)) +
    geom_line(size=1) +
    geom_point()

##Copy the plot
dev.copy(png, file = "plot3.png", width=480, height=480)

dev.off()
