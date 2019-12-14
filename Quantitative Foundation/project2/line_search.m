function alpha = line_search(x, func, grad, p, alpha, varargin)
% back track line search method to get the paramter alpha
rho = 0.5;
if nargin > 5
    rho = varargin{1};
end
c = 0.1;
if nargin > 6
    c = varargin{2};
end
coeff = {};
substitute = true;
if nargin > 7
    coeff = varargin{3};
    A = coeff{1};
    b = coeff{2};
    substitute = varargin{4};
end

if substitute
    while func(x + alpha * p, coeff) > func(x, coeff) + c * alpha * grad(x, coeff)' * p
        alpha = rho * alpha;
    end
else
    while true
       if all(b-A*(x + alpha * p) > 0)
            if func(x + alpha * p, coeff) <= func(x, coeff) + c * alpha * grad(x, coeff)' * p
                break;
            end
        end
        alpha = rho * alpha;
    end
end
