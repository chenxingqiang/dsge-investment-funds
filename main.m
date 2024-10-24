% Main program to run full model analysis

%% Initialize
clear all;
close all;

% Create model
params = ModelParameters();
model = DSGEModel(params);

%% Steady State Analysis
[ss, success] = model.compute_steady_state();
if ~success
    error('Steady state computation failed');
end

%% Policy Analysis
policy_analyzer = PolicyAnalysis(model);

% Find optimal policy
[opt_policy, policy_results] = policy_analyzer.find_optimal_policy();
fprintf('Optimal liquidity requirement: %.1f%%\n', opt_policy*100);

% Analyze shock responses
shock_results = policy_analyzer.analyze_aggregate_shock('preference', opt_policy);

%% Save Results
save('results/policy_analysis.mat', 'policy_results', 'shock_results');