% shock_analysis.m

% 1. 存款偏好冲击
shock_var = 'eps_d';
periods = 20;

% 生成脉冲响应
stoch_simul(var_list={'Y','C','N','K','B','L','R'}, ...
            irf=periods, nograph);

% 存储结果
deposit_shock_irf = oo_.irfs;

% 2. 技术冲击
shock_var = 'eps_a';
stoch_simul(var_list={'Y','C','N','K','B','L','R'}, ...
            irf=periods, nograph);

% 存储结果
tech_shock_irf = oo_.irfs;

% 3. 绘制结果
plot_shock_responses(deposit_shock_irf, tech_shock_irf);