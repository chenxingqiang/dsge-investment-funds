classdef HouseholdSector
    properties
        params
    end

    methods
        function obj = HouseholdSector(params)
            obj.params = params;
        end

        function [c, d_hh, s] = compute_ss(obj, w, Y, I)
    try
        fprintf('Computing household sector steady state...\n');
        
        % Total income equals total output
        total_income = Y;
        
        % Consumption from parameter
        c = obj.params.C_Y_ratio * Y;
        
        % Total expenditure includes consumption and investment
        total_expenditure = c + I;
        
        % Budget check
        budget_balance = total_income - total_expenditure;
        
        fprintf('\nHousehold Budget (relative to Y):\n');
        fprintf('Income components:\n');
        fprintf('  Total Income:      %.4f\n', total_income / Y);
        
        fprintf('\nExpenditure components:\n');
        fprintf('  Consumption:       %.4f\n', c / Y);
        fprintf('  Investment:        %.4f\n', I / Y);
        fprintf('  Total Expenditure: %.4f\n', total_expenditure / Y);
        
        fprintf('\nBudget balance/Y: %.6f\n', budget_balance / Y);
        
        if abs(budget_balance) > 1e-6
            fprintf('Budget constraint violation: %.6f\n', budget_balance);
            error('Budget constraint violated');
        end
        
        % Since in steady state assets are constant, d_hh and s are zeros
        d_hh = 0;
        s = 0;
        
    catch ME
        fprintf('Error in household sector SS: %s\n', ME.message);
        c = NaN; d_hh = NaN; s = NaN;
        rethrow(ME);
    end
end
    end
end