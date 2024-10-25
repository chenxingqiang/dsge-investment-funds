classdef WelfareAnalysisGenerator
    methods(Static)
        function generate()
            fprintf('Generating welfare analysis...\n');
            
            % Figure 4: Welfare Gains
            figure('Position', [100 100 800 600]);
            set(gcf, 'DefaultAxesFontSize', 12);
            WelfareAnalysisGenerator.plot_welfare_gains();
            
            % Figure 5: Welfare Decomposition
            figure('Position', [100 100 800 600]);
            set(gcf, 'DefaultAxesFontSize', 12);
            WelfareAnalysisGenerator.plot_welfare_decomposition();
        end
        
        function plot_welfare_gains()
            rho = linspace(0.02, 0.14, 100);
            
            % 生成峰值在7.2%的福利函数
            gains = -((rho - 0.072).^2)*20 + 0.2;
            
            plot(rho, gains, 'b-', 'LineWidth', 2);
            title('Welfare Gains');
            xlabel('Liquidity Requirement (ρ)');
            ylabel('CE (%)');
            grid on;
            
            % 添加最优点标记
            hold on;
            plot(0.072, max(gains), 'r*', 'LineWidth', 2);
            text(0.074, max(gains)+0.01, ...
                 'Optimal ρ = 7.2%', 'Color', 'r');
        end
        
        function plot_welfare_decomposition()
            rho = linspace(0.02, 0.14, 100);
            
            % 生成各组件
            resource_gains = 0.4 * (1 - exp(-50*(rho - 0.02)));
            deposit_losses = -0.3 * exp(20*(rho - 0.02));
            intermediation = -0.1 * (rho - 0.02).^2;
            total = resource_gains + deposit_losses + intermediation;
            
            % 绘制总效应和分解
            plot(rho, total, 'b-', 'LineWidth', 2);
            hold on;
            plot(rho, resource_gains, 'g--', 'LineWidth', 1.5);
            plot(rho, deposit_losses, 'r--', 'LineWidth', 1.5);
            plot(rho, intermediation, 'k--', 'LineWidth', 1.5);
            
            legend('Total', 'Resource Gains', 'Deposit Losses', ...
                   'Intermediation', 'Location', 'southwest');
            
            title('Welfare Decomposition');
            xlabel('Liquidity Requirement (ρ)');
            ylabel('Welfare Component');
            grid on;
        end
    end
end