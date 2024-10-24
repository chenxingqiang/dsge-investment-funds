classdef InvestmentFundSector
    % InvestmentFundSector - Investment fund optimization
    
    properties
        params      % Model parameters
        b           % Bond holdings
        d_if        % Fund deposits
        s           % Shares issued
        q_s         % Share price
        div_if      % Dividends
    end
    
    methods
        function obj = InvestmentFundSector(params)
            obj.params = params;
        end
        
        function [b_sales, price] = compute_bond_sales(obj, redemptions)
            % Compute bond sales given redemptions
            % Implementation of equations (8)-(9)
            
            phi_threshold = obj.d_if/(obj.q_s * obj.s);
            
            % Aggregate bond sales from equation (9)
            b_sales = integral(@(phi) obj.compute_individual_sales(phi, phi_threshold), ...
                             phi_threshold, 1, 'ArrayValued', true);
            
            % Secondary market price from equation in Section 3.2.2
            price = 1 - obj.params.kappa_hh * b_sales;
        end
        
        function obj = optimize(obj, i_d, q_b)
            % Optimize fund decisions
            % Implementation of equations (13)-(14)
            
            % FOC for deposits
            lambda_if = obj.compute_deposit_foc(i_d);
            
            % FOC for bonds
            obj.b = obj.compute_bond_holdings(q_b, lambda_if);
            
            % Balance sheet constraint
            obj.d_if = obj.q_s * obj.s - q_b * obj.b;
            
            % Compute dividends
            obj.div_if = obj.compute_dividends(i_d);
        end
        
        function div = compute_dividends(obj, i_d)
            % Compute fund dividends using equation (11)
            div = obj.b - obj.q_s * obj.s - obj.d_if + ...
                  (1 + i_d) * obj.d_if - obj.compute_liquidity_cost();
        end
    end
    
    methods(Access = private)
        function sales = compute_individual_sales(obj, phi, phi_threshold)
            % Helper function for bond sales computation
            if phi > phi_threshold
                sales = (phi * obj.q_s * obj.s - obj.d_if)/obj.price;
            else
                sales = 0;
            end
        end
        
        function cost = compute_liquidity_cost(obj)
            % Compute liquidity cost L(b_t)
            cost = (obj.params.kappa_if/2) * obj.b_sales^2;
        end
    end
end