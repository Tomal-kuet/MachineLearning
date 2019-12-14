function [x,y,Xtest] = readfiles()
    traindata = importdata('traindata.txt');
    x = traindata(:, 1:8);
    y = traindata(:, 9);
    Xtest = importdata('testinputs.txt');
end

