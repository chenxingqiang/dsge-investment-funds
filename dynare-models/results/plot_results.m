% plot_results.m

function plot_results(baseline_irf, policy_irf, shock_irfs)
    
    % 1. 政策效应图
    figure('Name', 'Policy Effects');
    variables = {'Y', 'C', 'N', 'K', 'B', 'L', 'R'};
    
    for i = 1:length(variables)
        subplot(3,3,i);
        plot(baseline_irf.(variables{i}), 'b-', 'LineWidth', 2);
        hold on;
        plot(policy_irf.(variables{i}), 'r--', 'LineWidth', 2);
        title(variables{i});
        grid on;
    end
    legend('Baseline', 'With Regulation');
    
    % 2. 冲击响应图
    figure('Name', 'Shock Responses');
    for i = 1:length(variables)
        subplot(3,3,i);
        plot(shock_irfs.deposit.(variables{i}), 'b-', 'LineWidth', 2);
        hold on;
        plot(shock_irfs.tech.(variables{i}), 'r--', 'LineWidth', 2);
        title(variables{i});
        grid on;
    end
    legend('Deposit Shock', 'Technology Shock');
    
end