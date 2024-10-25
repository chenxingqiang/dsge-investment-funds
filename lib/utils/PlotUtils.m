classdef PlotUtils
    methods(Static)
        function set_default_plot_settings()
            % 设置默认的绘图参数
            set(0, 'DefaultAxesFontSize', 12);
            set(0, 'DefaultAxesFontName', 'Times New Roman');
            set(0, 'DefaultLineLineWidth', 1.5);
            set(0, 'DefaultAxesBox', 'on');
            set(0, 'DefaultAxesGridLineStyle', ':');
        end
        
        function format_axis(ax)
            % 格式化坐标轴
            grid(ax, 'on');
            ax.GridLineStyle = ':';
            ax.GridAlpha = 0.3;
            ax.Box = 'on';
        end
        
        function save_figure(fig, filename)
            % 保存图形为高质量格式
            exportgraphics(fig, filename, 'Resolution', 300);
        end
    end
end