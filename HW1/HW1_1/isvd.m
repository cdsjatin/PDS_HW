%% Incremental SVD
% input : Sample data , tolerance , Max iteration
% output : Z approx matrix, and images for comparison
%{
close all;
clear all;
data = 'fruit.pgm';

X = double(importdata(data));
percent = [0.1,0.3,0.5]';

[A,B,C] = generateSampleMatrix(X,percent,150);
Xsample = B;
%}
function Z = isvd(Xsample,tol,J)

kmax = rank(Xsample);

subplot(1,2,1);
imshow(uint8(Xsample));
title(sprintf('Sampled image Rank: %d & norm: %d',rank(Xsample),norm(Xsample)));
[m,n] = size(Xsample);

tic
c = Xsample(:,1);
U = [c./norm(c)];
E = [norm(c)];
V = [1];

for k = 2:J
   c = Xsample(:,k) ;
    w = U\c;
    r = c - U*w;
    if(abs(r) > 0.01)
       
        norm_r = norm(r);
        U = [U (r./norm_r)];
        [~,q] = size(E);
        E = [E w
             zeros(1,q) norm_r];
         [p,q] = size(V);
          V=  [V zeros(p,1)
                zeros(1,q) 1]; 
         % Calculate SVD of new diagonal matrix E
         [Ubar,E,Vbar] = svd(E);
         U = U*Ubar;
         V = V*Vbar;
    else
    [p,q] = size(U);
        U = [U c];
    [p,q] = size(E); 
        M = E;
        E = zeros(p+1,q+1);
        E(1:p,1:q) = M(1:p,1:q);
        %E(p+1,q+1) = norm(c);
    [p,q] = size(V);
        M = V;
        V = eye(p+1,q+1);
        V(1:p,1:q) = M(1:p,1:q);
    end
end
time = toc;
  Z = U*E*V' ;
        norm_a(k) = norm(Z,'fro');
subplot(1,2,2);
imshow(uint8(Z));
str = sprintf('Time: %2.5f s & Rank: %d & norm: %d',time,rank(Z),norm(Z));
title(str);

end