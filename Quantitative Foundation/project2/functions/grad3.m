function [g] = grad3(x, varargin)
% compute the partial derivatives of func3
% Input: vector x: (2 x 1)
% output: vector y: (2 x 1) 

g = [200 * (x(2) - x(1)^2) * (-2 * x(1)) - 2 * (1 - x(1));
     200 * (x(2) - x(1)^2)];
 
end

