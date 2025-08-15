function [RSI] = calculateRSI(figNum, OpenPrice, Weeks)

% Step 1: Calculate weekly price changes
delta = diff(OpenPrice);  % 51 values

% Step 2: Separate gains and losses
gains = max(delta, 0);
losses = abs(min(delta, 0));

% Step 3: Initialize RSI vector
RSI = NaN(1, 54);  % RSI only valid starting from week 15

% Step 4: Calculate first 14-week average gain/loss
avg_gain = mean(gains(1:14));
avg_loss = mean(losses(1:14));

% Step 5: Compute RSI from week 15 to 52
for i = 15:54
    if i > 15
        gain = gains(i-1);
        loss = losses(i-1);
        avg_gain = ((avg_gain * 13) + gain) / 14;
        avg_loss = ((avg_loss * 13) + loss) / 14;
    end

    if avg_loss == 0
        RSI(i) = 100;  % Avoid division by zero; strong uptrend
    else
        RS = avg_gain / avg_loss;
        RSI(i) = 100 - (100 / (1 + RS));
    end
end

% Step 6: Plot
figure(figNum);
sgtitle("RSI");

subplot(2,1,2);
plot(Weeks, RSI, 'b-', 'LineWidth', 1.5);
xlabel('Week');
ylabel('RSI (14-week)');
title('14-Week RSI for Stock');
ylim([0 100]);
hold off
grid on;

subplot(2,1,1);
plot(Weeks, OpenPrice, 'kx');
xlabel("Week");
ylabel("Price ($)");
title("Original Stock Chart Data");
grid on;


