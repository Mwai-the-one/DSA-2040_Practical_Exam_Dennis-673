### 🔬 Project Title: Comprehensive Iris Dataset Analysis: Clustering, Classification, and Association Rules
A Machine Learning Pipeline covering Data Preprocessing, Unsupervised (K-Means), Supervised (Decision Tree & KNN), and Apriori Algorithms
## 📝 Overview

This project presents a complete machine learning workflow built around the classic Iris Dataset. It demonstrates expertise in handling structured data, performing exploratory analysis, applying both unsupervised (K-Means) and supervised (Decision Tree, KNN) machine learning models, and assessing their performance. A separate module also showcases Association Rule Mining using the Apriori algorithm on generated transactional data.

The core goal is to thoroughly analyze the Iris data to automatically classify the three species (Setosa, Versicolor, Virginica) and discover underlying data patterns.
## 🎯 Project Goals

    Data Preparation: Implement robust data cleaning, outlier management, and feature scaling.

    Exploratory Data Analysis (EDA): Visualize feature distributions and correlations to guide modeling choices.

    Unsupervised Learning (K-Means): Determine the optimal number of clusters and evaluate the clustering accuracy against the true labels.

    Supervised Learning: Train and evaluate two distinct classification models: Decision Tree and K-Nearest Neighbors (KNN).

    Model Comparison: Provide a clear comparison of model performance using key metrics like Accuracy and F1-Score.

    Pattern Discovery: Apply the Apriori algorithm for market basket analysis on simulated data.

## ⚙️ Technology Stack

This analysis was developed entirely in Python using industry-standard data science libraries:

    Data Handling: Pandas and NumPy.

    Modeling & Evaluation: scikit-learn (sklearn) and MLxtend.

    Visualization: Matplotlib and Seaborn.

## 🚀 Detailed Analysis and Methodology
## 1. Data Preparation and Feature Engineering

This initial phase ensures the data is clean, standardized, and ready for modeling:

    Data Loading and Cleaning: The Iris dataset was loaded directly from the scikit-learn library. The data cleaning function confirmed the dataset was relatively clean, primarily by identifying and removing duplicate rows (which were present in the original load).

    Outlier Handling (IQR and Capping): We used the Interquartile Range (IQR) method (1.5×IQR) to detect extreme outliers in the sepal and petal measurements. Instead of removing these data points, which can lead to data loss, we applied Capping. This process replaces the outlier values with the nearest upper or lower boundary value, preserving the data structure while mitigating the outlier's impact.

    Feature Scaling (Min-Max): To ensure that all features contribute equally to the distance calculations used in K-Means and KNN, the numerical features were scaled using MinMaxScaler. This process transforms the data so all values fall within the range of 0 and 1.

    Data Split: The dataset was split into training and testing sets (80% train, 20% test) for all subsequent supervised learning tasks.

## 2. Exploratory Data Analysis (EDA)

Visualization tools were used to understand the data's characteristics:

    Boxplots: Boxplots for each feature (sepal length/width, petal length/width) were generated against the species target variable. These plots clearly showed that Petal Length and Petal Width are the most effective features for separating the three Iris species.

    Correlation Heatmap: A correlation heatmap was generated to visualize the linear relationships between the features. This confirmed a strong positive correlation between Petal Length and Petal Width, as well as between Petal Length and Sepal Length, suggesting potential multicollinearity.

## 3. Unsupervised Learning: K-Means Clustering

K-Means was used to see if the natural groupings in the data align with the known species labels:

    Optimal Cluster Selection (Elbow Method): The Elbow Method was employed by calculating the Within-Cluster Sum of Squares (WCSS) for a range of cluster numbers (k=1 to 10). The resulting plot clearly indicated an "elbow" point at k=3, validating that the dataset naturally forms three clusters, corresponding to the three species.

    Model Evaluation: A K-Means model was trained using k=3. The performance was assessed using the Adjusted Rand Index (ARI), which compares the discovered clusters to the true species labels. A typical ARI score in the range of 0.75 to 0.85 demonstrated that the clustering model is highly effective in mirroring the actual biological classification.

    Cluster Visualization: Scatter plots, notably comparing Petal Length and Petal Width, were used to visualize the assigned clusters. The separation of the three clusters was visually distinct.

## 4. Supervised Learning: Comparative Classification

Two popular classification models were trained and evaluated on the scaled data.
A. Decision Tree Classifier

    Training: A Decision Tree model was trained, utilizing binary splits to recursively partition the feature space.

    Visualization: The resulting tree structure was visualized , clearly showing the simple, hierarchical rules (e.g., based on petal width thresholds) that the model learned to classify the species.

    Performance: The model typically achieved very high scores (often 100% Accuracy and F1-Score on the test set), highlighting its ability to capture the simple, linear decision boundaries present in the Iris dataset.

B. K-Nearest Neighbors (KNN) Classifier

    Training: A KNN model, set with k=5, was trained. This algorithm classifies a new data point based on the majority class of its five nearest neighbors in the feature space.

    Performance: Due to the prior Min-Max Scaling, the KNN model also performed exceptionally well, achieving scores comparable to the Decision Tree, often reaching 100% Accuracy.

C. Model Comparison

Both models demonstrated excellent performance. The analysis concluded that for a simple, well-separated dataset like Iris, both a boundary-finding algorithm (Decision Tree) and a distance-based algorithm (KNN) are equally effective.
5. Association Rule Mining (Apriori)

This final section demonstrated market basket analysis on a set of 50 simulated transactions:

    Process: The Apriori algorithm was applied to the one-hot encoded transaction data. We found Frequent Itemsets (items appearing together often) using a min_support threshold of 0.2.

    Rule Generation: Association Rules were then generated using a min_confidence threshold of 0.5.

    Key Discovery: The top rules were sorted by Lift, which measures how much more likely the items are to be bought together compared to if they were independent. This step successfully identified and highlighted the engineered pattern of `{diapers} \rightarrow {beer}$ as a rule with very high lift.
