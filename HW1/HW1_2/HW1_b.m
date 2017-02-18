% Contains the code for lee and seung 
% also top 10 rank terms for 
% initialization with random and nndsvd
clear all;
close all;
term = importdata('terms.mat')';
mat = importdata('bbc.mat');
k = 5 % number of terms
max_x = max(mat,[],2);
max_y = max(mat,[],1);
[m,n] = size(mat);

%% Random Matrix generation using max of column of matrix
for i=1:m
W(i,:) = randi(max_x(i,1),1,k);
end
for j=1:n
H(:,j) = randi(max_y(1,j),k,1) ;
end

%% NMF inbuilt function using multiplicative update algorithm
tic
[W,H] = nnmf(mat,k,'alg','mult','w0',W,'h0',H);
time = toc
for i = 1:5
[~,idx] = sort(W(:,i),'descend');
top_terms(i,:,1) = term(idx(1:10));

end
var(1,1) = 1;
var(1,2) = time;
var(1,3) = norm(mat-W*H,'fro');
var(1,4) = nnz(W*H);

%% NMF using 
% using NNDSVD initialization
[W,H] = NNDSVD(mat,k,1);
tic
[W,H] = nnmf(mat,k,'alg','mult','w0',W,'h0',H);
var(2,1) = 2;
var(2,2) = toc;
var(2,3) = norm(mat-W*H,'fro');
var(2,4) = nnz(W*H);

for i = 1:5
[~,idx] = sort(W(:,i),'descend');
top_terms(i,:,2) = term(idx(1:10));

end

%% NMF using 2 norm minimization of W and H
% with random initialization
tau = 10                      % initialize tau
disp('modified lee seung with random running......')
tic;
for i = 1:100
    
   W_t = W*(H*H')+tau*W;    %W_t temporary
   n = W./W_t;              % represents eeta
   q = mat*H';              % temp variable
   W = n.*q;                
   
   H_t = (W'*W)*H + tau*H;
   n = H./H_t;
   q = W'*mat;
   H = n.*q;

end
var(3,1) = 3;
var(3,2) = toc;
var(3,3) = norm(mat-W*H,'fro');
var(3,4) = nnz(W*H);
for i = 1:5
[~,idx] = sort(W(:,i),'descend');
top_terms(i,:,3) = term(idx(1:10));

end
%% NMF using 2 norm minimization of W and H
% using nndsvd initialization 
% NNDSVD.m file is taken from 
%https://github.com/trigeorgis/Deep-Semi-NMF/blob/master/matlab/NNDSVD.m
X = mat;
disp('modified lee seung with NDSVD running......')
[W,H] = NNDSVD(X,k,1);
tic;
for i = 1:100
    
   W_t = W*(H*H')+tau*W;    %W_t temporary
   n = W./W_t;              % represents eeta
   q = mat*H';              % temp variable
   W = n.*q;                
   
   H_t = (W'*W)*H + tau*H;
   n = H./H_t;
   q = W'*mat;
   H = n.*q;

end
var(4,1) = 4;
var(4,2) = toc;
var(4,3) = norm(mat-W*H,'fro');
var(4,4) = nnz(W*H);
for i = 1:5
[~,idx] = sort(W(:,i),'descend');
top_terms(i,:,4) = term(idx(1:10));

end
%% NMF using l1 norm 
% using random 
for i=1:m
W(i,:) = randi(max_x(i,1),1,k);
end
for j=1:n
H(:,j) = randi(max_y(1,j),k,1) ;
end


tau = 10;
disp('NMF l1 norm part 2 using random running....');

tic
for i = 1:100
    
    W_t = W*H*H' + tau*(sign(W));
    n = W./W_t;
    q = (mat*H');
    W = n.*q;
    
   H_t = (W'*W)*H + tau*(sign(H));
   n = H./H_t;
   q = W'*mat;
   H = n.*q;
   
end
var(5,1) = 5;
var(5,2) = toc;
var(5,3) = norm(mat-W*H,'fro');
var(5,4) = nnz(W*H);
for i = 1:5
[~,idx] = sort(W(:,i),'descend');
top_terms(i,:,5) = term(idx(1:10));

end
%% NMF using l1 norm
% using NNDSVD
tau = 10
disp('NMF l1 norm part 2 using NNDSVD running...')
[W,H] = NNDSVD(mat,k,1);
tic
for i = 1:100
    
   W_t = W*H*H' + tau*(sign(W));
   n = W./W_t;
   q = (mat*H');
   W = n.*q;
    
   H_t = (W'*W)*H + tau*(sign(H));
   n = H./H_t;
   q = W'*mat;
   H = n.*q;
   
end
var(6,1) = 6;
var(6,2) = toc;
var(6,3) = norm(mat-W*H,'fro');
var(6,4) = nnz(W*H);
for i = 1:5
[~,idx] = sort(W(:,i),'descend');
top_terms(i,:,6) = term(idx(1:10));

end
