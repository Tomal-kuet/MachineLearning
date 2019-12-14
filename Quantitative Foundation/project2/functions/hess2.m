function [H] = hess2(x, varargin)
% This is function computes the Hessian Matrix of func1.
% Input: vector x :(D x 1 where D is the dimension)
% output: scalar H :(D x D)

coeff = 1:size(x, 1);
if nargin > 1
    coeff = varargin{1};
    A = coeff{1};
    b = coeff{2};
    c = coeff{3};
end
H = A' * diag(1 ./ ((b - A * x).^2)) * A;

end

