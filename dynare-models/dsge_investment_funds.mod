// Declare parameters
parameters
    beta    // Discount factor
    alpha   // Labor share
    delta   // Depreciation rate
    sigma   // Risk aversion
    sigma_n // Labor supply elasticity
    sigma_d // Deposit preference
    gamma   // Returns to scale
    v       // Production weight
    epsilon // Substitution elasticity
    kappa_hh // Household bond cost
    kappa_if // Fund cost
    rho_a   // Technology persistence
    rho_d   // Preference persistence
    sig_a   // Technology volatility
    sig_d   // Preference volatility
    phi;    // Bond sales parameter

// Set parameter values
beta = 0.994;
alpha = 0.67;
delta = 0.025;
sigma = 1;
sigma_n = 3;
sigma_d = 1;
gamma = 0.627;
v = 0.678;
epsilon = 0.499;
kappa_hh = 0.005;
kappa_if = 0.005;
rho_a = 0.96;
rho_d = 0.60;
sig_a = 0.0054;
sig_d = 0.001;
phi = 0.5;

// Declare endogenous variables
var
    Y       // Output
    C       // Consumption
    N       // Labor
    W       // Wage
    R       // Interest rate
    I       // Investment
    K       // Capital stock
    K_b     // Bond-financed capital
    K_l     // Loan-financed capital
    B       // Bonds
    Q_b     // Bond price
    Q_s     // Fund shares price
    D_hh    // Household deposits
    D_if    // Fund deposits
    B_sales // Bond sales
    DIV_if  // Fund dividends
    Z       // Intermediate goods
    Z_b     // Bond-financed intermediate goods
    Z_l     // Loan-financed intermediate goods
    A       // Technology shock
    delta_d // Deposit preference shock
    Lambda  // Stochastic discount factor
    i_d;    // Deposit interest rate

// Declare exogenous shocks
varexo
    eps_a,  // Technology innovation
    eps_d;  // Deposit preference innovation

// Declare predetermined variables
predetermined_variables K K_b K_l B D_if;

model;
    // 1. Households
    Lambda = beta * (C(+1)/C)^(-sigma); // Stochastic discount factor
    C^(-sigma) = Lambda * (1 + R); // Euler equation
    W * N^sigma_n = C^(-sigma); // Labor supply

    // 2. Asset Demand
    Q_s = Lambda * (Q_s(+1) + DIV_if(+1)); // Fund share demand

    // 3. Investment funds
    1 = Lambda * ((1 + i_d) + kappa_if * B_sales(+1) / Q_b(+1)); // Portfolio choice
    DIV_if = B(-1) - Q_b * B - D_if + (1 + i_d(-1)) * D_if(-1) - 0.5 * kappa_if * B_sales^2; // Dividends
    Q_s = Q_b * B + D_if; // Balance sheet constraint
    B_sales = (phi * Q_s - D_if(-1))/Q_b * (1 + phi * Q_s - D_if(-1))/(2 * phi * Q_s); // Bond sales

    // 4. Production
    Y = A * N^alpha * Z^(1 - alpha); // Final goods
    Z = (v * Z_l^epsilon + (1 - v) * Z_b^epsilon)^(1 / epsilon); // Intermediate aggregation
    Z_l = K_l^gamma; // Loan production
    Z_b = K_b^gamma; // Bond production

    // 5. Factor prices
    W = alpha * Y / N; // Wage
    R = (1 - alpha) * Y / K - delta; // Interest rate

    // 6. Capital accumulation
    K = (1 - delta) * K(-1) + I; // Law of motion
    K = K_b + K_l; // Capital allocation
    Q_b * K_b = B; // Bond financing constraint
    K_l = D_hh + D_if; // Loan financing constraint and deposit market

    // 7. Market clearing
    Y = C + I + 0.5 * kappa_hh * B_sales^2 + 0.5 * kappa_if * B_sales^2; // Goods market

    // 8. Bond price
    Q_b = 1 - kappa_hh * B_sales; // Secondary market price

    // 9. Shock processes
    log(A) = rho_a * log(A(-1)) + sig_a * eps_a; // Technology shock
    log(delta_d) = rho_d * log(delta_d(-1)) + sig_d * eps_d; // Preference shock

    // 10. Deposit interest rate
    i_d = R; // Deposit interest rate equals interest rate
end;

// Set steady state values
initval;
    A = 1;
    delta_d = 1;
    Y = 1;
    C = 0.7;
    N = 0.33;
    K = 5;
    I = delta * K;
    K_b = 0.5;
    K_l = K - K_b;
    B = K_b;
    Q_b = 0.99;
    D_if = 0.05;
    D_hh = K_l - D_if; // Since K_l = D_hh + D_if
    Q_s = Q_b * B + D_if;
    B_sales = 0.02;
    DIV_if = 0.02;
    W = alpha * Y / N;
    R = (1 - alpha) * Y / K - delta;
    Z_l = K_l^gamma;
    Z_b = K_b^gamma;
    Z = (v * Z_l^epsilon + (1 - v) * Z_b^epsilon)^(1 / epsilon);
    Lambda = beta;
    i_d = R; // Deposit interest rate equals interest rate
end;

// Check steady state
steady;
check;

// Simulate model
stoch_simul(order=2, irf=40,
    periods=10000,
    drop=1000,
    hp_filter=1600,
    irf_shocks=(eps_a,eps_d));