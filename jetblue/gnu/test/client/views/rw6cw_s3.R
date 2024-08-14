#!/usr/bin/r

# Copyright (c)
mydata <- read.table("data.dat")

# Step 1: Calculate the mean and standard deviation
mean_val <- mean(mydata$V1)
sd_val <- sd(mydata$V1)


# Step 2: Calculate the z-score for each value
z_scores <- (mydata$V1 - mean_val) / sd_val

# Step 3: Calculate the percentage of values that are less than the mean
percentage_less_than_mean <- (sum(mydata$V1 < mean_val) / nrow(mydata)) * 100


# Step 4: Calculate the percentage of values that are greater than the mean
percentage_greater_than_mean <- (sum(mydata$V1 > mean_val) / nrow(mydata)) * 100
