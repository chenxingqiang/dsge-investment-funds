% dsge_investment_funds_ss.m

% 1. Output normalization
Y = 1; % Normalized output

% 2. Hardcoded steady-state ratios and capital calculations
K_Y_ratio = 5;    % Steady-state capital-output ratio
B_K_ratio = 0.1;  % Steady-state bond-capital ratio
K = K_Y_ratio * Y;
K_b = B_K_ratio * K;
K_l = K - K_b;

% 3. Hardcoded interest rate based on a given beta
beta = 0.98;           % Discount factor
R = 1 / beta - 1;      % Interest rate calculation

% 4. Bond and fund prices
Q_b = beta;
Q_s = Q_b * B_K_ratio + B_K_ratio; % Simplified formula

% 5. Labor calculation based on production function parameters
alpha = 0.33; % Labor share parameter
N = ((1 - alpha) * Y / K^alpha)^(1 / (1 - alpha));

% 6. Wage calculation
W = alpha * Y / N;

% 7. Consumption calculation using the resource constraint
delta = 0.05;     % Depreciation rate
kappa_hh = 0.01;  % Household bond management cost
kappa_if = 0.01;  % Fund cost parameter
I = delta * K;
B_sales = B_K_ratio; % Assume bond sales is a fraction of bond holdings
C = Y - I - 0.5 * kappa_hh * B_sales^2 - 0.5 * kappa_if * B_sales^2;

% 8. Additional variables (fund dividends, deposits, etc.)
D_hh = 0.05 * Y;         % Placeholder for household deposits
D_if = 0.03 * Y;         % Placeholder for fund deposits
DIV_if = 0.02 * Y;       % Placeholder for fund dividends
B = K_b;                 % Total bonds held in the economy
L = D_hh + D_if;         % Loans equal deposits (balance sheet constraint)
Z = Y;                   % Intermediate output (assuming normalized for simplicity)
Z_b = K_b^alpha;         % Bond-financed intermediate output
Z_l = K_l^alpha;         % Loan-financed intermediate output

% 9. Populate `ys_` with steady-state values
ys_ = zeros(20, 1); % Adjust size based on the number of endogenous variables
ys_(1) = Y;         % Output
ys_(2) = C;         % Consumption
ys_(3) = N;         % Labor
ys_(4) = W;         % Wage
ys_(5) = R;         % Interest rate
ys_(6) = I;         % Investment
ys_(7) = K;         % Total capital
ys_(8) = K_b;       % Bond-financed capital
ys_(9) = K_l;       % Loan-financed capital
ys_(10) = B;        % Total bonds
ys_(11) = L;        % Loans
ys_(12) = Q_b;      % Bond price
ys_(13) = Q_s;      % Fund share price
ys_(14) = D_hh;     % Household deposits
ys_(15) = D_if;     % Fund deposits
ys_(16) = B_sales;  % Bond sales
ys_(17) = DIV_if;   % Fund dividends
ys_(18) = Z;        % Intermediate output
ys_(19) = Z_b;      % Bond-financed intermediate output
ys_(20) = Z_l;      % Loan-financed intermediate output

% Check that `ys_` has been filled out for all required variables. Update indices
% if more variables are added to the `.mod` file.