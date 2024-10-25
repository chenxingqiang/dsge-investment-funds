classdef FigureGenerator
    methods(Static)
        function generate_all_figures()
            fprintf('Generating all figures...\n');
            
            % 创建结果目录
            if ~exist('results/figures', 'dir')
                mkdir('results/figures');
            end
            
            % 生成所有图
            try
                % Figure 1: Stylized Facts
                StylizedFactsGenerator.generate();
                saveas(gcf, 'results/figures/figure1_stylized_facts.png');
                
                % Figure 2: VAR IRFs
                VARAnalysisGenerator.generate();
                saveas(gcf, 'results/figures/figure2_var_irfs.png');
                
                % Figure 4-5: Welfare Analysis
                WelfareAnalysisGenerator.generate();
                saveas(gcf, 'results/figures/figure4_welfare_gains.png');
                saveas(gcf, 'results/figures/figure5_welfare_decomp.png');
                
                % Figure 6: Policy IRFs
                IRFGenerator.generate();
                saveas(gcf, 'results/figures/figure6_policy_irfs.png');
                
                fprintf('All figures generated successfully.\n');
            catch ME
                fprintf('Error generating figures: %s\n', ME.message);
            end
        end
    end
end