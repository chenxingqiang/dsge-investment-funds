classdef BankSector
    % BankSector - Banking sector implementation
    % Based on Section 3.2.1 of the paper
    
    properties
        params      % Model parameters
        loans       % Bank loans
        deposits    % Total deposits
        i_l         % Loan rate
        i_d         % Deposit rate
    end
    
    methods
        function obj = BankSector(params)
            obj.params = params;
        end
        
        function obj = optimize(obj)
            % Bank optimization based on equations (7)
            % In baseline model, loan rate equals deposit rate
            obj.i_l = obj.i_d;
        end
        
        function obj = update_balance_sheet(obj, d_hh, d_if)
            % Update bank balance sheet
            % Equations (35)-(36)
            obj.deposits = d_hh + d_if;
            obj.loans = obj.deposits;  % Balance sheet constraint
        end
        
        function profit = compute_profits(obj)
            % Compute bank profits
            profit = obj.i_l * obj.loans - obj.i_d * obj.deposits;
        end
    end
end