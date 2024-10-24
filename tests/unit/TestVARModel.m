classdef TestVARModel < matlab.unittest.TestCase
    % TestVARModel - Unit tests for VAR model
    
    properties
        var_model
        test_data
        test_variables
    end
    
    methods(TestMethodSetup)
        function setup(testCase)
            % Create sample data for testing
            T = 200; % Time periods
            N = 7;   % Variables
            
            % Generate random test data
            rng(42); % Set random seed for reproducibility
            testCase.test_data = randn(T, N);
            testCase.test_variables = {'var1', 'var2', 'var3', 'var4', ...
                                     'var5', 'var6', 'var7'};
            
            % Initialize VAR model
            testCase.var_model = VARModel(testCase.test_data, 4, ...
                                        testCase.test_variables);
        end
    end
    
    methods(Test)
        function testVAREstimation(testCase)
            % Test VAR coefficient estimation
            testCase.var_model = testCase.var_model.estimate();
            
            % Verify dimensions
            [~, N] = size(testCase.test_data);
            expected_coef_rows = N*4 + 1; % lags*variables + constant
            expected_coef_cols = N;
            
            actual_size = size(testCase.var_model.coef);
            testCase.verifyEqual(actual_size(1), expected_coef_rows);
            testCase.verifyEqual(actual_size(2), expected_coef_cols);
        end
        
        function testImpulseResponse(testCase)
            % Test impulse response computation
            testCase.var_model = testCase.var_model.estimate();
            
            horizon = 20;
            shock_var = 1;
            irf = testCase.var_model.impulse_response(horizon, shock_var);
            
            % Verify IRF dimensions
            [N, ~] = size(testCase.test_data);
            testCase.verifyEqual(size(irf), [N, horizon]);
        end
    end
end