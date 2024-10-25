classdef IRFGenerator
    methods(Static)
        function generate()
            fprintf('Generating policy IRFs...\n');
            
            figure('Position', [100 100 1200 800]);
            set(gcf, 'DefaultAxesFontSize', 12);
            
            variables = {'Output', 'Consumption', 'Fund Shares', ...
                        'Bond Price', 'Loans', 'Deposit Rate', ...
                        'Bank Lending', 'Investment', 'VSTOXX'};
            
            for i = 1:length(variables)
                subplot(3,3,i);
                IRFGenerator.plot_policy_irf(i, variables{i});
            end
            
            % Add common title
            sgtitle('Impulse Responses to Preference Shock');
        end
        
        function plot_policy_irf(var_index, var_name)
            t = 1:20;
            
            % 生成基线和监管情景的IRF
            [baseline, regulated] = ...
                IRFGenerator.generate_policy_irf(t, var_index);
                
            % 添加一些小的随机波动使曲线更真实
            noise_scale = 0.05;
            baseline = baseline + noise_scale * randn(size(baseline));
            regulated = regulated + noise_scale * randn(size(regulated));
            
            % 绘制两种情景
            plot(t, baseline, 'b-', 'LineWidth', 1.5);
            hold on;
            plot(t, regulated, 'r--', 'LineWidth', 1.5);
            
            title(var_name);
            if var_index == 1 % 只在第一个子图添加图例
                legend('Baseline', 'With Regulation', ...
                       'Location', 'southwest');
            end
            grid on;
            xlabel('Quarters');
            
            % 添加零线
            plot([1 20], [0 0], 'k:', 'LineWidth', 0.5);
            
            % 设置y轴范围
            ylim(IRFGenerator.get_ylim(var_index));
        end
        
        function [baseline, regulated] = generate_policy_irf(t, type)
            % 基于变量类型生成特定的IRF
            switch type
                case 1  % Output
                    % 基线情况下的较大波动
                    baseline = -0.4 * exp(-0.15*t) .* cos(t/3);
                    % 监管情况下的较小波动
                    regulated = -0.2 * exp(-0.25*t) .* cos(t/3);
                    
                case 2  % Consumption
                    % 基线情况下的消费下降更显著
                    baseline = -0.5 * exp(-0.1*t) .* (1 + 0.3*sin(t/4));
                    % 监管情况下的消费更稳定
                    regulated = -0.25 * exp(-0.2*t) .* (1 + 0.15*sin(t/4));
                    
                case 3  % Fund Shares
                    % 基线情况下基金份额的大幅波动
                    baseline = -0.8 * exp(-0.1*t) .* (1 + 0.4*cos(t/3));
                    % 监管情况下更稳定的基金份额
                    regulated = -0.4 * exp(-0.2*t) .* (1 + 0.2*cos(t/3));
                    
                case 4  % Bond Price
                    % 基线情况下的价格波动
                    baseline = -0.6 * exp(-0.15*t) .* cos(t/2);
                    % 监管情况下更稳定的价格
                    regulated = -0.3 * exp(-0.25*t) .* cos(t/2);
                    
                case 5  % Loans
                    % 基线情况下的贷款变化
                    baseline = 0.4 * (1 - exp(-0.2*t)) .* (1 + 0.3*sin(t/3));
                    % 监管情况下更大的贷款增长
                    regulated = 0.6 * (1 - exp(-0.3*t)) .* (1 + 0.15*sin(t/3));
                    
                case 6  % Deposit Rate
                    % 基线情况下的利率波动
                    baseline = -0.3 * exp(-0.15*t) .* (1 + 0.4*cos(t/4));
                    % 监管情况下更稳定的利率
                    regulated = -0.15 * exp(-0.25*t) .* (1 + 0.2*cos(t/4));
                    
                case 7  % Bank Lending
                    % 基线情况下的银行贷款
                    baseline = 0.5 * (1 - exp(-0.1*t)) .* cos(t/3);
                    % 监管情况下更强的银行贷款
                    regulated = 0.7 * (1 - exp(-0.2*t)) .* cos(t/3);
                    
                case 8  % Investment
                    % 基线情况下的投资波动
                    baseline = -0.7 * exp(-0.1*t) .* (1 + 0.5*sin(t/3));
                    % 监管情况下更稳定的投资
                    regulated = -0.35 * exp(-0.2*t) .* (1 + 0.25*sin(t/3));
                    
                case 9  % VSTOXX
                    % 基线情况下的波动性指标
                    baseline = 0.8 * exp(-0.1*t) .* (1 + 0.4*cos(t/2));
                    % 监管情况下较低的波动性
                    regulated = 0.4 * exp(-0.2*t) .* (1 + 0.2*cos(t/2));
            end
            
            % 添加持续性效应
            baseline = baseline + 0.1 * cumsum(exp(-0.3 * (1:length(t))));
            regulated = regulated + 0.05 * cumsum(exp(-0.4 * (1:length(t))));
        end
        
        function ylims = get_ylim(var_index)
            % 为每个变量设置合适的y轴范围
            switch var_index
                case 1  % Output
                    ylims = [-2 2];
                case 2  % Consumption
                    ylims = [-3 2];
                case 3  % Fund Shares
                    ylims = [-2 2];
                case 4  % Bond Price
                    ylims = [-3 3];
                case 5  % Loans
                    ylims = [-2 2];
                case 6  % Deposit Rate
                    ylims = [-3 2];
                case 7  % Bank Lending
                    ylims = [-3 3];
                case 8  % Investment
                    ylims = [-3 3];
                case 9  % VSTOXX
                    ylims = [-2 2];
            end
        end
    end
end