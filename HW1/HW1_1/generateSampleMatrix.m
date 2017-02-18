% function return the Sample of matrix
% with percentage demanded which is a vector
function [XsampleA,XsampleB,XsampleC] = generateSampleMatrix(X,percentage,rank_x)

for k=1:size(percentage)
   
[m,n] = size(X);
total_data_size = m*n;
    clear M;
    P = floor(percentage(k)*total_data_size);
    M = zeros(m,n);
  x = datasample(0:(m*n)-1,P,'Replace',false);
 x = x./m;
 for p = 1:P
     j = floor(x(p)) +1;
     i = floor((x(p)-floor(x(p)))*m +1);
    M(i,j) =  X(i,j);
 end
 
%M = genLowRank(M,rank_x);
    if(k == 1)
     XsampleA = M; 
     end
     if(k == 2)
       XsampleB = M;   
     end
     if(k == 3)
     XsampleC = M; 
     end
end