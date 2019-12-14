function [w, R] = my_ls(z,y)
    w = z\y;

%     s = z' * y;
%     M = z' * z;
%     w = M\s;
    y_pred = z*w;
    R = (sum((y_pred - y) .^2)) / length(y);    