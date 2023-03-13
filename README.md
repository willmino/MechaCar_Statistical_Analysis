# MechaCar_Statistical_Analysis
R statistical analyses and visualizations with car manufacturing data


## Linear Regression to Predict MPG

The independent variables "vehicle_length" and "ground_clearance" provided a non-random amount of variance to the mpg values in the dataset.
This is because the summary() of the multiple linear regression model in this example returned statistically significant p-values for "vehicle_length" and "ground_clearance".
Since the p-values for these parameters were far less than 0.05, there was over a 99% probability that the influence of these parameters on the mpg variable were not random.

The slope of this multiple linear model is not considered to be zero. The multiple linear regression model asks the question: "is the slope of the linear model not equal to zero?"
If this outcome is true, the null hypthesis is rejected. Though almost impossible to plot, we can tell the slope of this model is not equal to zero because there is at least one significant linear relationship between
an independent variable (ex: vehicle_length or ground_clearance) and the depdendent variable of mpg.
We know there is at least one statistically significant relationship between these variables because the lm() function output reveals separate coefficients for each independent variable in the multiple linear model
when compared to the mpg dependent variable. The coefficients are the result of a slope of a line that is created when all other independent variables are held constant. This allows the function to assess each independent
variable's separate effect on mpg. For the variables "vehicle_length" and "ground_clearance", the coefficients produced are 6.27 and 3.55, respectively. These values indicate the slope of the line describing the relationship
between each independent variable and mpg is positive and large. Though the other independent variables ("vehicle_weight", "spoiler_angle") have coefficients that are not zero, they still are very small and are less likely to have arisen without random chance. Thus, the p-values for the "vehicle_length" and "ground_clearance" parameters are very low and pass the significance threshold.

This model can effectively predict fuel-efficiencies (mpg) of MechaCar prototypes because the resulting multiple r^2 value is 0.71. R^2 is a quantitative measure of the 
validity of a trend in the data that is not due to random chance. The measure of R^2 ranges from 0 to 1. An r^2 closer to 1 indicates that the distribution of data associated with a relationship between two variables is less random and more specific. In the case of this multiple r^2 value (from the multiple linear regression model), the value of 0.71 indicates a strong correlation between some of the independent variables and the dependent variable of mpg. Using our resulting mutiple linear regression model equation, input data from novel MechaCar models without an mpg reading will likely yield a good predictor for mpg (fuel efficiency).

![MechaCar_Statistical_Analysis](https://github.com/willmino/MechaCar_Statistical_Analysis/blob/main/images/part1_mult_lin_regression.png)

# Part 2

## Summary Statistics on Suspension Coils

![total_summary](https://github.com/willmino/MechaCar_Statistical_Analysis/blob/main/images/total_summary.png)

In our summary of the total dataset "total_summary" the mean PSI value for coils from all production lots is 1498.78 and the median value is 1500. The mean is very close to the median indicating the data is very close to an ideal normal distribution. The variance of the data set is 62.29. This is indicates there is a large degree of variability among points relative to the mean value. The total data is spread out quite a bit. The standard deviation is the square root of variance at a value of 7.89. The means that 95% of all the coil PSI data measurements are within +/- 15.78 PSI units from the mean.

![lot_summary](https://github.com/willmino/MechaCar_Statistical_Analysis/blob/main/images/lot_summary.png)

To examine the most likely source of variance, we separated the summary statistics from the dataset by manufacturing_lot number. Thsi was accomplished by using the group_by() function, piped (%>%) to the dataset, and then using the summary() function in conjuction with another pip (%>%). A new summary table "lot_summary" was generated. In this summary table, it is revealed that Lot3 and Lot2 exhibit a higher degree of variance and standard deviation compared to Lot1. Lot3 exhibits a variance value of 170.29 and a standard deviation of 13.05. Lot2 exhibits a variance of 7.47 and a standard deviation of 2.73. Lot1 exhibits a low variance of 0.98 and a standard deviation of 0.98. This means that the data from Lot3 and Lot2 are contributing to a greater spread of data away from the mean. Thus, we can tell that Lot1 coil PSI data is closer to the mean values and less spread out. 

According to the design specifications for the MechaCar suspension coils, the variance level must not exceed 100 pounds per square inch. Based on the "total_summary" data, all lots in total meet the current manufacturing needs with a total variance of 62.3 However, not all Manufacturing lots meet the specifications individually. Lot3 fails to meet the variance requirement for its PSI measurements. Lot1 and Lot2 do in fact meet the requirements because their variance measurements are less than 100 PSI. It is likely that suspension coils from Lot1 and Lot2 will be produced for the MechaCar.

# Part 3

## T-Tests on Suspension Coils

In the first t-test, the PSI values from all three production lots are tested against the entire group's average to determine if there is a significant difference in the values. Since 1500 PSI was used as the mu value for the t.test() function, the difference in the average PSI across all production lots versus the population average PSI ws not statistically significant. This is because the resulting p-value from this t-test was greater than 0.05.

When comparing each production lot's average PSI value as a sample group against the total population, we began to see some differences in the resulting p-values. There was no difference between the Lot1 average PSI sample group and the total population PSI average because the resulting p-value was 1. Also, we could tell from our results table in part 2, that the values were identical (Lot1 mean PSI = 1500 vs mu = 1500). The p-value for Lot2 difference with the population mean was 0.607. This did not meet the confidence level of 0.05 and thus the difference in these mean PSI values was not statistically significant (Lot2 mean PSI = 1500.2 vs. mu=1500). The difference between Lot3 mean PSI and the population mean PSI yielded a p-value of 0.04168. This value was less than the confidence level of 0.05. Thus, Lot3 mean PSI value of 1496.14 was significantly different than the population mean PSI value of 1500.


