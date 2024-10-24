classdef DataUtils
    % DataUtils - Data processing utilities for VAR analysis
    
    methods(Static)
        function data = load_var_data()
            % Load and process data for VAR analysis
            % Returns:
            %   data: Structure containing processed data series
            
            % Define data paths and sources
            % Note: In practice, you would load actual data from files
            
            % Sample data structure (matching paper's variables)
            data = struct();
            
            % 1. Industrial production (in logs)
            data.ind_prod = [];
            
            % 2. Inflation (annual growth rate)
            data.inflation = [];
            
            % 3. Bank lending (annual growth rate)
            data.bank_lending = [];
            
            % 4. Fund flows
            data.fund_flows = [];
            
            % 5. BBB spread
            data.bbb_spread = [];
            
            % 6. 5-year Bund yield
            data.bund_yield = [];
            
            % 7. VSTOXX
            data.vstoxx = [];
        end
        
        function [X, varnames] = prepare_var_data(data)
            % Prepare data matrix for VAR estimation
            % Args:
            %   data: Structure containing raw data series
            % Returns:
            %   X: Matrix of processed data
            %   varnames: Cell array of variable names
            
            % Combine all series into matrix
            X = [data.inflation, data.ind_prod, data.bank_lending, ...
                 data.fund_flows, data.bbb_spread, data.bund_yield, ...
                 data.vstoxx];
            
            % Variable names
            varnames = {'Inflation', 'Industrial Production', 'Bank Lending', ...
                       'Bond Fund Flows', 'BBB Spread', '5-year Bund', 'VSTOXX'};
                   
            % Remove missing values
            X = X(all(~isnan(X),2),:);
        end
    end
end