function [OP, CP, Weeks] = grabValues(data)

[rows, cols] = size(data);
OP = data(:, 2);
CP = data(:, 5);
Weeks = 1:rows;