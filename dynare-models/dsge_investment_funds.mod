// 声明变量
var 
    Y           // 产出
    C           // 消费
    N           // 劳动
    W           // 工资
    R           // 利率
    I           // 投资
    K           // 资本存量
    K_b         // 债券融资的资本
    K_l         // 贷款融资的资本
    B           // 债券
    L           // 贷款
    Q_b         // 债券价格
    Q_s         // 基金份额价格
    D_hh        // 家庭存款
    D_if        // 基金存款
    B_sales     // 债券销售
    DIV_if      // 基金分红
    Z           // 中间产品
    Z_b         // 债券融资的中间产品
    Z_l         // 贷款融资的中间产品
    A           // 技术冲击
    delta_d     // 存款偏好冲击
    lambda_if   // 投资基金相关变量
    R_l;        // 贷款利率

// 声明外生冲击
varexo 
    eps_a       // 技术创新
    eps_d;      // 存款偏好创新

// Declare external function
external_function(name=f, nargs=3);

// 声明参数
parameters 
    beta        // 贴现因子
    alpha       // 劳动份额
    delta       // 折旧率
    sigma       // 风险厌恶
    sigma_n     // 劳动供给弹性
    sigma_d     // 存款偏好参数
    gamma       // 回报递减参数
    v           // 生产权重
    epsilon     // 替代弹性
    kappa_hh    // 家庭债券管理成本
    kappa_if    // 基金成本参数
    rho_a       // 技术冲击持续性
    rho_d       // 存款偏好冲击持续性
    sig_a       // 技术冲击标准差
    sig_d       // 存款偏好冲击标准差
    phi;        // 债券销售函数参数

// 加载参数值
@#include "params_calibration.m"

// 模型方程
model;

// 1. 家庭部门
C^(-sigma) = beta * (C(+1)^(-sigma)) * (1 + R);                      // 欧拉方程
C^(-sigma) = delta_d * D_hh^(-sigma_d) + beta * C(+1)^(-sigma) * (1 + R);   // 存款需求 
N^sigma_n = W / C^sigma;                                             // 劳动供给

// 2. 投资基金部门
1 + lambda_if = beta * ((1 + R) + kappa_if * B_sales(+1) / Q_b(+1));  // 存款FOC
Q_b = beta + lambda_if * Q_b;                                         // 债券FOC
Q_s * 1 = Q_b * B + D_if;                                             // 资产负债表约束
B_sales = f(D_if(-1), Q_s(-1), phi);                                  // 债券销售函数

// 3. 银行部门
R_l = R;                                                              // 贷款利率
L = D_hh + D_if;                                                      // 存款市场出清

// 4. 生产部门
Y = A * N^alpha * Z^(1-alpha);                                        // 最终产品
Z = (v * Z_l^epsilon + (1-v) * Z_b^epsilon)^(1/epsilon);              // 中间品聚合
Z_l = K_l^gamma;                                                      // 贷款融资生产
Z_b = K_b^gamma;                                                      // 债券融资生产

// 5. 资本累积
K = (1-delta) * K(-1) + I;                                            // 资本运动方程
K = K_b + K_l;                                                        // 资本分配

// 6. 市场出清
Y = C + I + 0.5 * kappa_hh * B_sales^2 + 0.5 * kappa_if * B_sales^2;  // 资源约束

// 7. 外生冲击过程
log(A) = rho_a * log(A(-1)) + sig_a * eps_a;                          // 技术冲击
log(delta_d) = rho_d * log(delta_d(-1)) + sig_d * eps_d;              // 存款偏好冲击

end;

// 初始值
initval;
@#include "steady_state/dsge_investment_funds_ss.m"
end;

// 线性化处理
steady;
check;

// 求解模型
stoch_simul(order=2, irf=20);