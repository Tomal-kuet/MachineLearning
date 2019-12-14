1. basic function files:
readfiles.m
    read the data from files
    output: x, y Xtest
my_ls.m
    least-sqaure function
    input: x, y
    output: w, train error
my_cv.m
    k-fold cross validation function
    input: z(expanded x), y, k
    output: R_train_mean(average of each k's train error), R_test_mean(average of each k's test error), R_train(each k's train error), R_test(each k's test error)
my_expansion.m
    expand x from x^0 to x^p
    input: x, y, k
    output: p_select(the best p), R_smallest(the smallest train error by using k-fold), R_train_mean, R_test_mean, R_train, R_test
my_k_fold_cv.m
    calculate the error by using k-fold cross validation only
    output: k_fold_R_train,  k_fold_R_test
my_p1.m
    main function to get the best p
    input: k
    output: p_select(best p), R_smallest, R_train_mean,  R_test_mean, R(final train error)
my_feature_selection.m
    using feature selection to get the train error
my_plot.m
    draw figures

my_test.m
    calculate the y_pred from testinputs.txt
    input: y
    ouput: R, y_pred

2. figures
    There are some figures of our results.

3. Other files
    one report
    one pdf for presentation

4. running steps
To find the best p, train error for each p, test error for each p, and the finall train error for whole 926 x elements, the plot a figure to show the trends of the train and test errors:
>> [p_select, R_smallest, R_train_mean,  R_test_mean, R] = my_p1(10);