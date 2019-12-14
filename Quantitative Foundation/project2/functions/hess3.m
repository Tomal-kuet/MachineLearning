function [H] = hess3(x, varargin)
% This is a quadratic function.
% Input: vector x :(2 x 1)
% output: matrix H

H = [-400 * (x(2) - 3 * x(1)^2) + 2, -400 * x(1);
    -400 * x(1), 200]; 
end

