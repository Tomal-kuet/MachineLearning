function [y] = func3(x, varargin)
% This is function computes the Hessian Matrix of func3.
% Input: vector x :(D x 1 where D is the dimension)
% output: scalar H :(D x D)

y = 100 * (x(2) - x(1)^2)^2 + (1 - x(1))^2;

end

