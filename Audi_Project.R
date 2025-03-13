## -----------------------------------------------------------------------------
## Predicting Used Car Prices using Regression Analysis
## 
## Author: Satkar Karki
## Date: April 8, 2025
## 
## Description:
## This project builds a predictive model to estimate the price of used Audi cars.
## It includes data preprocessing, exploratory data analysis (EDA), regression modeling,
## and model evaluation using various metrics like RMSE, MAE, and R-squared.
##
## -----------------------------------------------------------------------------

## Clean Environment
rm(list = ls())

# Install necessary packages (if not already installed)
install.packages("caTools")
install.packages("knitr")
install.packages("corrplot")
install.packages("car")

# Load required libraries
library(ggplot2)
library(readr)
library(caTools)
library(knitr)
library(corrplot)
library(car)

# Set working directory
setwd("/Users/satkarkarki/Desktop/USD/Spring 2025/DSCI 725/R File")
getwd()

# Load the dataset
audi <- read.csv("audi.csv")

# Data Preparation & Cleaning
audi$model <- as.factor(audi$model)
audi$transmission <- as.factor(audi$transmission)
audi$fuelType <- as.factor(audi$fuelType)

# Check for missing values
sum(is.na(audi))

# Exploratory Data Analysis (EDA)
summary(audi)

# Visualizing categorical variables
ggplot(audi, aes(x = reorder(model, -table(model)[model]))) +
  geom_bar(fill = "lightblue", color = "black") +
  labs(title = "Distribution of Car Models", x = "Model", y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Boxplot visualization for numerical variables
par(mfrow=c(1,1))
boxplot(audi$price, col = "lightblue", main="Boxplot of Price", ylab="Price")

# Correlation matrix
cor_matrix <- cor(audi[, c("price", "year", "mileage", "tax", "mpg", "engineSize")], use="complete.obs")
corrplot(cor_matrix, method = "color", type = "upper", 
         tl.col = "black", tl.srt = 45, 
         title = "Correlation Matrix of Numeric Variables",
         addCoef.col = "black", number.cex = 0.7, mar = c(0, 0, 1, 0))

# Splitting dataset into training and testing sets
set.seed(123)
split <- sample.split(audi$price, SplitRatio = 0.7)
train_set <- subset(audi, split == TRUE)
test_set <- subset(audi, split == FALSE)

# Building the multiple regression model
model <- lm(price ~ model + year + transmission + mileage + fuelType + tax + mpg + engineSize, data = train_set)

# Display model summary
summary(model)

# Variance Inflation Factor (VIF) for multicollinearity check
vif_values <- vif(model)
print(vif_values)

# Residual analysis
par(mfrow=c(2,2))
plot(model)

# Predict prices using the test set
predicted_prices <- predict(model, newdata = test_set)

# Compare predicted vs actual values
results <- data.frame(Actual = test_set$price, Predicted = predicted_prices)
head(results)

## -----------------------------------------------------------------------------
## Model Evaluation: Measuring Predictive Accuracy
## -----------------------------------------------------------------------------

# Compute Mean Absolute Error (MAE)
mae <- mean(abs(test_set$price - predicted_prices))

# Compute Mean Squared Error (MSE)
mse <- mean((test_set$price - predicted_prices)^2)

# Compute Root Mean Squared Error (RMSE)
rmse <- sqrt(mse)

# Compute R-squared
ss_total <- sum((test_set$price - mean(test_set$price))^2)
ss_residual <- sum((test_set$price - predicted_prices)^2)
r_squared <- 1 - (ss_residual / ss_total)

# Print Evaluation Metrics
cat("\nModel Evaluation Metrics:\n")
cat("Mean Absolute Error (MAE): ", mae, "\n")
cat("Mean Squared Error (MSE): ", mse, "\n")
cat("Root Mean Squared Error (RMSE): ", rmse, "\n")
cat("R-squared (on test data): ", r_squared, "\n")

