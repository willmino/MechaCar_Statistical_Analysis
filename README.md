# MechaCar_Statistical_Analysis
R statistical analyses and visualizations with car manufacturing data

## Overview
At AutosRUs, vehicle prototypes for the MechaCar were assessed in a multiple linear regression model to observe how certain characteristics of the vehicle impacted its fuel efficiency (mpg). Also, manufacturing lot testing of suspension coils were assessed for summary statistics and t-tests to meet specification standards. An additional statistical test was suggested at the end of this analysis for ranking the 2024 MechaCar with its competitor the 2023 Z-tron.


## Linear Regression to Predict MPG
In a multiple linear regression model, the influences of independent variables on a dependent variable are assessed for statistical significance.
To assess the MechaCar prototypes, a multiple linear regression model monitored the parameters "vehicle_length", "vehicle_weight", "spoiler_angle", "ground_clearance", and "AWD" and assessed their influences on the dependent variable mpg for statistical significance.
For this study, The independent variables "vehicle_length" and "ground_clearance" provided a non-random amount of variance towards the mpg values in the dataset.
This is because the summary() of the multiple linear regression model in this example returned statistically significant p-values for "vehicle_length" and "ground_clearance".
Since the p-values for these parameters were far less than 0.05, there was over a 99% probability that the influence of these parameters on the mpg variable were not random.

The slope of this multiple linear model is not considered to be zero. The multiple linear regression model asks the question: "is the slope of the linear model not equal to zero?"
If this outcome is true, the null hypthesis is rejected. Though almost impossible to plot, we can tell the slope of this model is not equal to zero because there is at least one significant linear relationship between an independent variable (ex: vehicle_length or ground_clearance) and the depdendent variable of mpg.
We know there is at least one statistically significant relationship between these variables because the lm() function output reveals separate coefficients for each independent variable in the multiple linear model
when compared to the mpg dependent variable. The coefficients are the result of a slope of a line that is created when all other independent variables are held constant. This allows the function to assess each independent
variable's separate effect on mpg. For the variables "vehicle_length" and "ground_clearance", the coefficients produced are 6.27 and 3.55, respectively. These values indicate the slope of the line describing the relationship
between each independent variable and mpg is positive and large. Though the other independent variables ("vehicle_weight", "spoiler_angle") have coefficients that are not zero, they still are very small and are less likely to have arisen without random chance. Thus, the p-values for the "vehicle_length" and "ground_clearance" parameters are very low and pass the significance threshold.

