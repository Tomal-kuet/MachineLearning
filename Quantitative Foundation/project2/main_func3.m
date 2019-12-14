clc
clear
close all
addpath('./functions')
%% parameters
alpha0 = 0.5;
delta = 1e-6;
rho = 0.5;
c = 0.1;
x0 = [-10;-10];
mesh_rangeX = -3:0.1:3;
mesh_rangeY = -3:0.1:3;

%% Gradient descent
[x, loss, x_steps] = run_optimization(@func3, @grad3, x0, alpha0, delta, 'naive', rho, c);
fx = func3(x);
fprintf('Global minimum = %.3f\n', fx);

fig = figure(1); plot_steps(@func3, x_steps, mesh_rangeX, mesh_rangeY, 'unary')
title(['Gradient Descent (Func3), Min: ', num2str(fx)])
saveas(fig, 'results/func3_gd.png')

%% Newton method
[x, loss, x_steps] = run_optimization(@func3, @grad3, x0, alpha0, delta, 'fixed', rho, c, 'Newton', @hess3);
fx = func3(x);
fprintf('Global minimum = %.3f\n', fx);

fig = figure(2); plot_steps(@func3, x_steps, mesh_rangeX, mesh_rangeY, 'unary')
title(['Newton Method (Func 3), Min: ', num2str(fx)])
saveas(fig, 'results/func3_newton.png')
%% Quasi-Newton Method
[x, loss, x_steps] = run_optimization(@func3, @grad3, x0, alpha0, delta, 'fixed', rho, c, 'Quasi-Newton');
fx = func3(x);
fprintf('Global minimum = %.3f\n', fx);

fig = figure(3); plot_steps(@func3, x_steps, mesh_rangeX, mesh_rangeY, 'unary')
title(['Quasi-Newton (Func 3), Min: ', num2str(fx)])
saveas(fig, 'results/func3_Qnewton.png')

