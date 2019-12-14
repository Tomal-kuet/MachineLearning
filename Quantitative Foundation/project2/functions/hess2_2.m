function [H] = hess2_2(t, varargin)
% This is function computes the Hessian Matrix of func2_2.
% Input: vector t :(D x 1 where D is the dimension)
% output: scalar H :(D x D)
if nargin > 1
    coeff = varargin{1};
    A = coeff{1};
    b = coeff{2};
    c = coeff{3};
end
B = A * ((A' * A) \ c);  % m x 1
g = -B .* exp(t) - ones(size(t, 1), 1);  % dy / dt
H = diag(g);
end