![MechaCar_Statistical_Analysis](https://github.com/willmino/MechaCar_Statistical_Analysis/blob/main/images/part1_mult_lin_regression.png)

### Linear Regression Prediction Efficacy

This model can effectively predict fuel-efficiencies (mpg) of MechaCar prototypes because the resulting multiple r^2 value is 0.71. R^2 is a quantitative measure of the 
validity of a trend in the data that is not due to random chance. The measure of r^2 ranges from 0 to 1. An r^2 closer to 1 indicates that the distribution of data associated with a relationship between two variables is less random and more specific. In the case of this multiple r^2 value (from the multiple linear regression model), the value of 0.71 indicates a strong correlation between some of the independent variables and the dependent variable of mpg. Using our resulting mutiple linear regression model equation, input data from novel MechaCar models without an mpg reading will likely yield a good predictor for mpg (fuel efficiency).

## Summary Statistics on Suspension Coils

![total_summary](https://github.com/willmino/MechaCar_Statistical_Analysis/blob/main/images/total_summary.png)

MechaCar prototype suspension coils were assessed in a statistical summary. In our summary of the bulk dataset "total_summary", the mean PSI value for coils from all production lots was 1498.78 and the median value was 1500. The mean was very close to the median indicating the data was very close to an ideal normal distribution. The variance of the data set was 62.29. This indicated a large degree of variability among points relative to the mean value. The total data was spread out quite a bit. The standard deviation is the square root of variance at a value of 7.89. The means that 95% of all the coil PSI data measurements were within +/- 15.78 PSI units from the mean.

![lot_summary](https://github.com/willmino/MechaCar_Statistical_Analysis/blob/main/images/lot_summary.png)

To examine the most likely source of variance made apparent in the bulk dataset, we separated the summary statistics from the dataset by manufacturing_lot number. This was accomplished by using the group_by() function, piped (%>%) to the dataset, and then using the summary() function in conjuction with another pipe (%>%). A new summary table "lot_summary" was generated. In this summary table, it was revealed that Lot3 and Lot2 exhibit a higher degree of variance and standard deviation compared to Lot1. Lot3 exhibited a variance value of 170.29 and a standard deviation of 13.05. Lot2 exhibited a variance of 7.47 and a standard deviation of 2.73. Lot1 exhibited a low variance of 0.98 and a standard deviation of 0.98. This meant that the data from Lot3 and Lot2 were contributing to a greater spread of data away from the mean. Thus, we can tell that Lot1 coil PSI data was closer to the mean values and less spread out. 

According to the design specifications for the MechaCar suspension coils, the variance level must not exceed 100 pounds per square inch. Based on the "total_summary" data from pooling all lots together, the bulk dataset met the design specification with a total variance of 62.3. However, not all Manufacturing lots individually met thse specifications. Lot3 failed to meet the variance requirement for its PSI measurements because its variance was at 170 PSI, which was greater than 100 PSI. Lot1 and Lot2 did in fact meet the requirements because their variance measurements both were less than 100 PSI. It was likely that suspension coils from Lot1 and Lot2 were selected for production for the MechaCar.


## T-Tests on Suspension Coils

## Bulk Dataset T-test with Population Mean
![t.test_population_mean](https://github.com/willmino/MechaCar_Statistical_Analysis/blob/main/images/t.test_1.png)

In the first t-test, the PSI values from all three production lots combined were tested against the entire group's average to determine if there was a significant difference in the values. Since 1500 PSI was used as the mu value for the t.test() function, the difference in the average PSI across all production lots versus the population average PSI was not statistically significant. This is because the resulting p-value (~0.06) from this t-test was greater than 0.05.


### Lot by Lot T-tests with Population Mean
![t.test_Lot1](https://github.com/willmino/MechaCar_Statistical_Analysis/blob/main/images/t.test_Lot1.png)
![t.test_Lot2](https://github.com/willmino/MechaCar_Statistical_Analysis/blob/main/images/t.test_Lot2.png)
![t.test_Lot3](https://github.com/willmino/MechaCar_Statistical_Analysis/blob/main/images/t.test_Lot3.png)

When comparing each production lot's average PSI value as a sample group against the total population, we began to see some differences in the resulting p-values. There was no difference between the Lot1 average PSI sample group and the total population PSI average because the resulting p-value was 1. Also, we could tell from our results table in part 2, that the values were identical (Lot1 mean PSI = 1500 vs mu = 1500). The p-value for Lot2 difference with the population mean was 0.607. This did not meet the confidence level of 0.05 and thus the difference in these mean PSI values was not statistically significant (Lot2 mean PSI = 1500.2 vs. mu=1500). The difference between Lot3 mean PSI and the population mean PSI yielded a p-value of 0.04168. This value was less than the confidence level of 0.05. Thus, the Lot3 mean PSI value of 1496.14 was significantly different than the population mean PSI value of 1500.


## Novel Study Design: MechaCar vs Competition

A study will be conducted to quantify how the 2024 MechaCar performs against the most recent competitor's electric vehicle the 2023 Z-tron.
The 2024 version of the MechCar is slated to feature an electric engine, improved electric travel efficiency (miles per charge), improved performance (horse power), and reduced carbon emissions. Like-minded consumers in the "Green" era of vehicle transportation today will be interested in the features this vehicle will have to offer.

### Metrics:
For this study, I will be testing the average vehicle lifetime compared between the 2024 MechaCar and its competitor the 2023 Z-tron.


### Average Vehicle Lifetime Background
When features are added to a car to make it more appealing to consumers, there are tradeoffs. A boring car designed for as minimal wear and tear possible over time will likely be very slow, aesthetically unpleasant, and generally not satisfying for the customer. On the other extreme, a very fast car (like a drag race car) experiences tremendous wear and tear and likely engine damage after a few number of drag races. Thus, tradeoffs are made between the integrity/stability of the car and improvements to vehicle function/appeal at the expense of the vehicle's stability. We are specifically going to monitor how the wear and tear, as a result of the improvements made to the MechaCar, affect the vehicle's average lifetime for the consumer, and how it ranks up to the competitor, the Z-tron.

The average vehicle lifetime is a value in years which comes from the aggregation of data from physical tests assessing the wear and tear brought about by the novel features of the car (electrical machinery components being disrupted on bumpy roads, mechanical stress resulting from improved horsepower, and structural sacrfices made for improved fuel efficiency) along with the likelihood of a customer to perform maintenance to fix the wear and tear. Accelerated physical tests will be run on the vehicles to simulate everyday wear and tear and to predict the average vehicle lifetime. Average vehicle lifetime will be quantified as the total amount of time (in years) a vehicle will be operated by a customer before an intolerable level of wear and tear and a loss of interest in maintenance funding are achieved.

### Null Hypothesis:
The novel features of the 2024 MechaCar do not lead to improved average vehicle lifetime compared to the competitor vehicle the Z-tron.

### Alternative Hypothesis:
The novel features of the 2024 MechaCar lead to improved average vehicle lifetime compared to the competitor vehicle the Z-tron.

### Statistical Test:
To reject our null hypothesis, a one tailed two-sample t-test must be performed to illustrate statistical significance in a positive improvement of the 2024 MechaCar's average vehicle lifetime compared to the 2023 Z-tron. A one tailed t-test is specifically performed because we are looking for IMPROVED average vehicle lifetime of the MechaCar that is statistically significant as opposed to simply assessing ANY statistically significant difference (includes improved or worsened) between the two car models.

This one-tailed two sample t-test is necessary because it will compare the mean values of average vehicle lifetime between the MechaCar and Z-tron sample populations and look to see if any of the variance between these two datasets is due to random chance. If the variance between the datasets are in fact due to random chance, then our statistical test will yield a p-value that is greater than 0.05 which will not satisfy our confidence level. Thus we will not be able to reject our null hypothesis. However, if the variance in the data is not due to random chance, (for example: reduced "wear and tear" or reduced "maintenance cost" is likely a factor in improved average vehicle lifetime), and our MechaCar has an improved average vehicle lifetime compared to the Z-tron, we can reject the null hypothesis and support the claim that the 2024 MechaCar is better than the 2023 Z-tron in this regard.

### Data Required for the Statistical Test

The data required for this statistical test is average vehicle lifetime. Each point in the dataset is a single value in years that comes from an aggregation of physical testing (physical tests assess wear and tear and how it influences likelihood of a customer paying to repair the damages) on 100 MechaCars and 100 Z-tron vehicles over a period of time to simulate ten years. Thus, we will have an N= 100 input which is enough data to obtain a relatively normal distribution for our t-test.

We can then compare the average vehicle lifetime from the MechaCar sample group and the Z-tron sample group (comparing two sample group means) in a one tailed two-sample t-test with 100 data points for each car (N=100). The result of this t-test will be a p-value. If the p-value is below the confidence level of 0.05, it will yield statistical significance. This outcome will have come about if the novel features of the MechCar offered a non-random amount of variance towards average vehicle lifetime that is an improvement compared to the Z-tron.



