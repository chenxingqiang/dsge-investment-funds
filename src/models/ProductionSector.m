classdef ProductionSector
    properties
        params
    end
    
    methods
        function obj = ProductionSector(params)
            obj.params = params;
        end
        
        function [Y, K_b, K_l, w, z, K_total] = compute_ss(obj, n, A)
            try
                fprintf('Computing production sector steady state...\n');
                
                % Parameters
                alpha = obj.params.alpha;
                K_Y_ratio = obj.params.K_Y_ratio;
                
                % Calculate Y using the rearranged production function
                term = A * K_Y_ratio^alpha * n^(1 - alpha);
                Y = term^(1 / (1 - alpha));
                
                % Calculate total capital
                K_total = K_Y_ratio * Y;
                
                % Calculate wage
                w = (1 - alpha) * Y / n;
                
                % Split capital
                K_b = obj.params.B_K_ratio * K_total;
                K_l = K_total - K_b;
                
                % Calculate intermediate goods production z
                % Ensure that gamma, v, and epsilon are properly defined in params
                gamma = obj.params.gamma;
                v = obj.params.v;
                epsilon = obj.params.epsilon;
                
                % Compute z_l and z_b
                z_l = K_l^gamma;
                z_b = K_b^gamma;
                
                % Compute z using the aggregator
                z = (v * z_l^epsilon + (1 - v) * z_b^epsilon)^(1 / epsilon);
                
                % Print outputs
                fprintf('\nProduction Sector Values:\n');
                fprintf('Output (Y):      %.4f\n', Y);
                fprintf('Capital ratio:   %.4f\n', K_total / Y);
                fprintf('Bond ratio:      %.4f\n', K_b / K_total);
                fprintf('Labor share:     %.4f\n', w * n / Y);
                fprintf('Capital split:\n');
                fprintf('  Bond-financed: %.4f\n', K_b);
                fprintf('  Loan-financed: %.4f\n', K_l);
                fprintf('  Total:         %.4f\n', K_total);
                
            catch ME
                fprintf('Error in production sector SS: %s\n', ME.message);
                Y = NaN; K_b = NaN; K_l = NaN; w = NaN; z = NaN; K_total = NaN;
                rethrow(ME);
            end
        end
    end
end