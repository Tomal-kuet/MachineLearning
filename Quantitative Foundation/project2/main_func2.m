clc
clear
close all
addpath('./functions')

%% Test gradient descent (for func 2)
% parameters for the backtracking linesearch
alpha0 = 1.0;
delta = 1e-6;
rho = 0.5;
const = 0.1;
% input data
data_path = '../../Project Materials\Project 2/';
[A, b, c] = load_data(data_path);
coeff{1} = A;
coeff{2} = b;
coeff{3} = c;

with_coeff = true;
alpha0_init = 'naive';
rho = 0.5;
c = 0.1;
substitute = false;
if substitute
    x0 = rand(size(b, 1), 1)*5;
    f = @func2_2;
    g = @grad2_2;
    h = @hess2_2;
else
    x0 = initialize_x(A, b);
    f = @func2;
    g = @grad2;
    h = @hess2;
end
mesh_rangeX = -3:0.1:3;
mesh_rangeY = -5:0.1:5;

%%
[x, loss, x_steps] = run_optimization2(f, g, x0, alpha0, delta, 'first-order', rho, const, coeff, 'GradientDescent', substitute);
fx = f(x, coeff);
fprintf('Global minimum = %.3f\n', fx);

fig = figure(1); plot_steps(f, x_steps, mesh_rangeX, mesh_rangeY, 'vectorized', coeff, substitute)
title(['Gradient Descent (Func2), Min: ', num2str(fx)])
saveas(fig, 'results/func2_gd.png')

%
%% Newton Method
[x, loss, x_steps] = run_optimization2(f, g, x0, alpha0, delta, 'fixed', rho, const, coeff, 'Newton', substitute, h);
fx = f(x, coeff);
fprintf('Global minimum = %.3f\n', fx);

fig = figure(2); plot_steps(f, x_steps, mesh_rangeX, mesh_rangeY, 'vectorized', coeff, substitute)
title(['Newton Method (Func 2), Min: ', num2str(fx)])
saveas(fig, 'results/func2_newton.png')
%% Quasi-Newton Method
[x, loss, x_steps] = run_optimization2(f, g, x0, alpha0, delta, 'fixed', rho, const, coeff, 'Quasi-Newton', substitute);
fx = f(x, coeff);
fprintf('Global minimum = %.3f\n', fx);

fig = figure(3); plot_steps(f, x_steps, mesh_rangeX, mesh_rangeY, 'vectorized', coeff, substitute)
title(['Quasi-Newton (Func 2), Min: ', num2str(fx)])
saveas(fig, 'results/func2_Qnewton.png')



