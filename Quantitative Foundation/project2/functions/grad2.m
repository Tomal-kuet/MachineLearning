function [g] = grad2(x, varargin)
% compute the partial derivatives of func2
% Input: vector x: (n x 1 where n is the dimension)
%        matrix A: (m x n, where m is the number of coefficients)
%        vector b: (m x 1)
%        vector c: (n x 1)
% output: vector g: (n x 1)
if nargin > 1
    coeff = varargin{1};
    A = coeff{1};
    b = coeff{2};
    c = coeff{3};
end

g = c + A' * (1 ./ (b - A * x));

end

