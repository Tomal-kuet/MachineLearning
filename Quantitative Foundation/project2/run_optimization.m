function [x, loss, x_steps] = run_optimization(f, g, x0, alpha0, delta, varargin)
% The Gradient Descenet algorithm
%% initialize parameters
alpha0_init = 'naive';
if nargin > 5
    alpha0_init = varargin{1};
end
rho = 0.5;
if nargin > 6
    rho = varargin{2};
end
c = 0.1;
if nargin > 7
    c = varargin{3};
end
optimizer = 'GradientDescent';
if nargin > 8
    optimizer = varargin{4};
    if strcmp(optimizer, 'Newton')
        H = varargin{5};
        alpha0_init = 'fixed';
        alpha0 = 1.0;
    end
    if strcmp(optimizer, 'Quasi-Newton')
%         B = varargin(5);
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
prev_p = -g(x);
prev_f = f(x);
while ~(delta_f < delta)
    if strcmp(optimizer, 'GradientDescent')
        % compute the first-order derivative
        p = -g(x);
    elseif strcmp(optimizer, 'Newton')
        p = - H(x) \ g(x);
    elseif strcmp(optimizer, 'Quasi-Newton')
        % BFGS method
        if n > 1
            s = x_steps(:, n) - x_steps(:, n-1);
            y = g(x_steps(:, n)) - g(x_steps(:, n-1));
            F = F + (y' * (F * y + s) / (y' * s)^2) * s * s' - (s * y' * F + F * y * s') / (y' * s);
        end
        p = -F * g(x);
    else
        error('Undefined optimizer!')
    end
    % determine the initial alpha value by linesearch
    if strcmp(alpha0_init, 'naive')
        alpha = line_search(x, f, g, p, alpha, rho, c);
    elseif strcmp(alpha0_init, 'fixed')
        alpha = alpha0;
        alpha = line_search(x, f, g, p, alpha, rho, c);
    elseif strcmp(alpha0_init, 'first-order')
        alpha = alpha * (prev_p' * prev_p) / (p' * p);
        alpha = line_search(x, f, g, p, alpha, rho, c);
    elseif strcmp(alpha0_init, 'interpolate')
        if n > 1
            phi0 = prev_p' * prev_p;
            alpha = 2 * (f(x) - prev_f) / phi0;
        end
        alpha = line_search(x, f, g, p, alpha, rho, c);
    end
    delta_f = abs(f(x + alpha * p) - f(x));
    prev_p = p;
    prev_f = f(x);
    % update x
    x = x + alpha * p;
    n = n + 1;
    % output
    fprintf('Iteration: %d, Loss value: %.6f\n', n-1, delta_f);
    loss = [loss; delta_f];
    x_steps = cat(2, x_steps, x);
end

end