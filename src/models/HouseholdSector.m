classdef HouseholdSector
    % HouseholdSector - Household optimization problem
    
    properties
        params      % Model parameters
        c           % Consumption
        n           % Labor
        d_hh        % Household deposits
        s           % Fund shares
    end
    
    methods
        function obj = HouseholdSector(params)
            obj.params = params;
        end
        
        function [c_next, lambda] = optimize(obj, w, i_d, q_s, div_if, pi)
            % Optimize household decisions
            % Args:
            %   w: Real wage
            %   i_d: Deposit rate
            %   q_s: Fund share price
            %   div_if: Fund dividends
            %   pi: Total profits
            
            % FOCs from equation (4)-(6)
            % Consumption Euler equation
            lambda = obj.params.beta * (obj.c/c_next)^(-obj.params.sigma) * (1 + i_d);
            
            % Deposit demand (equation 4)
            obj.d_hh = (lambda/(obj.params.delta_d * obj.c^(-obj.params.sigma)))^(-1/obj.params.sigma_d);
            
            % Labor supply (equation 6)
            obj.n = (w/(obj.params.psi_n * obj.c^obj.params.sigma))^(1/obj.params.sigma_n);
            
            % Fund share demand (equation 5)
            obj.s = (obj.c^(-obj.params.sigma))/...
                   (obj.params.beta * obj.c_next^(-obj.params.sigma) * (q_s + div_if)/q_s);
        end
    end
end