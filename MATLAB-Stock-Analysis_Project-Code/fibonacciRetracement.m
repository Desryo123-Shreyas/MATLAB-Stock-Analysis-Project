function fibonacciRetracement(data)

ClosePrice = data(:,5); % Assuming column 5 is closing price
OpenPrice = data(:,2)
Weeks = 1:length(ClosePrice);

% 1. Identify high and low over the range
priceHighCP = max(ClosePrice);
priceLowCP = min(ClosePrice);

priceHighOP = max(OpenPrice);
priceLowOP = min(OpenPrice);

% 2. Calculate Fibonacci levels
diffCP = priceHighCP - priceLowCP;
diffOP = priceHighOP - priceLowOP;
fibLevels = [0.0, 0.236, 0.382, 0.5, 0.618, 1.0];
retracementCP = priceHighOP - fibLevels * diffCP;
retracementOP = priceHighOP - fibLevels * diffOP;

% 3. Plot CP
figure(1);
plot(Weeks, ClosePrice, 'k', 'LineWidth', 1.5);
hold on;

% 4. Plot retracement lines
for i = 1:length(fibLevels)
    y = retracementCP(i);
    plot([Weeks(1), Weeks(end)], [y y], '--', 'DisplayName', sprintf('%.1f%%', fibLevels(i)*100));
end

title('Fibonacci Retracement Levels');
xlabel('Week');
ylabel('Close Price ($)');
legend show;
grid on;

% 3. Plot OP
figure(2);
plot(Weeks, OpenPrice, 'k', 'LineWidth', 1.5);
hold on;

% 4. Plot retracement lines
for i = 1:length(fibLevels)
    y = retracementOP(i);
    plot([Weeks(1), Weeks(end)], [y y], '--', 'DisplayName', sprintf('%.1f%%', fibLevels(i)*100));
end

title('Fibonacci Retracement Levels');
xlabel('Week');
ylabel('Open Price ($)');
legend show;
grid on;