% main.m - Main script to run the complete analysis

startup
clear all

try
    % Create parameters and verify consistency
    params = ModelParameters();
    fprintf('Parameter consistency checks passed\n');

    % Create and solve model
    model = DSGEModel(params);
    [ss, success] = model.compute_steady_state();

    if ~success
        error('Failed to compute valid steady state');
    end

catch ME
    fprintf('Error: %s\n', ME.message);
end


fprintf('Starting DSGE model analysis...\n');

%% Setup
% Initialize paths
if ~exist('startup', 'file')
    error('Please run startup.m first to initialize paths.');
end

% Add at the beginning of main.m
% Create results directories if they don't exist
if ~exist('results/figures', 'dir')
    mkdir('results/figures');
end

% Clear workspace
clear all;
close all;

try
    %% Model Initialization
    fprintf('Initializing model parameters...\n');
    params = ModelParameters();
    model = DSGEModel(params);

    %% Steady State Analysis
    fprintf('Computing steady state...\n');
    [ss, success] = model.compute_steady_state();
    if ~success
        error('Steady state computation failed');
    end

    %% Policy Analysis
    fprintf('Running policy analysis...\n');
    policy_analyzer = PolicyAnalysis(model);

    % Find optimal policy
    [opt_policy, policy_results] = policy_analyzer.find_optimal_policy();
    fprintf('Optimal liquidity requirement: %.1f%%\n', opt_policy*100);

    % Analyze shock responses
    fprintf('Computing shock responses...\n');
    shock_results = policy_analyzer.analyze_aggregate_shock('preference', opt_policy);

    %% Generate Figures
    fprintf('Generating figures...\n');
    try
        % 设置绘图默认参数
        PlotUtils.set_default_plot_settings();

        % 生成所有图形
        FigureGenerator.generate_all_figures();

        fprintf('All figures generated successfully.\n');
    catch ME
        fprintf('Error in figure generation: %s\n', ME.message);
        fprintf('Error trace:\n');
        disp(getReport(ME));
    end


    %% Save Results
    fprintf('Saving results...\n');
    results_dir = 'results';
    if ~exist(results_dir, 'dir')
        mkdir(results_dir);
    end
    save(fullfile(results_dir, 'policy_analysis.mat'), ...
        'policy_results', 'shock_results', 'ss', 'opt_policy');

    fprintf('Analysis completed successfully.\n');

catch ME
    fprintf('Error occurred: %s\n', ME.message);
    rethrow(ME);
end