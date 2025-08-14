# MATLAB-Stock-Analysis-Project

## Overview
This MATLAB script allows users to generate **RSI**, **MACD**, and **Fibonacci Retracement** charts for any stock data they provide.  
It works for **both Closing** and **Opening** prices, giving traders and analysts a visual representation of potential market trends and reversals.

## Features
- **Relative Strength Index (RSI)**
  - Measures momentum and identifies overbought/oversold conditions.
  - Configurable RSI period (default: 14 days).
  - Plotted for both opening and closing prices.

- **Moving Average Convergence Divergence (MACD)**
  - Tracks momentum shifts using short- and long-term EMAs.
  - Includes MACD line, signal line, and histogram.
  - Plotted for both opening and closing prices.

- **Fibonacci Retracement**
  - Calculates retracement levels based on the highest and lowest price points.
  - Useful for identifying potential support/resistance levels.
  - Levels plotted over both opening and closing price charts.

- **Custom Stock Input**
  - Accepts any stock time series data provided by the user.
  - Compatible with CSV, Excel, or MATLAB table formats.

## File Requirements
The input file should contain:
- **Date** (or datetime format)
- **Open** price
- **Close** price
- (Optional) **High** and **Low** prices for better Fibonacci accuracy

### Example CSV format:
```csv
Date,Open,High,Low,Close
2024-01-02,135.2,136.5,134.8,136.0
2024-01-03,136.0,137.2,135.1,135.5
...
