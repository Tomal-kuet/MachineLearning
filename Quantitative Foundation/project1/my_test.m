function R = my_test(y_test)
    [x,y,Xtest] = readfiles();
    [p_index] = my_expansion(x, y, k);
    p_select = p_index - 1;
    z = [];
    for p = 0:p_select
        z = [z,Xtest.^p];
    end

    [w,R] = my_ls(z, y);
    y_pred = z*w;
    R = (sum((y_pred - y_test) .^2)) / length(y);  
end

