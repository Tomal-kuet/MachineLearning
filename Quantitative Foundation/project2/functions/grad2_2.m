function [g] = grad2_2(t, varargin)
% compute the partial derivatives of func2
% Input: vector t = log(b - A * x) (m x 1 where n is the dimension)
%                  in this way, x = A \ (b - exp(t))
%        matrix A: (m x n, where m is the number of coefficients)
%        vector b: (m x 1)
%        vector c: (n x 1)
% output: vector g: (n x 1) the gradient of f w.r.t t
if nargin > 1
    coeff = varargin{1};
    A = coeff{1};
    b = coeff{2};
    c = coeff{3};
end
% B = c' * inv(A' * A) * A';  % 1 x m
% g = -B' .* exp(t) - ones(size(t, 1), 1);  % dy / dt
B = A * ((A' * A) \ c);  % m x 1
g = -B .* exp(t) - ones(size(t, 1), 1);  % dy / dt
end

