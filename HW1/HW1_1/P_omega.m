function [M] = P_omega(X,omega)
[m,n] = size(omega);
M = zeros(m,n);
    for i = 1:m
        for j = 1:n
            if(omega(i,j) ~= 0)
                M(i,j) = X(i,j);
            end  
        end
    end
end