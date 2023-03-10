# Part 1

library(dplyr)

mechaCar_mpg = read.csv("MechaCar_mpg.csv")

# perform a linear regression using the lm() function
#dependent variable (yaxis): mpg
#independent variables (xaxis): length, weight, spoiler angle, drivetrain, ground clearance
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechaCar_mpg)

# use summary() function. get p-value and r^2
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechaCar_mpg))


# Part 2
# get the mean, median, variance, & SD of the suspension_coil PSI column.

suspension_coil = read.csv("Suspension_Coil.csv")

total_summary <- suspension_coil %>%
  summarize(Mean = mean(PSI),Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

# create a lot_summary dataframe using the group_by() function and summarize() functions





