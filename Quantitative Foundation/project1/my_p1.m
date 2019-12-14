function [p_select, R_smallest, R_train_mean,  R_test_mean, R, R_train, R_test] = my_p1(k)
    [x,y,Xtest] = readfiles();
    
%     for k = 1:50    
        [p_index, R_smallest, R_train_mean, R_test_mean, R_train, R_test] = my_expansion(x, y, k) 
%     end
    z = [];
    p_select = p_index - 1;
    for p = 0:p_select
        z = [z,x.^p];
    end

    [w,R] = my_ls(z, y);

plot(0:10, R_train_mean,'-','LineWidth',2); 
title('poly+10-fold cross validation');
xlabel('p');
ylabel('R');
hold on; 
plot(0:10, R_test_mean,'-','LineWidth',2);
plot([p_select,p_select],[0,150],'--');
legend('training error','test error');