clear all;
close all;
image = 'fruit.pgm'
X = importdata(image);
%figure;
%imshow(X);
[U,S,V] = svd(double(X));
%figure;
u = zeros(size(U));
v = zeros(size(V));
s = zeros(size(S));
count = 1;
%norm_xz(20) = 0;
k = rank(double(X))
for r = 1:1:k
    u(:,1:r) = U(:,1:r);
    s(1:r,1:r) = S(1:r,1:r);
    v(:,1:r) = V(:,1:r);
    Z = u*s*(v');
    %imshow(uint8(Z));
    Z = double(X) - double(Z);
    norm_xz(count) = norm(Z,'fro');
    count = count +1;
end
figure;
plot(1:1:k,norm_xz(:),'ro');
xlabel('top r values');
ylabel('||X-Z_r||_f');
title('Norm vs top r plot');
grid;
norm_xz(50)
