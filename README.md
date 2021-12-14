# csci561-finalproject-team2

This is a shared project space for the Statistical Learning II (CSCI561) course at Colorado School of Mines. This shared repository contains R scripts for engineering features and constructing predictive model for compressing climate data.

## Authors

- Collin Barraugh (email: cbarraugh@mines.edu, mobile: 8582134014)
- Margaret Sabelhaus (email: msabelhaus@mines.edu, mobile: 3015252903)
- Doug Curth (email: Dcurth@mines.edu: , mobile: 5027515383 )
- Jose Molina (email: , mobile: )

## Collaboration Links

- Overleaf: <https://www.overleaf.com/project/6193187f3459e8cf3a6ec0e5>
- Slack: <https://app.slack.com/client/T02MPEX9L3G/C02MW6HS38A>
- GitHub: if you are reading this you are already here

## Guide to Code

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




