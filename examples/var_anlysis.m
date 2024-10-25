% VAR Analysis Example
% Replicates the empirical analysis from the paper

%% Load and prepare data
data = DataUtils.load_var_data();
[X, varnames] = DataUtils.prepare_var_data(data);

%% Create and estimate VAR model
var_model = VARModel(X, 4, varnames);
var_model = var_model.estimate();

%% Generate impulse responses
horizon = 20;  % 20 months horizon as in paper
shock_var = 4; % Fund flow shock (4th variable)

% Plot IRFs with 68% confidence bands
var_model.plot_irf(horizon, shock_var, 0.68);

% Save results
saveas(gcf, 'results/figures/example_var_irf.png');