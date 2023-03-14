# Part 1
library(dplyr)
mechaCar_mpg = read.csv("MechaCar_mpg.csv")

# RScript: perform a linear regression using the lm() function
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechaCar_mpg)

# RScript: use summary() function. get p-value and r^2
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechaCar_mpg))
# p-value = {vehicle_length: 2.60E-12, ground_clearance: 5.21E-08}
# Multiple R-squared = 0.7149

# Part 2
suspension_coil = read.csv("Suspension_Coil.csv")
# RScript: get the mean, median, variance, & SD of the suspension_coil PSI column.
total_summary <- suspension_coil %>%
  summarize(Mean = mean(PSI),Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

# RScript: create a lot_summary dataframe using the group_by() function and summarize() functions
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>%
  summarize(Mean = mean(PSI),Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

# Part 3
# Rscript: t-test for total dataset compared to the population mean of 1500 PSI
t.test(suspension_coil$PSI,mu=1500)

# Rscript: 3 t-tests for each manufacturing_lot dataset compared to the population mean of 1500 PSI
t.test(subset(suspension_coil, Manufacturing_Lot == "Lot1")$PSI, mu = 1500)
t.test(subset(suspension_coil, Manufacturing_Lot == "Lot2")$PSI, mu = 1500)
t.test(subset(suspension_coil, Manufacturing_Lot == "Lot3")$PSI, mu = 1500)

