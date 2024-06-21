# hclusteasy 0.1.0

This release introduces new functionalities aimed at simplifying hierarchical clustering analysis in R. With `hclusteasy` version 0.1.0, users can seamlessly import data from various formats, apply data normalization techniques, perform hierarchical clustering analysis, and visualize results through principal component analysis (PCA).

## Datasets

### iris_uci
The Iris dataset is a classic dataset used for analysis and machine learning, containing 150 samples of iris flowers from three different species: Iris setosa, Iris versicolor, and Iris virginica. Each sample has four morphological features: sepal length, sepal width, petal length, and petal width, measured in centimeters. Created by Ronald A. Fisher in 1936, the dataset is often used for testing classification algorithms.

### wine_uci
The Wine dataset is a well-known dataset used for classification and clustering in machine learning, containing chemical analysis results of wines grown in the same region in Italy but derived from three different cultivars. The dataset comprises 178 samples, each described by 13 continuous attributes such as alcohol content, malic acid, ash, and flavanoids. Created by Forina et al., it is commonly used to test the performance of various classification algorithms.

## Functions

* `read_data()`: Reads data from different formats (txt, xlsx, xls).
* `normalize_data()`: Applies data normalization techniques.
* `hca()`: Generates groups from hierarchical clustering analysis, calculating distances using the Euclidean method.
* `pca()`: Conducts principal component analysis and visualizes the first two principal components.

## Initial CRAN Submission

This version marks the initial submission of `hclusteasy` to the Comprehensive R Archive Network (CRAN).
