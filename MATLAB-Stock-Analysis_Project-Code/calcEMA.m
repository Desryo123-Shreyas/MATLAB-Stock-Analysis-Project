function [ema] = calcEMA(price, span)

alpha = 2 / (span + 1); % Smoothing factor
ema = zeros(length(price), 1);
ema(1) = price(1); % First value is the same as the data
for t = 2:length(price)
    ema(t) = alpha * price(t) + (1 - alpha) * ema(t - 1); % EMA formula
end

end