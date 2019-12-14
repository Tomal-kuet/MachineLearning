function [Varied_N,confidence_level] = ci_test_burneulli(func)

    Varied_N = [5;10;100;1000;10000];
    confidence_level = zeros (5,1);
    nCount = 1;
    dis_name='';
        for N=[ 5 10 100 1000 10000]
            max_miss = -1;
%              for theta = [0.00001 0.0001 0.001 .01 0.1 0.15 .2 .25 .3 .35 .4 .45 0.00005 .0005 .005 0.05 .5 .55 .6 .65 .7 .8 .85 .9 0.95 0.99 0.999 0.999]
%              for theta = [0.01 0.1 .4  .5 .55 .6 .7 .8 .9 0.95]
               for theta = [.01 .1 .25 .5 .75 .9]
                 p = theta;
                hits = 0;
                for reps=1:10000
                     X = sample_bernoulli(N, p);
                     dis_name = 'Beneulli';
                    [a,b] = ci(X,func);
                    if (a<=p && b>=p)
                        hits = hits + 1;
                    end
                end
                max_miss = max(max_miss,(1-hits/10000));
            end
            confidence_level(nCount) =  (1-max_miss);
            nCount = nCount +1;
            fprintf('For function   %d N: %5d distribution: %s MAX frac missed:  %1.3f Confidence LEVEL %1.3f\n',func, N, dis_name, max_miss,1-max_miss);
        end
           Table_name = strcat('FUnction_',int2str(func),'_',dis_name,'.mat');
           T = table(Varied_N,confidence_level);
           save(Table_name, 'T')

    end
