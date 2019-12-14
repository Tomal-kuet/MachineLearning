function [x0] = initialize_x(A, b, varargin)
% This function is used to get reasonable initial values of x for func2
% if nargin == 3
%     lambda = varargin{1};
% end

dim = size(b, 1);
% lambda = rand(dim, 1) * 10;
lambda = ones(dim, 1) * 10;
% x0 = inv(A' * A) * A' * (b - lambda);
x0 = A \ (b - lambda);

end

