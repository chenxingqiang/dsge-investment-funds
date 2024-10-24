classdef PolicyAnalysis
    % PolicyAnalysis - Analyzes effects of macroprudential regulation
    % Based on Sections 4.2 and 4.3 of the paper
    
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
            % Returns optimal ρ and analysis results
            
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
            
            % Plot results
            obj.plot_policy_analysis(rho_grid, results);
        end
        
        function results = analyze_aggregate_shock(obj, shock_type, policy_param)
            % Analyze model response to aggregate shock under different policies
            % Based on Section 4.3
            
            % Compute solutions
            obj.baseline_solution = obj.model.solve_model();
            
            obj.model.set_policy_parameter(policy_param);
            obj.policy_solution = obj.model.solve_model();
            
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
        end
    end
    
    methods(Access = private)
        function results = compute_policy_effects(obj, rho, results, idx)
            % Compute effects of given policy parameter
            
            % Welfare effects
            [results.ce(idx), welfare_decomp] = ...
                obj.welfare_calculator.compute_welfare_gains(rho);
            
            % Steady state effects
            [ss, ~] = obj.model.compute_steady_state();
            results.output(idx) = ss.Y;
            results.consumption(idx) = ss.c;
            results.deposits(idx) = ss.d_hh;
            results.bonds(idx) = ss.b;
        end
        
        function plot_policy_analysis(obj, rho_grid, results)
            % Create plots similar to Figure 4 in the paper
            figure('Position', [100 100 1200 800]);
            
            % Plot welfare gains
            subplot(2,3,1);
            plot(rho_grid*100, results.ce, 'b-', 'LineWidth', 2);
            title('Welfare Gains');
            xlabel('Liquidity Requirement (%)');
            ylabel('CE (%)');
            grid on;
            
            % Add other subplots
            % ...
        end
        
        function plot_shock_analysis(obj, results)
            % Create plots similar to Figure 6 in the paper
            figure('Position', [100 100 1200 800]);
            
            variables = {'Output', 'Consumption', 'Fund Shares', ...
                        'Bond Price', 'Loans', 'Deposit Rate'};
            
            for i = 1:length(variables)
                subplot(3,3,i);
                plot(results.baseline.(variables{i}), 'b-', 'LineWidth', 2);
                hold on;
                plot(results.policy.(variables{i}), 'r--', 'LineWidth', 2);
                title(variables{i});
                grid on;
            end
            
            legend('Baseline', 'With Regulation');
        end
    end
end