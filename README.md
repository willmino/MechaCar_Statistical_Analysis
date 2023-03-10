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

This model can effectively predict fuel-efficiencies (mpg) of MechaCar prototypes because the resulting multiple r^2 value is 0.71.
This value indicates a strong correlation between some of the independent variables and the dependent variable of mpg.

![MechaCar_Statistical_Analysis](https://github.com/willmino/MechaCar_Statistical_Analysis/blob/main/images/part1_mult_lin_regression.png)



