classdef WelfareAnalysis
    % WelfareAnalysis - Computes welfare effects of policies
    % Based on Section 4.2 of the paper
    
    properties
        model           % DSGE model
        params          % Model parameters
        baseline_ss     % Baseline steady state
        policy_ss       % Policy steady state
        nsim = 1000    % Number of simulations
        horizon = 1000  % Simulation horizon
    end
    
    methods
        function obj = WelfareAnalysis(model)
            obj.model = model;
            obj.params = model.params;
            
            % Compute baseline steady state
            [obj.baseline_ss, ~] = model.compute_steady_state();
        end
        
        function [ce, welfare_decomp] = compute_welfare_gains(obj, policy_param)
            % Compute consumption equivalent welfare gains
            % Args:
            %   policy_param: Liquidity requirement parameter ρ
            % Returns:
            %   ce: Consumption equivalent (in percent)
            %   welfare_decomp: Welfare decomposition
            
            % Set policy parameter and compute new steady state
            obj.model.set_policy_parameter(policy_param);
            [obj.policy_ss, ~] = obj.model.compute_steady_state();
            
            % Compute welfare in both economies
            V_woreg = obj.compute_welfare('baseline');
            V_reg = obj.compute_welfare('policy');
            
            % Compute consumption equivalent (equation in Section 4.2)
            ce = 100 * (exp((1-obj.params.beta)*(V_reg - V_woreg)) - 1);
            
            % Decompose welfare gains
            welfare_decomp = obj.decompose_welfare_gains(V_reg - V_woreg);
        end
        
        function welfare = compute_welfare(obj, type)
            % Compute welfare for given regime
            
            % Initialize simulation
            shocks = obj.generate_shocks();
            if strcmp(type, 'baseline')
                sim = obj.simulate_baseline(shocks);
            else
                sim = obj.simulate_policy(shocks);
            end
            
            % Compute lifetime utility (equation 3)
            welfare = obj.compute_lifetime_utility(sim);
        end
        
        function decomp = decompose_welfare_gains(obj, total_gain)
            % Decompose welfare gains into different channels
            % Based on Figure 5 in the paper
            
            decomp = struct();
            
            % 1. Gains from reduced resource losses
            decomp.resource = obj.compute_resource_gains();
            
            % 2. Losses from reduced household deposits
            decomp.deposits = obj.compute_deposit_losses();
            
            % 3. Effects from changes in financial intermediation
            decomp.intermediation = obj.compute_intermediation_effects();
        end
        
        function plot_welfare_analysis(obj, rho_grid)
            % Plot welfare analysis results (Figure 4 in paper)
            
            n_points = length(rho_grid);
            ce_values = zeros(n_points, 1);
            
            % Compute welfare gains for different ρ values
            for i = 1:n_points
                [ce_values(i), ~] = obj.compute_welfare_gains(rho_grid(i));
            end
            
            % Create plots
            figure('Position', [100 100 1200 800]);
            
            % Plot welfare gains
            subplot(2,3,1);
            plot(rho_grid*100, ce_values, 'b-', 'LineWidth', 2);
            title('Welfare Gains');
            xlabel('Liquidity Requirement (%)');
            ylabel('CE (%)');
            grid on;
            
            % Add other plots from Figure 4
            % ...
        end
    end
    
    methods(Access = private)
        function shocks = generate_shocks(obj)
            % Generate productivity and preference shocks
            rng(1234); % Set seed for reproducibility
            
            shocks = struct();
            shocks.tfp = randn(obj.horizon, obj.nsim) * obj.params.sigma_a;
            shocks.pref = randn(obj.horizon, obj.nsim) * obj.params.sigma_delta;
        end
        
        function utility = compute_lifetime_utility(obj, sim)
            % Compute lifetime utility from simulation
            
            beta_vec = obj.params.beta.^(0:obj.horizon-1)';
            
            utility = mean(sum(beta_vec .* ...
                (sim.c.^(1-obj.params.sigma)/(1-obj.params.sigma) + ...
                 obj.params.delta_d * sim.d_hh.^(1-obj.params.sigma_d)/(1-obj.params.sigma_d) - ...
                 obj.params.psi_n * sim.n.^(1+obj.params.sigma_n)/(1+obj.params.sigma_n)), 1));
        end
    end
end