function [Varied_N,confidence_level] = ci_test_uniform(func)

    Varied_N = [5;10;100;1000;10000];
    confidence_level = zeros (5,1);
    lower = [0;0;0;0;0.6;0.85];
    upper  = [.02; .2; .5; 1; .9; 0.95];
%     lower = [0 ; .0009; 0.009; .89; 0.899; .8999;0.99999 ];
%     upper = [.0002; .0011;.011; .91;.991; .9991; 1];
%     
%         upper = linspace(0.075,0.975,19)
%         lower = linspace(0.025,0.925,19)
        nCount = 1;
        dis_name='';
            for N=[ 5 10 100 1000 10000]
                max_miss = -1;
                for bound_count = 1:length(lower)
                    p = (lower(bound_count)+upper(bound_count))/2;
                    hits = 0;

                    for reps=1:10000
                            X = sample_uniform(N,lower(bound_count),upper(bound_count));
                            dis_name = 'Uniform';
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