% Run each section on its own for whichever indicator values you want,
% don't run all at the same time
% run data reading section, then run grab data values, then the rest should
% work
function main()

data = readmatrix("Lucid Group.xlsx"); % Change this to any other xlsx to get its data

%% Grab Data Values
[OP, CP, Weeks] = grabValues(data);


%% Fibonacci Retracement
% Look for retracement patterns

fibonacciRetracement(data);

%% RSI
% RSI is overbought above 70, potential selling opportunity but upward
% trends can keep overbough trends for a long time
% RSI is oversold when below 30, Possible buying opportunity

RSI_OP = calculateRSI(1, OP, Weeks);
fprintf("\nThe RSI value at the latest week is: %.2f\n", RSI_OP(54));

RSI_CP = calculateRSI(2, CP, Weeks);
fprintf("The RSI value at the latest week is: %.2f\n", RSI_CP(54));

%% MACD
% When the MACD line crosses above the signal line, it is typically seen as a bullish signal.
% MACD line > Signal line → Price might start rising → Buy opportunity
% MACD line < Signal line → Price might start falling → Sell or short opportunity

MACD(1, OP, Weeks);
MACD(2, CP, Weeks);

end