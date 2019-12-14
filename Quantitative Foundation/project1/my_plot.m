
% pot the test error
% bar(1:21, R_test_mean); 
% ylabel('R');
% xlabel('p+1');
% xlim([0,22]);
% hold on; 
% plot(xlim, [mean(R_test_mean),mean(R_test_mean)],'-','LineWidth',2);
% legend('test error','mean of folds');
% % ylabel('mean of test_error');
% xlim([0,22]);

%  plot the k_fold cross validation error
% bar(1:10, k_fold_R_test); 
% ylabel('R');
% xlabel('fold k=10');
% xlim([0,11]);
% hold on; 
% plot(xlim, [mean(k_fold_R_test),mean(k_fold_R_test)],'-','LineWidth',2);
% legend('test error','mean of folds');
% title('k-fold cross validation ');
% xlim([0,11]);

% bar(1:10, k_fold_R_train); 
% ylabel('R');
% xlabel('fold k=10');
% xlim([0,11]);
% ylim([0,200]);
% hold on; 
% plot(xlim, [mean(k_fold_R_train),mean(k_fold_R_train)],'-','LineWidth',2);
% legend('train error','mean of k-folds');
% title('k-fold cross validation ');
% xlim([0,11]);

% plot the k-fold error
% plot(1:10, k_fold_R_train,'-','LineWidth',2); 
% title('k-fold cross validation');
% xlabel('k');
% ylabel('R');
% hold on; 
% plot(1:10, k_fold_R_test,'-','LineWidth',2);
% legend('training error','test error');

% plot the feature selected of cv error
% plot(0:10, R_test_mean_select,'-','LineWidth',2); 
% title('select cross validation');
% xlabel('p');
% ylabel('R');
% hold on; 
% plot(0:10, R_train_mean_select,'-','LineWidth',2);
% hold on;
% plot([p_select_s - 1,p_select_s - 1],[0,150],'--');
% legend('select test error','select train error');


% plot the poly with k-fold
% plot(0:10, R_train_mean,'-','LineWidth',2); 
% title('poly+2-fold cross validation');
% xlabel('p');
% ylabel('R');
% hold on; 
% plot(0:10, R_test_mean,'-','LineWidth',2);
% plot([p_select - 1,p_select - 1],[0,150],'--');
% legend('raining error','test error');

plot(0:10, R_train_k0,'-','LineWidth',2); 
title('poly selection');
xlabel('p');
ylabel('R');
hold on; 
plot(0:10, R_test_k0,'-','LineWidth',2);
plot([p_select,p_select],[0,150],'--');
legend('raining error','test error');

