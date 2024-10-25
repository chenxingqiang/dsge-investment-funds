classdef WelfareAnalysis
    properties
        model
        params
        baseline_ss
        policy_ss
        nsim = 1000  % Number of simulations
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
            try
                % Store original parameters
                orig_params = obj.model.params;
                
                % Apply policy
                new_params = orig_params;
                new_params.liquidity_ratio = policy_param;
                obj.model.update_params(new_params);
                
                % Compute new steady state
                [obj.policy_ss, success] = obj.model.compute_steady_state();
                if ~success
                    error('Failed to compute policy steady state');
                end
                
                % Compute welfare in both economies
                V_woreg = obj.compute_welfare('baseline');
                V_reg = obj.compute_welfare('policy');
                
                % Compute consumption equivalent
                ce = 100 * (exp((1-obj.params.beta)*(V_reg - V_woreg)) - 1);
                
                % Decompose welfare gains
                welfare_decomp = obj.decompose_welfare_gains(V_reg - V_woreg);
                
                % Restore original parameters
                obj.model.update_params(orig_params);
                
            catch ME
                fprintf('Error in compute_welfare_gains: %s\n', ME.message);
                ce = NaN;
                welfare_decomp = struct();
            end
        end
        
        function welfare = compute_welfare(obj, type)
            if strcmp(type, 'baseline')
                ss = obj.baseline_ss;
            else
                ss = obj.policy_ss;
            end
            
            % Compute lifetime utility
            welfare = obj.compute_lifetime_utility(ss);
        end
        
        function decomp = decompose_welfare_gains(obj, total_gain)
            decomp = struct();
            % Resource gains
            decomp.resource = obj.compute_resource_gains();
            % Deposit utility losses
            decomp.deposits = obj.compute_deposit_losses();
            % Intermediation effects
            decomp.intermediation = obj.compute_intermediation_effects();
        end
    end
    
    methods(Access = private)
        function gains = compute_resource_gains(obj)
            % Compute gains from reduced resource losses
            baseline_costs = (obj.params.kappa_hh/2) * obj.baseline_ss.b_sales^2 + ...
                           (obj.params.kappa_if/2) * obj.baseline_ss.b_sales^2;
            policy_costs = (obj.params.kappa_hh/2) * obj.policy_ss.b_sales^2 + ...
                          (obj.params.kappa_if/2) * obj.policy_ss.b_sales^2;
            gains = baseline_costs - policy_costs;
        end
        
        function losses = compute_deposit_losses(obj)
            % Compute utility losses from reduced deposits
            baseline_utility = obj.params.delta_d * ...
                             obj.baseline_ss.d_hh^(1-obj.params.sigma_d)/(1-obj.params.sigma_d);
            policy_utility = obj.params.delta_d * ...
                           obj.policy_ss.d_hh^(1-obj.params.sigma_d)/(1-obj.params.sigma_d);
            losses = baseline_utility - policy_utility;
        end
        
        function effects = compute_intermediation_effects(obj)
            % Compute effects from changes in financial intermediation
            effects = (obj.policy_ss.Y - obj.baseline_ss.Y)/obj.baseline_ss.Y;
        end
        
        function utility = compute_lifetime_utility(obj, ss)
            % Compute lifetime utility from steady state values
            flow_utility = ss.c^(1-obj.params.sigma)/(1-obj.params.sigma) + ...
                         obj.params.delta_d * ss.d_hh^(1-obj.params.sigma_d)/(1-obj.params.sigma_d) - ...
                         obj.params.psi_n * ss.n^(1+obj.params.sigma_n)/(1+obj.params.sigma_n);
            utility = flow_utility/(1-obj.params.beta);
        end
    end
end