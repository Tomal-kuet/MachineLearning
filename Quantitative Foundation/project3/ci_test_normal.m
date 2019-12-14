function [Varied_N,confidence_level] = ci_test_normal(func)

    Varied_N = [5;10;100;1000;10000];
    confidence_level = zeros (5,1);
%     theta = [0.3; 0.5; 0.7];
    theta = [.01 0.1 0.25 0.5 0.75 0.9];
    sigma = [0.002; 0.02; .05; 0.1; 0.05; 0.01];
%     sigma = [0.05; 0.1; 0.04];
    nCount = 1;
    dis_name='';
        for N=[ 5 10 100 1000 10000]
            max_miss = -1;
            for bound_count = 1:length(theta)
                p = theta(bound_count);
                hits = 0;
                for reps=1:10000
                         X = sample_normal(N,sigma(bound_count),theta(bound_count));
                         dis_name = 'Normal';
                        [a,b] = ci(X,func);
                        if (a<=p && b>=p) 
                            hits = hits + 1;
                        end
                end
                max_miss = max(max_miss,(1-hits/10000));
            end
            confidence_level(nCount) =  (1-max_miss);
            nCount = nCount +1;
            fprintf('For function   %d N: %5d distribution: %s MAX frac missed:  %1.3f Confidence Level %1.5f\n',func, N, dis_name, max_miss, 1-max_miss);
        end
           Table_name = strcat('FUnction_',int2str(func),'_',dis_name,'.mat');
           T = table(Varied_N,confidence_level);
           save(Table_name, 'T')


end