#!/bin/bash

mkdir dsge-investment-funds
cd dsge-investment-funds

# 创建主目录结构
mkdir -p src/models
mkdir -p src/calibration 
mkdir -p src/analysis
mkdir -p lib/utils
mkdir -p tests/unit
mkdir -p tests/integration
mkdir -p results/figures
mkdir -p results/data
mkdir -p doc

# 创建源代码文件
touch src/models/VARModel.m
touch src/models/DSGEModel.m
touch src/models/BankModel.m
touch src/models/InvestmentFundModel.m
touch src/models/FirmModel.m

touch src/calibration/CalibrationParams.m
touch src/calibration/SteadyState.m

touch src/analysis/WelfareAnalysis.m
touch src/analysis/LiquidityAnalysis.m
touch src/analysis/ImpulseResponse.m

# 创建工具函数
touch lib/utils/PlotUtils.m
touch lib/utils/DataUtils.m
touch lib/utils/MathUtils.m

# 创建测试文件
touch tests/unit/TestVARModel.m
touch tests/unit/TestDSGEModel.m
touch tests/integration/TestFullModel.m

# 创建主程序
touch main.m
touch README.md