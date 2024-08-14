#!/usr/bin/r

# Copyright (c)
mydata <- read.fwf("data.txt", widths=c(1, 4, 3)) # nolint
mydata

# Calculate the mean and standard deviation for each column
summary_stats <- data.frame(
  Mean = apply(mydata, 2, mean),
  SD = apply(mydata, 2, sd)
)
summary_stats


# Calculate the correlation matrix
correlation_matrix <- cor(mydata)
correlation_matrix

# Calculate the eigenvalues and eigenvectors
eigen_values <- eigen(correlation_matrix)
eigen_values$values
eigen_vectors <- eigen_values$vectors

# Sort eigenvalues in descending order
sorted_eigen_values <- eigen_values$values[order(eigen_values$values, decreasing = TRUE)] # nolint # nolint
sorted_eigen_vectors <- eigen_vectors[, order(eigen_values$values, decreasing
= TRUE)] # nolint # nolint

# Print the sorted eigenvalues and eigenvectors
print("Sorted Eigenvalues:")
print(sorted_eigen_values)
print("Sorted Eigenvectors:")
print(sorted_eigen_vectors)

# Calculate the principal components
principal_components <- mydata %*% sorted_eigen_vectors


# Calculate the explained variance for each principal component
explained_variance <- sorted_eigen_values / sum(sorted_eigen_values)

# Print the explained variance
print("Explained Variance:")
print(explained_variance)

# Calculate the cumulative explained variance
cumulative_explained_variance <- cumsum(explained_variance)

# Print the cumulative explained variance
print("Cumulative Explained Variance:")
print(cumulative_explained_variance)

# Calculate the percentage of variance explained by the first few principal components # nolint # nolint
percentage_variance_explained <- round(cumulative_explained_variance * 100, 2)

# Print the percentage of variance explained by the first few principal components # nolint
print("Percentage Variance Explained:")
print(percentage_variance_explained)

# Calculate the cumulative percentage of variance explained
cumulative_percentage_variance_explained <- round(cumsum(percentage_variance_explained), 2) # nolint

# Print the cumulative percentage of variance explained
print("Cumulative Percentage Variance Explained:")
print(cumulative_percentage_variance_explained)


# Calculate the loadings for each principal component
loadings <- sorted_eigen_vectors %*% diag(sqrt(1 / sorted_eigen_values)) # nolint

# Print the loadings
print("Loadings:")
print(loadings)

# Calculate the principal component scores
principal_component_scores <- mydata %*% loadings

# Print the principal component scores
print("Principal Component Scores:")
print(principal_component_scores)


# Calculate the biplot
biplot_data <- cbind(principal_component_scores, mydata)
colnames(biplot_data) <- c("PC1", "PC2", "X", "Y", "Z")

# Create the biplot
biplot(biplot_data[, 1:2], biplot_data[, -(1:2)], main = "Biplot", xlab = "PC1", ylab = "PC2") # nolint
 # nolint
 # nolint
 # nolint
