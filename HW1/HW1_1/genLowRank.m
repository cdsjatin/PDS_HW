function Z = genLowRank(X,r)

[U,S,V] = svd(double(X));

u = zeros(size(U));
v = zeros(size(V));
s = zeros(size(S));

    u(:,1:r) = U(:,1:r);
    s(1:r,1:r) = S(1:r,1:r);
    v(:,1:r) = V(:,1:r);
    Z = u*s*(v');
end
