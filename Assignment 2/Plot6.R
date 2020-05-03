## Load Library
library(dplyr)
library(ggplot2)

## Set the working directory

setwd("~/VINITA/GRAYDON/R scripts/Coursera---Exploratory-Data-Analysis/Assignment 2")

##Load the data

NEI <- readRDS("summarySCC_PM25.rds")

## Check the data

head(NEI)
head(SCC)
colnames(SCC)

## Transform the data

emission = NEI %>%
    select(year, Emissions,type, fips) %>% 
    filter(type == "ON-ROAD" & fips %in% c("24510","06037")) %>%
    group_by(year,fips) %>% 
    summarise(total_emission = sum(Emissions))
  

emission

## Plot emissions from 1999 to 2008 for Baltimore

ggplot(emission,aes(year,total_emission, col = fips)) +
    geom_line(size=1.25) +
    geom_point()+
    scale_colour_discrete(name = "City", labels = c("Los Angeles", "Baltimore"))

##Copy the plot
dev.copy(png, file = "plot6.png", width=480, height=480)

dev.off()
