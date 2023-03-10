library(dplyr)

mechaCar_mpg = read.csv("MechaCar_mpg.csv")

# perform a linear regression using the lm() function
#dependent variable (yaxis): mpg
#independent variables (xaxis): length, weight, spoiler angle, drivetrain, ground clearance
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechaCar_mpg)

# use summary() function. get p-value and r^2
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechaCar_mpg))
# Part 1 p-value: 
# Part 1 r^2: 

# Part-1 summary: Vehicle_length and ground_clearance each separately
# exhibit a statistically significant effect on mpg. This is because when including these
# variables, among others, in the multiple linear regression model against mpg,
# the resulting p-values are lower than 0.05, and indicate they each have a 
# statistically significant effect on mpg.

# Since the p-values for these parameters were both less than 0.05,
# the probability that random chance played a role in how these factors affected mpg
# is far less than 5%. 
# The significance code returned for these parameters by the lm() function was ***,
# which indicates the strongest level of statistical significance.





