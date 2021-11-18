# Load the data. The data is structured as a list containing two variables, mat and var.
# The data consists of climate model output at ten separate time slices for multiple climate variables.
# The mat variable is a list where each element is the dataset for a single variable at a single time slice, 
# stored as a matrix. The elements in the var variable are the variable names and frequencies corresponding 
# to each dataset. The ith element in the var variable corresponds to the name and output frequency of
# the ith element in the mat variable.

load("./High/high_train.RData")
load("./Med/med_train.RData")
load("./Low/low_train.RData")
load("./High/high_validate.RData")
load("./Med/med_validate.RData")
load("./Low/low_validate.RData")

# Here are the values for a single dataset
high_train$mat[[1]]
# And here are the variable names corresponding to all the datasets in high_train. The first dataset shown above corresponds to the monthly variable BURDENDUST.
high_train$var

# Once the data is loaded, a single dataset can be plotted using image()
# More information about each variable including full name and units is located at
# https://www.cesm.ucar.edu/projects/community-projects/DPLE/data-sets.html

# Select data and axis labels
n=170
selected_dataset <- high_train
l <- length(selected_dataset$mat)
latitudes <- round(as.numeric(colnames(selected_dataset$mat[[n]])))
longitudes <- as.numeric(rownames(selected_dataset$mat[[n]]))
dataset <- selected_dataset$mat[[n]]
varname <- selected_dataset$var[n]

# Plot
image(dataset, main=varname, col = hcl.colors(100, "Blue-Red"),
      axes=FALSE, xlab="Longitude", ylab="Latitude")
axis(3, at=seq(0,1, length=7), labels=longitudes[seq(1, 288, length.out=7)],
     lwd=0, pos=-0.2, outer=T)
axis(2, at=seq(1,0, length=9), labels=latitudes[seq(1, 192, length.out=9)],
     lwd=0, pos=0)

# First, create features and put the features and observations into a data frame.
# This sample feature adds up the value of every element in the dataset, in case variables with larger
# magnitude values tend to have different optimal compression levels. The sample features should be computed for
# every dataset and added to the data frame, along with the classification for the dataset.

df <- data.frame()
ds_list <- list(high_train, med_train, low_train, high_validate, med_validate, low_validate)
classifications = c("high", "med", "low")
class_index = rep(c(1, 2, 3), 2)
for (i in 1:length(ds_list)){
  l <- length(ds_list[[i]]$mat)
  sum_feature = rep(NA, l)
  for(j in 1:l){
    sum_feature[j] <- sum(ds_list[[i]]$mat[[j]])
  }
  classification = classifications[class_index[i]]
  df <- rbind(df, data.frame("sum"=sum_feature, "classification"=rep(classification, l)))
}
df$classification <- as.factor(df$classification)

# Check that the data frame has been created successfully

head(df)
tail(df)

# Append a new feature, this one is the number of zeroes in each dataset, a measure of the sparsity of the dataset.

ds_list <- list(high_train, med_train, low_train, high_validate, med_validate, low_validate)
z <- c()
for (i in 1:length(ds_list)){
  l <- length(ds_list[[i]]$mat)
  zero_feature = rep(NA, l)
  for(j in 1:l){
    zero_feature[j] <- sum(ds_list[[i]]$mat[[j]] == 0)
  }
  z <- c(z, zero_feature)
}
df <- cbind(df, data.frame("zeroes"=z))

# Check that the data frame has been updated successfully.

head(df)
tail(df)

max_train_index = length(high_train$var) + length(med_train$var) + length(low_train$var)
train_indices = 1:max_train_index
validate_indices = (max_train_index + 1):length(df$classification)
