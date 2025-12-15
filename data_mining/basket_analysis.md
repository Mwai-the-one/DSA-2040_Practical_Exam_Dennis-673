### 📝 Project README: Iris Dataset Analysis & Association Rule Mining
## 1. Project Overview

This project implements a complete data science workflow, focusing on the classic Iris dataset for machine learning applications (Clustering and Classification) and generating synthetic data for Market Basket Analysis (Association Rule Mining).

The workflow covers four main areas:

    Exploratory Data Analysis (EDA) and Preprocessing: Loading the Iris dataset, cleaning data quality issues, detecting and handling outliers, and feature scaling.

    Unsupervised Learning (Clustering): Applying the K-Means algorithm to group the species and determining the optimal number of clusters using the Elbow Method.

    Supervised Learning (Classification): Training and comparing two popular classification models: Decision Tree and K-Nearest Neighbors (KNN).

    Association Rule Mining: Using the Apriori algorithm to discover co-occurrence patterns in a synthetic transaction dataset.

## 2. Setup and Dependencies

To run this project, you will need the following key Python libraries. They are imported at the beginning of the script:

    Data Handling: pandas, numpy

    Machine Learning & Metrics: sklearn (for datasets, preprocessing, models, and metrics), mlxtend (for Apriori and TransactionEncoder)

    Visualization: matplotlib.pyplot, seaborn

## 3. Workflow Breakdown and Code Explanation

The project is executed in a sequential pipeline, with each code block serving a specific purpose.
# 3.1 Data Loading and Initial Inspection

The initial code block is dedicated to importing all necessary libraries for the entire project.

The next step loads the Iris dataset using sklearn.datasets.load_iris and converts it into a pandas DataFrame. Following the load, the code performs an initial inspection by printing the dataset structure (.info()), listing the column names, and displaying the first few rows for confirmation.
# 3.2 Data Cleaning and Preprocessing

The script defines and calls a data_cleaning function. This function is responsible for data quality checks:

    It first calculates and prints the number of missing values (.isnull().sum()) and duplicate rows (.duplicated().sum()).

    It then handles these issues by dropping rows with missing values (.dropna(inplace=True)) and removing exact duplicate rows (.drop_duplicates(keep='first', inplace=True)).

    Finally, it prints confirmation statements showing the before-and-after counts.

Next, the script tackles outlier detection and handling.

    The detect_outliers_iqr function uses the Interquartile Range (IQR) method to find outliers in key numerical columns. It calculates the Q1​, Q3​, IQR, and the bounds (Q1​±1.5×IQR) and prints the identified outliers.

    The cap_outliers function is then used to handle the detected outliers by capping. Any value outside the defined lower or upper bounds is replaced with the boundary value itself. This mitigates the influence of extreme values.

Following cleaning, feature scaling is performed using Min-Max Scaler (MinMaxScaler). This process transforms all numerical features to a range between 0 and 1, a critical step for distance-based algorithms like K-Means and KNN.

Finally, the target variable (target species) is processed using one-hot encoding (pd.get_dummies) to create binary columns for each species, which is useful for visualization and specific modeling techniques.
# 3.3 Exploratory Data Analysis (EDA)

This section begins by printing the descriptive statistics (.describe()) of the encoded DataFrame, summarizing the central tendency, dispersion, and shape of the dataset’s distribution.

The script then generates several Boxplots to visually compare the distribution of each feature (sepal length, sepal width, petal length, and petal width) across the three species. This allows for a visual assessment of how well the classes are separated by each feature.

A Correlation Heatmap is computed and plotted to show the linear relationships between all features. This helps identify highly correlated features (e.g., petal length and petal width).

The section concludes by splitting the cleaned but unscaled data (features X and target y) into 80% training and 20% testing sets. This specific unscaled split is prepared for the K-Means Clustering step.
# 3.4 Unsupervised Learning: K-Means Clustering

This section explores K-Means clustering, starting with the assumption of k=3 clusters (since the dataset has 3 known species).

    A K-Means model is initialized and trained on the features of the training set (X_train).

    It then predicts the cluster labels for the test set (X_test).

    The performance is evaluated by calculating the Adjusted Rand Index (ARI), a score that compares the predicted clusters to the true species labels (y_test). The result is printed along with a statement assessing its accuracy.

To validate the choice of k, the Elbow Method is implemented.

    The Within-Cluster Sum of Squares (WCSS) is calculated for k values ranging from 1 to 10.

    The resulting WCSS values are plotted against the number of clusters (k). The "elbow" point indicates the optimal value for k.

Finally, scatter plots are generated. The data points from the test set are plotted using Petal Length vs. Petal Width and Sepal Length vs. Sepal Width, with colors determined by the predicted cluster labels. This visualizes the clustering effectiveness.
# 3.5 Supervised Learning: Decision Tree and KNN Classification

A new train-test split is performed using the Min-Max scaled features (as scaling is generally beneficial for KNN) and the original target variable.

Decision Tree Classifier:

    A DecisionTreeClassifier is initialized and trained on the scaled training data.

    It makes predictions on the test set.

    Key classification metrics—Accuracy, Precision, Recall, and F1-Score—are calculated and printed.

    The final Decision Tree is visualized , showing the feature-based rules the model created to classify the species.

K-Nearest Neighbors (KNN) Classifier:

    A KNeighborsClassifier is initialized with k=5 and trained on the scaled training data.

    It makes predictions on the test set.

    Its Accuracy and F1-Score are calculated and printed.

Model Comparison: The script concludes the classification section by comparing the printed accuracy scores of the Decision Tree and KNN models and prints a conclusive statement on which model performed better, along with a reason specific to the characteristics of the Iris dataset.
# 3.6 Association Rule Mining

This final section explores Market Basket Analysis.

    Synthetic Data Generation: A list of 50 transactions is generated from a predefined list of items. Two strong co-occurrence patterns (e.g., 'diapers' and 'beer', 'coffee' and 'sugar') are intentionally introduced to ensure meaningful rules are discovered.

    One-Hot Encoding: The transactions list is converted into a suitable format using the TransactionEncoder from mlxtend, resulting in a one-hot encoded DataFrame.

    Apriori Algorithm: The apriori function is applied with a minimum support threshold of 0.1 to identify all frequent itemsets (groups of items appearing together frequently).

    Association Rules: The association_rules function generates the final rules using a minimum confidence threshold of 0.1. The resulting rules are sorted by lift, and the top 5 are printed, showing the antecedents (IF), consequents (THEN), support, confidence, and lift metrics.

    Visualization: A function is used to filter for item pairs and generate a bar plot of the top 10 most frequent item pairs by their support value, visually highlighting the strongest co-occurrences.