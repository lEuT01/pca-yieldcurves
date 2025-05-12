% Set working directory and load data
cd('C:\Users\ellio\OneDrive\Desktop\ML-projects\Yield-Curve-PCA');
data = readmatrix("glc-yield-curve-data.xlsx");

% Check for nan values
if any(isnan(data(:)))
    disp('Warning: Data contains NaN values. Handling missing data...');
    % Replace nan values with interpolated data
    for i = 2:size(data, 2)
        data(:, i) = fillmissing(data(:, i), 'linear'); % Replace NaN with linear interpolation
    end
end

% Extract X matrix from data
X = data(:, 2:end); % Assuming the first column is the date or identifier

dates = 1:size(X, 2); % Create a time vector for the x-axis

% Normalize the data by subtracting the mean yield curve (centre the data around zero)
mean_yield_curve = mean(X, 1); % Mean yield for each column
X_normalized = X - mean_yield_curve; % Subtract the mean of each column from each column

% Variance-covariance matrix; 
varcov = (X_normalized' * X_normalized) / (size(X_normalized, 1) - 1);

% Check for nan values
if any(isnan(varcov(:))) || any(isinf(varcov(:)))
    error('Covariance matrix contains NaN. Check normalisation.');
end

% Diagonalize the varcov matrix to get PDP^(-1)
[P, D] = eig(varcov);

% Sort eigenvalues and eigenvectors in descending order
[eigenvalues_sorted, idx] = sort(diag(D), 'descend');
P_sorted = P(:, idx);
eigenvalues_sorted = diag(eigenvalues_sorted);

% Compute PC scores
Scores = X_normalized * P_sorted;

% Vectorized reconstructions
PC1 = Scores(:, 1) * P_sorted(:, 1)' + repmat(mean_yield_curve, size(X,1), 1);
PC2 = Scores(:, 2) * P_sorted(:, 2)' + repmat(mean_yield_curve, size(X,1), 1);
PC3 = Scores(:, 3) * P_sorted(:, 3)' + repmat(mean_yield_curve, size(X,1), 1);

% Plot the first 3 principal components
figure;
plot(1:size(X, 2), P_sorted(:, 1), 'r', 'LineWidth', 2); hold on;
plot(1:size(X, 2), P_sorted(:, 2), 'g', 'LineWidth', 2);
plot(1:size(X, 2), P_sorted(:, 3), 'b', 'LineWidth', 2);
title('Principal Components 1, 2, 3 (Spot Rate vs Tenor)');
xlabel('Tenor (Columns of X)');
ylabel('Principal Component Value');
legend('PC1', 'PC2', 'PC3');
hold off;

% Plot the reconstructed yield curves for PC1, PC2, and PC3
figure;
plot(1:size(X, 2), PC1(1,:), 'r', 'LineWidth', 2); hold on;
plot(1:size(X, 2), PC2(1,:), 'g', 'LineWidth', 2);
plot(1:size(X, 2), PC3(1,:), 'b', 'LineWidth', 2);
title('Reconstructed Yield Curves from PC1, PC2, and PC3');
xlabel('Tenor (Columns of X)');
ylabel('Yield Curve');
legend('PC1 Reconstructed', 'PC2 Reconstructed', 'PC3 Reconstructed');
hold off;

% Plot the original yield vs time
figure;
plot(dates, X, 'LineWidth', 2);
xlabel('Tenor (months after Dec 2015)');
ylabel('Yield Curve');
title('Original Yield vs Timestamp');

% Vectorized incremental reconstruction
reconstructed_PC1 = Scores(:, 1) * P_sorted(:, 1)' + repmat(mean_yield_curve, size(X,1), 1);
reconstructed_PC1_PC2 = reconstructed_PC1 + Scores(:, 2) * P_sorted(:, 2)';
reconstructed_PC1_PC2_PC3 = reconstructed_PC1_PC2 + Scores(:, 3) * P_sorted(:, 3)';

% Plot incremental PCs
figure;
hold on;

plot(dates, mean_yield_curve, 'k', 'LineWidth', 2, 'DisplayName', 'Average Yield');
plot(dates, reconstructed_PC1(1, :), 'r', 'LineWidth', 2, 'DisplayName', '+ PC1');
plot(dates, reconstructed_PC1_PC2(1, :), 'g', 'LineWidth', 2, 'DisplayName', '+ PC1 + PC2');
plot(dates, reconstructed_PC1_PC2_PC3(1, :), 'b', 'LineWidth', 2, 'DisplayName', '+ PC1-PC3');

title('Spot Rate vs Tenor with Incremental Principal Components');
xlabel('Tenor (Columns of X)');
ylabel('Yield');
legend('show');
hold off;