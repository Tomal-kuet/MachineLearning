function ci_functions()
    for func=1:10
        disp(strcat('Running CI test for function ' ,int2str(func) ,' :'));
         [N, confidence_level_normal] = ci_test_normal(func);
         [N, confidence_level_berneulli] = ci_test_burneulli(func);
         [N, confidence_level_uniform] = ci_test_uniform(func);
    end
end