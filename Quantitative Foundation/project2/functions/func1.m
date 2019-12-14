function [y] = func1(x, varargin)
% This is a quadratic function.
% Input: vector x :(D x 1 where D is the dimension)
% output: scalar y

coeff = 1:size(x, 1);
y = coeff * (x.^2);

end

