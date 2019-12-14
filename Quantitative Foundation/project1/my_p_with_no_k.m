function [p_select, R_smallest, R_train_nok] = my_p_with_no_k()
    [x,y,Xtest] = readfiles();
    
    % 	k = 10;
        N = length(x);
        z = [];
        for p = 0:10
            z = [z, x.^p]; 
    %         z = z.^p+1e-6*rand(size(z));
            [w, R_train_nok(p+1)] = my_ls(z, y);
        end
        [R_smallest, index] = min(R_train_nok);
    z = [];
    p_select = index - 1;
    for p = 0:p_select
        z = [z,x.^p];
    end

    [w,R] = my_ls(z, y);

plot(0:10, R_train_nok,'-','LineWidth',2); 
title('poly selection');
hold on;
xlabel('p');
ylabel('R');
plot([p_select,p_select],[0,150],'--');
legend('raining error','test error');
legend('raining error with nok');
