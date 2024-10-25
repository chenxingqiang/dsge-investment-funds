classdef PolicyAnalysis
    properties
        model
        welfare_calculator
        baseline_solution
        policy_solution
    end
    
    methods
        function obj = PolicyAnalysis(model)
            obj.model = model;
            obj.welfare_calculator = WelfareAnalysis(model);
        end
        
        function [opt_policy, results] = find_optimal_policy(obj)
            % Find optimal liquidity requirement
            try
                % Grid for liquidity requirement
                rho_grid = linspace(0.02, 0.14, 50);
                
                % Initialize results
                results = struct();
                results.ce = zeros(size(rho_grid));
                results.output = zeros(size(rho_grid));
                results.consumption = zeros(size(rho_grid));
                results.deposits = zeros(size(rho_grid));
                results.bonds = zeros(size(rho_grid));
                
                % Compute effects for each policy value
                for i = 1:length(rho_grid)
                    results = obj.compute_policy_effects(rho_grid(i), results, i);
                end
                
                % Find optimal policy
                [~, idx] = max(results.ce);
                opt_policy = rho_grid(idx);
                
                obj.plot_policy_analysis(rho_grid, results);
                
            catch ME
                fprintf('Error in find_optimal_policy: %s\n', ME.message);
                opt_policy = NaN;
                results = struct();
            end
        end
        
        function results = analyze_aggregate_shock(obj, shock_type, policy_param)
            try
                % Store original parameters
                orig_params = obj.model.params;
                
                % Compute baseline solution
                obj.baseline_solution = obj.model.compute_steady_state();
                
                % Apply policy and compute new solution
                new_params = orig_params;
                new_params.liquidity_ratio = policy_param;
                obj.model.update_params(new_params);
                obj.policy_solution = obj.model.compute_steady_state();
                
                % Generate shock
                if strcmp(shock_type, 'preference')
                    shock = obj.generate_preference_shock();
                else
                    shock = obj.generate_tfp_shock();
                end
                
                % Compute responses
                results.baseline = obj.simulate_shock_response(obj.baseline_solution, shock);
                results.policy = obj.simulate_shock_response(obj.policy_solution, shock);
                
                % Plot responses
                obj.plot_shock_analysis(results);
                
                % Restore original parameters
                obj.model.update_params(orig_params);
                
            catch ME
                fprintf('Error in analyze_aggregate_shock: %s\n', ME.message);
                results = struct();
            end
        end
    end
    
    methods(Access = private)
        function results = compute_policy_effects(obj, rho, results, idx)
            % Compute effects of given policy parameter
            try
                [ce, welfare_decomp] = obj.welfare_calculator.compute_welfare_gains(rho);
                
                % Store results
                results.ce(idx) = ce;
                [ss, ~] = obj.model.compute_steady_state();
                results.output(idx) = ss.Y;
                results.consumption(idx) = ss.c;
                results.deposits(idx) = ss.d_hh;
                results.bonds(idx) = ss.b;
                
            catch ME
                fprintf('Error computing policy effects: %s\n', ME.message);
            end
        end
    end
end