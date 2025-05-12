# Yield Curve Principal Component Analysis via MATLAB

This repository contains a MATLAB implementation of Principal Component Analysis (PCA) for yield curve modeling and visualization.

## Overview

This project applies PCA to yield curve data to identify the three main modes of variation, commonly interpreted as:
- **Level**: The overall height of the yield curve (PC1)
- **Slope**: The steepness of the yield curve (PC2)
- **Curvature**: The curvature or "humped-ness" of the yield curve (PC3)

These three components typically explain over 95% of the variation in yield curve movements.

![Principal Components](images/principal_components.png)

## Features

- Loads and preprocesses yield curve data from Excel
- Performs PCA to extract principal components
- Visualizes the principal components and their effects
- Reconstructs yield curves using the principal components
- Demonstrates cumulative contribution of each PC to the yield curve
- Provides stress testing and forecasting capabilities

## Files

- **yield_curve_pca.m** - Main script for PCA analysis
- **yield_curve_pca_user_friendly.m** - User-friendly version with file dialog
- **yield_curve_stress_testing.m** - Script for stress testing yield curves
- **glc-yield-curve-data.xlsx** - Sample yield curve data

## Usage

1. Clone this repository
2. Place your yield curve data in Excel format in the repository directory
   - First column should contain identifiers or dates
   - Remaining columns should contain yield rates for different tenors
3. Run one of the following scripts:

```matlab
% Basic analysis
run yield_curve_pca.m

% User-friendly version with file dialog
run yield_curve_pca_user_friendly.m

% After running PCA, try stress testing
run yield_curve_stress_testing.m
```

## Sample Visualizations

### Principal Components (Level, Slope, Curvature)
![Principal Components](images/principal_components.png)

### Reconstructed Yield Curves
![Reconstructed Yield Curves](images/reconstructed_curves.png)

### Original Yield Curves
![Original Yield Curves](images/original_curves.png)

### Incremental Reconstruction
![Incremental Reconstruction](images/incremental_reconstruction.png)

## Mathematical Background

The PCA methodology for yield curves follows these steps:

1. **Normalisation**: Center the yield curve data by subtracting the mean curve
2. **Variance-Covariance Matrix**: Calculate the variance-covariance matrix
3. **Eigendecomposition**: Decompose the covariance matrix to get eigenvectors (principal components) and eigenvalues
4. **PC Scores**: Project the normalised data onto the principal components
5. **Reconstruction**: Reconstruct yield curves using principal components

For yield curves, the interpretation of the first three PCs is typically:
- PC1 (Level): Parallel shift in the yield curve
- PC2 (Slope): Change in the steepness of the yield curve
- PC3 (Curvature): Change in the curvature of the yield curve

## Requirements

- MATLAB (tested on R2020b and later)
- Statistics and Machine Learning Toolbox (recommended for some features)

## Citation

If you use this code in your research, please cite:

```
@misc{yield-curve-pca,
  author = {Your Name},
  title = {Yield Curve Principal Component Analysis},
  year = {2025},
  publisher = {GitHub},
  journal = {GitHub repository},
  howpublished = {\url{https://github.com/yourusername/Yield-Curve-PCA}}
}
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature-name`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin feature/your-feature-name`
5. Open a Pull Request
