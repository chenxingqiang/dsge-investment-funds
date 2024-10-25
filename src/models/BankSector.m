classdef BankSector
    properties
        params
    end
    
    methods
        function obj = BankSector(params)
            obj.params = params;
        end
        
        function [i_l, l, d] = compute_ss(obj, i_d, d_hh, d_if)
            try
                fprintf('Computing bank sector steady state...\n');
                
                % Loan rate equals deposit rate (equation 7)
                i_l = i_d;
                
                % Balance sheet constraint
                d = d_hh + d_if;
                l = d;
                
                fprintf('Bank sector SS computed successfully.\n');
                fprintf('i_l: %.4f, l: %.4f, d: %.4f\n', i_l, l, d);
                
            catch ME
                fprintf('Error in bank sector SS: %s\n', ME.message);
                i_l = NaN; l = NaN; d = NaN;
                rethrow(ME);
            end
        end
    end
end