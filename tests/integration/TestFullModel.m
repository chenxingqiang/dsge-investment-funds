classdef TestFullModel < matlab.unittest.TestCase
    % TestFullModel - Integration tests for the complete model
    
    properties
        model
        welfare_calculator
        policy_analyzer
    end
    
    methods(TestMethodSetup)
        function setup(testCase)
            % Setup for each test
            params = ModelParameters();
            testCase.model = DSGEModel(params);
            testCase.welfare_calculator = WelfareAnalysis(testCase.model);
            testCase.policy_analyzer = PolicyAnalysis(testCase.model);
        end
    end
    
    methods(Test)
        function testSteadyStateComputationAndProperties(testCase)
            % Test steady state properties
            [ss, success] = testCase.model.compute_steady_state();
            
            % Check convergence
            testCase.verifyTrue(success);
            
            % Verify key steady state relationships
            testCase.verifyEqual(ss.n, 1/3, 'RelTol', 1e-6);
            testCase.verifyEqual(ss.i_l, ss.i_d, 'RelTol', 1e-6);
            testCase.verifyEqual(ss.d, ss.l, 'RelTol', 1e-6);
        end
        
        function testModelSolutionProperties(testCase)
            % Test model solution properties
            sol = testCase.model.solve_model();
            
            % Verify solution exists
            testCase.verifyTrue(isfield(sol, 'G1'));
            testCase.verifyTrue(isfield(sol, 'impact'));
            
            % Check stability
            eigenvals = eig(sol.G1);
            testCase.verifyTrue(all(abs(eigenvals) <= 1+1e-10));
        end
        
        function testWelfareCalculation(testCase)
            % Test welfare calculation
            [ce, decomp] = testCase.welfare_calculator.compute_welfare_gains(0.072);
            
            % Verify welfare gain is positive at optimal policy
            testCase.verifyTrue(ce > 0);
            
            % Verify decomposition adds up
            total = decomp.resource + decomp.deposits + decomp.intermediation;
            testCase.verifyEqual(total, ce, 'RelTol', 1e-6);
        end
        
        function testPolicyAnalysis(testCase)
            % Test policy analysis
            [opt_policy, results] = testCase.policy_analyzer.find_optimal_policy();
            
            % Verify optimal policy is in reasonable range
            testCase.verifyTrue(opt_policy >= 0.02);
            testCase.verifyTrue(opt_policy <= 0.14);
            
            % Verify results structure
            testCase.verifyTrue(isfield(results, 'ce'));
            testCase.verifyTrue(isfield(results, 'output'));
            testCase.verifyTrue(isfield(results, 'consumption'));
        end
        
        function testShockResponses(testCase)
            % Test impulse responses
            results = testCase.policy_analyzer.analyze_aggregate_shock(...
                'preference', 0.072);
            
            % Verify response structures
            testCase.verifyTrue(isfield(results, 'baseline'));
            testCase.verifyTrue(isfield(results, 'policy'));
            
            % Verify response properties
            testCase.verifySize(results.baseline.output, [40 1]);
            testCase.verifySize(results.policy.output, [40 1]);
        end
    end
end