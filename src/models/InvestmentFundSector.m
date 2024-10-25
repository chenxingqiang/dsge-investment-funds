classdef InvestmentFundSector
    properties
        params
    end

    methods
        function obj = InvestmentFundSector(params)
            obj.params = params;
        end

        function [b, d_if, q_s, div_if, b_sales] = compute_ss(obj, i_d, q_b, K_b)
    try
        fprintf('Computing investment fund sector steady state...\n');
        
        % Bond holdings match capital
        b = K_b;
        
        % Reduced liquidity ratio
        d_if = obj.params.liquidity_ratio * q_b * b;
        
        % Minimal bond sales
        b_sales = obj.params.liquidity_ratio * b * 0.5;  % Reduced sales
        
        % Share price
        q_s = q_b * b + d_if;
        
        % Fund returns with minimal costs
        bond_return = (1/q_b - 1) * q_b * b;
        deposit_return = i_d * d_if;
        sales_cost = (obj.params.kappa_if/2) * b_sales^2;
        
        div_if = bond_return + deposit_return - sales_cost;
        
        fprintf('\nInvestment Fund Values:\n');
        fprintf('Bond holdings: %.4f\n', b);
        fprintf('Deposits:      %.4f\n', d_if);
        fprintf('Share price:   %.4f\n', q_s);
        fprintf('Dividends:     %.4f\n', div_if);
        fprintf('Bond sales:    %.4f\n', b_sales);
        fprintf('Sales cost:    %.4f\n', sales_cost);
        
    catch ME
        fprintf('Error in investment fund sector SS: %s\n', ME.message);
        b = NaN; d_if = NaN; q_s = NaN; div_if = NaN; b_sales = NaN;
        rethrow(ME);
    end
end
    end
end