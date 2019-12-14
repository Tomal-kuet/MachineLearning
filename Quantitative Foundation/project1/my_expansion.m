function [index, R_smallest, R_train_mean, R_test_mean, R_train, R_test] = my_expansion(x, y, k)    
         
    % 	k = 10;
        N = length(x);
        z = [];
        for p = 0:10
            z = [z, x.^p]; 
    %         z = z.^p+1e-6*rand(size(z));
            [R_train_mean(p+1), R_test_mean(p+1), R_train(p+1,:),R_test(p+1, :)] = my_cv(z, y, k);
        end
        [R_smallest, index] = min(R_test_mean);