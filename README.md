# csci561-finalproject-team2

This is a shared project space for the Statistical Learning II (CSCI561) course at Colorado School of Mines. This shared repository contains R scripts for engineering features and constructing predictive model for compressing climate data.

## Authors

- Collin Barraugh (email: cbarraugh@mines.edu, mobile: 8582134014)
- Margaret Sabelhaus (email: msabelhaus@mines.edu, mobile: 3015252903)
- Doug Curth (email: Dcurth@mines.edu: , mobile: 5027515383 )
- Jose Molina (email: jmolinagal@gmail.com, mobile:7203083638 )

## Collaboration Links

- Overleaf: <https://www.overleaf.com/project/6193187f3459e8cf3a6ec0e5>
- Slack: <https://app.slack.com/client/T02MPEX9L3G/C02MW6HS38A>
- GitHub: if you are reading this you are already here

## Guide to Code

/src/pooling
- Uncomment line 112 and run normalize.Rmd to normalize the cimate images (left adjusted to 0 and divided by max ixel value)
- Run pooling_stats.ipynb to generate appriximately 30 pooling features for each dataset of climate images
- testing_poolingFeatures.csv and train_validation_poolingFeatures contain the best 5 pooling features generated from the python script for each dataset

/src/dfCreation.Rmd: 
- Generates the initial dataframe and populates it with simple summary statistic features
- Adds in contour features
- Adds in pooling features
- Saves the unstandardized data to CSVs
- Creates the dataframe of standardized features
- Saves the standardized data to CSVs

/src/multiStageModel1.Rmd
- Runs what we refer to as the Multi-Stage Model 1

/src/Subset selection and KNN Model.Rmd
- Runs subset selection and KNN model once variables have been created.

/src/ModelingTreesModel2.Rmd
-Runs what we refer to as the Multi-Stage Model 2

/writeup
- Contains files describing the objective for the class project. 


