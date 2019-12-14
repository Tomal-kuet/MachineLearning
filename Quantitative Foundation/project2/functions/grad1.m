function [g] = grad1(x, varargin)
% compute the partial derivatives of func1
% Input: vector x: (D x 1 where D is the dimension)
% output: vector y: (D x 1) 

coeff = 1:size(x, 1);
g = coeff' .* (2 * x);
end

