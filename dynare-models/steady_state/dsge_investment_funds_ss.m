function [ys_, params_] = dsge_investment_funds_ss()

% Load parameters
global M_

% Output normalization
Y = 1;

% Capital ratios
K_Y_ratio = 5.0;
B_K_ratio = 0.10;
K = K_Y_ratio * Y;
K_b = B_K_ratio * K;
K_l = K - K_b;

% Interest rates and prices  
beta = M_.params(1);
R = 1/beta - 1;
Q_b = beta;
Q_s = Q_b * B_K_ratio + B_K_ratio;

% Labor and wages
alpha = M_.params(2);
N = ((1-alpha) * Y / K^alpha)^(1/(1-alpha));
W = alpha * Y / N;

% Investment and consumption
delta = M_.params(3);
kappa_hh = M_.params(10);
kappa_if = M_.params(11);
I = delta * K;
B_sales = B_K_ratio;
C = Y - I - 0.5*kappa_hh*B_sales^2 - 0.5*kappa_if*B_sales^2;

% Financial variables
D_Y_ratio = 0.10;
D_hh = D_Y_ratio * Y;
D_if = 0.5 * D_Y_ratio * Y;
DIV_if = 0.02 * Y;
B = K_b;
L = D_hh + D_if;

% Production
Z = Y;
Z_b = K_b^gamma;
Z_l = K_l^gamma;

% Technology and shocks
A = 1;
delta_d = 1;
lambda_if = 0;
R_l = R;

% Create steady state vector
ys_ = zeros(24,1);

% Fill steady state values
ys_(1) = Y;
ys_(2) = C;
ys_(3) = N; 
ys_(4) = W;
ys_(5) = R;
ys_(6) = I;
ys_(7) = K;
ys_(8) = K_b;
ys_(9) = K_l;
ys_(10) = B;
ys_(11) = L;
ys_(12) = Q_b;
ys_(13) = Q_s;
ys_(14) = D_hh;
ys_(15) = D_if;
ys_(16) = B_sales;
ys_(17) = DIV_if;
ys_(18) = Z;
ys_(19) = Z_b;
ys_(20) = Z_l;
ys_(21) = A;
ys_(22) = delta_d;
ys_(23) = lambda_if;
ys_(24) = R_l;

% Return parameters if needed
params_ = struct();

end