function [k_fold_R_train,  k_fold_R_test]= my_k_fold_cv()
    [z,y,Xtest] = readfiles();
    k_fold_R_test = [];
    k_fold_R_train = [];
    N = length(z);
    k = 10;
    for range = 1:k
        test_start = round((range - 1) * N / k + 1);
        test_end = round(range * N / k);
        z_test = z(test_start:test_end, :);
        y_test = y(test_start:test_end, :);
        z_train = z;
        z_train(test_start:test_end, :) = [];
        y_train = y;
        y_train(test_start:test_end, :) = [];
        %             z_temp=z_train.^p+1e-6*rand(size(z_train));
        [w, k_fold_R_train(range)]= my_ls(z_train, y_train);
        y_pred = z_test*w;
        k_fold_R_test(range) = (sum((y_pred - y_test) .^2)) / length(y_test);       
    end
end

