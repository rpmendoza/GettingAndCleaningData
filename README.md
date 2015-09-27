# README

The run_analysis.R file reads and analyzes wearable data for 30 subjects/volunteers. The script first loads the data.table and dplyr packages. It then reads the files related to the volunteers' activites (walking, standing, etc) as well as the devices' features (x, y, z movement coordinates). The volunteers were randomly divided into training and testing. The script reads the testing data first, then the training data.

After all the data files have been read, the script renames the headings of the data into something more meaningful. For example, column V2 in the activities data has been renamed to "Activities". The code then extracts only the mean and standard deviation readings from the features data.

The testing volunteer data, their activities, and their movement are all combined into a single "testing" data. The same was done to the "training" data.

Finally, the two training and testing data were merged into a single (final) data frame called mergedDF. One final cleanup action was to remove the ambiguous heading for activities from the final data frame.

The last part the script is it creates a "summary" of the merged data and calculates the mean for the gyroscope movements. It also creates a file for the tidy data set.
