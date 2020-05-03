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
head(SCC)
colnames(SCC)

## Transform data

SCC$coal_related  <- grepl("coal", SCC$Short.Name, ignore.case=TRUE)|
    grepl("coal", SCC$EI.Sector,ignore.case = T)

head(SCC)

## Joining the data

data = left_join(NEI, SCC, by=c("SCC" = "SCC"))

glimpse(data)

emission = data %>%
    select(year, Emissions,coal_related ) %>% 
    filter(coal_related == "TRUE") %>% 
    group_by(year) %>% 
    summarise(total_emission = sum(Emissions))

emission

## Plot emissions from 1999 to 2008

barplot(emission$total_emission, emission$year,
        ylab = "Total Coal Emission", xlab = "Year",
        main = "Total Coal Combustion Emission from 1999 to 2008",
        names.arg = emission$year,
        col = "grey")

##Copy the plot
dev.copy(png, file = "plot4.png", width=480, height=480)

dev.off()
