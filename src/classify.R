# Load necessary libraries
library(terra)
library(randomForest)

# Load the satellite image
raster_image <- rast("satellite_image.tif")

# Select bands (assuming RGB + NIR)
raster_df <- as.data.frame(raster_image, xy = TRUE, na.rm = TRUE)

# Load labeled data (if available)
labels <- read.csv("training_data.csv")

# Train the Random Forest model
# Assuming 'Class' is the column in 'labels' that contains the class labels
rf_model <- randomForest(as.factor(Class) ~ ., data = labels, ntree = 100)

# Perform classification prediction
prediction <- predict(rf_model, raster_df)

# Plot the prediction results on a map
plot(prediction)