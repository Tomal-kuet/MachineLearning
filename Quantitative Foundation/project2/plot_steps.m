function [] = plot_steps(f, x_steps, mesh_rangeX, mesh_rangeY, varargin)
func_type = 'vectorized';
if nargin > 4
    func_type = varargin{1};
end
coeff = {};
substitute = false;
if nargin > 5
    coeff = varargin{2};
    substitute = varargin{3};
    A = coeff{1};
    b = coeff{2};
    c = coeff{3};
    if substitute
        coeff = {A(1:2, :), b(1:2, :), c};
    else
        coeff = {A(:, 1:2), b, c(1:2, :)};
    end
end
[X1_,X2_] = meshgrid(mesh_rangeX, mesh_rangeY);
[h, w] = size(X1_);
X_ = [reshape(X1_, [1, h*w]); reshape(X2_, [1, h*w])];

if ~strcmp(func_type, 'vectorized')
    Z_ = cellfun(@(x)f(x), mat2cell(X_, 2, ones(1, h*w)));
else
    Z_ = f(X_, coeff);
end
Z_ = reshape(Z_, [h, w]);
contour(X1_,X2_,real(Z_),40);  % if Z_ has complex items, we only use the real part.
hold on
plot(x_steps(1, :), x_steps(2, :), 'o-')

end

