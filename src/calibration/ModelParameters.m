classdef ModelParameters
    properties
        % Core parameters
        beta = 0.994;      % Discount factor (quarterly)
        alpha = 0.67;      % Labor share
        delta = 0.08;      % Depreciation rate
        
        % Target ratios (adjusted to sum to 1)
        C_Y_ratio = 0.60;  % Consumption share (increased)
        I_Y_ratio = 0.40;  % Investment share (I = δK)
        K_Y_ratio = 5.0;   % Capital stock
        B_K_ratio = 0.10;  % Bond financing share
        D_Y_ratio = 0.10;  % Deposit ratio
        fund_share = 0.15; % Fund share

        
        % Derived ratios
        B_Y_ratio          % Will be computed in constructor
        
        % Cost parameters (minimal friction)
        kappa_hh = 0.005;  % HH bond management cost
        kappa_if = 0.005;  % IF cost parameter
        liquidity_ratio = 0.01;  % Fund liquidity target
        
        % Utility parameters
        sigma = 1;         % Risk aversion
        sigma_n = 3;       % Inverse Frisch elasticity
        sigma_d = 1;       % Liquidity preference
        
        % Production parameters
        gamma = 0.627;     % DRS parameter
        v = 0.678;         % Production weight
        epsilon = 0.499;   % Entrepreneur aggregator
    end
    
    methods
        function obj = ModelParameters()
            % Compute derived ratios
            obj.B_Y_ratio = obj.B_K_ratio * obj.K_Y_ratio;
            
            % Verify consistency
            fprintf('Verifying parameter consistency...\n');
            
            % Resource shares
            total_share = obj.C_Y_ratio + obj.I_Y_ratio;
            fprintf('Resource shares:\n');
            fprintf('  C/Y: %.4f\n', obj.C_Y_ratio);
            fprintf('  I/Y: %.4f\n', obj.I_Y_ratio);
            fprintf('  Sum: %.4f\n', total_share);
            
            % Investment consistency
            implied_I_Y = obj.delta * obj.K_Y_ratio;
            fprintf('\nInvestment check:\n');
            fprintf('  I/Y target: %.4f\n', obj.I_Y_ratio);
            fprintf('  δK/Y:      %.4f\n', implied_I_Y);
            
            % Capital structure
            fprintf('\nCapital structure:\n');
            fprintf('  K/Y:       %.4f\n', obj.K_Y_ratio);
            fprintf('  B/K:       %.4f\n', obj.B_K_ratio);
            fprintf('  B/Y:       %.4f\n', obj.B_Y_ratio);
            
            % Verify consistency
            if abs(total_share - 1.0) > 1e-5
                error('Resource shares sum to %.4f (should be 1.0)', total_share);
            end
            if abs(implied_I_Y - obj.I_Y_ratio) > 1e-5
                error('Investment ratio inconsistent with depreciation');
            end
            
            fprintf('\nAll parameter consistency checks passed!\n\n');
        end
    end
end