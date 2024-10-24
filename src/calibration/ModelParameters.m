classdef ModelParameters
    % ModelParameters - DSGE model parameters calibration
    
    properties
        % Household parameters
        beta            % Discount factor
        sigma          % Risk aversion
        sigma_n        % Inverse Frisch elasticity
        psi_n          % Labor utility weight
        sigma_d        % Liquidity preference parameter
        delta_d        % Utility weight on deposits
        
        % Financial sector parameters
        kappa_hh       % Household bond management cost
        kappa_if       % Investment fund cost
        lambda_tilde   % Scale Lomax distribution
        alpha_tilde    % Shape Lomax distribution
        
        % Production parameters
        alpha          % Labor share
        gamma          % DRS parameter
        delta          % Capital depreciation
        v              % Production weight
        epsilon        % Entrepreneur aggregator
        kappa_I        % Investment adjustment cost
        
        % Shock processes
        rho_a          % TFP shock persistence
        sigma_a        % TFP shock std
        rho_delta      % Preference shock persistence
        sigma_delta    % Preference shock std
    end
    
    methods
        function params = ModelParameters()
            % Initialize with baseline calibration from paper
            params.beta = 0.994;        % Quarterly discount factor
            params.sigma = 1;           % Log utility
            params.sigma_n = 3;         % Frisch elasticity
            params.psi_n = 66.51;       % Labor weight
            params.sigma_d = 1;         % Liquidity preference
            params.delta_d = 0.026;     % Deposit utility weight
            
            % Financial sector
            params.kappa_hh = 2.84;     % HH cost parameter
            params.kappa_if = 0.25;     % IF cost parameter
            params.lambda_tilde = 2.23;  % Lomax scale
            params.alpha_tilde = 57.02;  % Lomax shape
            
            % Production
            params.alpha = 0.67;        % Labor share
            params.gamma = 0.627;       % DRS parameter
            params.delta = 0.025;       % Depreciation rate
            params.v = 0.678;           % Production weight
            params.epsilon = 0.499;     % Aggregator
            params.kappa_I = 0.25;      % Investment cost
            
            % Shocks
            params.rho_a = 0.96;        % TFP persistence
            params.sigma_a = 0.0054;    % TFP std
            params.rho_delta = 0.60;    % Preference persistence
            params.sigma_delta = 0.001; % Preference std
        end
    end
end