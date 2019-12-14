function [p_select_s, R_smallest_select, R_train_mean_select,  R_test_mean_select, R_select] = my_feature_selection(k)
    [x,y,Xtest] = readfiles();
    x_temp = mean(x');
    x_select = [x,x_temp'];
    
%     for k = 1:50    
        [p_select_s, R_smallest_select, R_train_mean_select, R_test_mean_select] = my_expansion(x_select, y, k) 
%     end
    z = [];
    for p = 0:p_select_s-1
        z = [z,x.^p];
    end

    [w,R_select] = my_ls(z, y); 
end

