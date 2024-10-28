
# DSGE Model with Investment Funds and Macroprudential Regulation

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)

This repository contains a MATLAB implementation of the DSGE model with investment funds and macroprudential regulation, based on the ECB Working Paper No. 2695. The model analyzes the effects of liquidity requirements on investment funds and their macroeconomic implications.

## Author

- **Chen Xingqiang**
- GitHub: [@chenxingqiang](https://github.com/chenxingqiang)
- Email: <chen.xingqiang@iechor.com>

## Project Structure

```
dynare-models/
├── dsge_investment_funds.mod        # Main model file
├── params_calibration.m             # Parameter calibration
├── main.m                          # Main execution script
├── steady_state/
│   └── dsge_investment_funds_ss.m   # Steady state computation
├── simulations/
│   ├── policy_experiments.m         # Policy experiments
│   └── shock_analysis.m            # Shock analysis
├── results/
│   └── plot_results.m              # Result plotting
└── dynare-6.0/                     # Dynare installation
```

## Features

- Complete DSGE model with investment funds and banking sector
- Macroprudential policy analysis
- Welfare analysis
- Impulse response analysis
- Detailed visualization of results

## Prerequisites

- MATLAB R2019b or later
- Dynare 6.0
- MATLAB Statistics and Machine Learning Toolbox

## Installation

1. Clone the repository:

```bash
git clone https://github.com/chenxingqiang/dsge-investment-funds.git
```

2. Install Dynare 6.0 (if not already installed):

- Download from [Dynare website](https://www.dynare.org/download/)
- Follow installation instructions for your operating system
- Set up MATLAB path to include Dynare

3. Set up project paths:

```matlab
addpath('dynare-6.0/matlab');
addpath(genpath('steady_state'));
addpath(genpath('simulations'));
addpath(genpath('results'));
```

## Usage

1. Basic model simulation:

```matlab
dynare dsge_investment_funds.mod
```

2. Run complete analysis:

```matlab
main
```

3. Run specific experiments:

```matlab
policy_experiments
```

## Model Components

### 1. Households

- Utility from consumption and deposits
- Labor supply decision
- Portfolio choice between deposits and fund shares

### 2. Investment Funds

- Bond holdings and deposits
- Liquidity management
- Periodic redemptions

### 3. Banking Sector

- Deposit taking
- Loan provision
- Balance sheet constraint

### 4. Production Sector

- Final goods production
- Intermediate goods
- Capital accumulation

## Key Results

### 1. Optimal Liquidity Requirement

- Optimal requirement found at 7.2% of assets
- Welfare gains decomposition:
  - Resource gains
  - Deposit utility losses
  - Intermediation effects

### 2. Shock Responses

- Response to deposit preference shocks
- Response to technology shocks
- Policy effectiveness in stabilizing economy

### 3. Welfare Analysis

- Consumption equivalent gains
- Trade-off between stability and efficiency
- Component-wise welfare decomposition

## Output Files

1. Figures (in results/figures/):

- figure1_stylized_facts.png
- figure2_var_irfs.png
- figure4_welfare_gains.png
- figure5_welfare_decomp.png
- figure6_policy_irfs.png

2. Data (in results/):

- baseline_results.mat
- policy_results.mat
- shock_results.mat
- analysis_report.txt

## Contributing

1. Fork the repository
2. Create your feature branch:

```bash
git checkout -b feature/amazing-feature
```

3. Commit your changes:

```bash
git commit -m 'Add amazing feature'
```

4. Push to the branch:

```bash
git push origin feature/amazing-feature
```

5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Citation

If you use this code in your research, please cite:

```bibtex
@techreport{diIasio2022,
    title={Macroprudential regulation of investment funds},
    author={di Iasio, Giovanni and Kaufmann, Christoph and Wicknig, Florian},
    year={2022},
    institution={European Central Bank},
    number={2695}
}
```

## Acknowledgments

Based on the ECB Working Paper No. 2695: "Macroprudential regulation of investment funds" by Giovanni di Iasio, Christoph Kaufmann, and Florian Wicknig.

## Contact

Chen Xingqiang - <chen.xingqiang@iechor.com>

Project Link: [https://github.com/chenxingqiang/dsge-investment-funds](https://github.com/chenxingqiang/dsge-investment-funds)

## Troubleshooting

Common issues and their solutions:

1. Dynare path not found:

```matlab
addpath('path/to/dynare/matlab');
```

2. Results directory not created:

```matlab
mkdir('results/figures');
```

3. Memory issues with large simulations:

- Reduce grid size in policy_experiments.m
- Decrease simulation periods
- Clear workspace between runs

## Version History

- 0.1
  - Initial Release
  - Implementation of basic model
- 0.2
  - Added welfare analysis
  - Improved visualization
- 0.3
  - Added policy experiments
  - Enhanced documentation
