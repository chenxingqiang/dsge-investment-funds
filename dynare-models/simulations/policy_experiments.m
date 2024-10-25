% policy_experiments.m

% 1. 基准情景
dynare dsge_investment_funds.mod

% 存储基准结果
baseline_irf = oo_.irfs;
baseline_ss = oo_.steady_state;

% 2. 政策情景 - 提高流动性要求
set_param_value('kappa_if', 0.01);
dynare dsge_investment_funds.mod

% 存储政策情景结果
policy_irf = oo_.irfs;
policy_ss = oo_.steady_state;

% 3. 计算福利效应
[ce, decomp] = welfare_analysis(baseline_ss, policy_ss, M_.params);

% 4. 绘制结果
plot_policy_effects(baseline_irf, policy_irf, ce, decomp);