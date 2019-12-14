function [y] = func2_2(t, varargin)
% This is a complex convex function.
% Input: vector t: t = log(b - A * x) (n x 1 where n is the dimension)
%                  in this way, x = A \ (b - exp(t))
%        matrix A: (m x n, where m is the number of coefficients)
%        vector b: (m x 1)
%        vector c: (n x 1)
% output: scalar y
if nargin > 1
    coeff = varargin{1};
    A = coeff{1};
    b = coeff{2};
    c = coeff{3};
end
x = A \ (repmat(b, 1, size(t, 2)) - exp(t)); % n, m
y = c' * x - sum(t);
end

