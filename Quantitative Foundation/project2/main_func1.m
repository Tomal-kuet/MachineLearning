clc
clear
close all
addpath('./functions')
%%
% parameters settings
alpha0 = 0.5;
delta = 1e-6;
rho = 0.5;
c = 0.1;
x0 = ones(100, 1);
mesh_rangeX = -3:0.1:3;
mesh_rangeY = -5:0.1:5;
%% Gradient Descent
[x, loss, x_steps] = run_optimization(@func1, @grad1, x0, alpha0, delta, 'naive', rho, c, 'GradientDescent');
fx = func1(x);
fprintf('Global minimum = %.3f\n', fx);

fig = figure(1); plot_steps(@func1, x_steps, mesh_rangeX, mesh_rangeY)
title(['Gradient Descent (Func 1), Min: ', num2str(fx)])
saveas(fig, 'results/func1_gd.png')

%% Newton
[x, loss, x_steps] = run_optimization(@func1, @grad1, x0, alpha0, delta, 'naive', rho, c, 'Newton', @hess1);
fx = func1(x);
fprintf('Global minimum = %.3f\n', fx);

fig = figure(2); plot_steps(@func1, x_steps, mesh_rangeX, mesh_rangeY)
title(['Newton Method (Func 1), Min: ', num2str(fx)])
saveas(fig, 'results/func1_newton.png')

%% Quasi-Newton Method
[x, loss, x_steps] = run_optimization(@func1, @grad1, x0, alpha0, delta, 'fixed', rho, c, 'Quasi-Newton');
fx = func1(x);
fprintf('Global minimum = %.3f\n', fx);

fig = figure(3); plot_steps(@func1, x_steps, mesh_rangeX, mesh_rangeY)
title(['Quasi-Newton (Func 1), Min: ', num2str(fx)])
saveas(fig, 'results/func1_Qnewton.png')
% 
