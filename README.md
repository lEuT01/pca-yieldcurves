# Yield Curve Principal Component Analysis
[![Made with MATLAB](https://img.shields.io/badge/Made%20with-MATLAB-orange.svg)](https://www.mathworks.com/products/matlab.html)

This repository contains a MATLAB implementation of Principal Component Analysis (PCA) for yield curve modelling and visualisation.

## Overview

This project applies PCA to yield curve data to identify the three main modes of variation, commonly interpreted as:
- **Level**: The overall height of the yield curve (PC1)
- **Slope**: The steepness of the yield curve (PC2)
- **Curvature**: The curvature or "humped-ness" of the yield curve (PC3)

These three components typically explain over 95% of the variation in yield curve movements.

![Principal Components](https://github.com/user-attachments/assets/becd1ef0-a5f5-4c27-8cad-fddaf705529b)

## Features

- Loads and preprocesses yield curve data from Excel
- Performs PCA to extract principal components
- Visualises the principal components and their effects
- Reconstructs yield curves using the principal components
- Demonstrates cumulative contribution of each PC to the yield curve

## Files

- **yield_curve_pca.m** - Main script for PCA analysis
- **glc-yield-curve-data.xlsx** - Sample yield curve data

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
