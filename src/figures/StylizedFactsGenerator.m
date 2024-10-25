classdef StylizedFactsGenerator
    methods(Static)
        function generate()
            fprintf('Generating stylized facts...\n');
            
            figure('Position', [100 100 1200 800]);
            set(gcf, 'DefaultAxesFontSize', 12);
            
            % Panel A: Balance Sheet Size
            subplot(2,2,1);
            StylizedFactsGenerator.plot_balance_sheet_size();
            
            % Panel B: Corporate Bond Holdings
            subplot(2,2,2);
            StylizedFactsGenerator.plot_bond_holdings();
            
            % Panel C: Cash Holdings
            subplot(2,2,3);
            StylizedFactsGenerator.plot_cash_holdings();
            
            % Panel D: Fund Flows
            subplot(2,2,4);
            StylizedFactsGenerator.plot_fund_flows();
        end
        
        function plot_balance_sheet_size()
            years = 2002:2020;
            % 构建增长趋势
            base_value = 3.6;  % 2002年的起始值
            growth_rate = 0.08; % 年增长率
            aum = base_value * exp(growth_rate * (0:length(years)-1));
            
            plot(years, aum, 'b-', 'LineWidth', 2);
            title('Balance Sheet Size');
            xlabel('Year');
            ylabel('EUR trillion');
            grid on;
            ylim([0 15]);
            
            % 添加辅助线
            hold on;
            plot([2002 2020], [aum(1) aum(1)], 'k--', 'LineWidth', 1);
            plot([2002 2020], [aum(end) aum(end)], 'k--', 'LineWidth', 1);
        end
        
        function plot_bond_holdings()
            holdings = [33 30 17 8 7 5];
            labels = {'Investment Funds (33%)', 'Banks (30%)', ...
                     'Insurance (17%)', 'Pension Funds (8%)', ...
                     'Households (7%)', 'Others (5%)'};
            
            pie(holdings, labels);
            title('Corporate Bond Holdings (2019)');
            colormap([0.2 0.2 0.7; 0.3 0.3 0.8; 0.4 0.4 0.9; ...
                     0.5 0.5 1.0; 0.6 0.6 1.0; 0.7 0.7 1.0]);
        end
        
        function plot_cash_holdings()
            % 创建真实分布的箱线图数据
            period1 = [4 6 5 7 3 8 4 6 5 7];  % 2009-2014
            period2 = [2 3 2.5 4 1.5 5 2 3 2.5 4]; % 2015-2019
            
            boxplot([period1' period2'], ...
                   {'2009-2014', '2015-2019'}, ...
                   'Notch', 'on', ...
                   'Colors', 'b');
            
            title('Cash Holdings of Corporate Bond Funds');
            ylabel('% of Total Assets');
            ylim([-2 10]);
            grid on;
            
            % 添加中位数标记
            hold on;
            plot([1 2], [median(period1) median(period2)], ...
                 'r*', 'LineWidth', 2);
        end
        
        function plot_fund_flows()
            % 2020年月度累计流量数据
            months = 1:12;
            % 模拟COVID-19冲击期间的流量
            flows = [0 -1 -6 -4 -2 0 1 0.5 0 -0.5 -1 -0.5];
            
            plot(months, flows, 'b-', 'LineWidth', 2);
            title('Cumulative Fund Flows (2020)');
            xlabel('Month');
            ylabel('% of AUM');
            grid on;
            ylim([-8 2]);
            
            % 添加COVID-19冲击标记
            hold on;
            plot([3 3], [-8 2], 'r--', 'LineWidth', 1);
            text(3.2, 1.5, 'COVID-19 Shock', 'Color', 'r');
        end
    end
end