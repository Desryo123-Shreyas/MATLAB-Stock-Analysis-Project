function MACD(figNum, price, Weeks)

% --- MACD Parameters ---
shortSpan = 12;
longSpan = 26;
signalSpan = 9;

% --- Calculate EMAs ---
emaShort = calcEMA(price, shortSpan);
emaLong = calcEMA(price, longSpan);

% --- MACD Line ---
macdLine = emaShort - emaLong;

% --- Signal Line ---
signalLine = calcEMA(macdLine, signalSpan);

% --- Histogram ---
macdHist = macdLine - signalLine;

% --- Plot ---
figure(figNum);
subplot(2,1,1);
plot(Weeks, price, 'k', 'LineWidth', 1.5);
title('Price');
xlabel('Time');
ylabel('Price');

subplot(2,1,2);
hold on;
plot(macdLine, 'b', 'LineWidth', 1.5);
plot(signalLine, 'r--', 'LineWidth', 1.2);
bar(macdHist, 'FaceColor', [0.3 0.7 0.3], 'EdgeColor', 'none');
title('MACD');
xlabel('Time');
ylabel('MACD');
legend('MACD Line', 'Signal Line', 'Histogram');
grid on;
