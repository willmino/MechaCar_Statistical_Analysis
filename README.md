# MechaCar_Statistical_Analysis
R statistical analyses and visualizations with car manufacturing data


## Linear Regression to Predict MPG

![MechaCar_Statistical_Analysis](https://github.com/willmino/MechaCar_Statistical_Analysis/tree/main/images)

The independent variables "vehicle_length" and "ground_clearance" provided a non-random amount of variance to the mpg values in the dataset.
This is because the summary() of the multiple linear regression model in this example returned statistically significant p-values for "vehicle_length" and "ground_clearance".
Since the p-values for these parameters were far less than 0.05, there was over a 99% probability that the influence of these parameters on the mpg variable were not random.

