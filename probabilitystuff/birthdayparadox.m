% birthday paradox
clear; clc; close all;

days = 365;  
maxPeople = 60;     
prob = zeros(1, maxPeople);   % store probabilities

% Calculate probability for each group size
for n = 1:maxPeople
    % Probability that all birthdays are different
    pDistinct = 1;
    for k = 0:n-1
        pDistinct = pDistinct * (days - k) / days;
    end
    % Probability that at least two share a birthday
    prob(n) = 1 - pDistinct;
end

% Plot the curve
plot(1:maxPeople, prob, 'b-', 'LineWidth', 2);
xlabel('Number of people in group');
ylabel('Probability of a shared birthday');
title('Birthday Paradox');
grid on;

% Add a 50% line
yline(0.5, '--k', '50% chance');
