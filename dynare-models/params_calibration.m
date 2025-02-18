% Save as params_calibration.m
% 1. 主要参数
beta = 0.994;     % 季度贴现因子
alpha = 0.67;     % 劳动份额
delta = 0.08;     % 季度折旧率
sigma = 1;        % 对数效用
sigma_n = 3;      % 劳动供给弹性倒数
sigma_d = 1;      % 存款偏好参数
psi = 1;          % 劳动供给参数
psi_n = 1;        % 劳动成本参数

% 2. 生产参数
gamma = 0.627;    % 回报递减参数
v = 0.678;        % 生产权重
epsilon = 0.499;  % 替代弹性

% 3. 金融摩擦参数
kappa_hh = 0.005; % 家庭债券管理成本
kappa_if = 0.005; % 基金成本参数

% 4. 冲击过程参数
rho_a = 0.96;     % 技术冲击持续性
rho_d = 0.60;     % 存款偏好冲击持续性
sig_a = 0.0054;   % 技术冲击标准差
sig_d = 0.001;    % 存款偏好冲击标准差

% 5. 目标比率
K_Y_ratio = 5.0;  % 资本产出比
B_K_ratio = 0.10; % 债券资本比
D_Y_ratio = 0.10; % 存款产出比

% 6. 初始化外生变量的稳态值
A = 1;            % 技术水平
delta_d = 1;      % 存款偏好

% Save all parameters to a mat file for steady state computation
save('params.mat');