%% HW1 1st question Generate Xsample

% getting random 10
close all;
clear all;
data = 'fruit.pgm';

X = double(importdata(data));
percent = [0.1,0.3,0.5]';

[A,B,C] = generateSampleMatrix(X,percent,253);
    

figure;
tic
 svt(A,2,3,5000,rank(A));
% title('SVT of 10 % sample data with Tau=5000, step-size = 2,tolerance = 3');
 figure;
 svt(B,2,3,5000,rank(B));
% title('SVT of 30 % sample data with Tau=5000, step-size = 2,tolerance = 3');
 figure;
 
 svt(C,2,3,5000,rank(C));
 
% title('SVT of 50 % sample data with Tau=5000, step-size = 2,tolerance = 3');
 
 %{  
 figure
 isvd(A,3,rank(A));
 %title('isvd of 10% sample data with tol = 3');


 figure
 isvd(B,3,rank(B));
 %title('isvd of 30% sample data with tol = 3');

 figure
 isvd(C,3,rank(C));
% title('isvd of 50% sample data with tol = 3');

%}


