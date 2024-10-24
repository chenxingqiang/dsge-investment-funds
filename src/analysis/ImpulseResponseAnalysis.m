classdef ImpulseResponseAnalysis
    % ImpulseResponseAnalysis - Computes and plots IRFs
    
    properties
        model
        horizon
    end
    
    methods
        function obj = ImpulseResponseAnalysis(model, horizon)
            obj.model = model;
            obj.horizon = horizon;
        end
        
        function irfs = compute_irfs(obj, shock_type)
            % Compute impulse responses for specified shock
            
            % Create shock vector
            shocks = zeros(2, obj.horizon);  % 2 shocks in the model
            if strcmp(shock_type, 'preference')
                shocks(1,1) = obj.model.params.sigma_delta;
            else  % TFP shock
                shocks(2,1) = obj.model.params.sigma_a;
            end
            
            % Simulate model
            sim_data = obj.model.simulate(obj.horizon, shocks);
            
            % Convert to IRFs
            irfs = obj.process_simulation(sim_data);
        end
        
        function plot_irfs(obj, irfs, variables)
            % Plot impulse responses
            figure('Position', [100 100 1200 800]);
            
            for i = 1:length(variables)
                subplot(ceil(length(variables)/3), 3, i);
                plot(1:obj.horizon, irfs.(variables{i}), 'b-', 'LineWidth', 2);
                title(variables{i}, 'Interpreter', 'none');
                grid on;
            end
        end
    end
end