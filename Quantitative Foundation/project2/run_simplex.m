function [Xo] = run_simplex(f, X, alpha, yita, rho, sigma, delta)

n = size(X, 1);
num_iter = 0;
stdval = inf;
while stdval > delta
    num_iter = num_iter + 1;
    
    % std of function values w.r.t. the current simplex
    func_vals = cellfun(@(x)f(x), mat2cell(X, n, ones(1, n+1)));
    stdval = std(func_vals);
    fprintf('Iter: %d, std: %.6f, ', num_iter, stdval);
%     plot_tri(X); hold on
    % step 1: sort
    [fvals, ind] = sort(func_vals);
    X = X(:, ind);
    % step 2: center
    Xo = mean(X(:, 1:end-1), 2);
    fprintf('function value: %.6f\n', f(Xo))
    % step 3: reflection
    Xr = Xo + alpha * (Xo - X(:, end));
    if f(Xr) >= f(X(:, 1)) && f(Xr) < f(X(:, end-1))
        X(:, end) = Xr;
        continue;
    end
    % step 4: expansion
    if f(Xr) < f(X(:, 1))
        Xe = Xo + yita * (Xo - X(:, end));
        if f(Xe) < f(Xr)
            X(:, end) = Xe;
        else
            X(:, end) = Xr;
        end
        continue;
    end
    % step 5: contraction
    if f(Xr) >= f(X(:, end-1)) 
        Xc = X(:, end) + rho * (Xo - X(:, end));
        if f(Xc) < f(X(:, end))
            X(:, end) = Xc;
            continue;
        end
    end
    % step 6: shrinking
    for i=2:(n+1)
        X(:, i) = X(:, 1) + sigma * (X(:, i) - X(:, 1));
    end
end


end

