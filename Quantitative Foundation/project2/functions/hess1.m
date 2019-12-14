function [H] = hess1(x, varargin)
% This is function computes the Hessian Matrix of func1.
% Input: vector x :(D x 1 where D is the dimension)
% output: scalar H :(D x D)

coeff = 1:size(x, 1);
H = diag(coeff' * 2);

end

