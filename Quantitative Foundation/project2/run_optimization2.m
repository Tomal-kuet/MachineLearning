function [x, loss, x_steps] = run_optimization2(f, g, x0, alpha0, delta, alpha0_init, rho, c, coeff, varargin)
% The Gradient Descenet algorithm
%% initialize parameters
optimizer = 'GradientDescent';
if nargin > 8
    optimizer = varargin{1};
    substitute = varargin{2};
    if strcmp(optimizer, 'Newton')
        H = varargin{3};
        alpha0_init = 'fixed';
        alpha0 = 1.0;
    end
    if strcmp(optimizer, 'Quasi-Newton')
        F = eye(size(x0, 1));
    end
end
%% loop started
delta_f = inf;
x = x0;
alpha = alpha0;
loss = [];
x_steps = x0;
n = 1;
prev_p = -g(x, coeff);
prev_f = f(x, coeff);
while ~(delta_f < delta)
    if strcmp(optimizer, 'GradientDescent')
        % compute the first-order derivative
        p = -g(x, coeff);
    elseif strcmp(optimizer, 'Newton')
        p = - H(x, coeff) \ g(x, coeff);
    elseif strcmp(optimizer, 'Quasi-Newton')
        % BFGS method
        if n > 1
            s = x_steps(:, n) - x_steps(:, n-1);
            y = g(x_steps(:, n), coeff) - g(x_steps(:, n-1), coeff);
            F = F + (y' * (F * y + s) / (y' * s)^2) * s * s' - (s * y' * F + F * y * s') / (y' * s);
        end
        p = -F * g(x, coeff);
    else
        error('Undefined optimizer!')
    end
    % determine the initial alpha value by linesearch
    if strcmp(alpha0_init, 'naive')
        alpha = line_search(x, f, g, p, alpha, rho, c, coeff, substitute);
    elseif strcmp(alpha0_init, 'fixed')
        alpha = alpha0;
        alpha = line_search(x, f, g, p, alpha, rho, c, coeff, substitute);
    elseif strcmp(alpha0_init, 'first-order')
        alpha = alpha * (prev_p' * prev_p) / (p' * p);
        alpha = line_search(x, f, g, p, alpha, rho, c, coeff, substitute);
    elseif strcmp(alpha0_init, 'interpolate')
        if n > 1
            phi0 = prev_p' * prev_p;
            alpha = 2 * (f(x, coeff) - prev_f) / phi0;
        end
        alpha = line_search(x, f, g, p, alpha, rho, c, coeff, substitute);
    end
    delta_f = abs(f(x + alpha * p, coeff) - f(x, coeff));
    prev_p = p;
    prev_f = f(x, coeff);
    % update x
    x = x + alpha * p;
    n = n + 1;
    % output
    fprintf('Iteration: %d, Loss value: %.6f\n', n-1, delta_f);
    loss = [loss; delta_f];
    x_steps = cat(2, x_steps, x);
end

end