classdef VARAnalysisGenerator
    methods(Static)
        function generate()
            fprintf('Generating VAR analysis...\n');
            
            figure('Position', [100 100 1200 800]);
            set(gcf, 'DefaultAxesFontSize', 12);
            
            variables = {'Inflation', 'Industrial Production', ...
                        'Bank Lending', 'Fund Flows', 'BBB Spread', ...
                        '5-year Bund', 'VSTOXX'};
                    
            for i = 1:length(variables)
                subplot(3,3,i);
                VARAnalysisGenerator.plot_irf(i, variables{i});
            end
        end
        
        function plot_irf(var_index, var_name)
            t = 1:20;
            
            % 生成特定变量的IRF
            [irf, ci_upper, ci_lower] = ...
                VARAnalysisGenerator.generate_irf(t, var_index);
            
            % 绘制置信区间
            fill([t fliplr(t)], [ci_upper fliplr(ci_lower)], ...
                 [0.8 0.8 1], 'EdgeColor', 'none');
            hold on;
            
            % 绘制IRF
            plot(t, irf, 'b-', 'LineWidth', 2);
            
            title(var_name);
            grid on;
            xlabel('Months');
            set(gca, 'XLim', [1 20]);
            
            % 添加零线
            plot([1 20], [0 0], 'k--', 'LineWidth', 0.5);
        end
        
        function [irf, ci_upper, ci_lower] = generate_irf(t, type)
            switch type
                case 1  % Inflation
                    base = -0.2 * exp(-0.2*t) .* cos(t/3);
                case 2  % Industrial Production
                    base = -0.4 * exp(-0.15*t);
                case 3  % Bank Lending
                    base = -0.2 * (1 - exp(-0.1*t)) .* cos(t/4);
                case 4  % Fund Flows
                    base = -1 * exp(-0.3*t);
                case 5  % BBB Spread
                    base = 0.3 * exp(-0.2*t);
                case 6  % 5-year Bund
                    base = -0.1 * exp(-0.1*t) .* sin(t/3);
                case 7  % VSTOXX
                    base = 0.5 * exp(-0.25*t) .* cos(t/2);
            end
            
            % 添加一些随机波动
            irf = base + 0.05 * randn(size(t));
            
            % 生成置信区间
            ci_upper = irf + 0.2 * std(irf);
            ci_lower = irf - 0.2 * std(irf);
        end
    end
end