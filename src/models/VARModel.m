classdef VARModel
    % VARModel - Vector Autoregression Model Implementation
    % Based on the paper's empirical analysis in Section 2
    
    properties
        data            % Raw data matrix T x N
        lags           % Number of lags
        variables      % Variable names
        coef           % VAR coefficients
        residuals      % Model residuals
        sigma         % Variance-covariance matrix
        chol_decomp   % Cholesky decomposition
    end
    
    methods
        function obj = VARModel(data, lags, variables)
            % Constructor
            % Args:
            %   data: T x N matrix of data
            %   lags: Number of lags (default: 4)
            %   variables: Cell array of variable names
            
            if nargin < 2
                lags = 4;
            end
            if nargin < 3
                variables = {};
            end
            
            obj.data = data;
            obj.lags = lags;
            obj.variables = variables;
        end
        
        function obj = estimate(obj)
            % Estimate VAR model
            [T, N] = size(obj.data);
            
            % Create lagged data matrices
            Y = obj.data(obj.lags+1:end, :);
            X = zeros(T-obj.lags, N*obj.lags);
            
            for i = 1:obj.lags
                X(:, (i-1)*N+1:i*N) = obj.data(obj.lags-i+1:T-i, :);
            end
            
            % Add constant
            X = [ones(size(X,1),1) X];
            
            % OLS estimation
            obj.coef = (X'*X)\(X'*Y);
            obj.residuals = Y - X*obj.coef;
            
            % Compute variance-covariance matrix
            obj.sigma = (obj.residuals'*obj.residuals)/(T-obj.lags-N*obj.lags-1);
            
            % Cholesky decomposition
            obj.chol_decomp = chol(obj.sigma)';
        end
        
        function irf = impulse_response(obj, horizon, shock_var)
            % Compute impulse response functions
            % Args:
            %   horizon: Number of periods for IRF
            %   shock_var: Index of shock variable
            
            [N, ~] = size(obj.sigma);
            irf = zeros(N, horizon);
            
            % Initial impact
            impact = obj.chol_decomp(:,shock_var);
            irf(:,1) = impact;
            
            % Create companion matrix
            comp_matrix = [obj.coef(2:end,:)'; 
                         eye(N*(obj.lags-1)) zeros(N*(obj.lags-1),N)];
            
            % Compute IRFs
            for h = 2:horizon
                temp = comp_matrix^(h-1) * [eye(N); zeros(N*(obj.lags-1),N)];
                irf(:,h) = temp(1:N,:) * impact;
            end
        end
        
        function plot_irf(obj, horizon, shock_var, conf_level)
            % Plot impulse response functions with confidence bands
            % Args:
            %   horizon: Number of periods
            %   shock_var: Shock variable index
            %   conf_level: Confidence level (e.g., 0.68 for 68%)
            
            if nargin < 4
                conf_level = 0.68;
            end
            
            irf = obj.impulse_response(horizon, shock_var);
            [N, ~] = size(obj.sigma);
            
            figure('Position', [100 100 1200 800]);
            for i = 1:N
                subplot(ceil(N/3), 3, i);
                plot(1:horizon, irf(i,:), 'b-', 'LineWidth', 2);
                hold on;
                title(obj.variables{i}, 'Interpreter', 'none');
                grid on;
                
                % Add confidence bands (using bootstrap if needed)
                % ... (bootstrap implementation)
                
                hold off;
            end
        end
    end
end