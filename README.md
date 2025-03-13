# Used Car Price Prediction - Audi Dataset

## Overview
This project builds a **multiple linear regression model** to predict the prices of used **Audi** cars based on various attributes such as model, year, mileage, transmission type, fuel type, tax, mpg, and engine size. 

The goal is to analyze key factors affecting **used car prices** and evaluate the predictive accuracy of the model using **MAE, MSE, RMSE, and R-squared**.

## Objectives
- **Data Preprocessing**
  - Import and clean the dataset (`audi.csv`).
  - Convert categorical variables into factors.
  - Check and handle missing values.
  - Perform exploratory data analysis (EDA).
  - Visualize distributions of key features.

- **Regression Modeling**
  - Build a **multiple linear regression model** to predict used car prices.
  - Test for multicollinearity using **Variance Inflation Factor (VIF)**.
  - Evaluate model performance on test data.

- **Model Evaluation**
  - Compute **Mean Absolute Error (MAE)**, **Mean Squared Error (MSE)**, and **Root Mean Squared Error (RMSE)**.
  - Calculate **R-squared** to assess model performance.

## Dataset
- **Source**: The dataset (`audi.csv`) contains information on used Audi cars.
- **Columns:**
  - `model`: Audi car model (e.g., A3, A4, Q5, etc.).
  - `year`: Manufacturing year.
  - `transmission`: Type of transmission (e.g., Manual, Automatic).
  - `mileage`: Total distance the car has been driven.
  - `fuelType`: Type of fuel used.
  - `tax`: Annual road tax in GBP.
  - `mpg`: Miles per gallon (fuel efficiency).
  - `engineSize`: Engine size in liters.
  - `price`: Actual selling price of the used car.

## Exploratory Data Analysis (EDA)
- **Distribution of Car Models**: Bar chart to visualize model frequency.
- **Boxplots** for price, mileage, tax, mpg, and engine size.
- **Correlation Analysis** to identify relationships between numerical variables.

## Regression Model
- **Model Formula**:
  ```
  price ~ model + year + transmission + mileage + fuelType + tax + mpg + engineSize
  ```
- **Interaction Term Tested**:
  ```
  price ~ model + year + transmission * engineSize + mileage + fuelType + tax + mpg
  ```

## Model Performance Metrics
| Metric | Value |
|--------|------|
| **MAE** (Mean Absolute Error) | TBD |
| **MSE** (Mean Squared Error) | TBD |
| **RMSE** (Root Mean Squared Error) | TBD |
| **R-squared** | TBD |

## Files in This Repository
```
📂 Used_Car_Prediction/
 ├── 📜 Audi_Project.R  # R script for data analysis & regression model
 ├── 📜 audi.csv  # Dataset containing Audi used car data
 ├── 📜 README.md  # Project documentation (this file)
```

## How to Run the Code
1. Open **R Studio**.
2. Load the dataset:
   ```r
   audi <- read.csv("audi.csv")
   ```
3. Run the `Audi_Project.R` script to:
   - Clean and visualize data.
   - Train the regression model.
   - Evaluate model performance.

## Tools & Technologies Used
- **R Programming**
- **ggplot2** for data visualization
- **car** package for multicollinearity analysis
- **caTools** for data splitting
- **corrplot** for correlation analysis

## Author
**Satkar Karki**  
[LinkedIn](https://www.linkedin.com/in/satkarkarki)  
[GitHub](https://github.com/satkar605)

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
