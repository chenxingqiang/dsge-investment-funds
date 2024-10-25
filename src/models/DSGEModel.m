classdef DSGEModel
    % DSGEModel - Main DSGE model implementation

    properties
        params          % Model parameters
        household       % Household sector
        inv_fund        % Investment fund sector
        bank           % Banking sector
        production     % Production sector
        steady_state   % Stores steady state values
    end

    methods
        function obj = DSGEModel(params)
            % Initialize model with parameters
            try
                fprintf('Initializing DSGE model...\n');
                obj.params = params;

                % Initialize sectors
                obj.production = ProductionSector(params);
                obj.household = HouseholdSector(params);
                obj.inv_fund = InvestmentFundSector(params);
                obj.bank = BankSector(params);

                fprintf('Model initialization complete.\n');
            catch ME
                fprintf('Error in model initialization: %s\n', ME.message);
                rethrow(ME);
            end
        end

        function [ss, success] = compute_steady_state(obj)
            try
                fprintf('\nStarting steady state computation...\n');
                ss = struct();

                % Step 1: Normalized values
                ss.A = 1;
                ss.n = 1/3;
                ss.i_d = 1/obj.params.beta - 1;
                ss.q_b = obj.params.beta;

                % Step 2: Production sector
                % 修改 ProductionSector/compute_ss 方法的输出
                [ss.Y, ss.K_b, ss.K_l, ss.w, ss.z, ss.K_total] = ...
                    obj.production.compute_ss(ss.n, ss.A);

                % Step 3: Investment fund sector
                [ss.b, ss.d_if, ss.q_s, ss.div_if, ss.b_sales] = ...
                    obj.inv_fund.compute_ss(ss.i_d, ss.q_b, ss.K_b);

                % Step 4: Household sector
                ss.r = obj.params.alpha * ss.Y / ss.K_total;
                % Calculate investment
                % Calculate investment
                ss.I = obj.params.delta * ss.K_total;

                % Check if c + I equals Y


                % Household sector
                [ss.c, ss.d_hh, ss.s] = obj.household.compute_ss(ss.w, ss.Y, ss.I);
                % Step 5: Bank sector
                [ss.i_l, ss.l, ss.d] = ...
                    obj.bank.compute_ss(ss.i_d, ss.d_hh, ss.d_if);


                if abs(ss.c + ss.I - ss.Y) > 1e-6
                    error('Total expenditure does not equal total output');
                end

                % Verify steady state
                success = obj.verify_steady_state(ss);



                if success
                    fprintf('\nSteady state computed successfully!\n');
                    obj.steady_state = ss;
                end

            catch ME
                fprintf('Error in compute_steady_state: %s\n', ME.message);
                ss = struct();
                success = false;
                rethrow(ME);
            end
        end

        function print_steady_state_verification(obj, ss)
            fprintf('\nSteady State Verification:\n');

            % Income-expenditure balance
            total_income = ss.w * ss.n + ss.i_d * ss.d_hh + ss.div_if * ss.s;
            total_expenditure = ss.c + ss.d_hh + ss.q_s * ss.s;

            fprintf('Household Budget (% GDP):\n');
            fprintf('  Total Income:      %.3f\n', total_income/ss.Y);
            fprintf('  Total Expenditure: %.3f\n', total_expenditure/ss.Y);
            fprintf('  Balance:           %.3e\n', (total_income - total_expenditure)/ss.Y);

            % Stock-flow consistency
            fprintf('\nStock-Flow Relations:\n');
            fprintf('  Deposits/GDP:      %.3f (target: %.3f)\n', ss.d/ss.Y, obj.params.D_Y_ratio);
            fprintf('  Bonds/GDP:         %.3f (target: %.3f)\n', ss.b/ss.Y, obj.params.B_Y_ratio);
            fprintf('  Capital/GDP:       %.3f (target: %.3f)\n', (ss.K_l + ss.K_b)/ss.Y, obj.params.K_Y_ratio);

            % Interest rates and returns
            fprintf('\nReturns:\n');
            fprintf('  Deposit rate:      %.3f%%\n', 100*ss.i_d);
            fprintf('  Loan rate:         %.3f%%\n', 100*ss.i_l);
            fprintf('  Bond return:       %.3f%%\n', 100*(1/ss.q_b - 1));

            % Production
            fprintf('\nProduction Relations:\n');
            fprintf('  Labor share:       %.3f (target: %.3f)\n', ss.w * ss.n/ss.Y, obj.params.alpha);
            fprintf('  Investment/GDP:    %.3f\n', (ss.I_l + ss.I_b)/ss.Y);
        end

        function print_steady_state_summary(obj, ss)
            fprintf('\nSteady State Summary:\n');
            fprintf('Output and Income:\n');
            fprintf('  Y:     %.4f\n', ss.Y);
            fprintf('  w*n/Y: %.4f\n', ss.w * ss.n / ss.Y);

            fprintf('\nHousehold Ratios:\n');
            fprintf('  C/Y:   %.4f\n', ss.c / ss.Y);
            fprintf('  D/Y:   %.4f\n', ss.d_hh / ss.Y);
            fprintf('  Fund/Y: %.4f\n', (ss.q_s * ss.s) / ss.Y);

            fprintf('\nFinancial Sector:\n');
            fprintf('  i_d:    %.4f%%\n', 100 * ss.i_d);
            fprintf('  i_l:    %.4f%%\n', 100 * ss.i_l);
            fprintf('  q_b:    %.4f\n', ss.q_b);

            fprintf('\nCapital Ratios:\n');
            fprintf('  K/Y:    %.4f\n', (ss.K_b + ss.K_l) / ss.Y);
            fprintf('  K_b/K:  %.4f\n', ss.K_b / (ss.K_b + ss.K_l));
        end

        function success = verify_steady_state(obj, ss)
            try
                tol = 1e-5;
                fprintf('\nSteady State Verification:\n');

                % Resource flow checks
                total_resources = ss.Y;
                consumption = ss.c;
                investment = obj.params.delta * (ss.K_b + ss.K_l);
                friction_costs = (obj.params.kappa_hh/2) * ss.b_sales^2 + ...
                    (obj.params.kappa_if/2) * ss.b_sales^2;
                total_uses = consumption + investment + friction_costs;

                fprintf('\nResource Flows (relative to Y):\n');
                fprintf('Resources:\n');
                fprintf('  Output (Y):        %.4f (100.00%%)\n', total_resources);
                fprintf('Uses:\n');
                fprintf('  Consumption:       %.4f (%.2f%%)\n', consumption, 100*consumption/ss.Y);
                fprintf('  Investment:        %.4f (%.2f%%)\n', investment, 100*investment/ss.Y);
                fprintf('  Friction costs:    %.4f (%.2f%%)\n', friction_costs, 100*friction_costs/ss.Y);
                fprintf('  Total:            %.4f (%.2f%%)\n', total_uses, 100*total_uses/ss.Y);

                % Stock ratios
                fprintf('\nStock Ratios:\n');
                fprintf('K/Y: %.4f (target: %.4f)\n', (ss.K_b + ss.K_l)/ss.Y, obj.params.K_Y_ratio);
                fprintf('B/K: %.4f (target: %.4f)\n', ss.K_b/(ss.K_b + ss.K_l), obj.params.B_K_ratio);
                fprintf('D/Y: %.4f (target: %.4f)\n', ss.d/ss.Y, obj.params.D_Y_ratio);

                % Return rates (annualized)
                fprintf('\nPrices and Returns:\n');
                fprintf('Deposit rate:    %.2f%%\n', 400*ss.i_d);
                fprintf('Bond yield:      %.2f%%\n', 400*(1/ss.q_b - 1));
                fprintf('Labor share:     %.4f\n', ss.w * ss.n/ss.Y);

                % Check balances
                resource_ok = abs(total_resources - total_uses) < tol;
                ratios_ok = abs(ss.K_b/(ss.K_b + ss.K_l) - obj.params.B_K_ratio) < tol;
                investment_ok = abs(investment/ss.Y - obj.params.I_Y_ratio) < tol;

                fprintf('\nBalance Checks:\n');
                fprintf('Resource constraint (error: %.2e): %s\n', ...
                    total_resources - total_uses, pickResult(resource_ok));
                fprintf('B/K ratio (%.4f vs %.4f): %s\n', ...
                    ss.K_b/(ss.K_b + ss.K_l), obj.params.B_K_ratio, pickResult(ratios_ok));
                fprintf('I/Y ratio (%.4f vs %.4f): %s\n', ...
                    investment/ss.Y, obj.params.I_Y_ratio, pickResult(investment_ok));

                success = resource_ok && ratios_ok && investment_ok;

                if success
                    fprintf('\nAll steady state conditions satisfied!\n');
                else
                    fprintf('\nWarning: Not all steady state conditions satisfied\n');
                end

            catch ME
                fprintf('Error in steady state verification: %s\n', ME.message);
                success = false;
            end
        end

        % Add to DSGEModel class methods
        function update_params(obj, new_params)
            obj.params = new_params;
            obj.production = ProductionSector(new_params);
            obj.household = HouseholdSector(new_params);
            obj.inv_fund = InvestmentFundSector(new_params);
            obj.bank = BankSector(new_params);
        end

    end

    methods(Access = private)
        function ss = compute_additional_ss_values(obj, ss)
            % Compute additional steady state values
            try
                fprintf('Computing additional steady state values...\n');

                % Investment
                ss.I_l = obj.params.delta * ss.K_l;
                ss.I_b = obj.params.delta * ss.K_b;

                % Bond market prices
                ss.q_b_tilde = 1 - obj.params.kappa_hh * ss.b_sales;

                % Bank profits
                ss.div_b = ss.i_l * ss.K_l - ss.i_d * (ss.d_hh + ss.d_if);

                % Additional variables for welfare analysis
                ss.z_l = ss.K_l^obj.params.gamma;
                ss.z_b = ss.K_b^obj.params.gamma;
                ss.z = (obj.params.v * ss.z_l^obj.params.epsilon + ...
                    (1-obj.params.v) * ss.z_b^obj.params.epsilon)^(1/obj.params.epsilon);

                fprintf('Additional steady state values computed successfully.\n');

            catch ME
                fprintf('Error in computing additional SS values: %s\n', ME.message);
                rethrow(ME);
            end
        end
    end
end