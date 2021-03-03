%% Problem 5

%% Calculating error for grid sizes 10-15
clear
clc

% First I am going to run it with a factor of 2

e2 = zeros(1,5);

for i = 10:15
    e2(i-9) = L2error(2,i);
end
disp(e2)

% Now try with a factor of 4

e4 = zeros(1,5);

for i = 10:15
    e4(i-9) = L2error(4,i);
end
disp(e4)

% Much faster and similar order error, so I will use a factor of 2

%% Plotting error for different alphas

N = [10:15];
al = 2;
e2 = zeros(1,5);

for i = 10:15
    e2(i-9) = L2error(2,i,al);
end

al = 3;
e3 = zeros(1,5);

for i = 10:15
    e3(i-9) = L2error(2,i,al);
end

al = 4;
e4 = zeros(1,5);

for i = 10:15
    e4(i-9) = L2error(2,i,al);
end

al = 5;
e5 = zeros(1,5);

for i = 10:15
    e5(i-9) = L2error(2,i,al);
end

EPlot = figure(1);
scatter(N,e2,'filled','b')
hold on
scatter(N,e3,'filled','r')
scatter(N,e4,'filled','g')
scatter(N,e5,'filled','m')
hold off
legend('alpha = 2','alpha = 3','alpha = 4','alpha = 5')
xlabel('Grid Size')
ylabel('Error')
title('Error vs Grid Size for Different Alpha Values')
saveas(EPlot,'Error_Plot.png')
