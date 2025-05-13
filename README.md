# Yield Curve Principal Component Analysis
[![Made with MATLAB](https://img.shields.io/badge/Made%20with-MATLAB-orange.svg)](https://www.mathworks.com/products/matlab.html)

This repository contains a MATLAB implementation of Principal Component Analysis (PCA) for yield curve modelling and visualisation.

## Overview

This project applies PCA to yield curve data to identify the three main modes of variation, commonly interpreted as:
- **Level**: The overall height of the yield curve (PC1)
- **Slope**: The steepness of the yield curve (PC2)
- **Curvature**: The curvature or "humped-ness" of the yield curve (PC3)

### What is PCA?
PCA (Principal Component Analysis) is a technique to simplify high-dimensional datasets by transforming them into a new coordinate system where the axes (called *principal components*) capture the directions of maximum variance. 

### PCA METHOD
1. **Normalise the data** by subtracting the mean of each column to center it around zero s.t. variance-covariance matrix `\propto X^T X` aka "sum-of-squares" matrix.
3. **Compute the variance-covariance matrix** to measure linear dependencies between features.
   Diagonal entries `\propto` variance of each spot rate
   Off-diagonal entries `\propto` covariances between the spot rates of different terms.
5. **Perform eigendecomposition** of the covariance matrix. This transforms our basis to a new coordinate system.
   - **Eigenvectors**: the principal components (directions of variance)
   - **Eigenvalues**: the variance explained by each component
6. **Projects the data** onto the principal components to obtain *scores* that describe each observation in the new, uncorrelated basis; this is done via a matrix of eigenvectors `P` s.t. new data points are denoted by `XP`; scores are the *new* data points.


These steps reduce the dimensionality while retaining the most important patterns in the data.

## Features

- Loads and preprocesses yield curve data from Excel
- Performs PCA to extract principal components
- Visualises the principal components and their effects
- Reconstructs yield curves using the principal components
- Demonstrates cumulative contribution of each PC to the yield curve

## Files

- **yield_curve_pca.m** - Main script for PCA analysis
- **glc-yield-curve-data.xlsx** - Sample gilt curves taken from the [Bank of England](https://www.bankofengland.co.uk/statistics/yield-curves) - shows nominal gilt curves for month end from 2016 - present (2024).

## Usage

1. Clone this repository
2. Place your yield curve data in Excel format in the repository directory
   - First column should contain identifiers or dates
   - Remaining columns should contain yield rates for different tenors
3. Run the MATLAB script:

```matlab
% Basic analysis
run yield_curve_pca.m
```

## Sample Visualisations
Below are outputs generated via use of the algorithm and the attached .xlsx file in the repository.
### Principal Components (Level, Slope, Curvature)
![Principal Components (PC1)](https://github.com/user-attachments/assets/becd1ef0-a5f5-4c27-8cad-fddaf705529b)

### Reconstructed Yield Curves
![Reconstructed Yield Curves (PC2)](https://github.com/user-attachments/assets/8369cdb7-9b2b-49fb-99d2-7ec2d607fdfb)

### Original Yield Curves
![Original Yield Curves (PC3)](https://github.com/user-attachments/assets/cd5abab6-3c9c-48a4-b8b0-abea36a8a4cf)

### Incremental Reconstruction
![Incremental Reconstruction (PC4)](https://github.com/user-attachments/assets/61206db4-a101-43b2-849a-6df06c2a28e0)

## Mathematical Background

The PCA methodology for yield curves follows these steps:

1. **Normalisation**: Centre the yield curve data by subtracting the mean curve
2. **Covariance Matrix**: Calculate the variance-covariance matrix
3. **Eigendecomposition**: Decompose the covariance matrix to get eigenvectors (principal components) and eigenvalues
4. **PC Scores**: Project the normalised data onto the principal components
5. **Reconstruction**: Reconstruct yield curves using principal components

For yield curves, the interpretation of the first three PCs is typically:
- PC1 (Level): Parallel shift in the yield curve
- PC2 (Slope): Change in the steepness of the yield curve
- PC3 (Curvature): Change in the curvature of the yield curve

## Requirements

- MATLAB (tested on R2020b and later)
- Statistics and Machine Learning Toolbox (recommended)

## References and Acknowledgements

- This method of Principal Component Analysis was taught to me by Paul Teggin upon placement at 'Pension Insurance Corporation' (PIC) in 2024.
