# Part 1
library(dplyr)
mechaCar_mpg = read.csv("MechaCar_mpg.csv")

# perform a linear regression using the lm() function
#dependent variable (yaxis): mpg
#independent variables (xaxis): length, weight, spoiler_angle, drivetrain, ground_clearance
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechaCar_mpg)

# use summary() function. get p-value and r^2
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechaCar_mpg))
# p-value = {vehicle_length: 2.60E-12, ground_clearance: 5.21E-08}
# Multiple R-squared = 0.7149

# Part 2
# get the mean, median, variance, & SD of the suspension_coil PSI column.
suspension_coil = read.csv("Suspension_Coil.csv")
total_summary <- suspension_coil %>%
  summarize(Mean = mean(PSI),Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

# create a lot_summary dataframe using the group_by() function and summarize() functions
# group each manufacturing lot by the mean, median, variance, and SD
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>%
  summarize(Mean = mean(PSI),Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

# Part 3
#Lot1 <- suspension_coil[suspension_coil$Manufacturing_Lot=="Lot1","PSI"]
#Lot2 <- suspension_coil[suspension_coil$Manufacturing_Lot=="Lot2","PSI"]
#Lot3 <- suspension_coil[suspension_coil$Manufacturing_Lot=="Lot3","PSI"]

#psi_values <- c(Lot1,Lot2,Lot3)

t.test(suspension_coil$PSI,mu=1500)
# Alternative Hypothesis: True mean is not equal to 1500. p-value: 0.06.
# We cannot reject the null hypothesis. The mean is so close to 1500 that its only difference
# can be due to random chance.

t.test(subset(suspension_coil, Manufacturing_Lot == "Lot1")$PSI, mu = 1500)
t.test(subset(suspension_coil, Manufacturing_Lot == "Lot2")$PSI, mu = 1500)
t.test(subset(suspension_coil, Manufacturing_Lot == "Lot3")$PSI, mu = 1500)

