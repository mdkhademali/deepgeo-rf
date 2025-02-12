# DeepGeo RF

## Project Overview
DeepGeo RF is a geospatial machine learning project that uses Remote Sensing and GIS techniques to classify satellite imagery. The project leverages **Random Forest (RF)** and **terra** library in R to analyze and classify land cover types from **GeoTIFF raster images**.

## Features
- Load and preprocess **satellite imagery** (GeoTIFF format)
- Extract **RGB + NIR bands** for classification
- Train a **Random Forest model** using labeled data
- Perform **land cover classification**
- Visualize classification results using **plots and maps**

## Usage
### 1. Load Satellite Image
```r
library(terra)

# Load GeoTIFF file
raster_image <- rast("satellite_image.tif")

# Display raster information
print(raster_image)
```

### 2. Load Training Data
```r
labels <- read.csv("training_data.csv")
head(labels)
```

### 3. Train Random Forest Model
```r
library(randomForest)

rf_model <- randomForest(as.factor(Class) ~ ., data = labels, ntree = 100)
```

### 4. Perform Classification
```r
prediction <- predict(rf_model, as.data.frame(raster_image, xy = TRUE, na.rm = TRUE))
plot(prediction)
```

### 5. Save Classified Image
```r
writeRaster(prediction, "classified_output.tif", format="GTiff", overwrite=TRUE)
```
